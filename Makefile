CXX := g++
CC := gcc
CFLAGS := -std=c++20 -O2 -Wall -Wextra -pedantic
NASM := nasm
LD := ld
OBJCOPY := objcopy

EFI_INC := /usr/include/efi
EFI_INCARCH := /usr/include/efi/x86_64
EFI_MULTIARCH := $(shell $(CC) -print-multiarch 2>/dev/null)
EFI_LIBDIR := /usr/lib$(if $(EFI_MULTIARCH),/$(EFI_MULTIARCH),)
EFI_GNUEFI_DIR := $(firstword $(wildcard /usr/lib/gnuefi /usr/lib/$(EFI_MULTIARCH)/gnuefi))
EFI_LDS := $(firstword $(wildcard $(EFI_GNUEFI_DIR)/elf_x86_64_efi.lds /usr/lib/elf_x86_64_efi.lds))
EFI_CRT0 := $(firstword $(wildcard $(EFI_GNUEFI_DIR)/crt0-efi-x86_64.o /usr/lib/crt0-efi-x86_64.o))

ifeq ($(EFI_LDS),)
$(error gnu-efi not found: install with 'sudo apt install -y gnu-efi')
endif
EFI_CFLAGS := -I$(EFI_INC) -I$(EFI_INCARCH) -fno-stack-protector -fpic -fshort-wchar -mno-red-zone -fno-plt -DEFI_FUNCTION_WRAPPER
EFI_LDFLAGS := -nostdlib -znocombreloc -T $(EFI_LDS) -shared -Bsymbolic -L$(if $(EFI_GNUEFI_DIR),$(EFI_GNUEFI_DIR)) -L$(EFI_LIBDIR) -L/usr/lib
EFI_LIBS := $(EFI_CRT0) -lefi -lgnuefi
UEFI_ESP_IMG := uefi_esp.img
UEFI_ESP_SIZE_KB := 8192

.PHONY: all clean freestanding iso run-iso uefi uefi-usb uefi-iso

all: prog

elfirc: elfirc.cpp
	$(CXX) $(CFLAGS) $< -o $@

out.asm: test.elfir elfirc
	./elfirc test.elfir $@

out.o: out.asm
	$(NASM) -felf64 $< -o $@

runtime.o: runtime.asm
	$(NASM) -felf64 $< -o $@

runtime_freestanding.o: runtime_freestanding.asm
	$(NASM) -felf64 $< -o $@

prog: out.o runtime.o
	$(LD) $^ -o $@
	./prog

out_freestanding.asm: test_freestanding.elfir elfirc
	./elfirc --freestanding test_freestanding.elfir $@

out_freestanding.o: out_freestanding.asm
	$(NASM) -felf64 $< -o $@

prog_freestanding: out_freestanding.o runtime_freestanding.o
	$(LD) -e _start $^ -o $@

freestanding: prog_freestanding

boot.o: boot.asm
	$(NASM) -felf64 $< -o $@

uefi_entry.o: uefi_entry.asm
	$(NASM) -felf64 $< -o $@

kernel.elf: boot.o out_freestanding.o runtime_freestanding.o linker.ld
	$(LD) -T linker.ld -o $@ boot.o out_freestanding.o runtime_freestanding.o

kernel_uefi.elf: out_freestanding.o runtime_freestanding.o uefi_entry.o
	$(LD) -e uefi_entry $^ -o $@

uefi_loader.o: uefi_loader.c
	$(CC) $(EFI_CFLAGS) -c $< -o $@

uefi_loader.so: uefi_loader.o
	$(LD) $(EFI_LDFLAGS) $< $(EFI_LIBS) -o $@

uefi_loader.efi: uefi_loader.so
	$(OBJCOPY) -j .text -j .sdata -j .data -j .rodata -j .dynamic -j .dynsym -j .rel -j .rela -j .reloc --target=efi-app-x86_64 $< $@

uefi: kernel_uefi.elf uefi_loader.efi

uefi-usb: uefi
	mkdir -p uefi_usb/EFI/BOOT
	cp uefi_loader.efi uefi_usb/EFI/BOOT/BOOTX64.EFI
	cp kernel_uefi.elf uefi_usb/

$(UEFI_ESP_IMG): uefi-usb
	rm -f $@
	mkfs.fat -C $@ $(UEFI_ESP_SIZE_KB)
	mmd -i $@ ::/EFI ::/EFI/BOOT
	mcopy -i $@ uefi_usb/EFI/BOOT/BOOTX64.EFI ::/EFI/BOOT/BOOTX64.EFI
	mcopy -i $@ uefi_usb/kernel_uefi.elf ::/kernel_uefi.elf
	cp $@ uefi_usb/uefi_esp.img

elfir_uefi.iso: $(UEFI_ESP_IMG)
	xorriso -as mkisofs -R -J -V "ELFIR_UEFI" -o $@ \
		-eltorito-alt-boot -e uefi_esp.img -no-emul-boot \
		-isohybrid-gpt-basdat uefi_usb

uefi-iso: elfir_uefi.iso

elfir.iso: kernel.elf grub.cfg
	mkdir -p iso/boot/grub
	cp kernel.elf iso/boot/
	cp grub.cfg iso/boot/grub/
	grub-mkrescue -o $@ iso

iso: elfir.iso

run-iso: elfir.iso
	qemu-system-x86_64 -cdrom $<

clean:
	rm -f elfirc out.asm out.o runtime.o runtime_freestanding.o prog out_freestanding.asm out_freestanding.o prog_freestanding boot.o kernel.elf elfir.iso elfir_uefi.iso $(UEFI_ESP_IMG) uefi_entry.o kernel_uefi.elf uefi_loader.o uefi_loader.so uefi_loader.efi
	rm -rf uefi_usb

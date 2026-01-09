CXX := g++
CFLAGS := -std=c++20 -O2 -Wall -Wextra -pedantic
NASM := nasm
LD := ld

.PHONY: all clean freestanding iso run-iso

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

kernel.elf: boot.o out_freestanding.o runtime_freestanding.o linker.ld
	$(LD) -T linker.ld -o $@ boot.o out_freestanding.o runtime_freestanding.o

elfir.iso: kernel.elf grub.cfg
	mkdir -p iso/boot/grub
	cp kernel.elf iso/boot/
	cp grub.cfg iso/boot/grub/
	grub-mkrescue -o $@ iso

iso: elfir.iso

run-iso: elfir.iso
	qemu-system-x86_64 -cdrom $<

clean:
	rm -f elfirc out.asm out.o runtime.o runtime_freestanding.o prog out_freestanding.asm out_freestanding.o prog_freestanding boot.o kernel.elf elfir.iso

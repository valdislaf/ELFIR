qemu-system-x86_64 -m 512M -machine q35 -bios /usr/share/OVMF/OVMF_CODE.fd -cdrom elfir_uefi.iso -serial stdio -no-reboot -no-shutdown -device qemu-xhci -device usb-kbd

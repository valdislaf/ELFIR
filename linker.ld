ENTRY(mb2_entry)
SECTIONS
{
    .multiboot2 0 : {
        *(.multiboot2)
    }

    . = 1M;

    .text : {
        *(.text*)
    }

    .rodata : {
        *(.rodata*)
    }

    .data : {
        *(.data*)
    }

    .bss : {
        *(.bss*)
        *(COMMON)
    }
}

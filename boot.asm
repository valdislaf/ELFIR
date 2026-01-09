BITS 32

section .multiboot2
align 8
mb2_header_start:
    dd 0xE85250D6
    dd 0
    dd mb2_header_end - mb2_header_start
    dd -(0xE85250D6 + 0 + (mb2_header_end - mb2_header_start))

    dw 0
    dw 0
    dd 8
mb2_header_end:

section .text
extern _start
extern idt_init

global mb2_entry
mb2_entry:
    cli
    mov esp, stack_top

    lgdt [gdt64_desc]

    mov eax, cr4
    or eax, 1 << 5
    mov cr4, eax

    mov ecx, 0xC0000080
    rdmsr
    or eax, 1 << 8
    wrmsr

    mov eax, pml4_table
    mov cr3, eax
    mov eax, cr0
    or eax, 1 << 31
    mov cr0, eax

    jmp 0x08:long_mode_start

BITS 64
long_mode_start:
    mov ax, 0x10
    mov ds, ax
    mov es, ax
    mov ss, ax

    call idt_init
    call _start

.hang:
    hlt
    jmp .hang

section .data
align 16
GDT64:
    dq 0
    dq 0x00AF9A000000FFFF
    dq 0x00AF92000000FFFF

gdt64_desc:
    dw gdt64_desc - GDT64 - 1
    dq GDT64

align 4096
pml4_table:
    dq pdpt_table + 0x3
align 4096
pdpt_table:
    dq pd_table + 0x3
align 4096
pd_table:
%assign i 0
%rep 512
    dq (i * 0x200000) | 0x83
%assign i i+1
%endrep

section .bss
align 16
stack_bottom:
    resb 16384
stack_top:

; runtime_freestanding.asm (ELFIR freestanding, x86-64)
; Provides rt_print_bytes for serial + VGA output.

BITS 64

global rt_print_bytes
global rt_str_copy
global rt_str_concat
global rt_str_free
global idt_init

%define COM1 0x3F8
%define VGA_BASE 0xB8000
%define VGA_COLS 80
%define VGA_ROWS 25
%define VGA_ATTR 0x0F

section .bss
alignb 4
rt_vga_row: resd 1
rt_vga_col: resd 1
rt_serial_ready: resb 1
alignb 8
rt_str_heap_pos: resq 1
alignb 16
rt_str_heap: resb 65536
rt_str_heap_end:

alignb 16
idt_table: resb 256 * 16

section .rodata
msg_exc: db "EXCEPTION: "
msg_exc_len: equ $ - msg_exc
msg_unk: db "#??"
msg_unk_len: equ $ - msg_unk
msg_rip: db "RIP=0x"
msg_rip_len: equ $ - msg_rip
msg_cr2: db " CR2=0x"
msg_cr2_len: equ $ - msg_cr2
msg_ec: db " EC=0x"
msg_ec_len: equ $ - msg_ec
msg_pfec: db "PFEC:"
msg_pfec_len: equ $ - msg_pfec
msg_p: db " P="
msg_p_len: equ $ - msg_p
msg_w: db " W="
msg_w_len: equ $ - msg_w
msg_u: db " U="
msg_u_len: equ $ - msg_u
msg_r: db " R="
msg_r_len: equ $ - msg_r
msg_i: db " I="
msg_i_len: equ $ - msg_i
msg_nl: db 10
msg_nl_len: equ $ - msg_nl
hex_table: db "0123456789ABCDEF"

exc_name_ptrs:
    dq exc_00, exc_01, exc_02, exc_03, exc_04, exc_05, exc_06, exc_07
    dq exc_08, exc_09, exc_10, exc_11, exc_12, exc_13, exc_14, exc_15
    dq exc_16, exc_17, exc_18, exc_19, exc_20, exc_21, exc_22, exc_23
    dq exc_24, exc_25, exc_26, exc_27, exc_28, exc_29, exc_30, exc_31
exc_name_lens:
    dq exc_00_len, exc_01_len, exc_02_len, exc_03_len, exc_04_len, exc_05_len, exc_06_len, exc_07_len
    dq exc_08_len, exc_09_len, exc_10_len, exc_11_len, exc_12_len, exc_13_len, exc_14_len, exc_15_len
    dq exc_16_len, exc_17_len, exc_18_len, exc_19_len, exc_20_len, exc_21_len, exc_22_len, exc_23_len
    dq exc_24_len, exc_25_len, exc_26_len, exc_27_len, exc_28_len, exc_29_len, exc_30_len, exc_31_len

exc_00: db "#DE"
exc_00_len: equ $ - exc_00
exc_01: db "#DB"
exc_01_len: equ $ - exc_01
exc_02: db "#NMI"
exc_02_len: equ $ - exc_02
exc_03: db "#BP"
exc_03_len: equ $ - exc_03
exc_04: db "#OF"
exc_04_len: equ $ - exc_04
exc_05: db "#BR"
exc_05_len: equ $ - exc_05
exc_06: db "#UD"
exc_06_len: equ $ - exc_06
exc_07: db "#NM"
exc_07_len: equ $ - exc_07
exc_08: db "#DF"
exc_08_len: equ $ - exc_08
exc_09: db "#CSO"
exc_09_len: equ $ - exc_09
exc_10: db "#TS"
exc_10_len: equ $ - exc_10
exc_11: db "#NP"
exc_11_len: equ $ - exc_11
exc_12: db "#SS"
exc_12_len: equ $ - exc_12
exc_13: db "#GP"
exc_13_len: equ $ - exc_13
exc_14: db "#PF"
exc_14_len: equ $ - exc_14
exc_15: db "#RES"
exc_15_len: equ $ - exc_15
exc_16: db "#MF"
exc_16_len: equ $ - exc_16
exc_17: db "#AC"
exc_17_len: equ $ - exc_17
exc_18: db "#MC"
exc_18_len: equ $ - exc_18
exc_19: db "#XM"
exc_19_len: equ $ - exc_19
exc_20: db "#VE"
exc_20_len: equ $ - exc_20
exc_21: db "#CP"
exc_21_len: equ $ - exc_21
exc_22: db "#RES"
exc_22_len: equ $ - exc_22
exc_23: db "#RES"
exc_23_len: equ $ - exc_23
exc_24: db "#RES"
exc_24_len: equ $ - exc_24
exc_25: db "#RES"
exc_25_len: equ $ - exc_25
exc_26: db "#RES"
exc_26_len: equ $ - exc_26
exc_27: db "#RES"
exc_27_len: equ $ - exc_27
exc_28: db "#RES"
exc_28_len: equ $ - exc_28
exc_29: db "#RES"
exc_29_len: equ $ - exc_29
exc_30: db "#RES"
exc_30_len: equ $ - exc_30
exc_31: db "#RES"
exc_31_len: equ $ - exc_31

align 16
idt_desc:
    dw (256 * 16) - 1
    dq idt_table

section .text

rt_serial_init_if_needed:
    mov     al, [rt_serial_ready]
    cmp     al, 1
    je      .done

    mov     dx, COM1 + 1
    xor     al, al
    out     dx, al          ; IER = 0

    mov     dx, COM1 + 3
    mov     al, 0x80
    out     dx, al          ; LCR: DLAB=1

    mov     dx, COM1 + 0
    mov     al, 0x01
    out     dx, al          ; DLL = 1 (115200)

    mov     dx, COM1 + 1
    xor     al, al
    out     dx, al          ; DLM = 0

    mov     dx, COM1 + 3
    mov     al, 0x03
    out     dx, al          ; LCR = 8N1

    mov     dx, COM1 + 2
    mov     al, 0xC7
    out     dx, al          ; FCR = FIFO enable + clear

    mov     dx, COM1 + 4
    mov     al, 0x0B
    out     dx, al          ; MCR = RTS/DSR

    mov     byte [rt_serial_ready], 1
.done:
    ret

rt_vga_putc_al:
    cmp     al, 0x0A
    je      .newline
    cmp     al, 0x0D
    je      .carriage

    mov     edx, [rt_vga_row]
    mov     ecx, [rt_vga_col]
    mov     r8d, edx
    imul    r8d, r8d, VGA_COLS
    add     r8d, ecx
    mov     rdi, VGA_BASE
    mov     ah, VGA_ATTR
    mov     [rdi + r8*2], ax

    inc     ecx
    cmp     ecx, VGA_COLS
    jb      .store
    xor     ecx, ecx
    inc     edx
.store:
    cmp     edx, VGA_ROWS
    jb      .store_ok
    xor     edx, edx
.store_ok:
    mov     [rt_vga_row], edx
    mov     [rt_vga_col], ecx
    ret

.newline:
    mov     edx, [rt_vga_row]
    inc     edx
    xor     ecx, ecx
    cmp     edx, VGA_ROWS
    jb      .nl_store
    xor     edx, edx
.nl_store:
    mov     [rt_vga_row], edx
    mov     [rt_vga_col], ecx
    ret

.carriage:
    mov     edx, [rt_vga_row]
    xor     ecx, ecx
    mov     [rt_vga_row], edx
    mov     [rt_vga_col], ecx
    ret

; rt_print_bytes: write(data,len) to serial + VGA
; in: rdi=data, rsi=len
rt_print_bytes:
    push    rbx
    push    r12
    push    r13

    call    rt_serial_init_if_needed
    mov     rbx, rdi
    mov     r12, rsi

.loop:
    test    r12, r12
    jz      .done
    mov     al, [rbx]
    mov     r13b, al

.wait_tx:
    mov     dx, COM1 + 5
    in      al, dx
    test    al, 0x20
    jz      .wait_tx

    mov     dx, COM1
    mov     al, r13b
    out     dx, al

    mov     al, r13b
    call    rt_vga_putc_al

    inc     rbx
    dec     r12
    jmp     .loop

.done:
    pop     r13
    pop     r12
    pop     rbx
    ret

rt_print_char_al:
    sub     rsp, 16
    mov     [rsp], al
    mov     rdi, rsp
    mov     rsi, 1
    call    rt_print_bytes
    add     rsp, 16
    ret

rt_print_bit_label:
    ; rdi=label ptr, rsi=len, rdx=bit (0/1)
    push    rbx
    mov     rbx, rdx
    call    rt_print_bytes
    mov     al, '0'
    test    rbx, rbx
    jz      .emit
    mov     al, '1'
.emit:
    call    rt_print_char_al
    pop     rbx
    ret

idt_set_entry:
    ; rdi=vector, rsi=handler
    lea     rdx, [rel idt_table]
    mov     rax, rdi
    shl     rax, 4
    add     rdx, rax
    mov     rax, rsi
    mov     word [rdx + 0], ax
    mov     word [rdx + 2], 0x08
    mov     byte [rdx + 4], 0
    mov     byte [rdx + 5], 0x8E
    shr     rax, 16
    mov     word [rdx + 6], ax
    shr     rax, 16
    mov     dword [rdx + 8], eax
    mov     dword [rdx + 12], 0
    ret

idt_init:
    push    rbx
    xor     ebx, ebx
.loop:
    mov     rdi, rbx
    lea     rsi, [rel isr_default]
    call    idt_set_entry
    inc     rbx
    cmp     rbx, 256
    jne     .loop

    mov     rdi, 0
    lea     rsi, [rel isr_de]
    call    idt_set_entry
    mov     rdi, 14
    lea     rsi, [rel isr_pf]
    call    idt_set_entry

    lidt    [rel idt_desc]
    pop     rbx
    ret

isr_de:
    push    qword 0
    push    qword 0
    jmp     isr_common

isr_pf:
    push    qword 14
    jmp     isr_common

isr_default:
    push    qword 0
    push    qword 0xFF
    jmp     isr_common

isr_common:
    cli
    mov     rbx, [rsp]
    mov     r13, [rsp + 8]
    mov     r12, [rsp + 16]

    lea     rdi, [rel msg_exc]
    mov     rsi, msg_exc_len
    call    rt_print_bytes

    cmp     rbx, 31
    ja      .print_name_unk
    lea     rdx, [rel exc_name_ptrs]
    mov     rdi, [rdx + rbx*8]
    lea     rdx, [rel exc_name_lens]
    mov     rsi, [rdx + rbx*8]
    call    rt_print_bytes
    jmp     .print_name_done
.print_name_unk:
    lea     rdi, [rel msg_unk]
    mov     rsi, msg_unk_len
    call    rt_print_bytes
.print_name_done:
    lea     rdi, [rel msg_nl]
    mov     rsi, msg_nl_len
    call    rt_print_bytes

    lea     rdi, [rel msg_rip]
    mov     rsi, msg_rip_len
    call    rt_print_bytes

    mov     rdi, r12
    call    rt_print_hex_u64_raw

    cmp     rbx, 14
    jne     .print_nl

    mov     rax, cr2
    mov     r14, rax
    lea     rdi, [rel msg_cr2]
    mov     rsi, msg_cr2_len
    call    rt_print_bytes
    mov     rdi, r14
    call    rt_print_hex_u64_raw

    lea     rdi, [rel msg_ec]
    mov     rsi, msg_ec_len
    call    rt_print_bytes
    mov     rdi, r13
    call    rt_print_hex_u64_raw

.print_nl:
    lea     rdi, [rel msg_nl]
    mov     rsi, msg_nl_len
    call    rt_print_bytes

    cmp     rbx, 14
    jne     .halt

    lea     rdi, [rel msg_pfec]
    mov     rsi, msg_pfec_len
    call    rt_print_bytes

    mov     rdx, r13
    and     rdx, 1
    lea     rdi, [rel msg_p]
    mov     rsi, msg_p_len
    call    rt_print_bit_label

    mov     rdx, r13
    shr     rdx, 1
    and     rdx, 1
    lea     rdi, [rel msg_w]
    mov     rsi, msg_w_len
    call    rt_print_bit_label

    mov     rdx, r13
    shr     rdx, 2
    and     rdx, 1
    lea     rdi, [rel msg_u]
    mov     rsi, msg_u_len
    call    rt_print_bit_label

    mov     rdx, r13
    shr     rdx, 3
    and     rdx, 1
    lea     rdi, [rel msg_r]
    mov     rsi, msg_r_len
    call    rt_print_bit_label

    mov     rdx, r13
    shr     rdx, 4
    and     rdx, 1
    lea     rdi, [rel msg_i]
    mov     rsi, msg_i_len
    call    rt_print_bit_label

    lea     rdi, [rel msg_nl]
    mov     rsi, msg_nl_len
    call    rt_print_bytes

.halt:
    hlt
    jmp     .halt

rt_print_hex_u64_raw:
    push    rbx
    sub     rsp, 16
    mov     rbx, rdi
    mov     rcx, 16
.hex_loop:
    mov     rax, rbx
    and     rax, 0xF
    mov     al, [rel hex_table + rax]
    mov     [rsp + rcx - 1], al
    shr     rbx, 4
    dec     rcx
    jne     .hex_loop
    mov     rdi, rsp
    mov     rsi, 16
    call    rt_print_bytes
    add     rsp, 16
    pop     rbx
    ret

rt_str_alloc:
    mov     rax, [rt_str_heap_pos]
    test    rax, rax
    jne     .have
    lea     rax, [rel rt_str_heap]
    mov     [rt_str_heap_pos], rax
.have:
    mov     rdx, [rt_str_heap_pos]
    mov     rcx, rdi
    mov     rax, rdx
    add     rdx, rcx
    lea     r8, [rel rt_str_heap_end]
    cmp     rdx, r8
    ja      .oom
    mov     [rt_str_heap_pos], rdx
    ret
.oom:
    xor     eax, eax
    ret

; rt_str_copy: copy string to new buffer
; in:  rdi=ptr, rsi=len
; out: rax=ptr, rdx=len (0 on OOM or empty)
rt_str_copy:
    push    rbx
    mov     rbx, rdi
    mov     r8, rsi
    test    r8, r8
    je      .empty
    mov     rdi, r8
    call    rt_str_alloc
    test    rax, rax
    je      .empty
    cld
    mov     rdi, rax
    mov     rsi, rbx
    mov     rcx, r8
    rep movsb
    mov     rdx, r8
    pop     rbx
    ret
.empty:
    xor     eax, eax
    xor     edx, edx
    pop     rbx
    ret

; rt_str_concat: concat two strings
; in:  rdi=ptr1, rsi=len1, rdx=ptr2, rcx=len2
; out: rax=ptr, rdx=len (0 on OOM)
rt_str_concat:
    push    rbx
    push    r12
    mov     rbx, rdi
    mov     r12, rdx
    mov     r8, rsi
    mov     r9, rcx
    mov     rdi, r8
    add     rdi, r9
    call    rt_str_alloc
    test    rax, rax
    je      .concat_oom
    cld
    mov     r10, rax
    mov     rdi, r10
    mov     rsi, rbx
    mov     rcx, r8
    rep movsb
    mov     rdi, r10
    add     rdi, r8
    mov     rsi, r12
    mov     rcx, r9
    rep movsb
    mov     rax, r10
    mov     rdx, r8
    add     rdx, r9
    pop     r12
    pop     rbx
    ret
.concat_oom:
    xor     eax, eax
    xor     edx, edx
    pop     r12
    pop     rbx
    ret

; rt_str_free: no-op in freestanding
; in: rdi=ptr, rsi=len
rt_str_free:
    ret

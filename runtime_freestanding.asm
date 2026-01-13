; runtime_freestanding.asm (ELFIR freestanding, x86-64)
; Provides rt_print_bytes for serial + VGA output.

BITS 64

global rt_print_bytes
global rt_str_copy
global rt_str_concat
global rt_str_free
global idt_init
global pic_init
global rt_uefi_tmp
global rt_uefi_line
global rt_uefi_last_line
global rt_uefi_hist_base
global rt_uefi_hist_len_base
global rt_uefi_edit_buf
global rt_ticks_ptr
global rt_kbd_head_ptr
global rt_kbd_tail_ptr
global rt_kbd_buf_ptr
global rt_map_fb
global rt_xhci_dcbaa
global rt_xhci_cmd_ring
global rt_xhci_evt_ring
global rt_xhci_erst
global rt_xhci_scratch_array
global rt_xhci_scratch_bufs
global rt_xhci_input_ctx
global rt_xhci_dev_ctx
global rt_xhci_ep0_ring
global rt_xhci_kbd_ring
global rt_usb_buf_ptr
global rt_usb_irq_ptr
global rt_xhci_kbd_buf
global rt_wbinvd
global uefi_present:weak
global uefi_read_key:weak
global uefi_print:weak
global uefi_clear:weak
global uefi_set_cursor_pos:weak
extern irq_timer_tick
extern irq_kbd_push
extern irq_xhci_evt
global rt_i8042_init

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
alignb 2
rt_uefi_tmp_buf: resw 4
alignb 8
rt_uefi_line_buf: resb 256
rt_uefi_last_line_buf: resb 256
rt_uefi_hist_buf: resb 256 * 8
rt_uefi_hist_len_buf: resb 8
rt_uefi_edit_buf_mem: resb 256
alignb 8
rt_ticks: resq 1
alignb 1
rt_kbd_head: resb 1
rt_kbd_tail: resb 1
alignb 1
rt_kbd_buf: resb 64
alignb 8
alignb 4096
rt_pml4: resq 512
alignb 4096
rt_pdpt: resq 512
alignb 4096
rt_pd_low: resq 512
alignb 4096
rt_pd_fb: resq 512
alignb 64
rt_xhci_dcbaa_mem: resq 256
alignb 64
rt_xhci_cmd_ring_mem: resb 4096
alignb 64
rt_xhci_evt_ring_mem: resb 4096
alignb 64
rt_xhci_erst_mem: resb 16
alignb 64
rt_xhci_scratch_array_mem: resq 32
alignb 4096
rt_xhci_scratch_bufs_mem: resb 4096 * 32
alignb 64
rt_xhci_input_ctx_mem: resb 2048
alignb 64
rt_xhci_dev_ctx_mem: resb 2048
alignb 64
rt_xhci_ep0_ring_mem: resb 4096
alignb 64
rt_xhci_kbd_ring_mem: resb 4096
alignb 4096
rt_xhci_kbd_buf_mem: resb 4096
alignb 8
rt_str_heap_pos: resq 1
alignb 16
rt_str_heap: resb 65536
rt_str_heap_end:
alignb 16
rt_usb_buf: resb 512
alignb 8
rt_usb_irq_flag: resb 8

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
rt_i8042_init:
    ; enable keyboard interface (0xAE)
.wait_ibf0:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf0
    mov  al, 0xAE
    out  0x64, al

    ; read command byte (0x20)
.wait_ibf1:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf1
    mov  al, 0x20
    out  0x64, al

    ; wait output buffer full
.wait_obf:
    in   al, 0x64
    test al, 0x01
    jz   .wait_obf
    in   al, 0x60
    mov  bl, al

    ; set IRQ1 enable (bit0=1), enable scancode translation (bit6=1),
    ; ensure keyboard not disabled (bit4=0)
    or   bl, 0x41
    and  bl, 0xEF

    ; write command byte (0x60) + value
.wait_ibf2:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf2
    mov  al, 0x60
    out  0x64, al

.wait_ibf3:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf3
    mov  al, bl
    out  0x60, al

    ; set scancode set 1 (0xF0 0x01) on the keyboard
.wait_ibf4:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf4
    mov  al, 0xF0
    out  0x60, al
.wait_obf2:
    in   al, 0x64
    test al, 0x01
    jz   .wait_obf2
    in   al, 0x60

.wait_ibf5:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf5
    mov  al, 0x01
    out  0x60, al
.wait_obf3:
    in   al, 0x64
    test al, 0x01
    jz   .wait_obf3
    in   al, 0x60

    ; enable scanning (0xF4)
.wait_ibf6:
    in   al, 0x64
    test al, 0x02
    jnz  .wait_ibf6
    mov  al, 0xF4
    out  0x60, al
.wait_obf4:
    in   al, 0x64
    test al, 0x01
    jz   .wait_obf4
    in   al, 0x60

    xor  eax, eax
    ret

rt_uefi_tmp:
    lea     rax, [rel rt_uefi_tmp_buf]
    ret

rt_uefi_line:
    lea     rax, [rel rt_uefi_line_buf]
    ret

rt_uefi_last_line:
    lea     rax, [rel rt_uefi_last_line_buf]
    ret

rt_uefi_hist_base:
    lea     rax, [rel rt_uefi_hist_buf]
    ret

rt_uefi_hist_len_base:
    lea     rax, [rel rt_uefi_hist_len_buf]
    ret

rt_uefi_edit_buf:
    lea     rax, [rel rt_uefi_edit_buf_mem]
    ret

rt_ticks_ptr:
    lea     rax, [rel rt_ticks]
    ret

rt_kbd_head_ptr:
    lea     rax, [rel rt_kbd_head]
    ret

rt_kbd_tail_ptr:
    lea     rax, [rel rt_kbd_tail]
    ret

rt_kbd_buf_ptr:
    lea     rax, [rel rt_kbd_buf]
    ret


rt_xhci_dcbaa:
    lea     rax, [rel rt_xhci_dcbaa_mem]
    ret

rt_xhci_cmd_ring:
    lea     rax, [rel rt_xhci_cmd_ring_mem]
    ret

rt_xhci_evt_ring:
    lea     rax, [rel rt_xhci_evt_ring_mem]
    ret

rt_xhci_erst:
    lea     rax, [rel rt_xhci_erst_mem]
    ret

rt_xhci_scratch_array:
    lea     rax, [rel rt_xhci_scratch_array_mem]
    ret

rt_xhci_scratch_bufs:
    lea     rax, [rel rt_xhci_scratch_bufs_mem]
    ret

rt_xhci_input_ctx:
    lea     rax, [rel rt_xhci_input_ctx_mem]
    ret

rt_xhci_dev_ctx:
    lea     rax, [rel rt_xhci_dev_ctx_mem]
    ret

rt_xhci_ep0_ring:
    lea     rax, [rel rt_xhci_ep0_ring_mem]
    ret

rt_xhci_kbd_ring:
    lea     rax, [rel rt_xhci_kbd_ring_mem]
    ret

rt_usb_buf_ptr:
    lea     rax, [rel rt_usb_buf]
    ret

rt_usb_irq_ptr:
    lea     rax, [rel rt_usb_irq_flag]
    ret

rt_xhci_kbd_buf:
    lea     rax, [rel rt_xhci_kbd_buf_mem]
    ret

rt_wbinvd:
    wbinvd
    ret

; Map low 1GiB and framebuffer 1GiB region using 2MiB pages.
; rdi = framebuffer physical base
rt_map_fb:
    push    rbx
    push    r12
    push    r13
    mov     rbx, rdi

    cld
    xor     eax, eax
    lea     rdi, [rel rt_pml4]
    mov     rcx, 512
    rep stosq
    lea     rdi, [rel rt_pdpt]
    mov     rcx, 512
    rep stosq
    lea     rdi, [rel rt_pd_low]
    mov     rcx, 512
    rep stosq
    %define PDE_2M_UC 0x9B
    lea     rdi, [rel rt_pd_fb]
    mov     rcx, 512
    rep stosq

    lea     rdi, [rel rt_pd_low]
    mov     rcx, 512
    xor     rax, rax
.low_loop:
    mov     r8, rax
    or      r8, 0x83
    mov     [rdi], r8
    add     rax, 0x200000
    add     rdi, 8
    dec     rcx
    jnz     .low_loop

    mov     r12, rbx
    and     r12, 0xFFFFFFFFC0000000
    mov     r13, rbx
    shr     r13, 30
    and     r13, 0x1FF

    lea     rdi, [rel rt_pd_fb]
    mov     rcx, 512
    mov     rax, r12
.fb_loop:
    mov     r8, rax
    or      r8, PDE_2M_UC
    mov     [rdi], r8
    add     rax, 0x200000
    add     rdi, 8
    dec     rcx
    jnz     .fb_loop

    lea     rax, [rel rt_pd_low]
    or      rax, 0x3
    mov     [rel rt_pdpt], rax
    lea     rax, [rel rt_pd_fb]
    or      rax, 0x3
    mov     [rel rt_pdpt + r13*8], rax

    lea     rax, [rel rt_pdpt]
    or      rax, 0x3
    mov     [rel rt_pml4], rax

    lea     rax, [rel rt_pml4]
    mov     cr3, rax

    xor     eax, eax
    pop     r13
    pop     r12
    pop     rbx
    ret

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
    push    r15

    call    rt_serial_init_if_needed
    xor     r15d, r15d
    call    uefi_present
    test    eax, eax
    setne   r15b
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

    test    r15b, r15b
    jnz     .skip_vga
    mov     al, r13b
    call    rt_vga_putc_al
.skip_vga:

    inc     rbx
    dec     r12
    jmp     .loop

.done:
    pop     r15
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
    mov     ax, cs
    mov     word [rdx + 2], ax
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
    mov     rdi, 32
    lea     rsi, [rel irq0_stub]
    call    idt_set_entry
    mov     rdi, 33
    lea     rsi, [rel irq1_stub]
    call    idt_set_entry
    mov     rdi, 64
    lea     rsi, [rel irq_xhci_stub]
    call    idt_set_entry

    lidt    [rel idt_desc]
    pop     rbx
    ret

pic_init:
    mov     al, 0x11
    out     0x20, al
    out     0xA0, al
    mov     al, 0x20
    out     0x21, al
    mov     al, 0x28
    out     0xA1, al
    mov     al, 0x04
    out     0x21, al
    mov     al, 0x02
    out     0xA1, al
    mov     al, 0x01
    out     0x21, al
    out     0xA1, al
    mov     al, 0xFC
    out     0x21, al
    mov     al, 0xFF
    out     0xA1, al
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

irq0_stub:
    push    rax
    push    rcx
    push    rdx
    push    rbx
    push    rbp
    push    rsi
    push    rdi
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    mov     rbx, rsp
    and     rbx, 0xF
    cmp     rbx, 0
    jne     .irq0_aligned
    sub     rsp, 8
    mov     rbx, 1
    jmp     .irq0_align_done
.irq0_aligned:
    xor     rbx, rbx
.irq0_align_done:
    call    irq_timer_tick
    test    rbx, rbx
    jz      .irq0_restore_done
    add     rsp, 8
.irq0_restore_done:
    mov     al, 0x20
    out     0x20, al
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9
    pop     r8
    pop     rdi
    pop     rsi
    pop     rbp
    pop     rbx
    pop     rdx
    pop     rcx
    pop     rax
    iretq

irq1_stub:
    push    rax
    push    rcx
    push    rdx
    push    rbx
    push    rbp
    push    rsi
    push    rdi
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    mov     rbx, rsp
    and     rbx, 0xF
    cmp     rbx, 0
    jne     .irq1_aligned
    sub     rsp, 8
    mov     rbx, 1
    jmp     .irq1_align_done
.irq1_aligned:
    xor     rbx, rbx
.irq1_align_done:
    in      al, 0x64
    test    al, 0x01
    jz      .irq1_done
    in      al, 0x60
    movzx   eax, al
   ; push    rax
    mov     edi, eax
	call    rt_print_hex_u64_raw
    call    irq_kbd_push
   ; add     rsp, 8
.irq1_done:
    test    rbx, rbx
    jz      .irq1_restore_done
    add     rsp, 8
.irq1_restore_done:
    mov     al, 0x20
    out     0x20, al
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9
    pop     r8
    pop     rdi
    pop     rsi
    pop     rbp
    pop     rbx
    pop     rdx
    pop     rcx
    pop     rax
    iretq

irq_xhci_stub:
    push    rax
    push    rcx
    push    rdx
    push    rbx
    push    rbp
    push    rsi
    push    rdi
    push    r8
    push    r9
    push    r10
    push    r11
    push    r12
    push    r13
    push    r14
    push    r15
    mov     rbx, rsp
    and     rbx, 0xF
    cmp     rbx, 0
    jne     .irqx_aligned
    sub     rsp, 8
    mov     rbx, 1
    jmp     .irqx_align_done
.irqx_aligned:
    xor     rbx, rbx
.irqx_align_done:
    call    irq_xhci_evt
    test    rbx, rbx
    jz      .irqx_restore_done
    add     rsp, 8
.irqx_restore_done:
    mov     rax, 0xFEE000B0
    mov     dword [rax], 0
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     r11
    pop     r10
    pop     r9
    pop     r8
    pop     rdi
    pop     rsi
    pop     rbp
    pop     rbx
    pop     rdx
    pop     rcx
    pop     rax
    iretq

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

; Weak stub: real UEFI build overrides this in uefi_entry.asm.
uefi_present:
    xor     eax, eax
    ret

; Weak stubs for non-UEFI builds.
uefi_read_key:
    xor     eax, eax
    ret

uefi_print:
    mov     eax, 1
    ret

uefi_clear:
    mov     eax, 1
    ret

uefi_set_cursor_pos:
    mov     eax, 1
    ret

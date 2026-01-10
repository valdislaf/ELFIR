global _start
global serial_init
global serial_write_byte
global serial_write_newline
global serial_write_backspace
global uefi_putc
global serial_write_kernel_start
global serial_write_kernel_init_ok
global serial_write_kernel_halt
global tty_write_hex_u64
global fb_glyph
global fb_putc
global fb_write_hex_u64
global fb_write_xhci_base_label
global fb_write_caplen_label
global fb_write_hciver_label
global fb_write_hcs1_label
global fb_write_hcs2_label
global fb_write_hcs3_label
global fb_write_dboff_label
global fb_write_rtsoff_label
global fb_write_ports_label
global fb_write_slots_label
global fb_write_cfg_label
global fb_write_dcbaap_label
global fb_write_crcr_label
global fb_write_erstba_label
global fb_write_erdp_label
global fb_write_iman_label
global xhci_zero
global fb_write_usbcmd_label
global fb_write_usbsts_label
global fb_fill_rect
global fb_mark_line
global tty_write_xhci_base_label
global tty_write_caplen_label
global tty_write_hciver_label
global irq_timer_tick
global irq_kbd_push
global panic
global sel_shift
global kbd_read_scancode
global kbd_flush
global kbd_read_scancode_irq
global kbd_scancode_to_ascii
global tty_scroll
global tty_clear
global tty_putc
global tty_write_prompt
global tty_write_buf
global line_copy
global line_redraw
global line_clear_display
global line_echo_buf
global hist_entry_ptr
global hist_get_len
global hist_set_len
global tty_write_help
global cmd_is_help
global cmd_is_cls
global cmd_is_halt
global cmd_is_echo
global cmd_is_panic
global serial_log_cmd_help
global serial_log_cmd_echo
global serial_log_cmd_cls
global serial_log_cmd_halt
global serial_log_cmd_panic
global serial_log_cmd_unknown
global serial_log_key_up
global serial_log_key_down
global serial_log_key_left
global serial_log_key_right
global run_command

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_u64
extern rt_print_u64_raw
extern rt_print_hex_u64
extern rt_print_hex_u64_raw
extern rt_print_bytes
extern rt_str_concat
extern rt_str_copy
extern rt_str_free
extern uefi_read_key
extern uefi_present
extern uefi_print
extern uefi_clear
extern uefi_set_cursor_pos
extern rt_uefi_tmp
extern uefi_get_xhci_base
extern uefi_get_fb_base
extern uefi_get_fb_stride
extern uefi_get_fb_width
extern uefi_get_fb_height
extern rt_map_fb
extern uefi_has_st
extern uefi_print_marker
extern rt_uefi_line
extern rt_uefi_last_line
extern rt_uefi_hist_base
extern rt_uefi_hist_len_base
extern rt_uefi_edit_buf
extern rt_ticks_ptr
extern rt_kbd_head_ptr
extern rt_kbd_tail_ptr
extern rt_kbd_buf_ptr
extern rt_xhci_dcbaa
extern rt_xhci_cmd_ring
extern rt_xhci_evt_ring
extern rt_xhci_erst
extern rt_xhci_scratch_array
extern rt_xhci_scratch_bufs

section .rodata

panic_str0: db 80, 65, 78, 73, 67, 58, 32
panic_str1: db 10
run_command_str0: db 109, 97, 110, 117, 97, 108, 32, 112, 97, 110, 105, 99

section .text

serial_init:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 1
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0x00
    and  rax, 0xFF
    out  dx, al
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 3
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0x80
    and  rax, 0xFF
    out  dx, al
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0x01
    and  rax, 0xFF
    out  dx, al
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 1
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0x00
    and  rax, 0xFF
    out  dx, al
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 3
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0x03
    and  rax, 0xFF
    out  dx, al
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 2
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0xC7
    and  rax, 0xFF
    out  dx, al
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 4
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0x0B
    and  rax, 0xFF
    out  dx, al

serial_write_byte:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
.while_start_2:
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    mov  rax, 5
    and  rax, 0xFFFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    jmp  .while_start_2
.while_end_3:
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, [rbp-16]
    and  rax, 0xFF
    out  dx, al

serial_write_newline:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x0D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    leave
    ret

serial_write_backspace:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    leave
    ret

uefi_putc:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    call rt_uefi_tmp
    add  rsp, 8
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, [rbp-16]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x0D
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x0A
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    call uefi_print
    add  rsp, 8
    mov  [rbp-24], rax
    mov  rax, [rbp-24]
    mov  [rbp-24], rax
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, [rbp-16]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x08
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x08
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    call uefi_print
    add  rsp, 8
    mov  [rbp-32], rax
    mov  rax, [rbp-32]
    mov  [rbp-32], rax
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-16]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFF
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-16]
    push rax
    call uefi_print
    add  rsp, 8
    mov  [rbp-40], rax
    mov  rax, [rbp-40]
    mov  [rbp-40], rax

serial_write_kernel_start:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_write_kernel_init_ok:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_write_kernel_halt:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

tty_write_hex_u64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_0:
    mov  rax, [rbp-48]
    push rax
    mov  rax, 16
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 15
    push rax
    mov  rax, [rbp-48]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  [rbp-56], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-56]
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-72], rax
    mov  rax, [rbp-64]
    and  rax, 0xFF
    push rax
    mov  rax, 10
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-72], rax
    jmp  .if_end_2
.if_next_3:
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFF
    push rax
    mov  rax, 10
    and  rax, 0xFF
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-72], rax
    jmp  .if_end_2
.if_next_4:
.if_end_2:
    mov  rax, [rbp-72]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  rcx, [rbp-48]
    add  rax, rcx
    mov  [rbp-48], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

fb_glyph:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x30
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0x003C666E7666663C
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x31
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0x003C181818381800
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x32
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0x007E60300C06663C
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x33
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0x003C66061C06663C
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x34
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0x000C0C7E6C3C1C0C
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x35
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0x003C6606067C607E
    leave
    ret
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x36
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    mov  rax, 0x003C66667C60301C
    leave
    ret
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x37
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 0x00303030300C067E
    leave
    ret
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x38
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_17
    mov  rax, 0x003C66663C66663C
    leave
    ret
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x39
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    mov  rax, 0x00380C063E66663C
    leave
    ret
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x41
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    mov  rax, 0x0066667E66663C18
    leave
    ret
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x42
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_23
    mov  rax, 0x007C66667C66667C
    leave
    ret
    jmp  .if_end_22
.if_next_23:
.if_end_22:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x43
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_25
    mov  rax, 0x003C66606060663C
    leave
    ret
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x44
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_27
    mov  rax, 0x7C6666666666667C
    leave
    ret
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x45
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    mov  rax, 0x007E60607C60607E
    leave
    ret
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x46
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_31
    mov  rax, 0x006060607C60607E
    leave
    ret
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x47
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_33
    mov  rax, 0x003C6660606E663C
    leave
    ret
    jmp  .if_end_32
.if_next_33:
.if_end_32:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x48
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_35
    mov  rax, 0x006666667E666666
    leave
    ret
    jmp  .if_end_34
.if_next_35:
.if_end_34:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x49
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_37
    mov  rax, 0x003C18181818183C
    leave
    ret
    jmp  .if_end_36
.if_next_37:
.if_end_36:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_39
    mov  rax, 0x007E606060606060
    leave
    ret
    jmp  .if_end_38
.if_next_39:
.if_end_38:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_41
    mov  rax, 0x006363636B7F7763
    leave
    ret
    jmp  .if_end_40
.if_next_41:
.if_end_40:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_43
    mov  rax, 0x0066666E7E766666
    leave
    ret
    jmp  .if_end_42
.if_next_43:
.if_end_42:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_45
    mov  rax, 0x003C66666666663C
    leave
    ret
    jmp  .if_end_44
.if_next_45:
.if_end_44:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x50
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_47
    mov  rax, 0x006060607C66667C
    leave
    ret
    jmp  .if_end_46
.if_next_47:
.if_end_46:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x52
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_49
    mov  rax, 0x0066666C7C66667C
    leave
    ret
    jmp  .if_end_48
.if_next_49:
.if_end_48:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x53
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_51
    mov  rax, 0x003C66063C60663C
    leave
    ret
    jmp  .if_end_50
.if_next_51:
.if_end_50:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x54
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_53
    mov  rax, 0x001818181818187E
    leave
    ret
    jmp  .if_end_52
.if_next_53:
.if_end_52:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x55
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_55
    mov  rax, 0x003C666666666666
    leave
    ret
    jmp  .if_end_54
.if_next_55:
.if_end_54:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x56
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_57
    mov  rax, 0x00183C6666666666
    leave
    ret
    jmp  .if_end_56
.if_next_57:
.if_end_56:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x58
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_59
    mov  rax, 0x0066663C183C6666
    leave
    ret
    jmp  .if_end_58
.if_next_59:
.if_end_58:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_61
    mov  rax, 0x007E000000000000
    leave
    ret
    jmp  .if_end_60
.if_next_61:
.if_end_60:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_63
    mov  rax, 0x00007E00007E0000
    leave
    ret
    jmp  .if_end_62
.if_next_63:
.if_end_62:
    mov  rax, 0
    leave
    ret

fb_putc:
    push rbp
    mov  rbp, rsp
    sub  rsp, 160
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    and  rax, 0xFF
    mov  [rbp-56], rax
    mov  rax, 1
    mov  [rbp-64], rax
    mov  rax, 10
    mov  [rbp-72], rax
    mov  rax, [rbp-56]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, [rbp-40]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-56]
    and  rax, 0xFF
    push rax
    call fb_glyph
    add  rsp, 8
    mov  [rbp-80], rax
    mov  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  [rbp-88], rax
    mov  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  [rbp-96], rax
    mov  rax, [rbp-88]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    mov  [rbp-104], rax
    mov  rax, [rbp-96]
    push rax
    mov  rax, [rbp-72]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    mov  [rbp-112], rax
    mov  rax, [rbp-104]
    push rax
    mov  rax, 8
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-24]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, [rbp-40]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 0
    mov  [rbp-104], rax
    mov  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, [rbp-72]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    mov  [rbp-112], rax
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-112]
    push rax
    mov  rax, 8
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-32]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, 0
    mov  [rbp-120], rax
.while_start_6:
    mov  rax, [rbp-120]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    mov  rax, [rbp-80]
    push rax
    mov  rax, [rbp-120]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-128], rax
    mov  rax, 0
    mov  [rbp-136], rax
.while_start_8:
    mov  rax, [rbp-136]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_9
    mov  rax, [rbp-128]
    and  rax, 0xFF
    push rax
    mov  rax, 0x80
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-136]
    and  rax, 0xFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0
    mov  [rbp-144], rax
.while_start_12:
    mov  rax, [rbp-144]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_13
    mov  rax, 0
    mov  [rbp-152], rax
.while_start_14:
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_15
    mov  rax, [rbp-112]
    push rax
    mov  rax, [rbp-120]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-144]
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-16]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-104]
    push rax
    mov  rax, [rbp-136]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-152]
    pop  rcx
    add  rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-160], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-160]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 0x00FFFFFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1
    mov  rcx, [rbp-152]
    add  rax, rcx
    mov  [rbp-152], rax
    jmp  .while_start_14
.while_end_15:
    mov  rax, 1
    mov  rcx, [rbp-144]
    add  rax, rcx
    mov  [rbp-144], rax
    jmp  .while_start_12
.while_end_13:
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, 1
    mov  rcx, [rbp-136]
    add  rax, rcx
    mov  [rbp-136], rax
    jmp  .while_start_8
.while_end_9:
    mov  rax, 1
    mov  rcx, [rbp-120]
    add  rax, rcx
    mov  [rbp-120], rax
    jmp  .while_start_6
.while_end_7:
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    leave
    ret

fb_write_hex_u64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 96
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
    mov  rax, 0
    mov  [rbp-64], rax
.while_start_0:
    mov  rax, [rbp-64]
    push rax
    mov  rax, 16
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 15
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  [rbp-72], rax
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-72]
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-80], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-88], rax
    mov  rax, [rbp-80]
    and  rax, 0xFF
    push rax
    mov  rax, 10
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-88], rax
    jmp  .if_end_2
.if_next_3:
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFF
    push rax
    mov  rax, 10
    and  rax, 0xFF
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-88], rax
    jmp  .if_end_2
.if_next_4:
.if_end_2:
    mov  rax, [rbp-88]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 1
    mov  rcx, [rbp-64]
    add  rax, rcx
    mov  [rbp-64], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

fb_write_xhci_base_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x49
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x5F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_caplen_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x50
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_hciver_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x49
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x56
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_hcs1_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x31
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_hcs2_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x32
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_hcs3_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x33
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_dboff_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_rtsoff_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_ports_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x50
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_slots_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_cfg_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x47
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_dcbaap_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x50
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_crcr_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_erstba_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_erdp_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x50
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_iman_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x49
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

xhci_zero:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, 0
    mov  [rbp-24], rax
.while_start_0:
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-24]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-24]
    add  rax, rcx
    mov  [rbp-24], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

fb_write_usbcmd_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x55
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_usbsts_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0x55
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_fill_rect:
    push rbp
    mov  rbp, rsp
    sub  rsp, 112
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
    mov  rax, [rbp+72]
    mov  [rbp-64], rax
    mov  rax, [rbp+80]
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, 0
    mov  [rbp-80], rax
.while_start_0:
    mov  rax, [rbp-80]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-80]
    pop  rcx
    add  rax, rcx
    mov  [rbp-88], rax
    mov  rax, [rbp-88]
    push rax
    mov  rax, [rbp-32]
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 0
    mov  [rbp-96], rax
.while_start_4:
    mov  rax, [rbp-96]
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-96]
    pop  rcx
    add  rax, rcx
    mov  [rbp-104], rax
    mov  rax, [rbp-104]
    push rax
    mov  rax, [rbp-24]
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    jmp  .while_end_5
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-88]
    push rax
    mov  rax, [rbp-16]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-104]
    pop  rcx
    add  rax, rcx
    mov  [rbp-112], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-112]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1
    mov  rcx, [rbp-96]
    add  rax, rcx
    mov  [rbp-96], rax
    jmp  .while_start_4
.while_end_5:
    mov  rax, 1
    mov  rcx, [rbp-80]
    add  rax, rcx
    mov  [rbp-80], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

fb_mark_line:
    push rbp
    mov  rbp, rsp
    sub  rsp, 96
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, 1
    mov  [rbp-56], rax
    mov  rax, 10
    mov  [rbp-64], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, 8
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    imul rax, rcx
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-72]
    push rax
    mov  rax, 4
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    imul rax, rcx
    mov  [rbp-80], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    imul rax, rcx
    mov  [rbp-88], rax
    mov  rax, [rbp-48]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, 24
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-88]
    push rax
    mov  rax, [rbp-80]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call fb_fill_rect
    add  rsp, 72
    leave
    ret

tty_write_xhci_base_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x5F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x62
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret

tty_write_caplen_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret

tty_write_hciver_label:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x76
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret

irq_timer_tick:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    sub  rsp, 8
    call rt_ticks_ptr
    add  rsp, 8
    mov  [rbp-8], rax
    mov  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-16], rax
    mov  rax, 1
    mov  rcx, [rbp-16]
    add  rax, rcx
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-16]
    pop  rcx
    mov  qword [rcx], rax
    leave
    ret

irq_kbd_push:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    sub  rsp, 8
    call rt_kbd_buf_ptr
    add  rsp, 8
    mov  [rbp-16], rax
    sub  rsp, 8
    call rt_kbd_head_ptr
    add  rsp, 8
    mov  [rbp-24], rax
    sub  rsp, 8
    call rt_kbd_tail_ptr
    add  rsp, 8
    mov  [rbp-32], rax
    mov  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-40], rax
    mov  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-48], rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 63
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-56], rax
    mov  rax, [rbp-56]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-48]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-56]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    leave
    ret

panic:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  rdx, [rbp+24]
    test rdx, rdx
    jns  .param_str_ok_0
    neg  rdx
    dec  rdx
.param_str_ok_0:
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
    lea  rdi, [rel panic_str0]
    mov  rsi, 7
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_1
    neg  rsi
    dec  rsi
.str_len_ok_1:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel panic_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    cli
    mov  rax, 1
    mov  [rbp-24], rax
.while_start_2:
    mov  rax, [rbp-24]
    cmp  rax, 0
    je   .while_end_3
    hlt
    jmp  .while_start_2
.while_end_3:
    mov  rax, [rbp-16]
    test rax, rax
    jns  .str_free_done_4
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-8]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_4:
    leave
    ret

sel_shift:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  rax, 0xFF
    mov  [rbp-24], rax
    mov  rax, [rbp-8]
    cmp  rax, 0
    je   .if_next_1
    mov  rax, [rbp-24]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-16]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret

kbd_read_scancode:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0x64
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x01
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0x60
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    and  rax, 0xFF
    leave
    ret

kbd_flush:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0x64
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    and  rax, 0xFF
    mov  [rbp-8], rax
.while_start_0:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x01
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 0x60
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, 0x64
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    and  rax, 0xFF
    mov  [rbp-8], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

kbd_read_scancode_irq:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, 0x01002000
    mov  [rbp-8], rax
    mov  rax, 0x01001008
    mov  [rbp-16], rax
    mov  rax, 0x01001009
    mov  [rbp-24], rax
    mov  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-32], rax
    mov  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-40], rax
    mov  rax, [rbp-32]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-48], rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 63
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-40], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, [rbp-48]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret

kbd_scancode_to_ascii:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0x08
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0x0A
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x39
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0x20
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x02
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0x21
    and  rax, 0xFF
    push rax
    mov  rax, 0x31
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x03
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0x40
    and  rax, 0xFF
    push rax
    mov  rax, 0x32
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0x23
    and  rax, 0xFF
    push rax
    mov  rax, 0x33
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x05
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    mov  rax, 0x24
    and  rax, 0xFF
    push rax
    mov  rax, 0x34
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x06
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 0x25
    and  rax, 0xFF
    push rax
    mov  rax, 0x35
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x07
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_17
    mov  rax, 0x5E
    and  rax, 0xFF
    push rax
    mov  rax, 0x36
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    mov  rax, 0x26
    and  rax, 0xFF
    push rax
    mov  rax, 0x37
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x09
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    mov  rax, 0x2A
    and  rax, 0xFF
    push rax
    mov  rax, 0x38
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_23
    mov  rax, 0x28
    and  rax, 0xFF
    push rax
    mov  rax, 0x39
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_22
.if_next_23:
.if_end_22:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_25
    mov  rax, 0x29
    and  rax, 0xFF
    push rax
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_27
    mov  rax, 0x5F
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    mov  rax, 0x2B
    and  rax, 0xFF
    push rax
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x10
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_31
    mov  rax, 0x51
    and  rax, 0xFF
    push rax
    mov  rax, 0x71
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x11
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_33
    mov  rax, 0x57
    and  rax, 0xFF
    push rax
    mov  rax, 0x77
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_32
.if_next_33:
.if_end_32:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x12
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_35
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_34
.if_next_35:
.if_end_34:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x13
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_37
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_36
.if_next_37:
.if_end_36:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x14
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_39
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_38
.if_next_39:
.if_end_38:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x15
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_41
    mov  rax, 0x59
    and  rax, 0xFF
    push rax
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_40
.if_next_41:
.if_end_40:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x16
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_43
    mov  rax, 0x55
    and  rax, 0xFF
    push rax
    mov  rax, 0x75
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_42
.if_next_43:
.if_end_42:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x17
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_45
    mov  rax, 0x49
    and  rax, 0xFF
    push rax
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_44
.if_next_45:
.if_end_44:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x18
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_47
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_46
.if_next_47:
.if_end_46:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x19
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_49
    mov  rax, 0x50
    and  rax, 0xFF
    push rax
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_48
.if_next_49:
.if_end_48:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_51
    mov  rax, 0x7B
    and  rax, 0xFF
    push rax
    mov  rax, 0x5B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_50
.if_next_51:
.if_end_50:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_53
    mov  rax, 0x7D
    and  rax, 0xFF
    push rax
    mov  rax, 0x5D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_52
.if_next_53:
.if_end_52:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_55
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_54
.if_next_55:
.if_end_54:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_57
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_56
.if_next_57:
.if_end_56:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_59
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_58
.if_next_59:
.if_end_58:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x21
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_61
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    mov  rax, 0x66
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_60
.if_next_61:
.if_end_60:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x22
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_63
    mov  rax, 0x47
    and  rax, 0xFF
    push rax
    mov  rax, 0x67
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_62
.if_next_63:
.if_end_62:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x23
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_65
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_64
.if_next_65:
.if_end_64:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x24
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_67
    mov  rax, 0x4A
    and  rax, 0xFF
    push rax
    mov  rax, 0x6A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_66
.if_next_67:
.if_end_66:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x25
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_69
    mov  rax, 0x4B
    and  rax, 0xFF
    push rax
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_68
.if_next_69:
.if_end_68:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x26
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_71
    mov  rax, 0x4C
    and  rax, 0xFF
    push rax
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_70
.if_next_71:
.if_end_70:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x27
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_73
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, 0x3B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_72
.if_next_73:
.if_end_72:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_75
    mov  rax, 0x22
    and  rax, 0xFF
    push rax
    mov  rax, 0x27
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_74
.if_next_75:
.if_end_74:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x29
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_77
    mov  rax, 0x7E
    and  rax, 0xFF
    push rax
    mov  rax, 0x60
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_76
.if_next_77:
.if_end_76:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_79
    mov  rax, 0x7C
    and  rax, 0xFF
    push rax
    mov  rax, 0x5C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_78
.if_next_79:
.if_end_78:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_81
    mov  rax, 0x5A
    and  rax, 0xFF
    push rax
    mov  rax, 0x7A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_80
.if_next_81:
.if_end_80:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_83
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_82
.if_next_83:
.if_end_82:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_85
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_84
.if_next_85:
.if_end_84:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_87
    mov  rax, 0x56
    and  rax, 0xFF
    push rax
    mov  rax, 0x76
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_86
.if_next_87:
.if_end_86:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x30
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_89
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, 0x62
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_88
.if_next_89:
.if_end_88:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x31
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_91
    mov  rax, 0x4E
    and  rax, 0xFF
    push rax
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_90
.if_next_91:
.if_end_90:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x32
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_93
    mov  rax, 0x4D
    and  rax, 0xFF
    push rax
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_92
.if_next_93:
.if_end_92:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x33
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_95
    mov  rax, 0x3C
    and  rax, 0xFF
    push rax
    mov  rax, 0x2C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_94
.if_next_95:
.if_end_94:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x34
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_97
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, 0x2E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_96
.if_next_97:
.if_end_96:
    mov  rax, [rbp-8]
    and  rax, 0xFF
    push rax
    mov  rax, 0x35
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_99
    mov  rax, 0x3F
    and  rax, 0xFF
    push rax
    mov  rax, 0x2F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-16]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_98
.if_next_99:
.if_end_98:
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret

tty_scroll:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFFFF
    mov  [rbp-16], rax
    sub  rsp, 8
    call uefi_has_st
    add  rsp, 8
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0
    mov  [rbp-24], rax
.while_start_2:
    mov  rax, [rbp-24]
    push rax
    mov  rax, 1920
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-24]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 80
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    movzx eax, word [rax]
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-24]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  rcx, [rbp-24]
    add  rax, rcx
    mov  [rbp-24], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, 1920
    mov  [rbp-40], rax
.while_start_4:
    mov  rax, [rbp-40]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-40]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-16]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  rcx, [rbp-40]
    add  rax, rcx
    mov  [rbp-40], rax
    jmp  .while_start_4
.while_end_5:

tty_clear:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    cmp  rax, 0
    je   .if_next_1
    sub  rsp, 8
    call uefi_clear
    add  rsp, 8
    mov  [rbp-40], rax
    mov  rax, [rbp-40]
    mov  [rbp-40], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_2:
    mov  rax, [rbp-48]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-48]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  rcx, [rbp-48]
    add  rax, rcx
    mov  [rbp-48], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, [rbp-16]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax

tty_putc:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  rax, 0xFF
    mov  [rbp-40], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    mov  [rbp-48], rax
    mov  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  [rbp-56], rax
    mov  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  [rbp-64], rax
    mov  rax, 0
    mov  [rbp-72], rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, [rbp-48]
    cmp  rax, 0
    je   .if_next_3
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 0
    mov  [rbp-64], rax
    mov  rax, 1
    mov  rcx, [rbp-56]
    add  rax, rcx
    mov  [rbp-56], rax
    jmp  .if_end_0
.if_next_1:
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_6
    mov  rax, [rbp-48]
    cmp  rax, 0
    je   .if_next_8
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_7
.if_next_8:
.if_end_7:
    mov  rax, 0
    mov  [rbp-64], rax
    jmp  .if_end_5
.if_next_6:
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, [rbp-48]
    cmp  rax, 0
    je   .if_next_13
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    mov  rax, [rbp-64]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 1
    mov  rcx, [rbp-64]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-64], rax
    jmp  .if_end_14
.if_next_15:
    mov  rax, [rbp-56]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_18
    mov  rax, 1
    mov  rcx, [rbp-56]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-56], rax
    mov  rax, 79
    mov  [rbp-64], rax
    jmp  .if_end_17
.if_next_18:
    mov  rax, 0
    mov  [rbp-64], rax
    jmp  .if_end_17
.if_next_19:
.if_end_17:
    jmp  .if_end_14
.if_next_16:
.if_end_14:
    mov  rax, [rbp-48]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    mov  rax, [rbp-56]
    push rax
    mov  rax, 80
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    add  rax, rcx
    mov  [rbp-72], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-72]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    jmp  .if_end_10
.if_next_11:
    mov  rax, [rbp-48]
    cmp  rax, 0
    je   .if_next_24
    mov  rax, [rbp-40]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_23
.if_next_24:
    mov  rax, [rbp-56]
    push rax
    mov  rax, 80
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    add  rax, rcx
    mov  [rbp-72], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-72]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, [rbp-40]
    and  rax, 0xFF
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    jmp  .if_end_23
.if_next_25:
.if_end_23:
    mov  rax, 1
    mov  rcx, [rbp-64]
    add  rax, rcx
    mov  [rbp-64], rax
    jmp  .if_end_10
.if_next_22:
.if_end_10:
    jmp  .if_end_5
.if_next_9:
.if_end_5:
    jmp  .if_end_0
.if_next_4:
.if_end_0:
    mov  rax, [rbp-64]
    push rax
    mov  rax, 80
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_27
    mov  rax, 0
    mov  [rbp-64], rax
    mov  rax, 1
    mov  rcx, [rbp-56]
    add  rax, rcx
    mov  [rbp-56], rax
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    mov  rax, [rbp-56]
    push rax
    mov  rax, 25
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    sub  rsp, 8
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_scroll
    add  rsp, 24
    mov  rax, 24
    mov  [rbp-56], rax
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    mov  qword [rcx], rax
    leave
    ret

tty_write_prompt:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret

tty_write_buf:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0
    mov  [rbp-56], rax
.while_start_0:
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-56]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    mov  rax, [rbp-64]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  rcx, [rbp-56]
    add  rax, rcx
    mov  [rbp-56], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

line_copy:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, 0
    mov  [rbp-32], rax
.while_start_0:
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-32]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-32]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-32]
    add  rax, rcx
    mov  [rbp-32], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

line_redraw:
    push rbp
    mov  rbp, rsp
    sub  rsp, 144
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
    mov  rax, [rbp+72]
    mov  [rbp-64], rax
    mov  rax, [rbp+80]
    mov  [rbp-72], rax
    mov  rax, [rbp+88]
    mov  [rbp-80], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-48]
    pop  rcx
    mov  qword [rcx], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    cmp  rax, 0
    je   .if_next_1
    sub  rsp, 8
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-48]
    push rax
    call uefi_set_cursor_pos
    add  rsp, 24
    mov  [rbp-88], rax
    mov  rax, [rbp-88]
    mov  [rbp-88], rax
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0
    mov  [rbp-96], rax
.while_start_2:
    mov  rax, [rbp-96]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-104], rax
    mov  rax, [rbp-104]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  rcx, [rbp-96]
    add  rax, rcx
    mov  [rbp-96], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    mov  [rbp-112], rax
.while_start_6:
    mov  rax, [rbp-112]
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  rcx, [rbp-112]
    add  rax, rcx
    mov  [rbp-112], rax
    jmp  .while_start_6
.while_end_7:
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-80]
    pop  rcx
    add  rax, rcx
    mov  [rbp-120], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-120]
    push rax
    mov  rax, 80
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-128], rax
    mov  rax, [rbp-120]
    push rax
    mov  rax, [rbp-120]
    push rax
    mov  rax, 80
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    push rax
    mov  rax, 80
    pop  rcx
    imul rax, rcx
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-136], rax
    mov  rax, [rbp-128]
    push rax
    mov  rax, 25
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 24
    mov  [rbp-128], rax
    mov  rax, [rbp-136]
    push rax
    mov  rax, 80
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 79
    mov  [rbp-136], rax
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-128]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-136]
    pop  rcx
    mov  qword [rcx], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    cmp  rax, 0
    je   .if_next_13
    sub  rsp, 8
    mov  rax, [rbp-128]
    push rax
    mov  rax, [rbp-136]
    push rax
    call uefi_set_cursor_pos
    add  rsp, 24
    mov  [rbp-144], rax
    mov  rax, [rbp-144]
    mov  [rbp-144], rax
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    leave
    ret

line_clear_display:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  rax, 0xFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 0
    mov  [rbp-56], rax
.while_start_0:
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_write_backspace
    add  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  rcx, [rbp-56]
    add  rax, rcx
    mov  [rbp-56], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

line_echo_buf:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  rax, 0xFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
    mov  rax, 0
    mov  [rbp-64], rax
.while_start_0:
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-56]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-64]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-72], rax
    sub  rsp, 8
    mov  rax, [rbp-72]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-72]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  rcx, [rbp-64]
    add  rax, rcx
    mov  [rbp-64], rax
    jmp  .while_start_0
.while_end_1:
    leave
    ret

hist_entry_ptr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 256
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    leave
    ret

hist_get_len:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-16]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-24], rax
    mov  rax, [rbp-24]
    and  rax, 0xFF
    leave
    ret

hist_set_len:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-16]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-24]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    leave
    ret

tty_write_help:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x3C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret

cmd_is_help:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x68
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x65
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x70
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, 1
    leave
    ret

cmd_is_cls:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 3
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x63
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x73
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, 1
    leave
    ret

cmd_is_halt:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x68
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x61
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x74
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, 1
    leave
    ret

cmd_is_echo:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x65
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x63
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x68
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, 1
    leave
    ret

cmd_is_panic:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 5
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x70
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x61
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x69
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 4
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x63
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0
    leave
    ret
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, 1
    leave
    ret

serial_log_cmd_help:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_cmd_echo:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_cmd_cls:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_cmd_halt:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_cmd_panic:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_cmd_unknown:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_key_up:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x75
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_key_down:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x77
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_key_left:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x66
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

serial_log_key_right:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x67
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-8]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    leave
    ret

run_command:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  rax, 0xFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
    mov  rax, [rbp-56]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    push rax
    call cmd_is_help
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_3
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_help
    add  rsp, 8
    sub  rsp, 8
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_write_help
    add  rsp, 40
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    sub  rsp, 8
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    push rax
    call cmd_is_cls
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_5
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_cls
    add  rsp, 8
    sub  rsp, 8
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_clear
    add  rsp, 40
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    sub  rsp, 8
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    push rax
    call cmd_is_halt
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_7
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_halt
    add  rsp, 8
    cli
    mov  rax, 1
    mov  [rbp-64], rax
.while_start_8:
    mov  rax, [rbp-64]
    cmp  rax, 0
    je   .while_end_9
    hlt
    jmp  .while_start_8
.while_end_9:
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    sub  rsp, 8
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    push rax
    call cmd_is_panic
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_11
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_panic
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rel run_command_str0]
    mov  rdx, 12
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call panic
    add  rsp, 24
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    sub  rsp, 8
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-48]
    push rax
    call cmd_is_echo
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_13
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_echo
    add  rsp, 8
    mov  rax, 4
    mov  [rbp-72], rax
    mov  rax, [rbp-56]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, [rbp-48]
    push rax
    mov  rax, 4
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_17
    mov  rax, 5
    mov  [rbp-72], rax
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-72]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    sub  rsp, 8
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-72]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-72]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_write_buf
    add  rsp, 56
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    mov  rax, [rbp-40]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_unknown
    add  rsp, 8
    mov  rax, 0x3F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-32]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-8]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret

_start:
    push rbp
    mov  rbp, rsp
    sub  rsp, 1072
    sub  rsp, 8
    call uefi_get_fb_base
    add  rsp, 8
    mov  [rbp-8], rax
    sub  rsp, 8
    call uefi_get_fb_stride
    add  rsp, 8
    mov  [rbp-16], rax
    sub  rsp, 8
    call uefi_get_fb_width
    add  rsp, 8
    mov  [rbp-24], rax
    sub  rsp, 8
    call uefi_get_fb_height
    add  rsp, 8
    mov  [rbp-32], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, [rbp-8]
    mov  [rbp-40], rax
    mov  rax, 0x00FF0000
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    push rax
    mov  rax, 48
    push rax
    mov  rax, 100
    push rax
    mov  rax, 400
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    push rax
    call fb_fill_rect
    add  rsp, 72
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    mov  [rbp-48], rax
    sub  rsp, 8
    call uefi_has_st
    add  rsp, 8
    mov  [rbp-56], rax
    mov  rax, [rbp-56]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-64], rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_init
    add  rsp, 8
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_start
    add  rsp, 8
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 0xB8000
    mov  [rbp-72], rax
    mov  rax, 0x0F00
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-80], rax
    mov  rax, [rbp-56]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    mov  [rbp-88], rax
.while_start_6:
    mov  rax, [rbp-88]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-88]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  rcx, [rbp-88]
    add  rax, rcx
    mov  [rbp-88], rax
    jmp  .while_start_6
.while_end_7:
    mov  rax, 996
    mov  [rbp-96], rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x45
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x4C
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x46
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x49
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 4
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x52
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 6
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x4F
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-96]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 7
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x4B
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, [rbp-56]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-104], rax
    mov  rax, [rbp-104]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_init_ok
    add  rsp, 8
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    sub  rsp, 8
    call rt_ticks_ptr
    add  rsp, 8
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    sub  rsp, 8
    call rt_kbd_head_ptr
    add  rsp, 8
    push rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    sub  rsp, 8
    call rt_kbd_tail_ptr
    add  rsp, 8
    push rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    sub  rsp, 8
    call kbd_flush
    add  rsp, 8
    mov  rax, 1
    mov  [rbp-112], rax
    mov  rax, [rbp-112]
    mov  [rbp-120], rax
    mov  rax, [rbp-56]
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0
    mov  [rbp-112], rax
    mov  rax, 0
    mov  [rbp-120], rax
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, [rbp-112]
    cmp  rax, 0
    je   .if_next_13
    sti
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    mov  rax, [rbp-56]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-128], rax
    mov  rax, [rbp-128]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_halt
    add  rsp, 8
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    mov  rax, 0
    mov  [rbp-136], rax
    mov  rax, 0
    mov  [rbp-144], rax
    lea  rax, [rbp-136]
    mov  [rbp-152], rax
    lea  rax, [rbp-144]
    mov  [rbp-160], rax
    mov  rax, 0
    mov  [rbp-168], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_17
    sub  rsp, 8
    call uefi_has_st
    add  rsp, 8
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    mov  rax, [rbp-8]
    push rax
    call rt_map_fb
    add  rsp, 8
    mov  [rbp-176], rax
    mov  rax, [rbp-176]
    mov  [rbp-176], rax
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    mov  rax, 0
    mov  [rbp-184], rax
    mov  rax, 0
    mov  [rbp-192], rax
    lea  rax, [rbp-184]
    mov  [rbp-200], rax
    lea  rax, [rbp-192]
    mov  [rbp-208], rax
    mov  rax, [rbp-8]
    mov  [rbp-216], rax
    mov  rax, 1600000000
    mov  [rbp-224], rax
.while_start_20:
    mov  rax, [rbp-224]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_21
    mov  rax, 1
    mov  rcx, [rbp-224]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-224], rax
    nop
    jmp  .while_start_20
.while_end_21:
    mov  rax, 0x00000000
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, 0
    push rax
    mov  rax, 0
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_fill_rect
    add  rsp, 72
    sub  rsp, 8
    call uefi_get_xhci_base
    add  rsp, 8
    mov  [rbp-232], rax
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_xhci_base_label
    add  rsp, 56
    mov  rax, [rbp-232]
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 0x00FF8800
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_mark_line
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-232]
    mov  [rbp-240], rax
    mov  rax, [rbp-240]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-248], rax
    mov  rax, [rbp-248]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-256], rax
    mov  rax, [rbp-248]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-264], rax
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_caplen_label
    add  rsp, 56
    mov  rax, [rbp-256]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hciver_label
    add  rsp, 56
    mov  rax, [rbp-264]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 0x0000FF00
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_mark_line
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-232]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-272], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, 0x08
    pop  rcx
    add  rax, rcx
    mov  [rbp-280], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, 0x0C
    pop  rcx
    add  rax, rcx
    mov  [rbp-288], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, 0x14
    pop  rcx
    add  rax, rcx
    mov  [rbp-296], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, 0x18
    pop  rcx
    add  rax, rcx
    mov  [rbp-304], rax
    mov  rax, [rbp-272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-312], rax
    mov  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-320], rax
    mov  rax, [rbp-288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-328], rax
    mov  rax, [rbp-296]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-336], rax
    mov  rax, [rbp-304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-344], rax
    mov  rax, [rbp-312]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 24
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-352], rax
    mov  rax, [rbp-312]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-360], rax
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hcs1_label
    add  rsp, 56
    mov  rax, [rbp-312]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hcs2_label
    add  rsp, 56
    mov  rax, [rbp-320]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hcs3_label
    add  rsp, 56
    mov  rax, [rbp-328]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_dboff_label
    add  rsp, 56
    mov  rax, [rbp-336]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_rtsoff_label
    add  rsp, 56
    mov  rax, [rbp-344]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_ports_label
    add  rsp, 56
    mov  rax, [rbp-352]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_slots_label
    add  rsp, 56
    mov  rax, [rbp-360]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-232]
    push rax
    mov  rax, [rbp-256]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-368], rax
    mov  rax, [rbp-368]
    push rax
    mov  rax, 0x00
    pop  rcx
    add  rax, rcx
    mov  [rbp-376], rax
    mov  rax, [rbp-368]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-384], rax
    mov  rax, [rbp-376]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-392], rax
    mov  rax, [rbp-384]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-400], rax
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_usbcmd_label
    add  rsp, 56
    mov  rax, [rbp-392]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_usbsts_label
    add  rsp, 56
    mov  rax, [rbp-400]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-392]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-408], rax
    mov  rax, [rbp-376]
    push rax
    mov  rax, [rbp-408]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-416], rax
.while_start_22:
    mov  rax, [rbp-416]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_23
    mov  rax, [rbp-376]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_25
    jmp  .while_end_23
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    mov  rax, 1
    mov  rcx, [rbp-416]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-416], rax
    jmp  .while_start_22
.while_end_23:
    mov  rax, [rbp-376]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-424], rax
    mov  rax, [rbp-384]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-432], rax
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_usbcmd_label
    add  rsp, 56
    mov  rax, [rbp-424]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_usbsts_label
    add  rsp, 56
    mov  rax, [rbp-432]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-424]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-440], rax
    mov  rax, [rbp-376]
    push rax
    mov  rax, [rbp-440]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-448], rax
.while_start_26:
    mov  rax, [rbp-448]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_27
    mov  rax, [rbp-384]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    jmp  .while_end_27
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    mov  rax, 1
    mov  rcx, [rbp-448]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-448], rax
    jmp  .while_start_26
.while_end_27:
    mov  rax, [rbp-376]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-456], rax
    mov  rax, [rbp-384]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-464], rax
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_usbcmd_label
    add  rsp, 56
    mov  rax, [rbp-456]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_usbsts_label
    add  rsp, 56
    mov  rax, [rbp-464]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-320]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x1F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-472], rax
    mov  rax, [rbp-320]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 27
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x1F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-480], rax
    mov  rax, [rbp-480]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 5
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-488], rax
    mov  rax, [rbp-488]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_31
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-488], rax
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    sub  rsp, 8
    call rt_xhci_dcbaa
    add  rsp, 8
    mov  [rbp-496], rax
    sub  rsp, 8
    call rt_xhci_cmd_ring
    add  rsp, 8
    mov  [rbp-504], rax
    sub  rsp, 8
    call rt_xhci_evt_ring
    add  rsp, 8
    mov  [rbp-512], rax
    sub  rsp, 8
    call rt_xhci_erst
    add  rsp, 8
    mov  [rbp-520], rax
    sub  rsp, 8
    call rt_xhci_scratch_array
    add  rsp, 8
    mov  [rbp-528], rax
    sub  rsp, 8
    call rt_xhci_scratch_bufs
    add  rsp, 8
    mov  [rbp-536], rax
    sub  rsp, 8
    mov  rax, 2048
    push rax
    mov  rax, [rbp-496]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    mov  rax, [rbp-504]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    mov  rax, [rbp-512]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 16
    push rax
    mov  rax, [rbp-520]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 256
    push rax
    mov  rax, [rbp-528]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    mov  rax, 32
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-536]
    push rax
    call xhci_zero
    add  rsp, 24
    mov  rax, [rbp-488]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_33
    mov  rax, [rbp-528]
    mov  [rbp-544], rax
    mov  rax, [rbp-496]
    mov  [rbp-552], rax
    mov  rax, [rbp-552]
    push rax
    mov  rax, [rbp-528]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 0
    mov  [rbp-560], rax
.while_start_34:
    mov  rax, [rbp-560]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-488]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_35
    mov  rax, [rbp-536]
    push rax
    mov  rax, [rbp-560]
    push rax
    mov  rax, 4096
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  [rbp-568], rax
    mov  rax, [rbp-544]
    push rax
    mov  rax, [rbp-560]
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    push rax
    mov  rax, [rbp-568]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 1
    mov  rcx, [rbp-560]
    add  rax, rcx
    mov  [rbp-560], rax
    jmp  .while_start_34
.while_end_35:
    jmp  .if_end_32
.if_next_33:
.if_end_32:
    mov  rax, [rbp-232]
    push rax
    mov  rax, [rbp-256]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-576], rax
    mov  rax, [rbp-576]
    push rax
    mov  rax, 0x00
    pop  rcx
    add  rax, rcx
    mov  [rbp-584], rax
    mov  rax, [rbp-576]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-592], rax
    mov  rax, [rbp-576]
    push rax
    mov  rax, 0x38
    pop  rcx
    add  rax, rcx
    mov  [rbp-600], rax
    mov  rax, [rbp-576]
    push rax
    mov  rax, 0x30
    pop  rcx
    add  rax, rcx
    mov  [rbp-608], rax
    mov  rax, [rbp-576]
    push rax
    mov  rax, 0x18
    pop  rcx
    add  rax, rcx
    mov  [rbp-616], rax
    mov  rax, [rbp-584]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFFE
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-624], rax
    mov  rax, [rbp-584]
    push rax
    mov  rax, [rbp-624]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-632], rax
.while_start_36:
    mov  rax, [rbp-632]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_37
    mov  rax, [rbp-592]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_39
    jmp  .while_end_37
    jmp  .if_end_38
.if_next_39:
.if_end_38:
    mov  rax, 1
    mov  rcx, [rbp-632]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-632], rax
    jmp  .while_start_36
.while_end_37:
    mov  rax, [rbp-584]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-640], rax
    mov  rax, [rbp-584]
    push rax
    mov  rax, [rbp-640]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-648], rax
.while_start_40:
    mov  rax, [rbp-648]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_41
    mov  rax, [rbp-584]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_43
    jmp  .while_end_41
    jmp  .if_end_42
.if_next_43:
.if_end_42:
    mov  rax, 1
    mov  rcx, [rbp-648]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-648], rax
    jmp  .while_start_40
.while_end_41:
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-656], rax
    mov  rax, [rbp-360]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_45
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-656], rax
    jmp  .if_end_44
.if_next_45:
.if_end_44:
    mov  rax, [rbp-600]
    push rax
    mov  rax, [rbp-656]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-608]
    push rax
    mov  rax, [rbp-496]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-616]
    push rax
    mov  rax, [rbp-504]
    push rax
    mov  rax, 1
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-520]
    mov  [rbp-664], rax
    mov  rax, [rbp-664]
    push rax
    mov  rax, [rbp-512]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-664]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    push rax
    mov  rax, 256
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, [rbp-344]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFE0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-672], rax
    mov  rax, [rbp-672]
    push rax
    mov  rax, 0x20
    pop  rcx
    add  rax, rcx
    mov  [rbp-680], rax
    mov  rax, [rbp-672]
    push rax
    mov  rax, 0x24
    pop  rcx
    add  rax, rcx
    mov  [rbp-688], rax
    mov  rax, [rbp-672]
    push rax
    mov  rax, 0x28
    pop  rcx
    add  rax, rcx
    mov  [rbp-696], rax
    mov  rax, [rbp-672]
    push rax
    mov  rax, 0x30
    pop  rcx
    add  rax, rcx
    mov  [rbp-704], rax
    mov  rax, [rbp-672]
    push rax
    mov  rax, 0x38
    pop  rcx
    add  rax, rcx
    mov  [rbp-712], rax
    mov  rax, [rbp-688]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-696]
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-704]
    push rax
    mov  rax, [rbp-520]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-712]
    push rax
    mov  rax, [rbp-512]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-680]
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-584]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-720], rax
    mov  rax, [rbp-584]
    push rax
    mov  rax, [rbp-720]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-728], rax
.while_start_46:
    mov  rax, [rbp-728]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_47
    mov  rax, [rbp-592]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_49
    jmp  .while_end_47
    jmp  .if_end_48
.if_next_49:
.if_end_48:
    mov  rax, 1
    mov  rcx, [rbp-728]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-728], rax
    jmp  .while_start_46
.while_end_47:
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_cfg_label
    add  rsp, 56
    mov  rax, [rbp-656]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_dcbaap_label
    add  rsp, 56
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_crcr_label
    add  rsp, 56
    mov  rax, [rbp-504]
    push rax
    mov  rax, 1
    pop  rcx
    or   rax, rcx
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_erstba_label
    add  rsp, 56
    mov  rax, [rbp-520]
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_erdp_label
    add  rsp, 56
    mov  rax, [rbp-512]
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_iman_label
    add  rsp, 56
    mov  rax, [rbp-680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, [rbp-200]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-200]
    mov  rax, qword [rax]
    mov  [rbp-736], rax
    mov  rax, [rbp-208]
    mov  rax, qword [rax]
    mov  [rbp-744], rax
    lea  rax, [rbp-736]
    mov  [rbp-752], rax
    lea  rax, [rbp-744]
    mov  [rbp-760], rax
.while_start_50:
    mov  rax, 1
    cmp  rax, 0
    je   .while_end_51
    sub  rsp, 8
    call uefi_read_key
    add  rsp, 8
    mov  [rbp-768], rax
    mov  rax, [rbp-768]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_53
    mov  rax, [rbp-768]
    push rax
    mov  rax, 0xFFFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-776], rax
    mov  rax, [rbp-776]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0x0D
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_55
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-760]
    push rax
    mov  rax, [rbp-752]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_54
.if_next_55:
    mov  rax, [rbp-776]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-760]
    push rax
    mov  rax, [rbp-752]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_54
.if_next_56:
    mov  rax, [rbp-776]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_57
    mov  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_59
    mov  rax, [rbp-752]
    push rax
    mov  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    jmp  .if_end_58
.if_next_59:
.if_end_58:
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-760]
    push rax
    mov  rax, [rbp-752]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_54
.if_next_57:
    mov  rax, [rbp-776]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0xFF
    and  rax, 0xFFFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-760]
    push rax
    mov  rax, [rbp-752]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-216]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_54
.if_next_60:
.if_end_54:
    jmp  .if_end_52
.if_next_53:
.if_end_52:
    nop
    jmp  .while_start_50
.while_end_51:
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    sub  rsp, 8
    call rt_uefi_line
    add  rsp, 8
    mov  [rbp-784], rax
    sub  rsp, 8
    call rt_uefi_last_line
    add  rsp, 8
    mov  [rbp-792], rax
    sub  rsp, 8
    call rt_uefi_hist_base
    add  rsp, 8
    mov  [rbp-800], rax
    sub  rsp, 8
    call rt_uefi_hist_len_base
    add  rsp, 8
    mov  [rbp-808], rax
    sub  rsp, 8
    call rt_uefi_edit_buf
    add  rsp, 8
    mov  [rbp-816], rax
    mov  rax, 0
    mov  [rbp-824], rax
    mov  rax, 0
    mov  [rbp-832], rax
    mov  rax, 0
    mov  [rbp-840], rax
    mov  rax, 0
    mov  [rbp-848], rax
    mov  rax, 256
    mov  [rbp-856], rax
    mov  rax, 0
    mov  [rbp-864], rax
    mov  rax, 0
    mov  [rbp-872], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, 0
    mov  [rbp-888], rax
    mov  rax, 0
    mov  [rbp-896], rax
    mov  rax, 0
    mov  [rbp-904], rax
    mov  rax, 0
    mov  [rbp-912], rax
    sub  rsp, 8
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call tty_clear
    add  rsp, 40
    sub  rsp, 8
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call tty_write_prompt
    add  rsp, 40
    mov  rax, [rbp-152]
    mov  rax, qword [rax]
    mov  [rbp-904], rax
    mov  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  [rbp-912], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, 1
    mov  [rbp-920], rax
.while_start_61:
    mov  rax, [rbp-920]
    cmp  rax, 0
    je   .while_end_62
    mov  rax, 0
    mov  [rbp-928], rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-936], rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-944], rax
    mov  rax, [rbp-48]
    cmp  rax, 0
    je   .if_next_64
    sub  rsp, 8
    call uefi_read_key
    add  rsp, 8
    mov  [rbp-928], rax
    mov  rax, [rbp-928]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_66
    mov  rax, [rbp-928]
    push rax
    mov  rax, 0xFFFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-936], rax
    mov  rax, [rbp-928]
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xFFFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-944], rax
    jmp  .if_end_65
.if_next_66:
.if_end_65:
    jmp  .if_end_63
.if_next_64:
.if_end_63:
    mov  rax, [rbp-48]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-936]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-944]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_68
    mov  rax, [rbp-944]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_70
    mov  rax, [rbp-944]
    and  rax, 0xFFFF
    push rax
    mov  rax, 1
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_72
    mov  rax, [rbp-872]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_74
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_up
    add  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_76
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-816]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    mov  [rbp-888], rax
    mov  rax, [rbp-864]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_78
    mov  rax, 8
    mov  rcx, [rbp-880]
    add  rax, rcx
    mov  [rbp-880], rax
    jmp  .if_end_77
.if_next_78:
.if_end_77:
    jmp  .if_end_75
.if_next_76:
    mov  rax, [rbp-864]
    push rax
    mov  rax, [rbp-872]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-952], rax
.while_start_80:
    mov  rax, [rbp-952]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_81
    mov  rax, 8
    mov  rcx, [rbp-952]
    add  rax, rcx
    mov  [rbp-952], rax
    jmp  .while_start_80
.while_end_81:
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-952]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_83
    mov  rax, [rbp-880]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_85
    mov  rax, 8
    mov  rcx, [rbp-880]
    add  rax, rcx
    mov  [rbp-880], rax
    jmp  .if_end_84
.if_next_85:
.if_end_84:
    jmp  .if_end_82
.if_next_83:
.if_end_82:
    jmp  .if_end_75
.if_next_79:
.if_end_75:
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-800]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-960], rax
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-808]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-824], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-960]
    push rax
    mov  rax, [rbp-784]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .if_end_73
.if_next_74:
.if_end_73:
    jmp  .if_end_71
.if_next_72:
    mov  rax, [rbp-944]
    and  rax, 0xFFFF
    push rax
    mov  rax, 2
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_88
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_90
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_down
    add  rsp, 8
    mov  rax, [rbp-864]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-968], rax
    mov  rax, [rbp-968]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_92
    mov  rax, 8
    mov  rcx, [rbp-968]
    add  rax, rcx
    mov  [rbp-968], rax
    jmp  .if_end_91
.if_next_92:
.if_end_91:
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-968]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_94
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-888]
    push rax
    mov  rax, [rbp-816]
    push rax
    mov  rax, [rbp-784]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-888]
    mov  [rbp-824], rax
    jmp  .if_end_93
.if_next_94:
    mov  rax, [rbp-880]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-880]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_97
    mov  rax, 8
    mov  rcx, [rbp-880]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    jmp  .if_end_96
.if_next_97:
.if_end_96:
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-800]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-976], rax
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-808]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-824], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-976]
    push rax
    mov  rax, [rbp-784]
    push rax
    call line_copy
    add  rsp, 24
    jmp  .if_end_93
.if_next_95:
.if_end_93:
    mov  rax, [rbp-824]
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .if_end_89
.if_next_90:
.if_end_89:
    jmp  .if_end_87
.if_next_88:
    mov  rax, [rbp-944]
    and  rax, 0xFFFF
    push rax
    mov  rax, 4
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_100
    mov  rax, [rbp-848]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_102
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_left
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-848]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_101
.if_next_102:
.if_end_101:
    jmp  .if_end_99
.if_next_100:
    mov  rax, [rbp-944]
    and  rax, 0xFFFF
    push rax
    mov  rax, 3
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_105
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-824]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_107
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_right
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-848]
    add  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_106
.if_next_107:
.if_end_106:
    jmp  .if_end_104
.if_next_105:
.if_end_104:
    jmp  .if_end_99
.if_next_103:
.if_end_99:
    jmp  .if_end_87
.if_next_98:
.if_end_87:
    jmp  .if_end_71
.if_next_86:
.if_end_71:
    jmp  .while_start_61
    jmp  .if_end_69
.if_next_70:
.if_end_69:
    mov  rax, [rbp-936]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_109
    mov  rax, [rbp-936]
    and  rax, 0xFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-984], rax
    mov  rax, [rbp-984]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_111
    mov  rax, 0x0A
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-984], rax
    jmp  .if_end_110
.if_next_111:
.if_end_110:
    mov  rax, [rbp-984]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_113
    mov  rax, [rbp-848]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_115
    mov  rax, [rbp-848]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-992], rax
.while_start_116:
    mov  rax, [rbp-992]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_117
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-992]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-992]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-992]
    add  rax, rcx
    mov  [rbp-992], rax
    jmp  .while_start_116
.while_end_117:
    mov  rax, 1
    mov  rcx, [rbp-824]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-824], rax
    mov  rax, 1
    mov  rcx, [rbp-848]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .if_end_114
.if_next_115:
.if_end_114:
    jmp  .while_start_61
    jmp  .if_end_112
.if_next_113:
.if_end_112:
    mov  rax, [rbp-984]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_119
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    mov  rax, [rbp-984]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, [rbp-824]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_121
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-792]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    mov  [rbp-832], rax
    sub  rsp, 8
    mov  rax, [rbp-864]
    push rax
    mov  rax, [rbp-800]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-1000], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-1000]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-864]
    push rax
    mov  rax, [rbp-808]
    push rax
    call hist_set_len
    add  rsp, 24
    mov  rax, 1
    mov  rcx, [rbp-864]
    add  rax, rcx
    mov  [rbp-864], rax
    mov  rax, [rbp-864]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_123
    mov  rax, 0
    mov  [rbp-864], rax
    jmp  .if_end_122
.if_next_123:
.if_end_122:
    mov  rax, [rbp-872]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_125
    mov  rax, 1
    mov  rcx, [rbp-872]
    add  rax, rcx
    mov  [rbp-872], rax
    jmp  .if_end_124
.if_next_125:
.if_end_124:
    jmp  .if_end_120
.if_next_121:
.if_end_120:
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call run_command
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-824], rax
    mov  rax, 0
    mov  [rbp-848], rax
    mov  rax, 0
    mov  [rbp-840], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    sub  rsp, 8
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call tty_write_prompt
    add  rsp, 40
    mov  rax, [rbp-152]
    mov  rax, qword [rax]
    mov  [rbp-904], rax
    mov  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  [rbp-912], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    jmp  .while_start_61
    jmp  .if_end_118
.if_next_119:
.if_end_118:
    mov  rax, [rbp-984]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_127
    jmp  .while_start_61
    jmp  .if_end_126
.if_next_127:
.if_end_126:
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-856]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_129
    jmp  .while_start_61
    jmp  .if_end_128
.if_next_129:
.if_end_128:
    mov  rax, [rbp-824]
    mov  [rbp-88], rax
.while_start_130:
    mov  rax, [rbp-88]
    push rax
    mov  rax, [rbp-848]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_131
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-88]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-88]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    sub  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-88]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-88], rax
    jmp  .while_start_130
.while_end_131:
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-848]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-984]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-824]
    add  rax, rcx
    mov  [rbp-824], rax
    mov  rax, 1
    mov  rcx, [rbp-848]
    add  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-984]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .while_start_61
    jmp  .if_end_108
.if_next_109:
.if_end_108:
    jmp  .if_end_67
.if_next_68:
.if_end_67:
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1008], rax
    mov  rax, [rbp-120]
    cmp  rax, 0
    je   .if_next_133
    sub  rsp, 8
    call kbd_read_scancode_irq
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1008], rax
    jmp  .if_end_132
.if_next_133:
    sub  rsp, 8
    call kbd_read_scancode
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1008], rax
    jmp  .if_end_132
.if_next_134:
.if_end_132:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_136
    jmp  .while_start_61
    jmp  .if_end_135
.if_next_136:
.if_end_135:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0xE0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_138
    mov  rax, 1
    mov  [rbp-896], rax
    jmp  .while_start_61
    jmp  .if_end_137
.if_next_138:
.if_end_137:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0xE1
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_140
    jmp  .while_start_61
    jmp  .if_end_139
.if_next_140:
.if_end_139:
    mov  rax, [rbp-896]
    cmp  rax, 0
    je   .if_next_142
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x48
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_144
    mov  rax, [rbp-872]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_146
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_up
    add  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_148
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-816]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    mov  [rbp-888], rax
    mov  rax, [rbp-864]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_150
    mov  rax, 8
    mov  rcx, [rbp-880]
    add  rax, rcx
    mov  [rbp-880], rax
    jmp  .if_end_149
.if_next_150:
.if_end_149:
    jmp  .if_end_147
.if_next_148:
    mov  rax, [rbp-864]
    push rax
    mov  rax, [rbp-872]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1016], rax
.while_start_152:
    mov  rax, [rbp-1016]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_153
    mov  rax, 8
    mov  rcx, [rbp-1016]
    add  rax, rcx
    mov  [rbp-1016], rax
    jmp  .while_start_152
.while_end_153:
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-1016]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_155
    mov  rax, [rbp-880]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_157
    mov  rax, 8
    mov  rcx, [rbp-880]
    add  rax, rcx
    mov  [rbp-880], rax
    jmp  .if_end_156
.if_next_157:
.if_end_156:
    jmp  .if_end_154
.if_next_155:
.if_end_154:
    jmp  .if_end_147
.if_next_151:
.if_end_147:
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-800]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-1024], rax
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-808]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-824], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-1024]
    push rax
    mov  rax, [rbp-784]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .if_end_145
.if_next_146:
.if_end_145:
    jmp  .if_end_143
.if_next_144:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x50
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_160
    mov  rax, [rbp-880]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_162
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_down
    add  rsp, 8
    mov  rax, [rbp-864]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1032], rax
    mov  rax, [rbp-1032]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_164
    mov  rax, 8
    mov  rcx, [rbp-1032]
    add  rax, rcx
    mov  [rbp-1032], rax
    jmp  .if_end_163
.if_next_164:
.if_end_163:
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-1032]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_166
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-888]
    push rax
    mov  rax, [rbp-816]
    push rax
    mov  rax, [rbp-784]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-888]
    mov  [rbp-824], rax
    jmp  .if_end_165
.if_next_166:
    mov  rax, [rbp-880]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  [rbp-880], rax
    mov  rax, [rbp-880]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_169
    mov  rax, 8
    mov  rcx, [rbp-880]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    jmp  .if_end_168
.if_next_169:
.if_end_168:
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-800]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-1040], rax
    sub  rsp, 8
    mov  rax, [rbp-880]
    push rax
    mov  rax, [rbp-808]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-824], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-1040]
    push rax
    mov  rax, [rbp-784]
    push rax
    call line_copy
    add  rsp, 24
    jmp  .if_end_165
.if_next_167:
.if_end_165:
    mov  rax, [rbp-824]
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .if_end_161
.if_next_162:
.if_end_161:
    jmp  .if_end_159
.if_next_160:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_172
    mov  rax, [rbp-848]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_174
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_left
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-848]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_173
.if_next_174:
.if_end_173:
    jmp  .if_end_171
.if_next_172:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_177
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-824]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_179
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_right
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-848]
    add  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_178
.if_next_179:
.if_end_178:
    jmp  .if_end_176
.if_next_177:
.if_end_176:
    jmp  .if_end_171
.if_next_175:
.if_end_171:
    jmp  .if_end_159
.if_next_170:
.if_end_159:
    jmp  .if_end_143
.if_next_158:
.if_end_143:
    mov  rax, 0
    mov  [rbp-896], rax
    jmp  .while_start_61
    jmp  .if_end_141
.if_next_142:
.if_end_141:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x80
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_181
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7F
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1048], rax
    mov  rax, [rbp-1048]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1048]
    and  rax, 0xFF
    push rax
    mov  rax, 0x36
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
    cmp  rax, 0
    je   .if_next_183
    mov  rax, 0
    mov  [rbp-168], rax
    jmp  .if_end_182
.if_next_183:
.if_end_182:
    jmp  .while_start_61
    jmp  .if_end_180
.if_next_181:
.if_end_180:
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    mov  rax, 0x36
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
    cmp  rax, 0
    je   .if_next_185
    mov  rax, 1
    mov  [rbp-168], rax
    jmp  .while_start_61
    jmp  .if_end_184
.if_next_185:
.if_end_184:
    sub  rsp, 8
    mov  rax, [rbp-168]
    push rax
    mov  rax, [rbp-1008]
    and  rax, 0xFF
    push rax
    call kbd_scancode_to_ascii
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1056], rax
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_187
    jmp  .while_start_61
    jmp  .if_end_186
.if_next_187:
.if_end_186:
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_189
    mov  rax, [rbp-848]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_191
    mov  rax, [rbp-848]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1064], rax
.while_start_192:
    mov  rax, [rbp-1064]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_193
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-1064]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-1064]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-1064]
    add  rax, rcx
    mov  [rbp-1064], rax
    jmp  .while_start_192
.while_end_193:
    mov  rax, 1
    mov  rcx, [rbp-824]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-824], rax
    mov  rax, 1
    mov  rcx, [rbp-848]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .if_end_190
.if_next_191:
.if_end_190:
    jmp  .while_start_61
    jmp  .if_end_188
.if_next_189:
.if_end_188:
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_195
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, [rbp-824]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_197
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-792]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    mov  [rbp-832], rax
    sub  rsp, 8
    mov  rax, [rbp-864]
    push rax
    mov  rax, [rbp-800]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-1072], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-1072]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-864]
    push rax
    mov  rax, [rbp-808]
    push rax
    call hist_set_len
    add  rsp, 24
    mov  rax, 1
    mov  rcx, [rbp-864]
    add  rax, rcx
    mov  [rbp-864], rax
    mov  rax, [rbp-864]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_199
    mov  rax, 0
    mov  [rbp-864], rax
    jmp  .if_end_198
.if_next_199:
.if_end_198:
    mov  rax, [rbp-872]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_201
    mov  rax, 1
    mov  rcx, [rbp-872]
    add  rax, rcx
    mov  [rbp-872], rax
    jmp  .if_end_200
.if_next_201:
.if_end_200:
    jmp  .if_end_196
.if_next_197:
.if_end_196:
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call run_command
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-824], rax
    mov  rax, 0
    mov  [rbp-848], rax
    mov  rax, 0
    mov  [rbp-840], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-880], rax
    sub  rsp, 8
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call tty_write_prompt
    add  rsp, 40
    mov  rax, [rbp-152]
    mov  rax, qword [rax]
    mov  [rbp-904], rax
    mov  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  [rbp-912], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    jmp  .while_start_61
    jmp  .if_end_194
.if_next_195:
.if_end_194:
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_203
    jmp  .while_start_61
    jmp  .if_end_202
.if_next_203:
.if_end_202:
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-856]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_205
    jmp  .while_start_61
    jmp  .if_end_204
.if_next_205:
.if_end_204:
    mov  rax, [rbp-824]
    mov  [rbp-88], rax
.while_start_206:
    mov  rax, [rbp-88]
    push rax
    mov  rax, [rbp-848]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_207
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-88]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-88]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    sub  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-88]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-88], rax
    jmp  .while_start_206
.while_end_207:
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-848]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-824]
    add  rax, rcx
    mov  [rbp-824], rax
    mov  rax, 1
    mov  rcx, [rbp-848]
    add  rax, rcx
    mov  [rbp-848], rax
    sub  rsp, 8
    mov  rax, [rbp-1056]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-64]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, [rbp-848]
    push rax
    mov  rax, [rbp-840]
    push rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, [rbp-784]
    push rax
    mov  rax, [rbp-912]
    push rax
    mov  rax, [rbp-904]
    push rax
    mov  rax, [rbp-80]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-72]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-824]
    mov  [rbp-840], rax
    jmp  .while_start_61
.while_end_62:
    leave
    ret


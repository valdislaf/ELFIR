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
global fb_write_portsc_label
global fb_write_portr_label
global fb_write_portu_label
global fb_write_slots_label
global fb_write_hcc1_label
global fb_write_ecp_label
global fb_write_leg_label
global fb_write_bios_label
global fb_write_os_label
global fb_write_spd1_label
global fb_write_spd2_label
global fb_write_poff_label
global fb_write_pcnt_label
global fb_write_slot_label
global fb_write_ccode_label
global fb_write_addr_label
global fb_write_ccs_label
global fb_write_ped_label
global fb_write_pls_label
global fb_write_spd_label
global fb_write_cfg_label
global fb_write_dcbaap_label
global fb_write_crcr_label
global fb_write_erstba_label
global fb_write_erdp_label
global fb_write_iman_label
global xhci_zero
global xhci_write_trb
global xhci_cmd_ring_init
global xhci_cmd_enqueue
global xhci_ring_init
global xhci_ctx_size
global fb_write_port_label
global xhci_evt_poll
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
extern idt_init
extern rt_i8042_init
extern pic_init
extern rt_xhci_dcbaa
extern rt_xhci_cmd_ring
extern rt_xhci_evt_ring
extern rt_xhci_erst
extern rt_xhci_scratch_array
extern rt_xhci_scratch_bufs
extern rt_xhci_input_ctx
extern rt_xhci_dev_ctx
extern rt_xhci_ep0_ring

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
    leave
    ret

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
    leave
    ret

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
    leave
    ret

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
    mov  rax, 2
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
    leave
    ret

fb_write_portsc_label:
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
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
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
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-56]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    mov  rax, [rbp-64]
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
    leave
    ret

fb_write_portr_label:
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
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
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
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-56]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    mov  rax, [rbp-64]
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
    leave
    ret
    leave
    ret

fb_write_portu_label:
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
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    mov  [rbp-56], rax
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
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-56]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    mov  rax, [rbp-64]
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
    leave
    ret

fb_write_hcc1_label:
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
    leave
    ret

fb_write_ecp_label:
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
    leave
    ret

fb_write_leg_label:
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
    leave
    ret

fb_write_bios_label:
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
    leave
    ret

fb_write_os_label:
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
    leave
    ret

fb_write_spd1_label:
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
    leave
    ret

fb_write_spd2_label:
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
    leave
    ret

fb_write_poff_label:
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
    leave
    ret
    leave
    ret

fb_write_pcnt_label:
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
    leave
    ret

fb_write_slot_label:
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
    leave
    ret

fb_write_ccode_label:
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
    leave
    ret
    leave
    ret

fb_write_addr_label:
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
    leave
    ret
    leave
    ret

fb_write_ccs_label:
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
    leave
    ret

fb_write_ped_label:
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
    leave
    ret

fb_write_pls_label:
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
    leave
    ret

fb_write_spd_label:
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
    leave
    ret

xhci_write_trb:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  eax, 0xFFFFFFFF
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  eax, 0xFFFFFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  [rbp-56], rax
    mov  rax, [rbp-56]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-24]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-56]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-32]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-56]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-40]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-56]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-48]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    leave
    ret
    leave
    ret

xhci_cmd_ring_init:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  eax, 0xFFFFFFFF
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    mov  [rbp-24], rax
    mov  rax, 255
    mov  [rbp-32], rax
    mov  rax, [rbp-8]
    mov  [rbp-40], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-64], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-16]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 6
    push rax
    mov  rax, 10
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    sub  rsp, 8
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-64]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-56]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-48]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    call xhci_write_trb
    add  rsp, 56
    leave
    ret
    leave
    ret

xhci_cmd_enqueue:
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    mov  rax, [rbp-8]
    mov  [rbp-64], rax
    mov  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  [rbp-72], rax
    mov  rax, [rbp-24]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    mov  rax, [rbp-56]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-80]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    sub  rsp, 8
    mov  rax, [rbp-56]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-48]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-40]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-32]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    push rax
    call xhci_write_trb
    add  rsp, 56
    mov  rax, 1
    mov  rcx, [rbp-72]
    add  rax, rcx
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 255
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    mov  [rbp-72], rax
    mov  rax, [rbp-80]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-80]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-72]
    pop  rcx
    mov  qword [rcx], rax
    leave
    ret
    leave
    ret

xhci_ring_init:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  eax, 0xFFFFFFFF
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    mov  [rbp-24], rax
    mov  rax, 255
    mov  [rbp-32], rax
    mov  rax, [rbp-8]
    mov  [rbp-40], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-64], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-16]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 6
    push rax
    mov  rax, 10
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    sub  rsp, 8
    mov  rax, [rbp-72]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-64]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-56]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-48]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    call xhci_write_trb
    add  rsp, 56
    leave
    ret
    leave
    ret

xhci_ctx_size:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  eax, 0xFFFFFFFF
    mov  [rbp-8], rax
    mov  rax, [rbp-8]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 2
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
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
    je   .if_next_1
    mov  rax, 64
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 32
    leave
    ret

fb_write_port_label:
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
    leave
    ret

xhci_evt_poll:
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
    mov  rax, [rbp-8]
    mov  [rbp-64], rax
    mov  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  [rbp-72], rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    mov  rax, [rbp-24]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-88], rax
    mov  rax, [rbp-80]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-88]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
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
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-40]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-48]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-56]
    push rax
    mov  rax, [rbp-80]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1
    mov  rcx, [rbp-72]
    add  rax, rcx
    mov  [rbp-72], rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, 256
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    mov  [rbp-72], rax
    mov  rax, [rbp-88]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-88], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-88]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-72]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 1
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
    mov  rax, 2
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
    sub  rsp, 8
    call rt_kbd_buf_ptr
    add  rsp, 8
    mov  [rbp-8], rax
    sub  rsp, 8
    call rt_kbd_head_ptr
    add  rsp, 8
    mov  [rbp-16], rax
    sub  rsp, 8
    call rt_kbd_tail_ptr
    add  rsp, 8
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
    leave
    ret

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
    leave
    ret

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
    leave
    ret

_start:
    push rbp
    mov  rbp, rsp
    sub  rsp, 2240
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
    mov  rax, 0
    mov  [rbp-48], rax
    mov  rax, 0
    mov  [rbp-56], rax
    lea  rax, [rbp-48]
    mov  [rbp-64], rax
    lea  rax, [rbp-56]
    mov  [rbp-72], rax
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-72]
    push rax
    mov  rax, [rbp-64]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-40]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-8]
    mov  [rbp-80], rax
    mov  rax, [rbp-80]
    mov  [rbp-80], rax
    mov  rax, [rbp-8]
    mov  [rbp-88], rax
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
    mov  rax, [rbp-88]
    push rax
    call fb_fill_rect
    add  rsp, 72
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    mov  [rbp-96], rax
    sub  rsp, 8
    call uefi_has_st
    add  rsp, 8
    mov  [rbp-104], rax
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-112], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, [rbp-8]
    mov  [rbp-120], rax
    mov  rax, 0
    mov  [rbp-128], rax
    mov  rax, 1
    mov  [rbp-136], rax
    lea  rax, [rbp-128]
    mov  [rbp-144], rax
    lea  rax, [rbp-136]
    mov  [rbp-152], rax
    mov  rax, 0x31
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-152]
    push rax
    mov  rax, [rbp-144]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-120]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, [rbp-104]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_init
    add  rsp, 8
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_start
    add  rsp, 8
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, 0xB8000
    mov  [rbp-160], rax
    mov  rax, 0x0F00
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-168], rax
    mov  rax, [rbp-104]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0
    mov  [rbp-176], rax
.while_start_8:
    mov  rax, [rbp-176]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_9
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-176]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  rcx, [rbp-176]
    add  rax, rcx
    mov  [rbp-176], rax
    jmp  .while_start_8
.while_end_9:
    mov  rax, 996
    mov  [rbp-184], rax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, [rbp-160]
    push rax
    mov  rax, [rbp-184]
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
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, [rbp-8]
    mov  [rbp-192], rax
    mov  rax, 0
    mov  [rbp-200], rax
    mov  rax, 2
    mov  [rbp-208], rax
    lea  rax, [rbp-200]
    mov  [rbp-216], rax
    lea  rax, [rbp-208]
    mov  [rbp-224], rax
    mov  rax, 0x32
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-224]
    push rax
    mov  rax, [rbp-216]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-192]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, [rbp-104]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_init_ok
    add  rsp, 8
    jmp  .if_end_12
.if_next_13:
.if_end_12:
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
    sub  rsp, 8
    call idt_init
    add  rsp, 8
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, [rbp-8]
    mov  [rbp-232], rax
    mov  rax, 0
    mov  [rbp-240], rax
    mov  rax, 3
    mov  [rbp-248], rax
    lea  rax, [rbp-240]
    mov  [rbp-256], rax
    lea  rax, [rbp-248]
    mov  [rbp-264], rax
    mov  rax, 0x33
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-264]
    push rax
    mov  rax, [rbp-256]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-232]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    sub  rsp, 8
    call rt_i8042_init
    add  rsp, 8
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_17
    mov  rax, [rbp-8]
    mov  [rbp-272], rax
    mov  rax, 0
    mov  [rbp-280], rax
    mov  rax, 4
    mov  [rbp-288], rax
    lea  rax, [rbp-280]
    mov  [rbp-296], rax
    lea  rax, [rbp-288]
    mov  [rbp-304], rax
    mov  rax, 0x34
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-304]
    push rax
    mov  rax, [rbp-296]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-272]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    mov  rax, 0
    mov  [rbp-312], rax
    mov  rax, 0
    mov  [rbp-320], rax
    mov  rax, [rbp-312]
    cmp  rax, 0
    je   .if_next_19
    mov  rax, 1
    mov  [rbp-320], rax
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    mov  rax, [rbp-312]
    cmp  rax, 0
    je   .if_next_21
    sub  rsp, 8
    call pic_init
    add  rsp, 8
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    mov  rax, [rbp-312]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-320]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_23
    mov  rax, 0x21
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0xFE
    and  rax, 0xFF
    out  dx, al
    jmp  .if_end_22
.if_next_23:
.if_end_22:
    mov  rax, [rbp-312]
    cmp  rax, 0
    je   .if_next_25
    sti
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    mov  rax, [rbp-104]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_27
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-328], rax
    mov  rax, [rbp-328]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_halt
    add  rsp, 8
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    mov  rax, 0
    mov  [rbp-336], rax
    mov  rax, 0
    mov  [rbp-344], rax
    lea  rax, [rbp-336]
    mov  [rbp-352], rax
    lea  rax, [rbp-344]
    mov  [rbp-360], rax
    mov  rax, 0
    mov  [rbp-368], rax
    mov  rax, 0
    mov  [rbp-376], rax
    mov  rax, 0
    mov  [rbp-384], rax
    mov  rax, 0
    mov  [rbp-392], rax
    mov  rax, 0
    mov  [rbp-400], rax
    mov  rax, 0
    mov  [rbp-408], rax
    mov  rax, 0
    mov  [rbp-416], rax
    lea  rax, [rbp-408]
    mov  [rbp-424], rax
    lea  rax, [rbp-416]
    mov  [rbp-432], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    mov  rax, [rbp-8]
    mov  [rbp-376], rax
    mov  rax, [rbp-16]
    mov  [rbp-384], rax
    mov  rax, [rbp-24]
    mov  [rbp-392], rax
    mov  rax, [rbp-32]
    mov  [rbp-400], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_31
    mov  rax, [rbp-8]
    push rax
    call rt_map_fb
    add  rsp, 8
    mov  [rbp-440], rax
    mov  rax, [rbp-440]
    mov  [rbp-440], rax
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    mov  rax, 0
    mov  [rbp-448], rax
    mov  rax, 0
    mov  [rbp-456], rax
    lea  rax, [rbp-448]
    mov  [rbp-464], rax
    lea  rax, [rbp-456]
    mov  [rbp-472], rax
    mov  rax, [rbp-8]
    mov  [rbp-480], rax
    mov  rax, 1000000
    mov  [rbp-488], rax
.while_start_32:
    mov  rax, [rbp-488]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_33
    mov  rax, 1
    mov  rcx, [rbp-488]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-488], rax
    nop
    jmp  .while_start_32
.while_end_33:
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
    mov  rax, [rbp-480]
    push rax
    call fb_fill_rect
    add  rsp, 72
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_35
    sub  rsp, 8
    call uefi_get_xhci_base
    add  rsp, 8
    mov  [rbp-496], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_37
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_xhci_base_label
    add  rsp, 56
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 0x00FF8800
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    mov  rax, qword [rax]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_mark_line
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_36
.if_next_37:
.if_end_36:
    mov  rax, [rbp-496]
    mov  [rbp-504], rax
    mov  rax, [rbp-504]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-512], rax
    mov  rax, [rbp-512]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-520], rax
    mov  rax, [rbp-512]
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
    mov  [rbp-528], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_39
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_caplen_label
    add  rsp, 56
    mov  rax, [rbp-520]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hciver_label
    add  rsp, 56
    mov  rax, [rbp-528]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 0x0000FF00
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    mov  rax, qword [rax]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_mark_line
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_38
.if_next_39:
.if_end_38:
    mov  rax, [rbp-496]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-536], rax
    mov  rax, [rbp-496]
    push rax
    mov  rax, 0x08
    pop  rcx
    add  rax, rcx
    mov  [rbp-544], rax
    mov  rax, [rbp-496]
    push rax
    mov  rax, 0x0C
    pop  rcx
    add  rax, rcx
    mov  [rbp-552], rax
    mov  rax, [rbp-496]
    push rax
    mov  rax, 0x14
    pop  rcx
    add  rax, rcx
    mov  [rbp-560], rax
    mov  rax, [rbp-496]
    push rax
    mov  rax, 0x18
    pop  rcx
    add  rax, rcx
    mov  [rbp-568], rax
    mov  rax, [rbp-536]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-576], rax
    mov  rax, [rbp-544]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-584], rax
    mov  rax, [rbp-552]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-592], rax
    mov  rax, [rbp-560]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-600], rax
    mov  rax, [rbp-568]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-608], rax
    mov  rax, [rbp-576]
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
    mov  [rbp-616], rax
    mov  rax, [rbp-576]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-624], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_41
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hcs1_label
    add  rsp, 56
    mov  rax, [rbp-576]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hcs2_label
    add  rsp, 56
    mov  rax, [rbp-584]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hcs3_label
    add  rsp, 56
    mov  rax, [rbp-592]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_dboff_label
    add  rsp, 56
    mov  rax, [rbp-600]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_rtsoff_label
    add  rsp, 56
    mov  rax, [rbp-608]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ports_label
    add  rsp, 56
    mov  rax, [rbp-616]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_slots_label
    add  rsp, 56
    mov  rax, [rbp-624]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_40
.if_next_41:
.if_end_40:
    mov  rax, [rbp-496]
    push rax
    mov  rax, 0x10
    pop  rcx
    add  rax, rcx
    mov  [rbp-632], rax
    mov  rax, [rbp-632]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-640], rax
    mov  rax, [rbp-640]
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-648], rax
    mov  rax, [rbp-648]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  [rbp-656], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_43
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hcc1_label
    add  rsp, 56
    mov  rax, [rbp-640]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ecp_label
    add  rsp, 56
    mov  rax, [rbp-656]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_42
.if_next_43:
.if_end_42:
    mov  rax, [rbp-656]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_45
    mov  rax, [rbp-656]
    mov  [rbp-664], rax
    mov  rax, 32
    mov  [rbp-672], rax
.while_start_46:
    mov  rax, [rbp-672]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-664]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .while_end_47
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-664]
    pop  rcx
    add  rax, rcx
    mov  [rbp-680], rax
    mov  rax, [rbp-680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-688], rax
    mov  rax, [rbp-688]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-696], rax
    mov  rax, [rbp-688]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
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
    mov  [rbp-704], rax
    mov  rax, [rbp-696]
    and  rax, 0xFF
    push rax
    mov  rax, 2
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_49
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-664]
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-712], rax
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-664]
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 0x08
    pop  rcx
    add  rax, rcx
    mov  [rbp-720], rax
    mov  rax, [rbp-712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-728], rax
    mov  rax, [rbp-720]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-736], rax
    mov  rax, [rbp-736]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-744], rax
    mov  rax, [rbp-736]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
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
    mov  [rbp-752], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_51
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_spd1_label
    add  rsp, 56
    mov  rax, [rbp-728]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_spd2_label
    add  rsp, 56
    mov  rax, [rbp-736]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_poff_label
    add  rsp, 56
    mov  rax, [rbp-744]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_pcnt_label
    add  rsp, 56
    mov  rax, [rbp-752]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_50
.if_next_51:
.if_end_50:
    jmp  .if_end_48
.if_next_49:
.if_end_48:
    mov  rax, [rbp-696]
    and  rax, 0xFF
    push rax
    mov  rax, 1
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_53
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-664]
    pop  rcx
    add  rax, rcx
    mov  [rbp-760], rax
    mov  rax, [rbp-760]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-768], rax
    mov  rax, [rbp-768]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-776], rax
    mov  rax, [rbp-768]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 24
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-784], rax
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_leg_label
    add  rsp, 56
    mov  rax, [rbp-768]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_bios_label
    add  rsp, 56
    mov  rax, [rbp-776]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_os_label
    add  rsp, 56
    mov  rax, [rbp-784]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-768]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 24
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-792], rax
    mov  rax, [rbp-760]
    push rax
    mov  rax, [rbp-792]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-800], rax
.while_start_54:
    mov  rax, [rbp-800]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_55
    mov  rax, [rbp-760]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-808], rax
    mov  rax, [rbp-808]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
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
    je   .if_next_57
    jmp  .while_end_55
    jmp  .if_end_56
.if_next_57:
.if_end_56:
    mov  rax, 1
    mov  rcx, [rbp-800]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-800], rax
    jmp  .while_start_54
.while_end_55:
    mov  rax, [rbp-760]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-816], rax
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_leg_label
    add  rsp, 56
    mov  rax, [rbp-816]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .while_end_47
    jmp  .if_end_52
.if_next_53:
.if_end_52:
    mov  rax, [rbp-704]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_59
    jmp  .while_end_47
    jmp  .if_end_58
.if_next_59:
.if_end_58:
    mov  rax, [rbp-664]
    push rax
    mov  rax, [rbp-704]
    and  rax, 0xFF
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-664], rax
    mov  rax, 1
    mov  rcx, [rbp-672]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-672], rax
    jmp  .while_start_46
.while_end_47:
    jmp  .if_end_44
.if_next_45:
.if_end_44:
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-520]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-824], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, 0x00
    pop  rcx
    add  rax, rcx
    mov  [rbp-832], rax
    mov  rax, [rbp-824]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-840], rax
    mov  rax, [rbp-832]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-848], rax
    mov  rax, [rbp-840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-856], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_61
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_usbcmd_label
    add  rsp, 56
    mov  rax, [rbp-848]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_usbsts_label
    add  rsp, 56
    mov  rax, [rbp-856]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_60
.if_next_61:
.if_end_60:
    mov  rax, [rbp-848]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-864], rax
    mov  rax, [rbp-832]
    push rax
    mov  rax, [rbp-864]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-872], rax
.while_start_62:
    mov  rax, [rbp-872]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_63
    mov  rax, [rbp-832]
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
    je   .if_next_65
    jmp  .while_end_63
    jmp  .if_end_64
.if_next_65:
.if_end_64:
    mov  rax, 1
    mov  rcx, [rbp-872]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-872], rax
    jmp  .while_start_62
.while_end_63:
    mov  rax, [rbp-832]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-880], rax
    mov  rax, [rbp-840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-888], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_67
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_usbcmd_label
    add  rsp, 56
    mov  rax, [rbp-880]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_usbsts_label
    add  rsp, 56
    mov  rax, [rbp-888]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_66
.if_next_67:
.if_end_66:
    mov  rax, [rbp-880]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-896], rax
    mov  rax, [rbp-832]
    push rax
    mov  rax, [rbp-896]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-904], rax
.while_start_68:
    mov  rax, [rbp-904]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_69
    mov  rax, [rbp-840]
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
    je   .if_next_71
    jmp  .while_end_69
    jmp  .if_end_70
.if_next_71:
.if_end_70:
    mov  rax, 1
    mov  rcx, [rbp-904]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-904], rax
    jmp  .while_start_68
.while_end_69:
    mov  rax, [rbp-832]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-912], rax
    mov  rax, [rbp-840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-920], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_73
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_usbcmd_label
    add  rsp, 56
    mov  rax, [rbp-912]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_usbsts_label
    add  rsp, 56
    mov  rax, [rbp-920]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_72
.if_next_73:
.if_end_72:
    mov  rax, [rbp-584]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x1F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-928], rax
    mov  rax, [rbp-584]
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
    mov  [rbp-936], rax
    mov  rax, [rbp-936]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 5
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-928]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-944], rax
    mov  rax, [rbp-944]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_75
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-944], rax
    jmp  .if_end_74
.if_next_75:
.if_end_74:
    sub  rsp, 8
    call rt_xhci_dcbaa
    add  rsp, 8
    mov  [rbp-952], rax
    sub  rsp, 8
    call rt_xhci_cmd_ring
    add  rsp, 8
    mov  [rbp-960], rax
    sub  rsp, 8
    call rt_xhci_evt_ring
    add  rsp, 8
    mov  [rbp-968], rax
    sub  rsp, 8
    call rt_xhci_erst
    add  rsp, 8
    mov  [rbp-976], rax
    sub  rsp, 8
    call rt_xhci_scratch_array
    add  rsp, 8
    mov  [rbp-984], rax
    sub  rsp, 8
    call rt_xhci_scratch_bufs
    add  rsp, 8
    mov  [rbp-992], rax
    sub  rsp, 8
    call rt_xhci_input_ctx
    add  rsp, 8
    mov  [rbp-1000], rax
    sub  rsp, 8
    call rt_xhci_dev_ctx
    add  rsp, 8
    mov  [rbp-1008], rax
    sub  rsp, 8
    call rt_xhci_ep0_ring
    add  rsp, 8
    mov  [rbp-1016], rax
    sub  rsp, 8
    mov  rax, 2048
    push rax
    mov  rax, [rbp-952]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    mov  rax, [rbp-960]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    mov  rax, [rbp-968]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 16
    push rax
    mov  rax, [rbp-976]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 256
    push rax
    mov  rax, [rbp-984]
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
    mov  rax, [rbp-992]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 2048
    push rax
    mov  rax, [rbp-1000]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 2048
    push rax
    mov  rax, [rbp-1008]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    mov  rax, [rbp-1016]
    push rax
    call xhci_zero
    add  rsp, 24
    mov  rax, [rbp-944]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_77
    mov  rax, [rbp-984]
    mov  [rbp-1024], rax
    mov  rax, [rbp-952]
    mov  [rbp-1032], rax
    mov  rax, [rbp-1032]
    push rax
    mov  rax, [rbp-984]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 0
    mov  [rbp-1040], rax
.while_start_78:
    mov  rax, [rbp-1040]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-944]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_79
    mov  rax, [rbp-992]
    push rax
    mov  rax, [rbp-1040]
    push rax
    mov  rax, 4096
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  [rbp-1048], rax
    mov  rax, [rbp-1024]
    push rax
    mov  rax, [rbp-1040]
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    push rax
    mov  rax, [rbp-1048]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 1
    mov  rcx, [rbp-1040]
    add  rax, rcx
    mov  [rbp-1040], rax
    jmp  .while_start_78
.while_end_79:
    jmp  .if_end_76
.if_next_77:
.if_end_76:
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-520]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1056], rax
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x00
    pop  rcx
    add  rax, rcx
    mov  [rbp-1064], rax
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-1072], rax
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x38
    pop  rcx
    add  rax, rcx
    mov  [rbp-1080], rax
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x30
    pop  rcx
    add  rax, rcx
    mov  [rbp-1088], rax
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x18
    pop  rcx
    add  rax, rcx
    mov  [rbp-1096], rax
    mov  rax, [rbp-1064]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFFE
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1104], rax
    mov  rax, [rbp-1064]
    push rax
    mov  rax, [rbp-1104]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-1112], rax
.while_start_80:
    mov  rax, [rbp-1112]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_81
    mov  rax, [rbp-1072]
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
    je   .if_next_83
    jmp  .while_end_81
    jmp  .if_end_82
.if_next_83:
.if_end_82:
    mov  rax, 1
    mov  rcx, [rbp-1112]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1112], rax
    jmp  .while_start_80
.while_end_81:
    mov  rax, [rbp-1064]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1120], rax
    mov  rax, [rbp-1064]
    push rax
    mov  rax, [rbp-1120]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-1128], rax
.while_start_84:
    mov  rax, [rbp-1128]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_85
    mov  rax, [rbp-1064]
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
    je   .if_next_87
    jmp  .while_end_85
    jmp  .if_end_86
.if_next_87:
.if_end_86:
    mov  rax, 1
    mov  rcx, [rbp-1128]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1128], rax
    jmp  .while_start_84
.while_end_85:
    mov  rax, [rbp-624]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1136], rax
    mov  rax, [rbp-1136]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_89
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1136], rax
    jmp  .if_end_88
.if_next_89:
.if_end_88:
    mov  rax, [rbp-1080]
    push rax
    mov  rax, [rbp-1136]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1088]
    push rax
    mov  rax, [rbp-952]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1144], rax
    mov  rax, 0
    mov  [rbp-1152], rax
    sub  rsp, 8
    mov  rax, [rbp-1144]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-960]
    push rax
    call xhci_cmd_ring_init
    add  rsp, 24
    mov  rax, [rbp-1096]
    push rax
    mov  rax, [rbp-960]
    push rax
    mov  rax, [rbp-1144]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-976]
    mov  [rbp-1160], rax
    mov  rax, [rbp-1160]
    push rax
    mov  rax, [rbp-968]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-1160]
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
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-608]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFE0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1168], rax
    mov  rax, [rbp-1168]
    push rax
    mov  rax, 0x20
    pop  rcx
    add  rax, rcx
    mov  [rbp-1176], rax
    mov  rax, [rbp-1168]
    push rax
    mov  rax, 0x24
    pop  rcx
    add  rax, rcx
    mov  [rbp-1184], rax
    mov  rax, [rbp-1168]
    push rax
    mov  rax, 0x28
    pop  rcx
    add  rax, rcx
    mov  [rbp-1192], rax
    mov  rax, [rbp-1168]
    push rax
    mov  rax, 0x30
    pop  rcx
    add  rax, rcx
    mov  [rbp-1200], rax
    mov  rax, [rbp-1168]
    push rax
    mov  rax, 0x38
    pop  rcx
    add  rax, rcx
    mov  [rbp-1208], rax
    mov  rax, [rbp-1184]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1192]
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1200]
    push rax
    mov  rax, [rbp-976]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-1208]
    push rax
    mov  rax, [rbp-968]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-1176]
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1216], rax
    mov  rax, 0
    mov  [rbp-1224], rax
    mov  rax, [rbp-1064]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1232], rax
    mov  rax, [rbp-1064]
    push rax
    mov  rax, [rbp-1232]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-1240], rax
.while_start_90:
    mov  rax, [rbp-1240]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_91
    mov  rax, [rbp-1072]
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
    je   .if_next_93
    jmp  .while_end_91
    jmp  .if_end_92
.if_next_93:
.if_end_92:
    mov  rax, 1
    mov  rcx, [rbp-1240]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1240], rax
    jmp  .while_start_90
.while_end_91:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_95
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_cfg_label
    add  rsp, 56
    mov  rax, [rbp-1136]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_dcbaap_label
    add  rsp, 56
    mov  rax, [rbp-952]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_crcr_label
    add  rsp, 56
    mov  rax, [rbp-960]
    push rax
    mov  rax, 1
    pop  rcx
    or   rax, rcx
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_erstba_label
    add  rsp, 56
    mov  rax, [rbp-976]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_erdp_label
    add  rsp, 56
    mov  rax, [rbp-968]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_iman_label
    add  rsp, 56
    mov  rax, [rbp-1176]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_94
.if_next_95:
.if_end_94:
    mov  rax, [rbp-496]
    push rax
    mov  rax, [rbp-600]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFE0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1248], rax
    mov  rax, [rbp-1248]
    mov  [rbp-1256], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1264], rax
    mov  rax, 9
    push rax
    mov  rax, 10
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1144]
    push rax
    lea  rax, [rbp-1152]
    push rax
    mov  rax, [rbp-960]
    push rax
    call xhci_cmd_enqueue
    add  rsp, 56
    mov  rax, [rbp-1256]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-1272], rax
    mov  rax, 0
    mov  [rbp-1280], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1288], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1296], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1304], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1312], rax
.while_start_96:
    mov  rax, [rbp-1272]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1280]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .while_end_97
    lea  rax, [rbp-1312]
    push rax
    lea  rax, [rbp-1304]
    push rax
    lea  rax, [rbp-1296]
    push rax
    lea  rax, [rbp-1288]
    push rax
    lea  rax, [rbp-1216]
    push rax
    lea  rax, [rbp-1224]
    push rax
    mov  rax, [rbp-968]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_99
    mov  rax, [rbp-1312]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 10
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x3F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1320], rax
    mov  rax, [rbp-1312]
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-1328], rax
    mov  rax, [rbp-1304]
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-1336], rax
    mov  rax, [rbp-968]
    push rax
    mov  rax, [rbp-1224]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1344], rax
    mov  rax, [rbp-1208]
    push rax
    mov  rax, [rbp-1344]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-1320]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 33
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_101
    mov  rax, 1
    mov  [rbp-1280], rax
    mov  rax, [rbp-1328]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1264], rax
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_slot_label
    add  rsp, 56
    mov  rax, [rbp-1328]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ccode_label
    add  rsp, 56
    mov  rax, [rbp-1336]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_100
.if_next_101:
.if_end_100:
    jmp  .if_end_98
.if_next_99:
.if_end_98:
    mov  rax, 1
    mov  rcx, [rbp-1272]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1272], rax
    jmp  .while_start_96
.while_end_97:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_103
    mov  rax, 1
    mov  [rbp-1352], rax
.while_start_104:
    mov  rax, [rbp-1352]
    push rax
    mov  rax, [rbp-616]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_105
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-1352]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 0x10
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1360], rax
    mov  rax, [rbp-1360]
    mov  [rbp-1368], rax
    mov  rax, [rbp-1368]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1376], rax
    mov  rax, [rbp-1352]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_portsc_label
    add  rsp, 56
    mov  rax, [rbp-1376]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 1
    mov  rcx, [rbp-1352]
    add  rax, rcx
    mov  [rbp-1352], rax
    jmp  .while_start_104
.while_end_105:
    jmp  .if_end_102
.if_next_103:
.if_end_102:
    mov  rax, 0x00FE0000
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1384], rax
    mov  rax, 0
    mov  [rbp-1392], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1400], rax
    mov  rax, 1
    mov  [rbp-1408], rax
.while_start_106:
    mov  rax, [rbp-1408]
    push rax
    mov  rax, [rbp-616]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_107
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-1408]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 0x10
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1416], rax
    mov  rax, [rbp-1416]
    mov  [rbp-1424], rax
    mov  rax, [rbp-1424]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1432], rax
    mov  rax, [rbp-1432]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x10
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x200
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1384]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1440], rax
    mov  rax, [rbp-1424]
    push rax
    mov  rax, [rbp-1440]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 200000
    mov  [rbp-1448], rax
.while_start_108:
    mov  rax, [rbp-1448]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_109
    mov  rax, [rbp-1424]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x10
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
    je   .if_next_111
    jmp  .while_end_109
    jmp  .if_end_110
.if_next_111:
.if_end_110:
    mov  rax, 1
    mov  rcx, [rbp-1448]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1448], rax
    jmp  .while_start_108
.while_end_109:
    mov  rax, 200000
    mov  [rbp-1456], rax
.while_start_112:
    mov  rax, [rbp-1456]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_113
    mov  rax, 1
    mov  rcx, [rbp-1456]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1456], rax
    jmp  .while_start_112
.while_end_113:
    mov  rax, [rbp-1424]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1464], rax
    mov  rax, [rbp-1464]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1472], rax
    mov  rax, [rbp-1464]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1480], rax
    mov  rax, [rbp-1464]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 5
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1488], rax
    mov  rax, [rbp-1464]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 10
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1496], rax
    mov  rax, [rbp-1472]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1392]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_115
    mov  rax, [rbp-1408]
    mov  [rbp-1392], rax
    mov  rax, [rbp-1496]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1400], rax
    jmp  .if_end_114
.if_next_115:
.if_end_114:
    mov  rax, 1
    cmp  rax, 0
    je   .if_next_117
    mov  rax, [rbp-1408]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_portr_label
    add  rsp, 56
    mov  rax, [rbp-1464]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ccs_label
    add  rsp, 56
    mov  rax, [rbp-1472]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ped_label
    add  rsp, 56
    mov  rax, [rbp-1480]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_pls_label
    add  rsp, 56
    mov  rax, [rbp-1488]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_spd_label
    add  rsp, 56
    mov  rax, [rbp-1496]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_116
.if_next_117:
.if_end_116:
    mov  rax, 1
    mov  rcx, [rbp-1408]
    add  rax, rcx
    mov  [rbp-1408], rax
    jmp  .while_start_106
.while_end_107:
    mov  rax, [rbp-1264]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1392]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_119
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1504], rax
    sub  rsp, 8
    mov  rax, [rbp-1504]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1016]
    push rax
    call xhci_ring_init
    add  rsp, 24
    mov  rax, [rbp-640]
    and  eax, 0xFFFFFFFF
    push rax
    call xhci_ctx_size
    add  rsp, 8
    mov  [rbp-1512], rax
    mov  rax, [rbp-952]
    mov  [rbp-1520], rax
    mov  rax, [rbp-1520]
    push rax
    mov  rax, [rbp-1264]
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    push rax
    mov  rax, [rbp-1008]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-1000]
    mov  [rbp-1528], rax
    mov  rax, [rbp-1528]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1528]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 0x3
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1000]
    push rax
    mov  rax, [rbp-1512]
    pop  rcx
    add  rax, rcx
    mov  [rbp-1536], rax
    mov  rax, [rbp-1400]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 20
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 27
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1544], rax
    mov  rax, [rbp-1392]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1552], rax
    mov  rax, [rbp-1536]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-1544]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1536]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-1552]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1536]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1536]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1000]
    push rax
    mov  rax, [rbp-1512]
    push rax
    mov  rax, 2
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1560], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1568], rax
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1576], rax
    mov  rax, [rbp-1016]
    mov  [rbp-1584], rax
    mov  rax, [rbp-1584]
    push rax
    mov  rax, 0xFFFFFFF0
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1592], rax
    mov  rax, [rbp-1584]
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1600], rax
    mov  rax, [rbp-1560]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-1568]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1560]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-1576]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1560]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-1592]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1560]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    mov  rax, [rbp-1600]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, [rbp-1000]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1608], rax
    mov  rax, [rbp-1000]
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1616], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1624], rax
    mov  rax, [rbp-1264]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 24
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 11
    push rax
    mov  rax, 10
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1632], rax
    mov  rax, [rbp-1632]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1624]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1616]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1608]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1144]
    push rax
    lea  rax, [rbp-1152]
    push rax
    mov  rax, [rbp-960]
    push rax
    call xhci_cmd_enqueue
    add  rsp, 56
    mov  rax, [rbp-1256]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-1640], rax
    mov  rax, 0
    mov  [rbp-1648], rax
.while_start_120:
    mov  rax, [rbp-1640]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1648]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .while_end_121
    lea  rax, [rbp-1312]
    push rax
    lea  rax, [rbp-1304]
    push rax
    lea  rax, [rbp-1296]
    push rax
    lea  rax, [rbp-1288]
    push rax
    lea  rax, [rbp-1216]
    push rax
    lea  rax, [rbp-1224]
    push rax
    mov  rax, [rbp-968]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_123
    mov  rax, [rbp-1312]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 10
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x3F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1656], rax
    mov  rax, [rbp-1312]
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-1664], rax
    mov  rax, [rbp-1304]
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-1672], rax
    mov  rax, [rbp-968]
    push rax
    mov  rax, [rbp-1224]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1680], rax
    mov  rax, [rbp-1208]
    push rax
    mov  rax, [rbp-1680]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-1656]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 33
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1664]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1264]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_125
    mov  rax, 1
    mov  [rbp-1648], rax
    sub  rsp, 8
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_addr_label
    add  rsp, 56
    mov  rax, [rbp-1672]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_124
.if_next_125:
.if_end_124:
    jmp  .if_end_122
.if_next_123:
.if_end_122:
    mov  rax, 1
    mov  rcx, [rbp-1640]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1640], rax
    jmp  .while_start_120
.while_end_121:
    jmp  .if_end_118
.if_next_119:
.if_end_118:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_127
    mov  rax, 1
    mov  [rbp-1688], rax
.while_start_128:
    mov  rax, [rbp-1688]
    push rax
    mov  rax, [rbp-616]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_129
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-1688]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 0x10
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1696], rax
    mov  rax, [rbp-1696]
    mov  [rbp-1704], rax
    mov  rax, [rbp-1704]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1712], rax
    mov  rax, [rbp-1712]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFE1F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1720], rax
    mov  rax, [rbp-1720]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00010000
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000200
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1384]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1720], rax
    mov  rax, [rbp-1704]
    push rax
    mov  rax, [rbp-1720]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 200000
    mov  [rbp-1728], rax
.while_start_130:
    mov  rax, [rbp-1728]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_131
    mov  rax, 1
    mov  rcx, [rbp-1728]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1728], rax
    jmp  .while_start_130
.while_end_131:
    mov  rax, [rbp-1704]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1736], rax
    mov  rax, [rbp-1688]
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_portu_label
    add  rsp, 56
    mov  rax, [rbp-1736]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-472]
    push rax
    mov  rax, [rbp-464]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 1
    mov  rcx, [rbp-1688]
    add  rax, rcx
    mov  [rbp-1688], rax
    jmp  .while_start_128
.while_end_129:
    jmp  .if_end_126
.if_next_127:
.if_end_126:
    mov  rax, [rbp-464]
    mov  rax, qword [rax]
    mov  [rbp-1744], rax
    mov  rax, [rbp-472]
    mov  rax, qword [rax]
    mov  [rbp-1752], rax
    lea  rax, [rbp-1744]
    mov  [rbp-1760], rax
    lea  rax, [rbp-1752]
    mov  [rbp-1768], rax
    mov  rax, 0
    mov  [rbp-1776], rax
    mov  rax, [rbp-1776]
    cmp  rax, 0
    je   .if_next_133
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1784], rax
.while_start_134:
    mov  rax, 1
    cmp  rax, 0
    je   .while_end_135
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1792], rax
    mov  rax, 1
    mov  [rbp-1800], rax
.while_start_136:
    mov  rax, [rbp-1800]
    push rax
    mov  rax, [rbp-616]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_137
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-1800]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 0x10
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1808], rax
    mov  rax, [rbp-1808]
    mov  [rbp-1816], rax
    mov  rax, [rbp-1816]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1824], rax
    mov  rax, [rbp-1824]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1832], rax
    mov  rax, [rbp-1832]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_139
    mov  rax, [rbp-1792]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1800]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1792], rax
    jmp  .if_end_138
.if_next_139:
.if_end_138:
    mov  rax, 1
    mov  rcx, [rbp-1800]
    add  rax, rcx
    mov  [rbp-1800], rax
    jmp  .while_start_136
.while_end_137:
    mov  rax, [rbp-1792]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1784]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-1792]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_141
    mov  rax, [rbp-1792]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1784], rax
    mov  rax, 1
    mov  [rbp-1840], rax
.while_start_142:
    mov  rax, [rbp-1840]
    push rax
    mov  rax, [rbp-616]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_143
    mov  rax, [rbp-1792]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1840]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
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
    je   .if_next_145
    mov  rax, [rbp-1056]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, [rbp-1840]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 0x10
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-1848], rax
    mov  rax, [rbp-1848]
    mov  [rbp-1856], rax
    mov  rax, [rbp-1856]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1864], rax
    mov  rax, [rbp-1864]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1872], rax
    mov  rax, [rbp-1864]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1880], rax
    mov  rax, [rbp-1864]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 5
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1888], rax
    mov  rax, [rbp-1864]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 10
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1896], rax
    mov  rax, [rbp-1840]
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_portsc_label
    add  rsp, 56
    mov  rax, [rbp-1864]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ccs_label
    add  rsp, 56
    mov  rax, [rbp-1872]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_ped_label
    add  rsp, 56
    mov  rax, [rbp-1880]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_pls_label
    add  rsp, 56
    mov  rax, [rbp-1888]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_spd_label
    add  rsp, 56
    mov  rax, [rbp-1896]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-1768]
    push rax
    mov  rax, [rbp-1760]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-480]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_144
.if_next_145:
.if_end_144:
    mov  rax, 1
    mov  rcx, [rbp-1840]
    add  rax, rcx
    mov  [rbp-1840], rax
    jmp  .while_start_142
.while_end_143:
    jmp  .if_end_140
.if_next_141:
.if_end_140:
    mov  rax, 200000
    mov  [rbp-1904], rax
.while_start_146:
    mov  rax, [rbp-1904]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_147
    mov  rax, 1
    mov  rcx, [rbp-1904]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1904], rax
    jmp  .while_start_146
.while_end_147:
    jmp  .while_start_134
.while_end_135:
    jmp  .if_end_132
.if_next_133:
.if_end_132:
    jmp  .if_end_34
.if_next_35:
.if_end_34:
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    sub  rsp, 8
    call rt_uefi_line
    add  rsp, 8
    mov  [rbp-1912], rax
    sub  rsp, 8
    call rt_uefi_last_line
    add  rsp, 8
    mov  [rbp-1920], rax
    sub  rsp, 8
    call rt_uefi_hist_base
    add  rsp, 8
    mov  [rbp-1928], rax
    sub  rsp, 8
    call rt_uefi_hist_len_base
    add  rsp, 8
    mov  [rbp-1936], rax
    sub  rsp, 8
    call rt_uefi_edit_buf
    add  rsp, 8
    mov  [rbp-1944], rax
    mov  rax, 0
    mov  [rbp-1952], rax
    mov  rax, 0
    mov  [rbp-1960], rax
    mov  rax, 0
    mov  [rbp-1968], rax
    mov  rax, 0
    mov  [rbp-1976], rax
    mov  rax, 256
    mov  [rbp-1984], rax
    mov  rax, 0
    mov  [rbp-1992], rax
    mov  rax, 0
    mov  [rbp-2000], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, 0
    mov  [rbp-2016], rax
    mov  rax, 0
    mov  [rbp-2024], rax
    mov  rax, 0
    mov  [rbp-2032], rax
    mov  rax, 0
    mov  [rbp-2040], rax
    sub  rsp, 8
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call tty_clear
    add  rsp, 40
    sub  rsp, 8
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call tty_write_prompt
    add  rsp, 40
    mov  rax, [rbp-352]
    mov  rax, qword [rax]
    mov  [rbp-2032], rax
    mov  rax, [rbp-360]
    mov  rax, qword [rax]
    mov  [rbp-2040], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-376]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_149
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x59
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_148
.if_next_149:
.if_end_148:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_151
    mov  rax, [rbp-8]
    mov  [rbp-2048], rax
    mov  rax, 0
    mov  [rbp-2056], rax
    mov  rax, 5
    mov  [rbp-2064], rax
    lea  rax, [rbp-2056]
    mov  [rbp-2072], rax
    lea  rax, [rbp-2064]
    mov  [rbp-2080], rax
    mov  rax, 0x35
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-2080]
    push rax
    mov  rax, [rbp-2072]
    push rax
    mov  rax, [rbp-32]
    push rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, [rbp-2048]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_150
.if_next_151:
.if_end_150:
    mov  rax, 1
    mov  [rbp-2088], rax
.while_start_152:
    mov  rax, [rbp-2088]
    cmp  rax, 0
    je   .while_end_153
    mov  rax, 0
    mov  [rbp-2096], rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-2104], rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-2112], rax
    mov  rax, [rbp-96]
    cmp  rax, 0
    je   .if_next_155
    sub  rsp, 8
    call uefi_read_key
    add  rsp, 8
    mov  [rbp-2096], rax
    mov  rax, [rbp-2096]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_157
    mov  rax, [rbp-2096]
    push rax
    mov  rax, 0xFFFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-2104], rax
    mov  rax, [rbp-2096]
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
    mov  [rbp-2112], rax
    jmp  .if_end_156
.if_next_157:
.if_end_156:
    jmp  .if_end_154
.if_next_155:
.if_end_154:
    mov  rax, [rbp-96]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-2104]
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
    mov  rax, [rbp-2112]
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
    je   .if_next_159
    mov  rax, [rbp-2112]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_161
    mov  rax, [rbp-2112]
    and  rax, 0xFFFF
    push rax
    mov  rax, 1
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_163
    mov  rax, [rbp-2000]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_165
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_up
    add  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_167
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-1944]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    mov  [rbp-2016], rax
    mov  rax, [rbp-1992]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_169
    mov  rax, 8
    mov  rcx, [rbp-2008]
    add  rax, rcx
    mov  [rbp-2008], rax
    jmp  .if_end_168
.if_next_169:
.if_end_168:
    jmp  .if_end_166
.if_next_167:
    mov  rax, [rbp-1992]
    push rax
    mov  rax, [rbp-2000]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2120], rax
.while_start_171:
    mov  rax, [rbp-2120]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_172
    mov  rax, 8
    mov  rcx, [rbp-2120]
    add  rax, rcx
    mov  [rbp-2120], rax
    jmp  .while_start_171
.while_end_172:
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-2120]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_174
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_176
    mov  rax, 8
    mov  rcx, [rbp-2008]
    add  rax, rcx
    mov  [rbp-2008], rax
    jmp  .if_end_175
.if_next_176:
.if_end_175:
    jmp  .if_end_173
.if_next_174:
.if_end_173:
    jmp  .if_end_166
.if_next_170:
.if_end_166:
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1928]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-2128], rax
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1936]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-1952], rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-2128]
    push rax
    mov  rax, [rbp-1912]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .if_end_164
.if_next_165:
.if_end_164:
    jmp  .if_end_162
.if_next_163:
    mov  rax, [rbp-2112]
    and  rax, 0xFFFF
    push rax
    mov  rax, 2
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_179
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_181
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_down
    add  rsp, 8
    mov  rax, [rbp-1992]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2136], rax
    mov  rax, [rbp-2136]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_183
    mov  rax, 8
    mov  rcx, [rbp-2136]
    add  rax, rcx
    mov  [rbp-2136], rax
    jmp  .if_end_182
.if_next_183:
.if_end_182:
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-2136]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_185
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2016]
    push rax
    mov  rax, [rbp-1944]
    push rax
    mov  rax, [rbp-1912]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-2016]
    mov  [rbp-1952], rax
    jmp  .if_end_184
.if_next_185:
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_188
    mov  rax, 8
    mov  rcx, [rbp-2008]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    jmp  .if_end_187
.if_next_188:
.if_end_187:
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1928]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-2144], rax
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1936]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-1952], rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-2144]
    push rax
    mov  rax, [rbp-1912]
    push rax
    call line_copy
    add  rsp, 24
    jmp  .if_end_184
.if_next_186:
.if_end_184:
    mov  rax, [rbp-1952]
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .if_end_180
.if_next_181:
.if_end_180:
    jmp  .if_end_178
.if_next_179:
    mov  rax, [rbp-2112]
    and  rax, 0xFFFF
    push rax
    mov  rax, 4
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_191
    mov  rax, [rbp-1976]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_193
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_left
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-1976]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_192
.if_next_193:
.if_end_192:
    jmp  .if_end_190
.if_next_191:
    mov  rax, [rbp-2112]
    and  rax, 0xFFFF
    push rax
    mov  rax, 3
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_196
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1952]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_198
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_right
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-1976]
    add  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_197
.if_next_198:
.if_end_197:
    jmp  .if_end_195
.if_next_196:
.if_end_195:
    jmp  .if_end_190
.if_next_194:
.if_end_190:
    jmp  .if_end_178
.if_next_189:
.if_end_178:
    jmp  .if_end_162
.if_next_177:
.if_end_162:
    jmp  .while_start_152
    jmp  .if_end_160
.if_next_161:
.if_end_160:
    mov  rax, [rbp-2104]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_200
    mov  rax, [rbp-2104]
    and  rax, 0xFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2152], rax
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_202
    mov  rax, 0x0A
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2152], rax
    jmp  .if_end_201
.if_next_202:
.if_end_201:
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_204
    mov  rax, [rbp-1976]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_206
    mov  rax, [rbp-1976]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2160], rax
.while_start_207:
    mov  rax, [rbp-2160]
    push rax
    mov  rax, [rbp-1952]
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
    je   .while_end_208
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2160]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2160]
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
    mov  rcx, [rbp-2160]
    add  rax, rcx
    mov  [rbp-2160], rax
    jmp  .while_start_207
.while_end_208:
    mov  rax, 1
    mov  rcx, [rbp-1952]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1952], rax
    mov  rax, 1
    mov  rcx, [rbp-1976]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .if_end_205
.if_next_206:
.if_end_205:
    jmp  .while_start_152
    jmp  .if_end_203
.if_next_204:
.if_end_203:
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_210
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, [rbp-376]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_212
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_211
.if_next_212:
.if_end_211:
    mov  rax, [rbp-1952]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_214
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-1920]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    mov  [rbp-1960], rax
    sub  rsp, 8
    mov  rax, [rbp-1992]
    push rax
    mov  rax, [rbp-1928]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-2168], rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2168]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1992]
    push rax
    mov  rax, [rbp-1936]
    push rax
    call hist_set_len
    add  rsp, 24
    mov  rax, 1
    mov  rcx, [rbp-1992]
    add  rax, rcx
    mov  [rbp-1992], rax
    mov  rax, [rbp-1992]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_216
    mov  rax, 0
    mov  [rbp-1992], rax
    jmp  .if_end_215
.if_next_216:
.if_end_215:
    mov  rax, [rbp-2000]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_218
    mov  rax, 1
    mov  rcx, [rbp-2000]
    add  rax, rcx
    mov  [rbp-2000], rax
    jmp  .if_end_217
.if_next_218:
.if_end_217:
    jmp  .if_end_213
.if_next_214:
.if_end_213:
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call run_command
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-1952], rax
    mov  rax, 0
    mov  [rbp-1976], rax
    mov  rax, 0
    mov  [rbp-1968], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    sub  rsp, 8
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call tty_write_prompt
    add  rsp, 40
    mov  rax, [rbp-352]
    mov  rax, qword [rax]
    mov  [rbp-2032], rax
    mov  rax, [rbp-360]
    mov  rax, qword [rax]
    mov  [rbp-2040], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    jmp  .while_start_152
    jmp  .if_end_209
.if_next_210:
.if_end_209:
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_220
    jmp  .while_start_152
    jmp  .if_end_219
.if_next_220:
.if_end_219:
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1984]
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
    je   .if_next_222
    jmp  .while_start_152
    jmp  .if_end_221
.if_next_222:
.if_end_221:
    mov  rax, [rbp-1952]
    mov  [rbp-176], rax
.while_start_223:
    mov  rax, [rbp-176]
    push rax
    mov  rax, [rbp-1976]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_224
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-176]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-176]
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
    mov  rcx, [rbp-176]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-176], rax
    jmp  .while_start_223
.while_end_224:
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-1976]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-1952]
    add  rax, rcx
    mov  [rbp-1952], rax
    mov  rax, 1
    mov  rcx, [rbp-1976]
    add  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-376]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_226
    mov  rax, [rbp-2152]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_225
.if_next_226:
.if_end_225:
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .while_start_152
    jmp  .if_end_199
.if_next_200:
.if_end_199:
    jmp  .if_end_158
.if_next_159:
.if_end_158:
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2176], rax
    mov  rax, [rbp-320]
    cmp  rax, 0
    je   .if_next_228
    sub  rsp, 8
    call kbd_read_scancode_irq
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2176], rax
    jmp  .if_end_227
.if_next_228:
    sub  rsp, 8
    call kbd_read_scancode
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2176], rax
    jmp  .if_end_227
.if_next_229:
.if_end_227:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    mov  rax, [rbp-320]
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_231
    sub  rsp, 8
    call kbd_read_scancode
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2176], rax
    jmp  .if_end_230
.if_next_231:
.if_end_230:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_233
    jmp  .while_start_152
    jmp  .if_end_232
.if_next_233:
.if_end_232:
    mov  rax, [rbp-376]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_235
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_write_hex_u64
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_234
.if_next_235:
.if_end_234:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0xE0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_237
    mov  rax, 1
    mov  [rbp-2024], rax
    jmp  .while_start_152
    jmp  .if_end_236
.if_next_237:
.if_end_236:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0xE1
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_239
    jmp  .while_start_152
    jmp  .if_end_238
.if_next_239:
.if_end_238:
    mov  rax, [rbp-2024]
    cmp  rax, 0
    je   .if_next_241
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0x48
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_243
    mov  rax, [rbp-2000]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_245
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_up
    add  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_247
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-1944]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    mov  [rbp-2016], rax
    mov  rax, [rbp-1992]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_249
    mov  rax, 8
    mov  rcx, [rbp-2008]
    add  rax, rcx
    mov  [rbp-2008], rax
    jmp  .if_end_248
.if_next_249:
.if_end_248:
    jmp  .if_end_246
.if_next_247:
    mov  rax, [rbp-1992]
    push rax
    mov  rax, [rbp-2000]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2184], rax
.while_start_251:
    mov  rax, [rbp-2184]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_252
    mov  rax, 8
    mov  rcx, [rbp-2184]
    add  rax, rcx
    mov  [rbp-2184], rax
    jmp  .while_start_251
.while_end_252:
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-2184]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_254
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_256
    mov  rax, 8
    mov  rcx, [rbp-2008]
    add  rax, rcx
    mov  [rbp-2008], rax
    jmp  .if_end_255
.if_next_256:
.if_end_255:
    jmp  .if_end_253
.if_next_254:
.if_end_253:
    jmp  .if_end_246
.if_next_250:
.if_end_246:
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1928]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-2192], rax
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1936]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-1952], rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-2192]
    push rax
    mov  rax, [rbp-1912]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .if_end_244
.if_next_245:
.if_end_244:
    jmp  .if_end_242
.if_next_243:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0x50
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_259
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_261
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_down
    add  rsp, 8
    mov  rax, [rbp-1992]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2200], rax
    mov  rax, [rbp-2200]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_263
    mov  rax, 8
    mov  rcx, [rbp-2200]
    add  rax, rcx
    mov  [rbp-2200], rax
    jmp  .if_end_262
.if_next_263:
.if_end_262:
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-2200]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_265
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2016]
    push rax
    mov  rax, [rbp-1944]
    push rax
    mov  rax, [rbp-1912]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-2016]
    mov  [rbp-1952], rax
    jmp  .if_end_264
.if_next_265:
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  [rbp-2008], rax
    mov  rax, [rbp-2008]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_268
    mov  rax, 8
    mov  rcx, [rbp-2008]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    jmp  .if_end_267
.if_next_268:
.if_end_267:
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1928]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-2208], rax
    sub  rsp, 8
    mov  rax, [rbp-2008]
    push rax
    mov  rax, [rbp-1936]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  [rbp-1952], rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-2208]
    push rax
    mov  rax, [rbp-1912]
    push rax
    call line_copy
    add  rsp, 24
    jmp  .if_end_264
.if_next_266:
.if_end_264:
    mov  rax, [rbp-1952]
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .if_end_260
.if_next_261:
.if_end_260:
    jmp  .if_end_258
.if_next_259:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_271
    mov  rax, [rbp-1976]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_273
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_left
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-1976]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_272
.if_next_273:
.if_end_272:
    jmp  .if_end_270
.if_next_271:
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_276
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1952]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_278
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_right
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-1976]
    add  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_277
.if_next_278:
.if_end_277:
    jmp  .if_end_275
.if_next_276:
.if_end_275:
    jmp  .if_end_270
.if_next_274:
.if_end_270:
    jmp  .if_end_258
.if_next_269:
.if_end_258:
    jmp  .if_end_242
.if_next_257:
.if_end_242:
    mov  rax, 0
    mov  [rbp-2024], rax
    jmp  .while_start_152
    jmp  .if_end_240
.if_next_241:
.if_end_240:
    mov  rax, [rbp-2176]
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
    je   .if_next_280
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7F
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2216], rax
    mov  rax, [rbp-2216]
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
    mov  rax, [rbp-2216]
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
    je   .if_next_282
    mov  rax, 0
    mov  [rbp-368], rax
    jmp  .if_end_281
.if_next_282:
.if_end_281:
    jmp  .while_start_152
    jmp  .if_end_279
.if_next_280:
.if_end_279:
    mov  rax, [rbp-2176]
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
    mov  rax, [rbp-2176]
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
    je   .if_next_284
    mov  rax, 1
    mov  [rbp-368], rax
    jmp  .while_start_152
    jmp  .if_end_283
.if_next_284:
.if_end_283:
    sub  rsp, 8
    mov  rax, [rbp-368]
    push rax
    mov  rax, [rbp-2176]
    and  rax, 0xFF
    push rax
    call kbd_scancode_to_ascii
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2224], rax
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_286
    jmp  .while_start_152
    jmp  .if_end_285
.if_next_286:
.if_end_285:
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_288
    mov  rax, [rbp-1976]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_290
    mov  rax, [rbp-1976]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2232], rax
.while_start_291:
    mov  rax, [rbp-2232]
    push rax
    mov  rax, [rbp-1952]
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
    je   .while_end_292
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2232]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2232]
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
    mov  rcx, [rbp-2232]
    add  rax, rcx
    mov  [rbp-2232], rax
    jmp  .while_start_291
.while_end_292:
    mov  rax, 1
    mov  rcx, [rbp-1952]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1952], rax
    mov  rax, 1
    mov  rcx, [rbp-1976]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .if_end_289
.if_next_290:
.if_end_289:
    jmp  .while_start_152
    jmp  .if_end_287
.if_next_288:
.if_end_287:
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_294
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, [rbp-376]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_296
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_295
.if_next_296:
.if_end_295:
    mov  rax, [rbp-1952]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_298
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-1920]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    mov  [rbp-1960], rax
    sub  rsp, 8
    mov  rax, [rbp-1992]
    push rax
    mov  rax, [rbp-1928]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-2240], rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2240]
    push rax
    call line_copy
    add  rsp, 24
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1992]
    push rax
    mov  rax, [rbp-1936]
    push rax
    call hist_set_len
    add  rsp, 24
    mov  rax, 1
    mov  rcx, [rbp-1992]
    add  rax, rcx
    mov  [rbp-1992], rax
    mov  rax, [rbp-1992]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_300
    mov  rax, 0
    mov  [rbp-1992], rax
    jmp  .if_end_299
.if_next_300:
.if_end_299:
    mov  rax, [rbp-2000]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_302
    mov  rax, 1
    mov  rcx, [rbp-2000]
    add  rax, rcx
    mov  [rbp-2000], rax
    jmp  .if_end_301
.if_next_302:
.if_end_301:
    jmp  .if_end_297
.if_next_298:
.if_end_297:
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call run_command
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-1952], rax
    mov  rax, 0
    mov  [rbp-1976], rax
    mov  rax, 0
    mov  [rbp-1968], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2008], rax
    sub  rsp, 8
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call tty_write_prompt
    add  rsp, 40
    mov  rax, [rbp-352]
    mov  rax, qword [rax]
    mov  [rbp-2032], rax
    mov  rax, [rbp-360]
    mov  rax, qword [rax]
    mov  [rbp-2040], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    jmp  .while_start_152
    jmp  .if_end_293
.if_next_294:
.if_end_293:
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_304
    jmp  .while_start_152
    jmp  .if_end_303
.if_next_304:
.if_end_303:
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1984]
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
    je   .if_next_306
    jmp  .while_start_152
    jmp  .if_end_305
.if_next_306:
.if_end_305:
    mov  rax, [rbp-1952]
    mov  [rbp-176], rax
.while_start_307:
    mov  rax, [rbp-176]
    push rax
    mov  rax, [rbp-1976]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_308
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-176]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-176]
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
    mov  rcx, [rbp-176]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-176], rax
    jmp  .while_start_307
.while_end_308:
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-1976]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, 1
    mov  rcx, [rbp-1952]
    add  rax, rcx
    mov  [rbp-1952], rax
    mov  rax, 1
    mov  rcx, [rbp-1976]
    add  rax, rcx
    mov  [rbp-1976], rax
    sub  rsp, 8
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-112]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, [rbp-376]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_310
    mov  rax, [rbp-2224]
    and  rax, 0xFF
    push rax
    mov  rax, [rbp-432]
    push rax
    mov  rax, [rbp-424]
    push rax
    mov  rax, [rbp-400]
    push rax
    mov  rax, [rbp-392]
    push rax
    mov  rax, [rbp-384]
    push rax
    mov  rax, [rbp-376]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_309
.if_next_310:
.if_end_309:
    sub  rsp, 8
    mov  rax, [rbp-1976]
    push rax
    mov  rax, [rbp-1968]
    push rax
    mov  rax, [rbp-1952]
    push rax
    mov  rax, [rbp-1912]
    push rax
    mov  rax, [rbp-2040]
    push rax
    mov  rax, [rbp-2032]
    push rax
    mov  rax, [rbp-168]
    and  rax, 0xFFFF
    push rax
    mov  rax, [rbp-360]
    push rax
    mov  rax, [rbp-352]
    push rax
    mov  rax, [rbp-160]
    push rax
    call line_redraw
    add  rsp, 88
    mov  rax, [rbp-1952]
    mov  [rbp-1968], rax
    jmp  .while_start_152
.while_end_153:
    leave
    ret


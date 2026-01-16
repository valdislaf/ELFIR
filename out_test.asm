global _start
global xhci_write_trb
global xhci_zero
global xhci_cmd_ring_init
global xhci_cmd_enqueue
global xhci_xfer_enqueue
global xhci_ring_init
global xhci_ring_doorbell
global usb_kbd_meta_addr
global usb_kbd_meta_store_u64
global usb_kbd_meta_load_u64
global usb_kbd_meta_store_i64
global usb_kbd_meta_load_i64
global usb_kbd_ring_ptr
global usb_kbd_buf_ptr
global usb_kbd_prev_ptr
global usb_kbd_find_by_ep
global usb_kbd_alloc_handle
global usb_kbd_max_devs
global usb_kbd_ring_size
global usb_kbd_buf_size
global usb_kbd_meta_stride
global usb_kbd_meta_used_off
global usb_kbd_meta_slot_off
global usb_kbd_meta_ep_id_off
global usb_kbd_meta_ep_addr_off
global usb_kbd_meta_epu_off
global usb_kbd_meta_db_off
global usb_kbd_meta_ring_ptr_off
global usb_kbd_meta_ring_idx_off
global usb_kbd_meta_ring_cycle_off
global usb_kbd_meta_report_buf_off
global usb_kbd_meta_report_len_off
global usb_kbd_meta_in_flight_off
global usb_kbd_meta_has_report_off
global usb_kbd_meta_seq_off
global usb_kbd_meta_prev_off
global usb_kbd_meta_prev_ptr
global usb_kbd_ring_pool
global usb_kbd_buf_pool
global usb_kbd_meta_pool
global kbd_meta_init
global xhci_queue_noop
global xhci_ctx_size
global pci_write32
global pci_find_cap
global pci_pm_set_d0
global pci_flr
global pci_enable_msi
global pci_find_xhci_base
global pci_find_xhci_active_base
global xhci_evt_poll
global xhci_ctrl_xfer
global hid_key_in_prev
global hid_first_key
global fb_mark_line
global irq_timer_tick
global irq_kbd_push
global irq_xhci_evt
global panic
global kbd_read_scancode
global kbd_flush
global kbd_read_scancode_irq
global tty_clear
global tty_write_buf
global line_clear_display
global line_echo_buf
global hist_get_len
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
extern spc
extern eq
extern us
extern nl
extern d0
extern d1
extern d2
extern d3
extern d4
extern d5
extern d6
extern d7
extern d8
extern d9
extern A
extern B
extern C
extern D
extern E
extern F
extern G
extern H
extern I
extern J
extern K
extern L
extern M
extern N
extern O
extern P
extern Q
extern R
extern S
extern T
extern U
extern V
extern W
extern X
extern Y
extern Z
extern a
extern b
extern c
extern d
extern e
extern f
extern g
extern h
extern i
extern j
extern k
extern l
extern m
extern n
extern o
extern p
extern q
extern r
extern s
extern t
extern u
extern v
extern w
extern x
extern y
extern z
extern serial_init
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
extern rt_xhci_kbd_ring
extern rt_xhci_kbd_buf
extern rt_usb_buf_ptr
extern rt_usb_irq_ptr
extern rt_wbinvd
extern serial_write_byte
extern serial_write_newline
extern serial_write_backspace
extern uefi_putc
extern serial_write_kernel_start
extern serial_write_kernel_init_ok
extern serial_write_kernel_halt
extern tty_write_hex_u64
extern fb_glyph
extern fb_clear_screen
extern tty_putc
extern tty_scroll
extern fb_putc
extern fb_fill_rect
extern kputc
extern kputs
extern kendl
extern kbind_fb
extern fb_cursor_xor
extern fb_clear_cell
extern fb_draw_char_at
extern fb_redraw_from
extern fb_hex
extern khex
extern kdigit
extern fb_write_hex_u64
extern fb_put_hex_nib
extern fb_write_hex_u8
extern fb_label_xhci_base
extern fb_label_caplen
extern fb_label_hciver
extern fb_label_hcs1
extern fb_label_hcs2
extern fb_label_hcs3
extern fb_label_dboff
extern fb_label_rtsoff
extern fb_label_ports
extern fb_label_portsc
extern fb_label_portr
extern fb_label_portu
extern fb_label_slots
extern fb_label_hcc1
extern fb_label_ecp
extern fb_label_leg
extern fb_label_bios
extern fb_label_os
extern fb_label_spd1
extern fb_label_spd2
extern fb_label_poff
extern fb_label_pcnt
extern fb_label_slot
extern fb_label_ccode
extern fb_label_addr
extern fb_label_ccs
extern fb_label_ped
extern fb_label_pls
extern fb_label_spd
extern fb_label_cfg
extern fb_label_dcbaap
extern fb_label_crcr
extern fb_label_erstba
extern fb_label_iman
extern fb_label_usb_ready
extern fb_label_ep_id
extern fb_label_ep_ctx
extern fb_label_ep_addr
extern fb_label_ep_mps
extern fb_label_ep_int
extern fb_label_if_num
extern fb_label_alt_num
extern fb_label_db_slot
extern fb_label_db_reg
extern fb_label_db_target
extern fb_label_ic_dw
extern fb_label_dc_dw
extern fb_label_evt_ring
extern fb_label_erst_base
extern fb_label_erst_sz
extern fb_label_erst_ba
extern fb_label_erdp
extern fb_label_port
extern fb_label_usbcmd
extern fb_label_usbsts
extern tty_write_xhci_base_label
extern tty_write_caplen_label
extern tty_write_hciver_label
extern dbg_mark_g
extern dbg_mark2_g
extern dbg_dump_xhci_all_g
extern dbg_boot_mark
extern kbd_scancode_to_ascii
extern tty_write_help
extern cmd_is_help
extern cmd_is_cls
extern cmd_is_halt
extern cmd_is_echo
extern cmd_is_panic
extern serial_log_cmd_help
extern serial_log_cmd_echo
extern serial_log_cmd_cls
extern serial_log_cmd_halt
extern serial_log_cmd_panic
extern serial_log_cmd_unknown
extern serial_log_key_up
extern serial_log_key_down
extern serial_log_key_left
extern serial_log_key_right
extern sel_shift
extern pci_read32
extern pci_cfg_addr
extern line_apply_char
extern line_redraw
extern fb_cursor_set_line
extern line_redraw_serial
extern line_copy
extern hist_entry_ptr
extern hist_set_len
extern tty_write_prompt
extern hid_key_to_ascii

section .rodata

panic_str0: db 80, 65, 78, 73, 67, 58, 32
panic_str1: db 10
run_command_str0: db 109, 97, 110, 117, 97, 108, 32, 112, 97, 110, 105, 99

section .bss

fb_yp: resb 8
fb_xp: resb 8
fb_x: resb 8
fb_height: resb 8
fb_y: resb 8
fb_width: resb 8
fb_stride: resb 8
fb_out: resb 8

section .text

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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  [rbp-56], rax
    lea  rax, [rbp-24]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-32]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-24], rax
    mov  rax, 255
    mov  [rbp-32], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-16]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    sub  rsp, 8
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-64], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-72], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    call xhci_write_trb
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 255
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-80]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    leave
    ret

xhci_xfer_enqueue:
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-64], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-72], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    call xhci_write_trb
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 255
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-80]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-24], rax
    mov  rax, 255
    mov  [rbp-32], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-16]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    sub  rsp, 8
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    call xhci_write_trb
    add  rsp, 56
    leave
    ret
    leave
    ret

xhci_ring_doorbell:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  eax, 0xFFFFFFFF
    mov  [rbp-16], rax
    sub  rsp, 8
    call rt_wbinvd
    add  rsp, 8
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    leave
    ret

usb_kbd_meta_addr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_stride
    add  rsp, 8
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    leave
    ret

usb_kbd_meta_store_u64:
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_addr
    add  rsp, 24
    mov  [rbp-40], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret

usb_kbd_meta_load_u64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_addr
    add  rsp, 24
    mov  [rbp-32], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    leave
    ret

usb_kbd_meta_store_i64:
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
    mov  [rbp-32], rax
    sub  rsp, 8
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    leave
    ret

usb_kbd_meta_load_i64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    leave
    ret

usb_kbd_ring_ptr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_ring_size
    add  rsp, 8
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    leave
    ret

usb_kbd_buf_ptr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_buf_size
    add  rsp, 8
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    leave
    ret

usb_kbd_prev_ptr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    sub  rsp, 8
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_buf_ptr
    add  rsp, 24
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    leave
    ret

usb_kbd_find_by_ep:
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
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ep_id_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
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
    je   .if_next_3
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-32]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    leave
    ret

usb_kbd_alloc_handle:
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    sub  rsp, 8
    mov  rax, 1
    push rax
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_max_devs
    add  rsp, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-32], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    mov  rax, 1
    push rax
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_idx_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 1
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_cycle_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_in_flight_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_has_report_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_seq_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    leave
    ret

usb_kbd_max_devs:
    push rbp
    mov  rbp, rsp
    mov  rax, 4
    leave
    ret

usb_kbd_ring_size:
    push rbp
    mov  rbp, rsp
    mov  rax, 4096
    leave
    ret

usb_kbd_buf_size:
    push rbp
    mov  rbp, rsp
    mov  rax, 16
    leave
    ret

usb_kbd_meta_stride:
    push rbp
    mov  rbp, rsp
    mov  rax, 128
    leave
    ret

usb_kbd_meta_used_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 0
    leave
    ret

usb_kbd_meta_slot_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 8
    leave
    ret

usb_kbd_meta_ep_id_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 16
    leave
    ret

usb_kbd_meta_ep_addr_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 24
    leave
    ret

usb_kbd_meta_epu_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 32
    leave
    ret

usb_kbd_meta_db_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 40
    leave
    ret

usb_kbd_meta_ring_ptr_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 48
    leave
    ret

usb_kbd_meta_ring_idx_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 56
    leave
    ret

usb_kbd_meta_ring_cycle_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 64
    leave
    ret

usb_kbd_meta_report_buf_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 72
    leave
    ret

usb_kbd_meta_report_len_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 80
    leave
    ret

usb_kbd_meta_in_flight_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 88
    leave
    ret

usb_kbd_meta_has_report_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 96
    leave
    ret

usb_kbd_meta_seq_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 104
    leave
    ret

usb_kbd_meta_prev_off:
    push rbp
    mov  rbp, rsp
    mov  rax, 112
    leave
    ret

usb_kbd_meta_prev_ptr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_stride
    add  rsp, 8
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    sub  rsp, 8
    call usb_kbd_meta_prev_off
    add  rsp, 8
    pop  rcx
    add  rax, rcx
    leave
    ret

usb_kbd_ring_pool:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    leave
    ret

usb_kbd_buf_pool:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_ring_pool
    add  rsp, 8
    push rax
    sub  rsp, 8
    call usb_kbd_ring_size
    add  rsp, 8
    push rax
    sub  rsp, 8
    call usb_kbd_max_devs
    add  rsp, 8
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    leave
    ret

usb_kbd_meta_pool:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_buf_pool
    add  rsp, 8
    push rax
    sub  rsp, 8
    call usb_kbd_buf_size
    add  rsp, 8
    push rax
    sub  rsp, 8
    call usb_kbd_max_devs
    add  rsp, 8
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    leave
    ret

kbd_meta_init:
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
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    mov  rax, [rbp+72]
    and  eax, 0xFFFFFFFF
    mov  [rbp-64], rax
    mov  rax, [rbp+80]
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, [rbp+88]
    mov  [rbp-80], rax
    sub  rsp, 8
    mov  rax, 1
    push rax
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    sub  rsp, 8
    call usb_kbd_meta_slot_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ep_id_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ep_addr_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_epu_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_db_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_ptr_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_idx_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 1
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_cycle_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_report_buf_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    sub  rsp, 8
    call usb_kbd_meta_report_len_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_in_flight_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_has_report_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_seq_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_prev_ptr
    add  rsp, 24
    mov  [rbp-88], rax
    sub  rsp, 8
    mov  rax, 8
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    leave
    ret

xhci_queue_noop:
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
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, 0
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
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 23
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call xhci_xfer_enqueue
    add  rsp, 56
    sub  rsp, 8
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    call xhci_ring_doorbell
    add  rsp, 24
    leave
    ret

xhci_ctx_size:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  eax, 0xFFFFFFFF
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
    mov  eax, dword [rax]
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

pci_write32:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  rax, 0xFF
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFF
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_cfg_addr
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    mov  rax, 0xCF8
    and  rax, 0xFFFF
    mov  dx, ax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    out  dx, eax
    mov  rax, 0xCFC
    and  rax, 0xFFFF
    mov  dx, ax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    out  dx, eax
    leave
    ret

pci_find_cap:
    push rbp
    mov  rbp, rsp
    sub  rsp, 96
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  rax, 0xFF
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFF
    mov  [rbp-32], rax
    sub  rsp, 8
    mov  rax, 0x04
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00100000
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
    je   .if_next_1
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    mov  rax, 0x34
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-56], rax
    mov  rax, 48
    mov  [rbp-64], rax
.while_start_2:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .while_end_3
    sub  rsp, 8
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-80], rax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
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
    mov  [rbp-88], rax
    lea  rax, [rbp-80]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-88]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret

pci_pm_set_d0:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  rax, 0xFF
    mov  [rbp-24], rax
    sub  rsp, 8
    mov  rax, 0x01
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_find_cap
    add  rsp, 40
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-32], rax
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
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
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x3
    and  eax, 0xFFFFFFFF
    not  rax
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    leave
    ret

pci_flr:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  rax, 0xFF
    mov  [rbp-24], rax
    sub  rsp, 8
    mov  rax, 0x10
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_find_cap
    add  rsp, 40
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-32], rax
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
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
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 15
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    mov  rax, 2000000
    mov  [rbp-48], rax
.while_start_2:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 15
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
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    jmp  .while_end_3
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_2
.while_end_3:
    leave
    ret

pci_enable_msi:
    push rbp
    mov  rbp, rsp
    sub  rsp, 96
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    and  rax, 0xFF
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    and  rax, 0xFF
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    and  rax, 0xFF
    mov  [rbp-32], rax
    sub  rsp, 8
    mov  rax, 0x05
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_find_cap
    add  rsp, 40
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
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
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-48], rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
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
    mov  [rbp-56], rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 7
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
    mov  [rbp-64], rax
    mov  rax, 0xFEE00000
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-72], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0C
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    jmp  .if_end_2
.if_next_3:
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    jmp  .if_end_2
.if_next_4:
.if_end_2:
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x0000FFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
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
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0x04
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-96], rax
    lea  rax, [rbp-96]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-96]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-96]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
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
    mov  r8, rax
    lea  rax, [rbp-96]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-96]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    mov  rax, 1
    leave
    ret

pci_find_xhci_base:
    push rbp
    mov  rbp, rsp
    sub  rsp, 112
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, 0
    mov  [rbp-32], rax
.while_start_0:
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    mov  rax, 256
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 0
    mov  [rbp-40], rax
.while_start_2:
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 32
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_4:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    sub  rsp, 8
    mov  rax, 0x00
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    sub  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-64], rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
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
    mov  [rbp-72], rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
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
    mov  [rbp-80], rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
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
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-80]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x03
    and  rax, 0xFF
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-72]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x30
    and  rax, 0xFF
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
    je   .if_next_9
    sub  rsp, 8
    mov  rax, 0x10
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-96], rax
    sub  rsp, 8
    mov  rax, 0x14
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-104], rax
    lea  rax, [rbp-104]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    push rax
    lea  rax, [rbp-96]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    mov  [rbp-112], rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xF
    not  rax
    pop  rcx
    and  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-112]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    leave
    ret
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_4
.while_end_5:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-32]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
    mov  rax, 0
    leave
    ret

pci_find_xhci_active_base:
    push rbp
    mov  rbp, rsp
    sub  rsp, 224
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, 0
    mov  [rbp-32], rax
.while_start_0:
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    mov  rax, 256
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 0
    mov  [rbp-40], rax
.while_start_2:
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 32
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_4:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    sub  rsp, 8
    mov  rax, 0x00
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-56], rax
    lea  rax, [rbp-56]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    sub  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-64], rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
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
    mov  [rbp-72], rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
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
    mov  [rbp-80], rax
    lea  rax, [rbp-64]
    mov  eax, dword [rax]
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
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-80]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x03
    and  rax, 0xFF
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-72]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x30
    and  rax, 0xFF
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
    je   .if_next_9
    sub  rsp, 8
    mov  rax, 0x10
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-96], rax
    sub  rsp, 8
    mov  rax, 0x14
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-104], rax
    lea  rax, [rbp-104]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    push rax
    lea  rax, [rbp-96]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    mov  [rbp-112], rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xF
    not  rax
    pop  rcx
    and  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-112]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    mov  [rbp-120], rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-128], rax
    lea  rax, [rbp-128]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-136], rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-144], rax
    lea  rax, [rbp-144]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-152], rax
    lea  rax, [rbp-152]
    mov  eax, dword [rax]
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
    mov  [rbp-160], rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-168], rax
    mov  rax, 1
    mov  [rbp-176], rax
.while_start_12:
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-160]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_13
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
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
    mov  [rbp-184], rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    mov  [rbp-192], rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-200], rax
    lea  rax, [rbp-200]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-208], rax
    lea  rax, [rbp-200]
    mov  eax, dword [rax]
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
    mov  [rbp-216], rax
    lea  rax, [rbp-208]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-216]
    mov  eax, dword [rax]
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
    je   .if_next_15
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    leave
    ret
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_12
.while_end_13:
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_4
.while_end_5:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-32]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
    mov  rax, 0
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-64], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-72], rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-88], rax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-80]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 256
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-88]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    leave
    ret

xhci_ctrl_xfer:
    push rbp
    mov  rbp, rsp
    sub  rsp, 304
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
    mov  [rbp-72], rax
    mov  rax, [rbp+88]
    mov  [rbp-80], rax
    mov  rax, [rbp+96]
    and  eax, 0xFFFFFFFF
    mov  [rbp-88], rax
    mov  rax, [rbp+104]
    mov  [rbp-96], rax
    mov  rax, [rbp+112]
    mov  [rbp-104], rax
    mov  rax, [rbp+120]
    mov  [rbp-112], rax
    mov  rax, [rbp+128]
    mov  [rbp-120], rax
    mov  rax, [rbp+136]
    mov  [rbp-128], rax
    mov  rax, [rbp+144]
    mov  [rbp-136], rax
    mov  rax, [rbp+152]
    mov  [rbp-144], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-152], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    mov  [rbp-160], rax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-168], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-176], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-184], rax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 2
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-184]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_2
.if_next_3:
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-184]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_2
.if_next_4:
.if_end_2:
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-176]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-184]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-176]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 6
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-176]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 2
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
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-176]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-168]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-160]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-152]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call xhci_xfer_enqueue
    add  rsp, 56
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_6
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    mov  [rbp-192], rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-200], rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
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
    mov  [rbp-208], rax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-216], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-224], rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_8
    lea  rax, [rbp-224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-224]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_7
.if_next_8:
.if_end_7:
    lea  rax, [rbp-224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 3
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
    mov  r8, rax
    lea  rax, [rbp-224]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-216]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-208]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-200]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call xhci_xfer_enqueue
    add  rsp, 56
    jmp  .if_end_5
.if_next_6:
.if_end_5:
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-232], rax
    lea  rax, [rbp-88]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_10
    lea  rax, [rbp-232]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_9
.if_next_10:
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    lea  rax, [rbp-232]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    jmp  .if_end_9
.if_next_11:
.if_end_9:
    lea  rax, [rbp-232]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-232]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
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
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-232]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call xhci_xfer_enqueue
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    call xhci_ring_doorbell
    add  rsp, 24
    mov  rax, 2000000
    mov  [rbp-240], rax
.while_start_14:
    lea  rax, [rbp-240]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_15
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-248], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-256], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-264], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-272], rax
    lea  rax, [rbp-272]
    push rax
    lea  rax, [rbp-264]
    push rax
    lea  rax, [rbp-256]
    push rax
    lea  rax, [rbp-248]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_17
    lea  rax, [rbp-272]
    mov  eax, dword [rax]
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
    mov  [rbp-280], rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
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
    mov  [rbp-288], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-296], rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-296]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    je   .if_next_21
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    lea  rax, [rbp-288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_23
    mov  rax, 1
    leave
    ret
    jmp  .if_end_22
.if_next_23:
.if_end_22:
    mov  rax, 0
    leave
    ret
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-240]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_14
.while_end_15:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    je   .if_next_25
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    mov  rax, 0
    leave
    ret

hid_key_in_prev:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, 2
    mov  [rbp-24], rax
.while_start_0:
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 1
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
    mov  rax, 0
    leave
    ret

hid_first_key:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, 2
    mov  [rbp-16], rax
.while_start_0:
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-24], rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-72], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-80], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-88], rax
    lea  rax, [rbp-48]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, 24
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_fill_rect
    add  rsp, 72
    leave
    ret
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-16], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-40], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-48], rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    leave
    ret
    leave
    ret

irq_xhci_evt:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    sub  rsp, 8
    call rt_usb_irq_ptr
    add  rsp, 8
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-16], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    pop  rcx
    mov  qword [rcx], rax
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 0x64
    and  rax, 0xFFFF
    mov  dx, ax
    in   al, dx
    movzx eax, al
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-32], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-40], rax
    lea  rax, [rbp-32]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-48], rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
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
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    lea  rax, [rbp-48]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
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
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_2:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_2
.while_end_3:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    lea  rax, [rbp-64]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_backspace
    add  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
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
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-72], rax
    sub  rsp, 8
    lea  rax, [rbp-72]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-72]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_0
.while_end_1:
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-24], rax
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call cmd_is_help
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_3
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_help
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_write_help
    add  rsp, 40
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call cmd_is_cls
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_5
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_cls
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_clear
    add  rsp, 40
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call cmd_is_halt
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_7
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_halt
    add  rsp, 8
    cli
    mov  rax, 1
    mov  [rbp-64], rax
.while_start_8:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .while_end_9
    hlt
    jmp  .while_start_8
.while_end_9:
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call cmd_is_panic
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_11
    lea  rax, [rbp-40]
    movzx eax, word [rax]
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call cmd_is_echo
    add  rsp, 24
    cmp  rax, 0
    je   .if_next_13
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_echo
    add  rsp, 8
    mov  rax, 4
    mov  [rbp-72], rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    sub  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_write_buf
    add  rsp, 56
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_putc
    add  rsp, 40
    leave
    ret
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_cmd_unknown
    add  rsp, 8
    mov  rax, 0x3F
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_putc
    add  rsp, 40
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    sub  rsp, 4144
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_out]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_stride]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_width]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_height]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_x]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_y]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rel fb_x]
    mov  r8, rax
    lea  rax, [rel fb_xp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rel fb_y]
    mov  r8, rax
    lea  rax, [rel fb_yp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-48], rax
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
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call fb_fill_rect
    add  rsp, 72
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    mov  [rbp-56], rax
    sub  rsp, 8
    call uefi_has_st
    add  rsp, 8
    mov  [rbp-64], rax
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-72], rax
    mov  rax, 1
    and  rax, 0xFF
    push rax
    call dbg_boot_mark
    add  rsp, 8
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_init
    add  rsp, 8
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_start
    add  rsp, 8
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 0xB8000
    mov  [rbp-80], rax
    mov  rax, 0x0F00
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-88], rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    mov  [rbp-96], rax
.while_start_6:
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-96]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_6
.while_end_7:
    mov  rax, 996
    mov  [rbp-104], rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    movzx eax, word [rax]
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
    mov  rax, 2
    and  rax, 0xFF
    push rax
    call dbg_boot_mark
    add  rsp, 8
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    lea  rax, [rbp-72]
    movzx eax, word [rax]
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
    sub  rsp, 8
    call idt_init
    add  rsp, 8
    mov  rax, 3
    and  rax, 0xFF
    push rax
    call dbg_boot_mark
    add  rsp, 8
    sub  rsp, 8
    call rt_i8042_init
    add  rsp, 8
    mov  rax, 4
    and  rax, 0xFF
    push rax
    call dbg_boot_mark
    add  rsp, 8
    mov  rax, 0
    mov  [rbp-112], rax
    mov  rax, 0
    mov  [rbp-120], rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-120]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_13
    sub  rsp, 8
    call pic_init
    add  rsp, 8
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 0x21
    and  rax, 0xFFFF
    mov  dx, ax
    mov  rax, 0xFE
    and  rax, 0xFF
    out  dx, al
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_17
    sti
    jmp  .if_end_16
.if_next_17:
.if_end_16:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    mov  rax, 0x3F8
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-128], rax
    lea  rax, [rbp-128]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_kernel_halt
    add  rsp, 8
    jmp  .if_end_18
.if_next_19:
.if_end_18:
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
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_out]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_x]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_y]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_xp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_yp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    mov  rax, 0
    mov  [rbp-176], rax
    mov  rax, 0
    mov  [rbp-184], rax
    mov  rax, 0
    mov  [rbp-192], rax
    lea  rax, [rel fb_xp]
    mov  rax, qword [rax]
    mov  [rbp-200], rax
    lea  rax, [rel fb_yp]
    mov  rax, qword [rax]
    mov  [rbp-208], rax
    mov  rax, 0
    mov  [rbp-216], rax
    mov  rax, 0
    mov  [rbp-224], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-232], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-240], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-248], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-256], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-264], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-272], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-280], rax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-288], rax
    mov  rax, 10
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-296], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-304], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-312], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-320], rax
    mov  rax, 0
    mov  [rbp-328], rax
    mov  rax, 0
    mov  [rbp-336], rax
    mov  rax, 0
    mov  [rbp-344], rax
    mov  rax, 0
    mov  [rbp-352], rax
    mov  rax, 0
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
    mov  rax, 0
    mov  [rbp-424], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-432], rax
    mov  rax, 0
    mov  [rbp-440], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-448], rax
    sub  rsp, 8
    call rt_usb_buf_ptr
    add  rsp, 8
    mov  [rbp-456], rax
    sub  rsp, 8
    call rt_xhci_scratch_bufs
    add  rsp, 8
    mov  [rbp-464], rax
    lea  rax, [rbp-464]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_ring_pool
    add  rsp, 8
    mov  [rbp-472], rax
    lea  rax, [rbp-464]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_buf_pool
    add  rsp, 8
    mov  [rbp-480], rax
    lea  rax, [rbp-464]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_pool
    add  rsp, 8
    mov  [rbp-488], rax
    lea  rax, [rbp-464]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4096
    push rax
    mov  rax, 31
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  [rbp-496], rax
    lea  rax, [rbp-496]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  [rbp-504], rax
    sub  rsp, 8
    call rt_usb_irq_ptr
    add  rsp, 8
    mov  [rbp-512], rax
    mov  rax, 0
    mov  [rbp-520], rax
    mov  rax, 0
    mov  [rbp-528], rax
    mov  rax, 0
    mov  [rbp-536], rax
    mov  rax, 1
    mov  [rbp-544], rax
    mov  rax, 2
    mov  [rbp-552], rax
    mov  rax, 1
    mov  [rbp-560], rax
    mov  rax, 1
    mov  [rbp-568], rax
    mov  rax, 1
    mov  [rbp-576], rax
    mov  rax, 0
    mov  [rbp-584], rax
    lea  rax, [rbp-584]
    mov  [rbp-592], rax
    mov  rax, 1
    mov  [rbp-600], rax
    mov  rax, 0
    mov  [rbp-608], rax
    mov  rax, 0
    mov  [rbp-616], rax
    mov  rax, 0
    mov  [rbp-624], rax
    mov  rax, 0
    mov  [rbp-632], rax
    mov  rax, 0
    mov  [rbp-640], rax
    mov  rax, 0
    mov  [rbp-648], rax
    mov  rax, 0
    mov  [rbp-656], rax
    mov  rax, 0
    mov  [rbp-664], rax
    mov  rax, 0
    mov  [rbp-672], rax
    mov  rax, 0
    mov  [rbp-680], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-688], rax
    mov  rax, 0
    mov  [rbp-696], rax
    mov  rax, 800000
    mov  [rbp-704], rax
    mov  rax, 150000
    mov  [rbp-712], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_out]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-184]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-192]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_stride]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_width]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_height]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_x]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rel fb_y]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rel fb_x]
    mov  r8, rax
    lea  rax, [rel fb_xp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rel fb_y]
    mov  r8, rax
    lea  rax, [rel fb_yp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rel fb_xp]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-200]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rel fb_yp]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-208]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_23
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call rt_map_fb
    add  rsp, 8
    mov  [rbp-720], rax
    lea  rax, [rbp-720]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-720]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_22
.if_next_23:
.if_end_22:
    mov  rax, 0
    mov  [rbp-728], rax
    mov  rax, 0
    mov  [rbp-736], rax
    lea  rax, [rbp-728]
    mov  [rbp-744], rax
    lea  rax, [rbp-736]
    mov  [rbp-752], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    mov  [rbp-760], rax
    mov  rax, 1000000
    mov  [rbp-768], rax
.while_start_24:
    lea  rax, [rbp-768]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_25
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-768]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    nop
    jmp  .while_start_24
.while_end_25:
    mov  rax, 0x00000000
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    push rax
    mov  rax, 0
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_fill_rect
    add  rsp, 72
    mov  rax, 1
    cmp  rax, 0
    je   .if_next_27
    sub  rsp, 8
    call uefi_get_xhci_base
    add  rsp, 8
    mov  [rbp-776], rax
    mov  rax, 0
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-784], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-792], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-800], rax
    lea  rax, [rbp-800]
    push rax
    lea  rax, [rbp-792]
    push rax
    lea  rax, [rbp-784]
    push rax
    call pci_find_xhci_active_base
    add  rsp, 24
    mov  [rbp-808], rax
    lea  rax, [rbp-808]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    lea  rax, [rbp-800]
    push rax
    lea  rax, [rbp-792]
    push rax
    lea  rax, [rbp-784]
    push rax
    call pci_find_xhci_base
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-808]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    mov  rax, 1
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    sub  rsp, 8
    call dbg_dump_xhci_all_g
    add  rsp, 8
    lea  rax, [rbp-808]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_31
    lea  rax, [rbp-808]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-776]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-800]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-792]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-784]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_pm_set_d0
    add  rsp, 24
    mov  rax, 2
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    lea  rax, [rbp-800]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-792]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-784]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_flr
    add  rsp, 24
    mov  rax, 3
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 0x04
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-800]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-792]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-784]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-816], rax
    lea  rax, [rbp-816]
    mov  eax, dword [rax]
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
    push rax
    mov  rax, 1
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-816]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-816]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-800]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-792]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-784]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_write32
    add  rsp, 40
    mov  rax, 4
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 0x40
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-800]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-792]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-784]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call pci_enable_msi
    add  rsp, 40
    mov  [rbp-824], rax
    lea  rax, [rbp-824]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_33
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-520]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-512]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    sti
    mov  rax, 5
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    jmp  .if_end_32
.if_next_33:
    mov  rax, 9
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    jmp  .if_end_32
.if_next_34:
.if_end_32:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_36
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_35
.if_next_36:
.if_end_35:
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_38
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_37
.if_next_38:
.if_end_37:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_40
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_xhci_base
    add  rsp, 24
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 0x00FF8800
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_mark_line
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_39
.if_next_40:
.if_end_39:
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    mov  [rbp-832], rax
    lea  rax, [rbp-832]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-840], rax
    lea  rax, [rbp-840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-848], rax
    lea  rax, [rbp-840]
    mov  eax, dword [rax]
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
    mov  [rbp-856], rax
    mov  rax, 6
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_42
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_caplen
    add  rsp, 24
    lea  rax, [rbp-848]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_hciver
    add  rsp, 24
    lea  rax, [rbp-856]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    sub  rsp, 8
    mov  rax, 0x0000FF00
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_mark_line
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_41
.if_next_42:
.if_end_41:
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-864], rax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x08
    pop  rcx
    add  rax, rcx
    mov  [rbp-872], rax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0C
    pop  rcx
    add  rax, rcx
    mov  [rbp-880], rax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x14
    pop  rcx
    add  rax, rcx
    mov  [rbp-888], rax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x18
    pop  rcx
    add  rax, rcx
    mov  [rbp-896], rax
    lea  rax, [rbp-864]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-904], rax
    lea  rax, [rbp-872]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-912], rax
    lea  rax, [rbp-880]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-920], rax
    lea  rax, [rbp-888]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-928], rax
    lea  rax, [rbp-896]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-936], rax
    lea  rax, [rbp-904]
    mov  eax, dword [rax]
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
    mov  [rbp-944], rax
    lea  rax, [rbp-904]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-952], rax
    mov  rax, 7
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_44
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_hcs1
    add  rsp, 24
    lea  rax, [rbp-904]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_hcs2
    add  rsp, 24
    lea  rax, [rbp-912]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_hcs3
    add  rsp, 24
    lea  rax, [rbp-920]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_dboff
    add  rsp, 24
    lea  rax, [rbp-928]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_rtsoff
    add  rsp, 24
    lea  rax, [rbp-936]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_ports
    add  rsp, 24
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_slots
    add  rsp, 24
    lea  rax, [rbp-952]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_43
.if_next_44:
.if_end_43:
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x10
    pop  rcx
    add  rax, rcx
    mov  [rbp-960], rax
    lea  rax, [rbp-960]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-968], rax
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
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
    mov  [rbp-976], rax
    lea  rax, [rbp-976]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  [rbp-984], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_46
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_hcc1
    add  rsp, 24
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_ecp
    add  rsp, 24
    lea  rax, [rbp-984]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_45
.if_next_46:
.if_end_45:
    lea  rax, [rbp-984]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_48
    lea  rax, [rbp-984]
    mov  rax, qword [rax]
    mov  [rbp-992], rax
    mov  rax, 32
    mov  [rbp-1000], rax
.while_start_49:
    lea  rax, [rbp-1000]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
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
    je   .while_end_50
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-1008], rax
    lea  rax, [rbp-1008]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1016], rax
    lea  rax, [rbp-1016]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1024], rax
    lea  rax, [rbp-1016]
    mov  eax, dword [rax]
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
    mov  [rbp-1032], rax
    lea  rax, [rbp-1024]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 2
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_52
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-1040], rax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 0x08
    pop  rcx
    add  rax, rcx
    mov  [rbp-1048], rax
    lea  rax, [rbp-1040]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1056], rax
    lea  rax, [rbp-1048]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1064], rax
    lea  rax, [rbp-1064]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-1072], rax
    lea  rax, [rbp-1064]
    mov  eax, dword [rax]
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
    mov  [rbp-1080], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_54
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_spd1
    add  rsp, 24
    lea  rax, [rbp-1056]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_spd2
    add  rsp, 24
    lea  rax, [rbp-1064]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_poff
    add  rsp, 24
    lea  rax, [rbp-1072]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_pcnt
    add  rsp, 24
    lea  rax, [rbp-1080]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_53
.if_next_54:
.if_end_53:
    jmp  .if_end_51
.if_next_52:
.if_end_51:
    lea  rax, [rbp-1024]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 1
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_56
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-1088], rax
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1096], rax
    lea  rax, [rbp-1096]
    mov  eax, dword [rax]
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
    mov  [rbp-1104], rax
    lea  rax, [rbp-1096]
    mov  eax, dword [rax]
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
    mov  [rbp-1112], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_58
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_leg
    add  rsp, 24
    lea  rax, [rbp-1096]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_bios
    add  rsp, 24
    lea  rax, [rbp-1104]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_os
    add  rsp, 24
    lea  rax, [rbp-1112]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_57
.if_next_58:
.if_end_57:
    lea  rax, [rbp-1096]
    mov  eax, dword [rax]
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
    mov  [rbp-1120], rax
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1120]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-1128], rax
    lea  rax, [rbp-1128]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    lea  rax, [rbp-1128]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 4000000
    mov  [rbp-1136], rax
.while_start_59:
    lea  rax, [rbp-1136]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_60
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1144], rax
    lea  rax, [rbp-1144]
    mov  eax, dword [rax]
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
    je   .if_next_62
    jmp  .while_end_60
    jmp  .if_end_61
.if_next_62:
.if_end_61:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1136]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_59
.while_end_60:
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1152], rax
    lea  rax, [rbp-1152]
    mov  eax, dword [rax]
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
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_64
    lea  rax, [rbp-1152]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    not  rax
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1160], rax
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1160]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-1168], rax
.while_start_65:
    lea  rax, [rbp-1168]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_66
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1176], rax
    lea  rax, [rbp-1176]
    mov  eax, dword [rax]
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
    je   .if_next_68
    jmp  .while_end_66
    jmp  .if_end_67
.if_next_68:
.if_end_67:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1168]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_65
.while_end_66:
    lea  rax, [rbp-1088]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1152]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_63
.if_next_64:
.if_end_63:
    lea  rax, [rbp-1152]
    mov  eax, dword [rax]
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
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_70
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_69
.if_next_70:
.if_end_69:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_72
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_leg
    add  rsp, 24
    lea  rax, [rbp-1152]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_71
.if_next_72:
.if_end_71:
    jmp  .while_end_50
    jmp  .if_end_55
.if_next_56:
.if_end_55:
    lea  rax, [rbp-1032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_74
    jmp  .while_end_50
    jmp  .if_end_73
.if_next_74:
.if_end_73:
    lea  rax, [rbp-992]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-992]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1000]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_49
.while_end_50:
    jmp  .if_end_47
.if_next_48:
.if_end_47:
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-848]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1184], rax
    lea  rax, [rbp-1184]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x00
    pop  rcx
    add  rax, rcx
    mov  [rbp-1192], rax
    lea  rax, [rbp-1184]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-1200], rax
    lea  rax, [rbp-1192]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1208], rax
    lea  rax, [rbp-1200]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1216], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_76
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_usbcmd
    add  rsp, 24
    lea  rax, [rbp-1208]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_usbsts
    add  rsp, 24
    lea  rax, [rbp-1216]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_75
.if_next_76:
.if_end_75:
    lea  rax, [rbp-1208]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1224], rax
    lea  rax, [rbp-1192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-1232], rax
.while_start_77:
    lea  rax, [rbp-1232]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_78
    lea  rax, [rbp-1192]
    mov  rax, qword [rax]
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
    je   .if_next_80
    jmp  .while_end_78
    jmp  .if_end_79
.if_next_80:
.if_end_79:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1232]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_77
.while_end_78:
    lea  rax, [rbp-1192]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1240], rax
    lea  rax, [rbp-1200]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1248], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_82
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_usbcmd
    add  rsp, 24
    lea  rax, [rbp-1240]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_usbsts
    add  rsp, 24
    lea  rax, [rbp-1248]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_81
.if_next_82:
.if_end_81:
    lea  rax, [rbp-1240]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1256], rax
    lea  rax, [rbp-1192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1256]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-1264], rax
.while_start_83:
    lea  rax, [rbp-1264]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_84
    lea  rax, [rbp-1200]
    mov  rax, qword [rax]
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
    je   .if_next_86
    jmp  .while_end_84
    jmp  .if_end_85
.if_next_86:
.if_end_85:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1264]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_83
.while_end_84:
    lea  rax, [rbp-1192]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1272], rax
    lea  rax, [rbp-1200]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1280], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_88
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_usbcmd
    add  rsp, 24
    lea  rax, [rbp-1272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_usbsts
    add  rsp, 24
    lea  rax, [rbp-1280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_87
.if_next_88:
.if_end_87:
    lea  rax, [rbp-912]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x1F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1288], rax
    lea  rax, [rbp-912]
    mov  eax, dword [rax]
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
    mov  [rbp-1296], rax
    lea  rax, [rbp-1296]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 5
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1304], rax
    lea  rax, [rbp-1304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_90
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1304]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_89
.if_next_90:
.if_end_89:
    sub  rsp, 8
    call rt_xhci_dcbaa
    add  rsp, 8
    mov  [rbp-1312], rax
    sub  rsp, 8
    call rt_xhci_cmd_ring
    add  rsp, 8
    mov  [rbp-1320], rax
    sub  rsp, 8
    call rt_xhci_evt_ring
    add  rsp, 8
    mov  [rbp-1328], rax
    sub  rsp, 8
    call rt_xhci_erst
    add  rsp, 8
    mov  [rbp-1336], rax
    sub  rsp, 8
    call rt_xhci_scratch_array
    add  rsp, 8
    mov  [rbp-1344], rax
    sub  rsp, 8
    call rt_xhci_scratch_bufs
    add  rsp, 8
    mov  [rbp-1352], rax
    sub  rsp, 8
    call rt_xhci_input_ctx
    add  rsp, 8
    mov  [rbp-1360], rax
    sub  rsp, 8
    call rt_xhci_dev_ctx
    add  rsp, 8
    mov  [rbp-1368], rax
    sub  rsp, 8
    call rt_xhci_ep0_ring
    add  rsp, 8
    mov  [rbp-1376], rax
    sub  rsp, 8
    mov  rax, 2048
    push rax
    lea  rax, [rbp-1312]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 16
    push rax
    lea  rax, [rbp-1336]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 256
    push rax
    lea  rax, [rbp-1344]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-1352]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 2048
    push rax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 2048
    push rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 4096
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    lea  rax, [rbp-1304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_92
    lea  rax, [rbp-1344]
    mov  rax, qword [rax]
    mov  [rbp-1384], rax
    lea  rax, [rbp-1312]
    mov  rax, qword [rax]
    mov  [rbp-1392], rax
    lea  rax, [rbp-1344]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1392]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  [rbp-1400], rax
.while_start_93:
    lea  rax, [rbp-1400]
    mov  rax, qword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_94
    lea  rax, [rbp-1352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4096
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  [rbp-1408], rax
    lea  rax, [rbp-1408]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1384]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1400]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_93
.while_end_94:
    jmp  .if_end_91
.if_next_92:
.if_end_91:
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-848]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1416], rax
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x00
    pop  rcx
    add  rax, rcx
    mov  [rbp-1424], rax
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-1432], rax
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x38
    pop  rcx
    add  rax, rcx
    mov  [rbp-1440], rax
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x30
    pop  rcx
    add  rax, rcx
    mov  [rbp-1448], rax
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x18
    pop  rcx
    add  rax, rcx
    mov  [rbp-1456], rax
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFFE
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1464], rax
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1464]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-1472], rax
.while_start_95:
    lea  rax, [rbp-1472]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_96
    lea  rax, [rbp-1432]
    mov  rax, qword [rax]
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
    je   .if_next_98
    jmp  .while_end_96
    jmp  .if_end_97
.if_next_98:
.if_end_97:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1472]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_95
.while_end_96:
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000002
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1480], rax
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1480]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-1488], rax
.while_start_99:
    lea  rax, [rbp-1488]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_100
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
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
    je   .if_next_102
    jmp  .while_end_100
    jmp  .if_end_101
.if_next_102:
.if_end_101:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1488]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_99
.while_end_100:
    lea  rax, [rbp-952]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1496], rax
    lea  rax, [rbp-1496]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_104
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1496]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_103
.if_next_104:
.if_end_103:
    lea  rax, [rbp-1440]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1496]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    lea  rax, [rbp-1448]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1312]
    mov  rax, qword [rax]
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1504], rax
    mov  rax, 0
    mov  [rbp-1512], rax
    sub  rsp, 8
    lea  rax, [rbp-1504]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    call xhci_cmd_ring_init
    add  rsp, 24
    lea  rax, [rbp-1456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1504]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-1336]
    mov  rax, qword [rax]
    mov  [rbp-1520], rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1520]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 256
    mov  r8, rax
    lea  rax, [rbp-1520]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-936]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFE0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1528], rax
    lea  rax, [rbp-1528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x20
    pop  rcx
    add  rax, rcx
    mov  [rbp-1536], rax
    lea  rax, [rbp-1528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x24
    pop  rcx
    add  rax, rcx
    mov  [rbp-1544], rax
    lea  rax, [rbp-1528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x28
    pop  rcx
    add  rax, rcx
    mov  [rbp-1552], rax
    lea  rax, [rbp-1528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x30
    pop  rcx
    add  rax, rcx
    mov  [rbp-1560], rax
    lea  rax, [rbp-1528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x38
    pop  rcx
    add  rax, rcx
    mov  [rbp-1568], rax
    lea  rax, [rbp-1544]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    lea  rax, [rbp-1552]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    lea  rax, [rbp-1336]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x3F
    not  rax
    pop  rcx
    and  rax, rcx
    mov  [rbp-1576], rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xF
    not  rax
    pop  rcx
    and  rax, rcx
    mov  [rbp-1584], rax
    lea  rax, [rbp-1560]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1576]
    mov  rax, qword [rax]
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1584]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-1536]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x00000003
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    lea  rax, [rbp-1536]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-384]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-1544]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-392]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-1552]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-400]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-1560]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-408]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-1584]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-328]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1576]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-336]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1592], rax
    mov  rax, 0
    mov  [rbp-1600], rax
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00000001
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1608], rax
    lea  rax, [rbp-1424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1608]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-1616], rax
.while_start_105:
    lea  rax, [rbp-1616]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_106
    lea  rax, [rbp-1432]
    mov  rax, qword [rax]
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
    je   .if_next_108
    jmp  .while_end_106
    jmp  .if_end_107
.if_next_108:
.if_end_107:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1616]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_105
.while_end_106:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_110
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_cfg
    add  rsp, 24
    lea  rax, [rbp-1496]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_dcbaap
    add  rsp, 24
    lea  rax, [rbp-1312]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_crcr
    add  rsp, 24
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    or   rax, rcx
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_erstba
    add  rsp, 24
    lea  rax, [rbp-1336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_erdp
    add  rsp, 24
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_iman
    add  rsp, 24
    lea  rax, [rbp-1536]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_109
.if_next_110:
.if_end_109:
    lea  rax, [rbp-776]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-928]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFE0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-1624], rax
    lea  rax, [rbp-1624]
    mov  rax, qword [rax]
    mov  [rbp-1632], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1640], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_112
    mov  rax, 1
    mov  [rbp-1648], rax
.while_start_113:
    lea  rax, [rbp-1648]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_114
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-1648]
    mov  rax, qword [rax]
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
    mov  [rbp-1656], rax
    lea  rax, [rbp-1656]
    mov  rax, qword [rax]
    mov  [rbp-1664], rax
    lea  rax, [rbp-1664]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1672], rax
    sub  rsp, 8
    lea  rax, [rbp-1648]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_portsc
    add  rsp, 40
    lea  rax, [rbp-1672]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1648]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_113
.while_end_114:
    jmp  .if_end_111
.if_next_112:
.if_end_111:
    mov  rax, 0x00FE0000
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1680], rax
    mov  rax, 0
    mov  [rbp-1688], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1696], rax
    mov  rax, 0
    mov  [rbp-1704], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1712], rax
    mov  rax, 1
    mov  [rbp-1720], rax
.while_start_115:
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_116
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
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
    mov  [rbp-1728], rax
    lea  rax, [rbp-1728]
    mov  rax, qword [rax]
    mov  [rbp-1736], rax
    lea  rax, [rbp-1736]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1744], rax
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_118
    sub  rsp, 8
    call P
    add  rsp, 8
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call kdigit
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-1744]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_117
.if_next_118:
.if_end_117:
    lea  rax, [rbp-1744]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1752], rax
    lea  rax, [rbp-1736]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1752]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 200000
    mov  [rbp-1760], rax
.while_start_119:
    lea  rax, [rbp-1760]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_120
    lea  rax, [rbp-1736]
    mov  rax, qword [rax]
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
    je   .if_next_122
    jmp  .while_end_120
    jmp  .if_end_121
.if_next_122:
.if_end_121:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1760]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_119
.while_end_120:
    mov  rax, 200000
    mov  [rbp-1768], rax
.while_start_123:
    lea  rax, [rbp-1768]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_124
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1768]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_123
.while_end_124:
    lea  rax, [rbp-1736]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1776], rax
    lea  rax, [rbp-1776]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1784], rax
    lea  rax, [rbp-1776]
    mov  eax, dword [rax]
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
    mov  [rbp-1792], rax
    lea  rax, [rbp-1776]
    mov  eax, dword [rax]
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
    mov  [rbp-1800], rax
    lea  rax, [rbp-1776]
    mov  eax, dword [rax]
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
    mov  [rbp-1808], rax
    lea  rax, [rbp-1784]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1792]
    mov  eax, dword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1704]
    mov  rax, qword [rax]
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
    je   .if_next_126
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1704]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1776]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1712]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_125
.if_next_126:
.if_end_125:
    lea  rax, [rbp-1784]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1792]
    mov  eax, dword [rax]
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
    je   .if_next_128
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1688]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1808]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1696]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_127
.if_next_128:
.if_end_127:
    mov  rax, 1
    cmp  rax, 0
    je   .if_next_130
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-1720]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_portr
    add  rsp, 40
    lea  rax, [rbp-1776]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ccs
    add  rsp, 24
    lea  rax, [rbp-1784]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ped
    add  rsp, 24
    lea  rax, [rbp-1792]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_pls
    add  rsp, 24
    lea  rax, [rbp-1800]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_spd
    add  rsp, 24
    lea  rax, [rbp-1808]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_129
.if_next_130:
.if_end_129:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1720]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_115
.while_end_116:
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1704]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_132
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-1704]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call kdigit
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    lea  rax, [rbp-1712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_131
.if_next_132:
.if_end_131:
    lea  rax, [rbp-680]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_134
    lea  rax, [rbp-680]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1688]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    mov  [rbp-1816], rax
    lea  rax, [rbp-1816]
    mov  rax, qword [rax]
    mov  [rbp-1824], rax
    lea  rax, [rbp-1824]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1832], rax
    lea  rax, [rbp-1832]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-1696]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_133
.if_next_134:
.if_end_133:
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_136
    mov  rax, 1
    mov  [rbp-1840], rax
.while_start_137:
    lea  rax, [rbp-1840]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_138
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-1840]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-1848]
    mov  rax, qword [rax]
    mov  [rbp-1856], rax
    lea  rax, [rbp-1856]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1864], rax
    lea  rax, [rbp-1864]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1872], rax
    lea  rax, [rbp-1864]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1872]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1880]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
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
    je   .if_next_140
    lea  rax, [rbp-1864]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x10
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1888], rax
    lea  rax, [rbp-1856]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1888]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 400000
    mov  [rbp-1896], rax
.while_start_141:
    lea  rax, [rbp-1896]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_142
    lea  rax, [rbp-1856]
    mov  rax, qword [rax]
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
    je   .if_next_144
    jmp  .while_end_142
    jmp  .if_end_143
.if_next_144:
.if_end_143:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1896]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_141
.while_end_142:
    mov  rax, 400000
    mov  [rbp-1904], rax
.while_start_145:
    lea  rax, [rbp-1904]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_146
    lea  rax, [rbp-1856]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1912], rax
    lea  rax, [rbp-1912]
    mov  eax, dword [rax]
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
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_148
    jmp  .while_end_146
    jmp  .if_end_147
.if_next_148:
.if_end_147:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1904]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_145
.while_end_146:
    jmp  .if_end_139
.if_next_140:
.if_end_139:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1840]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_137
.while_end_138:
    mov  rax, 0
    mov  [rbp-1920], rax
.while_start_149:
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1920]
    mov  rax, qword [rax]
    push rax
    mov  rax, 20
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .while_end_150
    mov  rax, 500000
    mov  [rbp-1928], rax
.while_start_151:
    lea  rax, [rbp-1928]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_152
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1928]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_151
.while_end_152:
    mov  rax, 1
    mov  [rbp-1936], rax
.while_start_153:
    lea  rax, [rbp-1936]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_154
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-1936]
    mov  rax, qword [rax]
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
    mov  [rbp-1944], rax
    lea  rax, [rbp-1944]
    mov  rax, qword [rax]
    mov  [rbp-1952], rax
    lea  rax, [rbp-1952]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1960], rax
    lea  rax, [rbp-1960]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-1968], rax
    lea  rax, [rbp-1960]
    mov  eax, dword [rax]
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
    mov  [rbp-1976], rax
    lea  rax, [rbp-1960]
    mov  eax, dword [rax]
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
    mov  [rbp-1984], rax
    lea  rax, [rbp-1968]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1976]
    mov  eax, dword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    je   .if_next_156
    lea  rax, [rbp-1936]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1688]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1984]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1696]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_155
.if_next_156:
.if_end_155:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1936]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_153
.while_end_154:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1920]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_149
.while_end_150:
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_158
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_157
.if_next_158:
.if_end_157:
    jmp  .if_end_135
.if_next_136:
.if_end_135:
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_160
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_159
.if_next_160:
.if_end_159:
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_162
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_161
.if_next_162:
.if_end_161:
    mov  rax, 1
    mov  [rbp-1992], rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  [rbp-2000], rax
    lea  rax, [rbp-680]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_164
    lea  rax, [rbp-680]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1992]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-680]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-2000]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_163
.if_next_164:
.if_end_163:
.while_start_165:
    lea  rax, [rbp-1992]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2000]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_166
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-1992]
    mov  rax, qword [rax]
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
    mov  [rbp-2008], rax
    lea  rax, [rbp-2008]
    mov  rax, qword [rax]
    mov  [rbp-2016], rax
    lea  rax, [rbp-2016]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2024], rax
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2032], rax
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
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
    mov  [rbp-2040], rax
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
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
    mov  [rbp-2048], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2056], rax
    mov  rax, 0
    mov  [rbp-2064], rax
    mov  rax, 0
    mov  [rbp-2072], rax
    mov  rax, 0
    mov  [rbp-2080], rax
    mov  rax, 0
    mov  [rbp-2088], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2096], rax
    lea  rax, [rbp-2032]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_168
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1992]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_165
    jmp  .if_end_167
.if_next_168:
.if_end_167:
    lea  rax, [rbp-2040]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_170
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 9
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2104], rax
    lea  rax, [rbp-2048]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setae al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_172
    lea  rax, [rbp-2104]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 31
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2104]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_171
.if_next_172:
    lea  rax, [rbp-2104]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 4
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2104]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_171
.if_next_173:
.if_end_171:
    lea  rax, [rbp-2016]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2104]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-2112], rax
.while_start_174:
    lea  rax, [rbp-2112]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_175
    lea  rax, [rbp-2016]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2120], rax
    lea  rax, [rbp-2048]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setae al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_177
    lea  rax, [rbp-2120]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 31
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
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_179
    jmp  .while_end_175
    jmp  .if_end_178
.if_next_179:
.if_end_178:
    jmp  .if_end_176
.if_next_177:
    lea  rax, [rbp-2120]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 4
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
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_182
    jmp  .while_end_175
    jmp  .if_end_181
.if_next_182:
.if_end_181:
    jmp  .if_end_176
.if_next_180:
.if_end_176:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2112]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_174
.while_end_175:
    mov  rax, 2000000
    mov  [rbp-2128], rax
.while_start_183:
    lea  rax, [rbp-2128]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_184
    lea  rax, [rbp-2016]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2136], rax
    lea  rax, [rbp-2136]
    mov  eax, dword [rax]
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
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_186
    jmp  .while_end_184
    jmp  .if_end_185
.if_next_186:
.if_end_185:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2128]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_183
.while_end_184:
    lea  rax, [rbp-2016]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2024]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2032]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-2040]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2024]
    mov  eax, dword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-2048]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2032]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2040]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
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
    je   .if_next_188
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1992]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_165
    jmp  .if_end_187
.if_next_188:
.if_end_187:
    jmp  .if_end_169
.if_next_170:
.if_end_169:
    lea  rax, [rbp-1992]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-1688]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2048]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1696]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-280]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-288]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 10
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-296]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-304]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-312]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-272]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1640]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
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
    lea  rax, [rbp-1504]
    push rax
    lea  rax, [rbp-1512]
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    call xhci_cmd_enqueue
    add  rsp, 56
    lea  rax, [rbp-1632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-2144], rax
    mov  rax, 0
    mov  [rbp-2152], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2160], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2168], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2176], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2184], rax
.while_start_189:
    lea  rax, [rbp-2144]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-2152]
    mov  rax, qword [rax]
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
    je   .while_end_190
    lea  rax, [rbp-2184]
    push rax
    lea  rax, [rbp-2176]
    push rax
    lea  rax, [rbp-2168]
    push rax
    lea  rax, [rbp-2160]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_192
    lea  rax, [rbp-2184]
    mov  eax, dword [rax]
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
    mov  [rbp-2192], rax
    lea  rax, [rbp-2184]
    mov  eax, dword [rax]
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
    mov  [rbp-2200], rax
    lea  rax, [rbp-2176]
    mov  eax, dword [rax]
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
    mov  [rbp-2208], rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1600]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2216], rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2216]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-2192]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 33
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_194
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2152]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2200]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-1640]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_196
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_slot
    add  rsp, 24
    lea  rax, [rbp-2200]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_ccode
    add  rsp, 24
    lea  rax, [rbp-2208]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_195
.if_next_196:
.if_end_195:
    jmp  .if_end_193
.if_next_194:
.if_end_193:
    jmp  .if_end_191
.if_next_192:
.if_end_191:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2144]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_189
.while_end_190:
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_198
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1992]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_165
    jmp  .if_end_197
.if_next_198:
.if_end_197:
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    je   .if_next_200
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2224], rax
    sub  rsp, 8
    lea  rax, [rbp-2224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ring_init
    add  rsp, 24
    mov  rax, 0
    mov  [rbp-2232], rax
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call xhci_ctx_size
    add  rsp, 8
    mov  [rbp-2240], rax
    lea  rax, [rbp-1312]
    mov  rax, qword [rax]
    mov  [rbp-2248], rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-2248]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    mov  [rbp-2256], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2256]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0x3
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2256]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-2264], rax
    lea  rax, [rbp-1696]
    mov  eax, dword [rax]
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
    mov  [rbp-2272], rax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    mov  [rbp-2280], rax
    lea  rax, [rbp-2272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2264]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2264]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2264]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2264]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2288], rax
    lea  rax, [rbp-1696]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_202
    mov  rax, 64
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2288]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_201
.if_next_202:
.if_end_201:
    lea  rax, [rbp-1696]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-1696]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 5
    and  eax, 0xFFFFFFFF
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
    je   .if_next_204
    mov  rax, 512
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2288]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_203
.if_next_204:
.if_end_203:
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2296], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2304], rax
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
    lea  rax, [rbp-2288]
    mov  eax, dword [rax]
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
    mov  [rbp-2312], rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    mov  [rbp-2320], rax
    lea  rax, [rbp-2320]
    mov  rax, qword [rax]
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
    mov  [rbp-2328], rax
    lea  rax, [rbp-2320]
    mov  rax, qword [rax]
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
    mov  [rbp-2336], rax
    lea  rax, [rbp-2304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2296]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2312]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2296]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2328]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2296]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2336]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2296]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2344], rax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
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
    mov  [rbp-2352], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2360], rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
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
    mov  [rbp-2368], rax
    lea  rax, [rbp-2368]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2360]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2352]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2344]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1504]
    push rax
    lea  rax, [rbp-1512]
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    call xhci_cmd_enqueue
    add  rsp, 56
    lea  rax, [rbp-1632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-2376], rax
    mov  rax, 0
    mov  [rbp-2384], rax
.while_start_205:
    lea  rax, [rbp-2376]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
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
    je   .while_end_206
    lea  rax, [rbp-2184]
    push rax
    lea  rax, [rbp-2176]
    push rax
    lea  rax, [rbp-2168]
    push rax
    lea  rax, [rbp-2160]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_208
    lea  rax, [rbp-2184]
    mov  eax, dword [rax]
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
    mov  [rbp-2392], rax
    lea  rax, [rbp-2184]
    mov  eax, dword [rax]
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
    mov  [rbp-2400], rax
    lea  rax, [rbp-2176]
    mov  eax, dword [rax]
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
    mov  [rbp-2408], rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1600]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2416], rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-2392]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-2400]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
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
    je   .if_next_210
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2384]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_212
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_addr
    add  rsp, 24
    lea  rax, [rbp-2408]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_211
.if_next_212:
.if_end_211:
    jmp  .if_end_209
.if_next_210:
.if_end_209:
    jmp  .if_end_207
.if_next_208:
.if_end_207:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2376]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_205
.while_end_206:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_214
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_216
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_215
.if_next_216:
.if_end_215:
    lea  rax, [rbp-1624]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2424], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2432], rax
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_218
    mov  rax, 0
    mov  [rbp-2440], rax
    lea  rax, [rbp-2440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x80
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x06
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0200
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0009
    push rax
    mov  rax, 48
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_220
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_219
.if_next_220:
.if_end_219:
    sub  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    push rax
    mov  rax, 9
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2440]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2224]
    push rax
    lea  rax, [rbp-2232]
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ctrl_xfer
    add  rsp, 152
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_222
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-2384]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_221
.if_next_222:
.if_end_221:
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_224
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_223
.if_next_224:
.if_end_223:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_226
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2432]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2432]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_228
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2432]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_227
.if_next_228:
.if_end_227:
    jmp  .if_end_225
.if_next_226:
.if_end_225:
    jmp  .if_end_217
.if_next_218:
.if_end_217:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_230
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2448], rax
    lea  rax, [rbp-2448]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 9
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_232
    mov  rax, 9
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2448]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_231
.if_next_232:
.if_end_231:
    lea  rax, [rbp-2448]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 512
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_234
    mov  rax, 512
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2448]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_233
.if_next_234:
.if_end_233:
    lea  rax, [rbp-2448]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2456], rax
    lea  rax, [rbp-2456]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 9
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_236
    mov  rax, 128
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2456]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_235
.if_next_236:
.if_end_235:
    lea  rax, [rbp-2456]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 256
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_238
    mov  rax, 256
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2456]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_237
.if_next_238:
.if_end_237:
    mov  rax, 0
    mov  [rbp-2464], rax
    lea  rax, [rbp-2464]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x80
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2464]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x06
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2464]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0200
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2464]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2456]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 48
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    push rax
    lea  rax, [rbp-2456]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2224]
    push rax
    lea  rax, [rbp-2232]
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ctrl_xfer
    add  rsp, 152
    cmp  rax, 0
    je   .if_next_240
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_242
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_241
.if_next_242:
.if_end_241:
    mov  rax, 9
    mov  [rbp-2472], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2480], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2488], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2496], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2504], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-2512], rax
    mov  rax, 0
    mov  [rbp-2520], rax
    mov  rax, 0
    mov  [rbp-2528], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2536], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2544], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2552], rax
.while_start_243:
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-2456]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2520]
    mov  rax, qword [rax]
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
    je   .while_end_244
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2560], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
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
    mov  [rbp-2568], rax
    lea  rax, [rbp-2560]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_246
    jmp  .while_end_244
    jmp  .if_end_245
.if_next_246:
.if_end_245:
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2560]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-2456]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_248
    jmp  .while_end_244
    jmp  .if_end_247
.if_next_248:
.if_end_247:
    lea  rax, [rbp-2568]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 4
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2560]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 9
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setae al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_250
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2504]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2512]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2480]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 6
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2488]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 7
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2496]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_249
.if_next_250:
.if_end_249:
    lea  rax, [rbp-2568]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 5
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2560]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 7
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setae al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_252
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2576], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2584], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 4
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFFFF
    push rax
    mov  rax, 8
    and  rax, 0xFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  rax, 0xFFFF
    pop  rcx
    or   rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-2592], rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2472]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 6
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-2600], rax
    lea  rax, [rbp-2576]
    movzx eax, byte [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    push rax
    mov  rax, 3
    and  rax, 0xFF
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
    je   .if_next_254
    lea  rax, [rbp-2536]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_256
    lea  rax, [rbp-2576]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2536]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2592]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2544]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2600]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2552]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_255
.if_next_256:
.if_end_255:
    lea  rax, [rbp-2480]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2488]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2496]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
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
    je   .if_next_258
    lea  rax, [rbp-2576]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-280]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2592]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-288]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2600]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-296]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2504]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_260
    lea  rax, [rbp-2504]
    mov  rax, qword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-304]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_259
.if_next_260:
.if_end_259:
    lea  rax, [rbp-2512]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_262
    lea  rax, [rbp-2512]
    mov  rax, qword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-312]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_261
.if_next_262:
.if_end_261:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2528]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2520]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_257
.if_next_258:
.if_end_257:
    jmp  .if_end_253
.if_next_254:
.if_end_253:
    jmp  .if_end_251
.if_next_252:
.if_end_251:
    lea  rax, [rbp-2560]
    movzx eax, byte [rax]
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2472]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_243
.while_end_244:
    lea  rax, [rbp-2528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_264
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-2384]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_263
.if_next_264:
.if_end_263:
    jmp  .if_end_239
.if_next_240:
.if_end_239:
    jmp  .if_end_229
.if_next_230:
.if_end_229:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_266
    sub  rsp, 8
    lea  rax, [rbp-592]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_alloc_handle
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-2056]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_268
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-2384]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_267
.if_next_268:
    sub  rsp, 8
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-472]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_ring_ptr
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-2072]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-480]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_buf_ptr
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-2080]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-2088]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2096]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_267
.if_next_269:
.if_end_267:
    jmp  .if_end_265
.if_next_266:
.if_end_265:
    mov  rax, 0
    mov  [rbp-2608], rax
    lea  rax, [rbp-2608]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x00
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2608]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2608]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x09
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2608]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2432]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2608]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2608]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2608]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2608]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 48
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2608]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-608]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_271
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_270
.if_next_271:
.if_end_270:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    sub  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2224]
    push rax
    lea  rax, [rbp-2232]
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ctrl_xfer
    add  rsp, 152
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_273
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-2384]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_272
.if_next_273:
.if_end_272:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-312]
    mov  eax, dword [rax]
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
    je   .if_next_275
    mov  rax, 0
    mov  [rbp-2616], rax
    lea  rax, [rbp-2616]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x01
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2616]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2616]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0B
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2616]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2616]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-312]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2616]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2616]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2616]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2616]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 48
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2616]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2616]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2224]
    push rax
    lea  rax, [rbp-2232]
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ctrl_xfer
    add  rsp, 152
    mov  [rbp-2624], rax
    lea  rax, [rbp-2624]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-2624]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_274
.if_next_275:
.if_end_274:
    mov  rax, 1
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_277
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_276
.if_next_277:
.if_end_276:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-544]
    mov  rax, qword [rax]
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
    je   .if_next_279
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-544]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    jmp  .if_end_278
.if_next_279:
.if_end_278:
    mov  rax, 0
    mov  [rbp-2632], rax
    lea  rax, [rbp-2632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x21
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2632]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0B
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2632]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2632]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2632]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2632]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 48
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2632]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_281
    mov  rax, 1
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_283
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_282
.if_next_283:
.if_end_282:
    sub  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2632]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2224]
    push rax
    lea  rax, [rbp-2232]
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ctrl_xfer
    add  rsp, 152
    cmp  rax, 0
    je   .if_next_285
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_287
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_286
.if_next_287:
.if_end_286:
    jmp  .if_end_284
.if_next_285:
.if_end_284:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-544]
    mov  rax, qword [rax]
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
    je   .if_next_289
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-544]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    jmp  .if_end_288
.if_next_289:
.if_end_288:
    jmp  .if_end_280
.if_next_281:
.if_end_280:
    mov  rax, 0
    mov  [rbp-2640], rax
    lea  rax, [rbp-2640]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x21
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2640]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0A
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2640]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2640]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2640]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x0000
    push rax
    mov  rax, 48
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  r8, rax
    lea  rax, [rbp-2640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_291
    mov  rax, 1
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_293
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_292
.if_next_293:
.if_end_292:
    sub  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2640]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2224]
    push rax
    lea  rax, [rbp-2232]
    push rax
    lea  rax, [rbp-1376]
    mov  rax, qword [rax]
    push rax
    call xhci_ctrl_xfer
    add  rsp, 152
    cmp  rax, 0
    je   .if_next_295
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_297
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_296
.if_next_297:
.if_end_296:
    jmp  .if_end_294
.if_next_295:
.if_end_294:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-544]
    mov  rax, qword [rax]
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
    je   .if_next_299
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-544]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    jmp  .if_end_298
.if_next_299:
.if_end_298:
    jmp  .if_end_290
.if_next_291:
.if_end_290:
    lea  rax, [rbp-2384]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_301
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_303
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_usb_ready
    add  rsp, 24
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_302
.if_next_303:
.if_end_302:
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    mov  [rbp-2648], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2648]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    mov  [rbp-2656], rax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-2664], rax
    mov  rax, 0
    mov  [rbp-2672], rax
.while_start_304:
    lea  rax, [rbp-2672]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_305
    lea  rax, [rbp-2656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2672]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-2664]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2672]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2672]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_304
.while_end_305:
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_307
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x0F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2680], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2688], rax
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x80
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
    je   .if_next_309
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2688]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_308
.if_next_309:
.if_end_308:
    lea  rax, [rbp-2680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 2
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2688]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_306
.if_next_307:
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_306
.if_next_310:
.if_end_306:
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    add  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-272]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-2696], rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2704], rax
    lea  rax, [rbp-2704]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_312
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2704]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_311
.if_next_312:
.if_end_311:
    lea  rax, [rbp-1696]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 20
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2704]
    mov  eax, dword [rax]
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
    mov  [rbp-2712], rax
    lea  rax, [rbp-2712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2696]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1688]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-2696]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2720], rax
    lea  rax, [rbp-2720]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2720]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2720]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2648]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_314
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2720]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2704]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_313
.if_next_314:
.if_end_313:
    sub  rsp, 8
    sub  rsp, 8
    call usb_kbd_ring_size
    add  rsp, 8
    push rax
    lea  rax, [rbp-2072]
    mov  rax, qword [rax]
    push rax
    call xhci_zero
    add  rsp, 24
    sub  rsp, 8
    lea  rax, [rbp-2096]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2072]
    mov  rax, qword [rax]
    push rax
    call xhci_ring_init
    add  rsp, 24
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-2088]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2728], rax
    lea  rax, [rbp-296]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2736], rax
    lea  rax, [rbp-2736]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_316
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2736]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_315
.if_next_316:
.if_end_315:
    lea  rax, [rbp-1696]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setae al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_318
    lea  rax, [rbp-2736]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_320
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2736]
    mov  rcx, rax
    mov  rax, rcx
    mov  eax, dword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    and  eax, 0xFFFFFFFF
    mov  dword [rcx], eax
    jmp  .if_end_319
.if_next_320:
.if_end_319:
    lea  rax, [rbp-2736]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_322
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2736]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_321
.if_next_322:
.if_end_321:
    jmp  .if_end_317
.if_next_318:
.if_end_317:
    lea  rax, [rbp-288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2744], rax
    lea  rax, [rbp-2744]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_324
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2744]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_323
.if_next_324:
.if_end_323:
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2752], rax
    lea  rax, [rbp-2744]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2760], rax
    lea  rax, [rbp-2760]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 65535
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_326
    mov  rax, 65535
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2760]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_325
.if_next_326:
.if_end_325:
    lea  rax, [rbp-2736]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2768], rax
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2776], rax
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x80
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
    je   .if_next_328
    mov  rax, 7
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2776]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_327
.if_next_328:
.if_end_327:
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
    lea  rax, [rbp-2776]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-2744]
    mov  eax, dword [rax]
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
    mov  [rbp-2784], rax
    lea  rax, [rbp-2072]
    mov  rax, qword [rax]
    mov  [rbp-2792], rax
    lea  rax, [rbp-2792]
    mov  rax, qword [rax]
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
    mov  [rbp-2800], rax
    lea  rax, [rbp-2792]
    mov  rax, qword [rax]
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
    mov  [rbp-2808], rax
    lea  rax, [rbp-2752]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2760]
    mov  eax, dword [rax]
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
    mov  [rbp-2816], rax
    lea  rax, [rbp-2768]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2784]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2800]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2808]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-2816]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 6
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-2728]
    mov  rax, qword [rax]
    push rax
    mov  rax, 7
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2824], rax
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
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
    mov  [rbp-2832], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2840], rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 24
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 12
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
    mov  [rbp-2848], rax
    lea  rax, [rbp-2848]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2832]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2824]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1504]
    push rax
    lea  rax, [rbp-1512]
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    call xhci_cmd_enqueue
    add  rsp, 56
    lea  rax, [rbp-1632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 2000000
    mov  [rbp-2856], rax
    mov  rax, 0
    mov  [rbp-2864], rax
.while_start_329:
    lea  rax, [rbp-2856]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-2864]
    mov  rax, qword [rax]
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
    je   .while_end_330
    lea  rax, [rbp-2184]
    push rax
    lea  rax, [rbp-2176]
    push rax
    lea  rax, [rbp-2168]
    push rax
    lea  rax, [rbp-2160]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_332
    lea  rax, [rbp-2184]
    mov  eax, dword [rax]
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
    mov  [rbp-2872], rax
    lea  rax, [rbp-2184]
    mov  eax, dword [rax]
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
    mov  [rbp-2880], rax
    lea  rax, [rbp-2176]
    mov  eax, dword [rax]
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
    mov  [rbp-2888], rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1600]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2896], rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2896]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-2872]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-2880]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
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
    je   .if_next_334
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_336
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2888]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_335
.if_next_336:
.if_end_335:
    lea  rax, [rbp-2888]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_338
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2864]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_337
.if_next_338:
.if_end_337:
    jmp  .if_end_333
.if_next_334:
.if_end_333:
    jmp  .if_end_331
.if_next_332:
.if_end_331:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2856]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_329
.while_end_330:
    lea  rax, [rbp-2864]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-544]
    mov  rax, qword [rax]
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
    je   .if_next_340
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-544]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    jmp  .if_end_339
.if_next_340:
.if_end_339:
    lea  rax, [rbp-2864]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_342
    mov  rax, 0
    mov  [rbp-2904], rax
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_344
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-2904]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_343
.if_next_344:
.if_end_343:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_346
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_345
.if_next_346:
.if_end_345:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-216]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_348
    sub  rsp, 8
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-2080]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2072]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call kbd_meta_init
    add  rsp, 88
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_350
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-1992]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_349
.if_next_350:
.if_end_349:
    jmp  .if_end_347
.if_next_348:
.if_end_347:
    lea  rax, [rbp-2864]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-2064]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_352
    mov  rax, 8
    and  rax, 0xFF
    push rax
    call dbg_mark_g
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_351
.if_next_352:
.if_end_351:
    lea  rax, [rbp-664]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_354
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-664]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call xhci_ctx_size
    add  rsp, 8
    mov  [rbp-2912], rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2912]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2920], rax
    lea  rax, [rbp-2920]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    push rax
    lea  rax, [rbp-2920]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFF0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    mov  [rbp-2928], rax
    lea  rax, [rbp-2928]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-376]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_356
    mov  rax, 4
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_355
.if_next_356:
    mov  rax, 10
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_355
.if_next_357:
.if_end_355:
    lea  rax, [rbp-2920]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x7
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2936], rax
    lea  rax, [rbp-2936]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_359
    mov  rax, 6
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_358
.if_next_359:
    mov  rax, 7
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_358
.if_next_360:
.if_end_358:
    jmp  .if_end_353
.if_next_354:
.if_end_353:
    lea  rax, [rbp-2904]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_362
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-256]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_364
    mov  rax, 3
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_363
.if_next_364:
.if_end_363:
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-344]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-352]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-2424]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-360]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-320]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-1600]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-1592]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-448]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-344]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2944], rax
    lea  rax, [rbp-352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2944]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_366
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2952], rax
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2952]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    jmp  .if_end_365
.if_next_366:
.if_end_365:
    lea  rax, [rbp-2072]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-376]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-2080]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-496]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-2080]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-504]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-2088]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-416]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-2096]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-432]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_361
.if_next_362:
.if_end_361:
    lea  rax, [rbp-600]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_368
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-600]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call xhci_ctx_size
    add  rsp, 8
    mov  [rbp-2960], rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2960]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-2968], rax
    lea  rax, [rbp-2968]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x7
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-2976], rax
    lea  rax, [rbp-2968]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    push rax
    lea  rax, [rbp-2968]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFFF0
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    mov  [rbp-2984], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2976]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2984]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_367
.if_next_368:
.if_end_367:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-576]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_370
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-576]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call xhci_ctx_size
    add  rsp, 8
    mov  [rbp-2992], rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2992]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-3000], rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2992]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-3008], rax
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-968]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call Z
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-2992]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3000]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3000]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3000]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3000]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3008]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3008]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3008]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3008]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_369
.if_next_370:
.if_end_369:
    mov  rax, 0
    mov  [rbp-3016], rax
.while_start_371:
    lea  rax, [rbp-3016]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_372
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3016]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3016]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_371
.while_end_372:
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_374
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_usb_ready
    add  rsp, 24
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ep_id
    add  rsp, 24
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ep_ctx
    add  rsp, 24
    lea  rax, [rbp-272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ep_addr
    add  rsp, 24
    lea  rax, [rbp-280]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ep_mps
    add  rsp, 24
    lea  rax, [rbp-288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ep_int
    add  rsp, 24
    lea  rax, [rbp-296]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_if_num
    add  rsp, 24
    lea  rax, [rbp-304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_alt_num
    add  rsp, 24
    lea  rax, [rbp-312]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_db_slot
    add  rsp, 24
    lea  rax, [rbp-320]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_db_reg
    add  rsp, 24
    lea  rax, [rbp-360]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_db_target
    add  rsp, 24
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-1360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-3024], rax
    lea  rax, [rbp-1368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-2240]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-3032], rax
    sub  rsp, 8
    mov  rax, 0
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ic_dw
    add  rsp, 40
    lea  rax, [rbp-3024]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 1
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ic_dw
    add  rsp, 40
    lea  rax, [rbp-3024]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 2
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ic_dw
    add  rsp, 40
    lea  rax, [rbp-3024]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 3
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_ic_dw
    add  rsp, 40
    lea  rax, [rbp-3024]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 0
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_dc_dw
    add  rsp, 40
    lea  rax, [rbp-3032]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 1
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_dc_dw
    add  rsp, 40
    lea  rax, [rbp-3032]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 2
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_dc_dw
    add  rsp, 40
    lea  rax, [rbp-3032]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 3
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_dc_dw
    add  rsp, 40
    lea  rax, [rbp-3032]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_evt_ring
    add  rsp, 24
    lea  rax, [rbp-328]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_erst_base
    add  rsp, 24
    lea  rax, [rbp-336]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_376
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_375
.if_next_376:
.if_end_375:
    lea  rax, [rbp-392]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_378
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-392]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_377
.if_next_378:
.if_end_377:
    lea  rax, [rbp-400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_380
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_erst_sz
    add  rsp, 24
    lea  rax, [rbp-400]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_379
.if_next_380:
.if_end_379:
    lea  rax, [rbp-408]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_382
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_erst_ba
    add  rsp, 24
    lea  rax, [rbp-408]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_381
.if_next_382:
.if_end_381:
    lea  rax, [rbp-352]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_384
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_label_erdp
    add  rsp, 24
    lea  rax, [rbp-352]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_383
.if_next_384:
.if_end_383:
    jmp  .if_end_373
.if_next_374:
.if_end_373:
    jmp  .if_end_341
.if_next_342:
.if_end_341:
    jmp  .if_end_300
.if_next_301:
.if_end_300:
    jmp  .if_end_213
.if_next_214:
.if_end_213:
    jmp  .if_end_199
.if_next_200:
.if_end_199:
    lea  rax, [rbp-2064]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_386
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_388
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ep_id_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_in_flight_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_has_report_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    lea  rax, [rbp-2056]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_390
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-584]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_389
.if_next_390:
.if_end_389:
    jmp  .if_end_387
.if_next_388:
.if_end_387:
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 24
    and  eax, 0xFFFFFFFF
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 10
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
    mov  [rbp-3040], rax
    lea  rax, [rbp-3040]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1504]
    push rax
    lea  rax, [rbp-1512]
    push rax
    lea  rax, [rbp-1320]
    mov  rax, qword [rax]
    push rax
    call xhci_cmd_enqueue
    add  rsp, 56
    lea  rax, [rbp-1632]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 1000000
    mov  [rbp-3048], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3056], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3064], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3072], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3080], rax
.while_start_391:
    lea  rax, [rbp-3048]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_392
    lea  rax, [rbp-3080]
    push rax
    lea  rax, [rbp-3072]
    push rax
    lea  rax, [rbp-3064]
    push rax
    lea  rax, [rbp-3056]
    push rax
    lea  rax, [rbp-1592]
    push rax
    lea  rax, [rbp-1600]
    push rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .if_next_394
    lea  rax, [rbp-3080]
    mov  eax, dword [rax]
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
    mov  [rbp-3088], rax
    lea  rax, [rbp-3080]
    mov  eax, dword [rax]
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
    mov  [rbp-3096], rax
    lea  rax, [rbp-1328]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-1600]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-3104], rax
    lea  rax, [rbp-1568]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3104]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-3088]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-3096]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-1640]
    mov  eax, dword [rax]
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
    je   .if_next_396
    jmp  .while_end_392
    jmp  .if_end_395
.if_next_396:
.if_end_395:
    jmp  .if_end_393
.if_next_394:
.if_end_393:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3048]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_391
.while_end_392:
    jmp  .if_end_385
.if_next_386:
.if_end_385:
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_398
    sub  rsp, 8
    call usb_kbd_meta_ep_id_off
    add  rsp, 8
    push rax
    mov  rax, 0
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_397
.if_next_398:
.if_end_397:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-1992]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_165
.while_end_166:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_400
    mov  rax, 1
    mov  [rbp-3112], rax
.while_start_401:
    lea  rax, [rbp-3112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_402
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-3112]
    mov  rax, qword [rax]
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
    mov  [rbp-3120], rax
    lea  rax, [rbp-3120]
    mov  rax, qword [rax]
    mov  [rbp-3128], rax
    lea  rax, [rbp-3128]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3136], rax
    lea  rax, [rbp-3136]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFFFFFE1F
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3144], rax
    lea  rax, [rbp-3144]
    mov  eax, dword [rax]
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
    lea  rax, [rbp-1680]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-3144]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-3128]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3144]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mov  rax, 200000
    mov  [rbp-3152], rax
.while_start_403:
    lea  rax, [rbp-3152]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_404
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3152]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_403
.while_end_404:
    lea  rax, [rbp-3128]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3160], rax
    sub  rsp, 8
    lea  rax, [rbp-3112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_portu
    add  rsp, 40
    lea  rax, [rbp-3160]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3112]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_401
.while_end_402:
    jmp  .if_end_399
.if_next_400:
.if_end_399:
    lea  rax, [rbp-744]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-3168], rax
    lea  rax, [rbp-752]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-3176], rax
    lea  rax, [rbp-3168]
    mov  [rbp-3184], rax
    lea  rax, [rbp-3176]
    mov  [rbp-3192], rax
    mov  rax, 0
    mov  [rbp-3200], rax
    lea  rax, [rbp-3200]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_406
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3208], rax
.while_start_407:
    mov  rax, 1
    cmp  rax, 0
    je   .while_end_408
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3216], rax
    mov  rax, 1
    mov  [rbp-3224], rax
.while_start_409:
    lea  rax, [rbp-3224]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_410
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-3224]
    mov  rax, qword [rax]
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
    mov  [rbp-3232], rax
    lea  rax, [rbp-3232]
    mov  rax, qword [rax]
    mov  [rbp-3240], rax
    lea  rax, [rbp-3240]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3248], rax
    lea  rax, [rbp-3248]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3256], rax
    lea  rax, [rbp-3256]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_412
    lea  rax, [rbp-3216]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3224]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-3216]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_411
.if_next_412:
.if_end_411:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3224]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_409
.while_end_410:
    lea  rax, [rbp-3216]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3208]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-3216]
    mov  eax, dword [rax]
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
    je   .if_next_414
    lea  rax, [rbp-3216]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-3208]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 1
    mov  [rbp-3264], rax
.while_start_415:
    lea  rax, [rbp-3264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-944]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_416
    lea  rax, [rbp-3216]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3264]
    mov  rax, qword [rax]
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
    je   .if_next_418
    lea  rax, [rbp-1416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-3264]
    mov  rax, qword [rax]
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
    mov  [rbp-3272], rax
    lea  rax, [rbp-3272]
    mov  rax, qword [rax]
    mov  [rbp-3280], rax
    lea  rax, [rbp-3280]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3288], rax
    lea  rax, [rbp-3288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3296], rax
    lea  rax, [rbp-3288]
    mov  eax, dword [rax]
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
    mov  [rbp-3304], rax
    lea  rax, [rbp-3288]
    mov  eax, dword [rax]
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
    mov  [rbp-3312], rax
    lea  rax, [rbp-3288]
    mov  eax, dword [rax]
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
    mov  [rbp-3320], rax
    sub  rsp, 8
    lea  rax, [rbp-3264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_portsc
    add  rsp, 40
    lea  rax, [rbp-3288]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_ccs
    add  rsp, 24
    lea  rax, [rbp-3296]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_ped
    add  rsp, 24
    lea  rax, [rbp-3304]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_pls
    add  rsp, 24
    lea  rax, [rbp-3312]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_label_spd
    add  rsp, 24
    lea  rax, [rbp-3320]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-3192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_height]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_width]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_stride]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-760]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_417
.if_next_418:
.if_end_417:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3264]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_415
.while_end_416:
    jmp  .if_end_413
.if_next_414:
.if_end_413:
    mov  rax, 200000
    mov  [rbp-3328], rax
.while_start_419:
    lea  rax, [rbp-3328]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_420
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3328]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_419
.while_end_420:
    jmp  .while_start_407
.while_end_408:
    jmp  .if_end_405
.if_next_406:
.if_end_405:
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    sub  rsp, 8
    call rt_uefi_line
    add  rsp, 8
    mov  [rbp-3336], rax
    sub  rsp, 8
    call rt_uefi_last_line
    add  rsp, 8
    mov  [rbp-3344], rax
    sub  rsp, 8
    call rt_uefi_hist_base
    add  rsp, 8
    mov  [rbp-3352], rax
    sub  rsp, 8
    call rt_uefi_hist_len_base
    add  rsp, 8
    mov  [rbp-3360], rax
    sub  rsp, 8
    call rt_uefi_edit_buf
    add  rsp, 8
    mov  [rbp-3368], rax
    mov  rax, 0
    mov  [rbp-3376], rax
    mov  rax, 0
    mov  [rbp-3384], rax
    mov  rax, 0
    mov  [rbp-3392], rax
    mov  rax, 0
    mov  [rbp-3400], rax
    mov  rax, 256
    mov  [rbp-3408], rax
    mov  rax, 0
    mov  [rbp-3416], rax
    mov  rax, 0
    mov  [rbp-3424], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-3432], rax
    mov  rax, 0
    mov  [rbp-3440], rax
    mov  rax, 0
    mov  [rbp-3448], rax
    mov  rax, 0
    mov  [rbp-3456], rax
    mov  rax, 0
    mov  [rbp-3464], rax
    mov  rax, 0
    mov  [rbp-3472], rax
    mov  rax, 0
    mov  [rbp-3480], rax
    mov  rax, 0
    mov  [rbp-3488], rax
    mov  rax, 0
    mov  [rbp-3496], rax
    mov  rax, 0
    mov  [rbp-3504], rax
    mov  rax, 0
    mov  [rbp-3512], rax
    sub  rsp, 8
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call tty_clear
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call tty_write_prompt
    add  rsp, 40
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3456]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_422
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3472]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3480]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3488]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_421
.if_next_422:
.if_end_421:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_424
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call Y
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_423
.if_next_424:
.if_end_423:
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_426
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_428
    mov  rax, 5
    and  rax, 0xFF
    push rax
    call dbg_boot_mark
    add  rsp, 8
    jmp  .if_end_427
.if_next_428:
.if_end_427:
    jmp  .if_end_425
.if_next_426:
.if_end_425:
    mov  rax, 1
    mov  [rbp-3520], rax
.while_start_429:
    lea  rax, [rbp-3520]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .while_end_430
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_432
    lea  rax, [rbp-3504]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-3512]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
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
    je   .if_next_434
    lea  rax, [rbp-3496]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_436
    sub  rsp, 8
    lea  rax, [rbp-3512]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3504]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    jmp  .if_end_435
.if_next_436:
.if_end_435:
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3504]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3512]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3512]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3504]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3496]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_433
.if_next_434:
    lea  rax, [rbp-3496]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_437
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3504]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3512]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3512]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3504]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3496]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_433
.if_next_437:
.if_end_433:
    jmp  .if_end_431
.if_next_432:
.if_end_431:
    mov  rax, 0
    mov  [rbp-3528], rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-3536], rax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-3544], rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_439
    sub  rsp, 8
    call uefi_read_key
    add  rsp, 8
    mov  r8, rax
    lea  rax, [rbp-3528]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_441
    lea  rax, [rbp-3528]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-3536]
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    lea  rax, [rbp-3528]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-3544]
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    jmp  .if_end_440
.if_next_441:
.if_end_440:
    jmp  .if_end_438
.if_next_439:
.if_end_438:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-3536]
    movzx eax, word [rax]
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
    lea  rax, [rbp-3544]
    movzx eax, word [rax]
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
    je   .if_next_443
    lea  rax, [rbp-3544]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_445
    lea  rax, [rbp-3544]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    mov  rax, 1
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_447
    lea  rax, [rbp-3424]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_449
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_up
    add  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_451
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3368]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_453
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_452
.if_next_453:
.if_end_452:
    jmp  .if_end_450
.if_next_451:
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3424]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-3552], rax
.while_start_455:
    lea  rax, [rbp-3552]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_456
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3552]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_455
.while_end_456:
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3552]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_458
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_460
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_459
.if_next_460:
.if_end_459:
    jmp  .if_end_457
.if_next_458:
.if_end_457:
    jmp  .if_end_450
.if_next_454:
.if_end_450:
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-3560], rax
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3560]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_448
.if_next_449:
.if_end_448:
    jmp  .if_end_446
.if_next_447:
    lea  rax, [rbp-3544]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    mov  rax, 2
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_463
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_465
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_down
    add  rsp, 8
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-3568], rax
    lea  rax, [rbp-3568]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_467
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3568]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_466
.if_next_467:
.if_end_466:
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3568]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_469
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3440]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3440]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_468
.if_next_469:
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_472
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_471
.if_next_472:
.if_end_471:
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-3576], rax
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3576]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    jmp  .if_end_468
.if_next_470:
.if_end_468:
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_464
.if_next_465:
.if_end_464:
    jmp  .if_end_462
.if_next_463:
    lea  rax, [rbp-3544]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    mov  rax, 4
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_475
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_477
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_left
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_476
.if_next_477:
.if_end_476:
    jmp  .if_end_474
.if_next_475:
    lea  rax, [rbp-3544]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    mov  rax, 3
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_480
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_482
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_right
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    jmp  .if_end_481
.if_next_482:
.if_end_481:
    jmp  .if_end_479
.if_next_480:
.if_end_479:
    jmp  .if_end_474
.if_next_478:
.if_end_474:
    jmp  .if_end_462
.if_next_473:
.if_end_462:
    jmp  .if_end_446
.if_next_461:
.if_end_446:
    jmp  .while_start_429
    jmp  .if_end_444
.if_next_445:
.if_end_444:
    lea  rax, [rbp-3536]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    mov  rax, 0
    and  rax, 0xFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_484
    lea  rax, [rbp-3536]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-3584], rax
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_486
    mov  rax, 0x0A
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-3584]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_485
.if_next_486:
.if_end_485:
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x08
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_488
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_490
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-3592], rax
.while_start_491:
    lea  rax, [rbp-3592]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
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
    je   .while_end_492
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3592]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3592]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3592]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_491
.while_end_492:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_489
.if_next_490:
.if_end_489:
    jmp  .while_start_429
    jmp  .if_end_487
.if_next_488:
.if_end_487:
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x0A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_494
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call tty_putc
    add  rsp, 40
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_496
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_495
.if_next_496:
.if_end_495:
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_498
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3344]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3384]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-3600], rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3600]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    call hist_set_len
    add  rsp, 24
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3416]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_500
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3416]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_499
.if_next_500:
.if_end_499:
    lea  rax, [rbp-3424]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_502
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3424]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_501
.if_next_502:
.if_end_501:
    jmp  .if_end_497
.if_next_498:
.if_end_497:
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call run_command
    add  rsp, 56
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call tty_write_prompt
    add  rsp, 40
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3456]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3464]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    jmp  .while_start_429
    jmp  .if_end_493
.if_next_494:
.if_end_493:
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_504
    jmp  .while_start_429
    jmp  .if_end_503
.if_next_504:
.if_end_503:
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3408]
    mov  rax, qword [rax]
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
    je   .if_next_506
    jmp  .while_start_429
    jmp  .if_end_505
.if_next_506:
.if_end_505:
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-96]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
.while_start_507:
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_508
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
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
    mov  r8, rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-96]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_507
.while_end_508:
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_510
    lea  rax, [rbp-3584]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_509
.if_next_510:
.if_end_509:
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .while_start_429
    jmp  .if_end_483
.if_next_484:
.if_end_483:
    jmp  .if_end_442
.if_next_443:
.if_end_442:
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_512
    lea  rax, [rbp-368]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_514
    mov  rax, 0
    mov  [rbp-3608], rax
.while_start_515:
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_516
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_518
    sub  rsp, 8
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-472]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_ring_ptr
    add  rsp, 24
    mov  [rbp-3616], rax
    sub  rsp, 8
    call usb_kbd_meta_db_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    mov  [rbp-3624], rax
    sub  rsp, 8
    call usb_kbd_meta_ep_id_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3632], rax
    sub  rsp, 8
    call usb_kbd_meta_ring_idx_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_i64
    add  rsp, 24
    mov  [rbp-3640], rax
    sub  rsp, 8
    call usb_kbd_meta_ring_cycle_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3648], rax
    lea  rax, [rbp-3632]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3624]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3648]
    push rax
    lea  rax, [rbp-3640]
    push rax
    lea  rax, [rbp-3616]
    mov  rax, qword [rax]
    push rax
    call xhci_queue_noop
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-3640]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_idx_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-3648]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_cycle_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3608]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-368]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_520
    mov  rax, 5
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_519
.if_next_520:
.if_end_519:
    jmp  .while_end_516
    jmp  .if_end_517
.if_next_518:
.if_end_517:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3608]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_515
.while_end_516:
    jmp  .if_end_513
.if_next_514:
.if_end_513:
    mov  rax, 0
    mov  [rbp-3656], rax
.while_start_521:
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_522
    sub  rsp, 8
    call usb_kbd_meta_used_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_524
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3656]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_521
    jmp  .if_end_523
.if_next_524:
.if_end_523:
    sub  rsp, 8
    call usb_kbd_meta_in_flight_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_i64
    add  rsp, 24
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_526
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3656]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_521
    jmp  .if_end_525
.if_next_526:
.if_end_525:
    sub  rsp, 8
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-480]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_buf_ptr
    add  rsp, 24
    mov  [rbp-3664], rax
    mov  rax, 0
    mov  [rbp-3672], rax
.while_start_527:
    lea  rax, [rbp-3672]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_528
    mov  rax, 0xAA
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-3664]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3672]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3672]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_527
.while_end_528:
    lea  rax, [rbp-3664]
    mov  rax, qword [rax]
    mov  [rbp-3680], rax
    lea  rax, [rbp-3680]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3688], rax
    lea  rax, [rbp-3680]
    mov  rax, qword [rax]
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
    mov  [rbp-3696], rax
    mov  rax, 8
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3704], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3712], rax
    lea  rax, [rbp-3712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-3712]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-3712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    push rax
    mov  rax, 5
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-3712]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-3712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
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
    mov  r8, rax
    lea  rax, [rbp-3712]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    sub  rsp, 8
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-472]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_ring_ptr
    add  rsp, 24
    mov  [rbp-3720], rax
    sub  rsp, 8
    call usb_kbd_meta_db_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    mov  [rbp-3728], rax
    sub  rsp, 8
    call usb_kbd_meta_ep_id_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3736], rax
    sub  rsp, 8
    call usb_kbd_meta_ring_idx_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_i64
    add  rsp, 24
    mov  [rbp-3744], rax
    sub  rsp, 8
    call usb_kbd_meta_ring_cycle_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_load_u64
    add  rsp, 24
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3752], rax
    lea  rax, [rbp-3744]
    mov  rax, qword [rax]
    mov  [rbp-3760], rax
    lea  rax, [rbp-640]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
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
    je   .if_next_530
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_529
.if_next_530:
.if_end_529:
    lea  rax, [rbp-3712]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3704]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3696]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3688]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3752]
    push rax
    lea  rax, [rbp-3744]
    push rax
    lea  rax, [rbp-3720]
    mov  rax, qword [rax]
    push rax
    call xhci_xfer_enqueue
    add  rsp, 56
    sub  rsp, 8
    lea  rax, [rbp-3736]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3728]
    mov  rax, qword [rax]
    push rax
    call xhci_ring_doorbell
    add  rsp, 24
    sub  rsp, 8
    lea  rax, [rbp-3744]
    mov  rax, qword [rax]
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_idx_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    lea  rax, [rbp-3752]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    sub  rsp, 8
    call usb_kbd_meta_ring_cycle_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 1
    push rax
    sub  rsp, 8
    call usb_kbd_meta_in_flight_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-224]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_532
    lea  rax, [rbp-3720]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-376]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-3760]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-424]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3744]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-416]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3752]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-432]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-3664]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-496]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-480]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_prev_ptr
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-504]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    jmp  .if_end_531
.if_next_532:
.if_end_531:
    lea  rax, [rbp-640]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
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
    je   .if_next_534
    mov  rax, 2
    mov  r8, rax
    lea  rax, [rbp-640]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_533
.if_next_534:
.if_end_533:
    lea  rax, [rbp-552]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_536
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-552]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_535
.if_next_536:
.if_end_535:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-560]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-3656]
    mov  rax, qword [rax]
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
    je   .if_next_538
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-560]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call Q
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3736]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call K
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3720]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3680]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3760]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-3720]
    mov  rax, qword [rax]
    mov  [rbp-3768], rax
    lea  rax, [rbp-3768]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3760]
    mov  rax, qword [rax]
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  [rbp-3776], rax
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3776]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_537
.if_next_538:
.if_end_537:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3656]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_521
.while_end_522:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-624]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_540
    lea  rax, [rbp-344]
    mov  rax, qword [rax]
    mov  [rbp-3784], rax
    lea  rax, [rbp-3784]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
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
    mov  [rbp-3792], rax
    lea  rax, [rbp-3784]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
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
    mov  [rbp-3800], rax
    lea  rax, [rbp-3784]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
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
    mov  [rbp-3808], rax
    lea  rax, [rbp-3784]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
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
    mov  [rbp-3816], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-624]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3792]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3800]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3808]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3816]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_539
.if_next_540:
.if_end_539:
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3824], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3832], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3840], rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3848], rax
    mov  rax, 1
    mov  [rbp-3856], rax
    lea  rax, [rbp-520]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_542
    lea  rax, [rbp-512]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-3864], rax
    lea  rax, [rbp-3864]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-528]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_544
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3856]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_543
.if_next_544:
    lea  rax, [rbp-3864]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-528]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_543
.if_next_545:
.if_end_543:
    jmp  .if_end_541
.if_next_542:
.if_end_541:
    lea  rax, [rbp-3856]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_547
    lea  rax, [rbp-648]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_549
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-648]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 2
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_548
.if_next_549:
.if_end_548:
    lea  rax, [rbp-672]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_551
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-672]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-344]
    mov  rax, qword [rax]
    mov  [rbp-3872], rax
    lea  rax, [rbp-3872]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
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
    mov  [rbp-3880], rax
    lea  rax, [rbp-3880]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_553
    mov  rax, 9
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    lea  rax, [rbp-624]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_555
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-624]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call dbg_dump_xhci_all_g
    add  rsp, 8
    jmp  .if_end_554
.if_next_555:
.if_end_554:
    jmp  .if_end_552
.if_next_553:
    lea  rax, [rbp-448]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3888], rax
    lea  rax, [rbp-3880]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3888]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_558
    mov  rax, 8
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_557
.if_next_558:
.if_end_557:
    jmp  .if_end_552
.if_next_556:
.if_end_552:
    jmp  .if_end_550
.if_next_551:
.if_end_550:
.while_start_559:
    lea  rax, [rbp-3848]
    push rax
    lea  rax, [rbp-3840]
    push rax
    lea  rax, [rbp-3832]
    push rax
    lea  rax, [rbp-3824]
    push rax
    lea  rax, [rbp-448]
    push rax
    lea  rax, [rbp-440]
    push rax
    lea  rax, [rbp-344]
    mov  rax, qword [rax]
    push rax
    call xhci_evt_poll
    add  rsp, 56
    cmp  rax, 0
    je   .while_end_560
    lea  rax, [rbp-3848]
    mov  eax, dword [rax]
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
    mov  [rbp-3896], rax
    lea  rax, [rbp-3840]
    mov  eax, dword [rax]
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
    mov  [rbp-3904], rax
    lea  rax, [rbp-3848]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 16
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
    mov  [rbp-3912], rax
    lea  rax, [rbp-3840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00FFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3920], rax
    lea  rax, [rbp-344]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-440]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-3928], rax
    lea  rax, [rbp-352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3928]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x8
    pop  rcx
    or   rax, rcx
    pop  rcx
    mov  qword [rcx], rax
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_562
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-3936], rax
    lea  rax, [rbp-384]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3936]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    jmp  .if_end_561
.if_next_562:
.if_end_561:
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-632]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_564
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-632]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call V
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3896]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3904]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3912]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3824]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3832]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3840]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3848]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_563
.if_next_564:
.if_end_563:
    lea  rax, [rbp-3896]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-568]
    mov  rax, qword [rax]
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
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_566
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-568]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3912]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3904]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3920]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_565
.if_next_566:
.if_end_565:
    lea  rax, [rbp-3896]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_568
    lea  rax, [rbp-3912]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-584]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_find_by_ep
    add  rsp, 24
    mov  [rbp-3944], rax
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_570
    sub  rsp, 8
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-472]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_ring_ptr
    add  rsp, 24
    mov  [rbp-3952], rax
    sub  rsp, 8
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-480]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_buf_ptr
    add  rsp, 24
    mov  [rbp-3960], rax
    sub  rsp, 8
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-480]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_prev_ptr
    add  rsp, 24
    mov  [rbp-3968], rax
    lea  rax, [rbp-3952]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-376]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-496]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-3968]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-504]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    sub  rsp, 8
    mov  rax, 0
    push rax
    sub  rsp, 8
    call usb_kbd_meta_in_flight_off
    add  rsp, 8
    push rax
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-488]
    mov  rax, qword [rax]
    push rax
    call usb_kbd_meta_store_u64
    add  rsp, 40
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-224]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-240]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-248]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_572
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-248]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-688]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-696]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_571
.if_next_572:
.if_end_571:
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_574
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3912]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3944]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_573
.if_next_574:
.if_end_573:
    lea  rax, [rbp-656]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_576
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-656]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 3
    and  rax, 0xFF
    push rax
    call dbg_mark2_g
    add  rsp, 8
    jmp  .if_end_575
.if_next_576:
.if_end_575:
    lea  rax, [rbp-3904]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_578
    sub  rsp, 8
    call rt_wbinvd
    add  rsp, 8
    mov  rax, 1
    mov  [rbp-3976], rax
    mov  rax, 0
    mov  [rbp-3984], rax
.while_start_579:
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_580
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0xAA
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_582
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3976]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_581
.if_next_582:
.if_end_581:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3984]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_579
.while_end_580:
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_584
    lea  rax, [rbp-536]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-528]
    mov  rax, qword [rax]
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
    je   .if_next_586
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-536]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call Q
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-528]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_585
.if_next_586:
.if_end_585:
    lea  rax, [rbp-3976]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_588
    lea  rax, [rbp-552]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_590
    mov  rax, 2
    mov  r8, rax
    lea  rax, [rbp-552]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3904]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3920]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call K
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3952]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call V
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-344]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-3824]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-3832]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    pop  rcx
    or   rax, rcx
    mov  [rbp-3992], rax
    lea  rax, [rbp-3952]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-424]
    mov  rax, qword [rax]
    push rax
    mov  rax, 16
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-4000], rax
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-4000]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call V
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3992]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_592
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3984]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
.while_start_593:
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_594
    sub  rsp, 8
    call B
    add  rsp, 8
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call kdigit
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3984]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_593
.while_end_594:
    jmp  .if_end_591
.if_next_592:
.if_end_591:
    jmp  .if_end_589
.if_next_590:
.if_end_589:
    jmp  .if_end_587
.if_next_588:
    mov  rax, 0
    cmp  rax, 0
    je   .if_next_597
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3984]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
.while_start_598:
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_599
    sub  rsp, 8
    call B
    add  rsp, 8
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call kdigit
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3984]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3984]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_598
.while_end_599:
    jmp  .if_end_596
.if_next_597:
.if_end_596:
    jmp  .if_end_587
.if_next_595:
.if_end_587:
    jmp  .if_end_583
.if_next_584:
.if_end_583:
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4008], rax
    mov  rax, 0
    mov  [rbp-4016], rax
    lea  rax, [rbp-4008]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x22
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
    je   .if_next_601
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-4016]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_600
.if_next_601:
.if_end_600:
    mov  rax, 2
    mov  [rbp-4024], rax
.while_start_602:
    lea  rax, [rbp-4024]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_603
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4024]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4032], rax
    lea  rax, [rbp-4032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    sub  rsp, 8
    lea  rax, [rbp-3968]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call hid_key_in_prev
    add  rsp, 24
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_605
    lea  rax, [rbp-4032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x50
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_607
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_609
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_608
.if_next_609:
.if_end_608:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-4024]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_602
    jmp  .if_end_606
.if_next_607:
.if_end_606:
    lea  rax, [rbp-4032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_611
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_613
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_612
.if_next_613:
.if_end_612:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-4024]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_602
    jmp  .if_end_610
.if_next_611:
.if_end_610:
    sub  rsp, 8
    lea  rax, [rbp-4016]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4032]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call hid_key_to_ascii
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4040], rax
    lea  rax, [rbp-4040]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_615
    sub  rsp, 8
    lea  rax, [rbp-3464]
    push rax
    lea  rax, [rbp-3456]
    push rax
    lea  rax, [rbp-3432]
    push rax
    lea  rax, [rbp-3424]
    push rax
    lea  rax, [rbp-3416]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3384]
    push rax
    lea  rax, [rbp-3344]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3408]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3400]
    push rax
    lea  rax, [rbp-3392]
    push rax
    lea  rax, [rbp-3376]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3488]
    push rax
    lea  rax, [rbp-3480]
    push rax
    lea  rax, [rbp-3472]
    push rax
    lea  rax, [rbp-3512]
    push rax
    lea  rax, [rbp-3504]
    push rax
    lea  rax, [rbp-3496]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4040]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call line_apply_char
    add  rsp, 264
    jmp  .if_end_614
.if_next_615:
.if_end_614:
    jmp  .if_end_604
.if_next_605:
.if_end_604:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-4024]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_602
.while_end_603:
    mov  rax, 0
    mov  [rbp-4048], rax
.while_start_616:
    lea  rax, [rbp-4048]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_617
    lea  rax, [rbp-3960]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4048]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-3968]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4048]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-4048]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_616
.while_end_617:
    lea  rax, [rbp-3968]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-504]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    jmp  .if_end_577
.if_next_578:
.if_end_577:
    jmp  .if_end_569
.if_next_570:
.if_end_569:
    jmp  .if_end_567
.if_next_568:
.if_end_567:
    jmp  .while_start_559
.while_end_560:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-616]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_546
.if_next_547:
    lea  rax, [rbp-552]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_620
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-616]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    mov  rax, 0
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-616]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2000000
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
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
    je   .if_next_622
    mov  rax, 3
    mov  r8, rax
    lea  rax, [rbp-552]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    jmp  .if_end_621
.if_next_622:
.if_end_621:
    jmp  .if_end_619
.if_next_620:
.if_end_619:
    jmp  .if_end_546
.if_next_618:
.if_end_546:
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_624
    lea  rax, [rbp-504]
    mov  rax, qword [rax]
    mov  [rbp-4056], rax
    lea  rax, [rbp-4056]
    mov  rax, qword [rax]
    push rax
    call hid_first_key
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4064], rax
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_626
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-688]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-696]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_625
.if_next_626:
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-688]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_629
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-688]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-696]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_628
.if_next_629:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-696]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-696]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-704]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-696]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-704]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-696]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-704]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    lea  rax, [rbp-712]
    mov  rax, qword [rax]
    pop  rcx
    mov  r8, rax
    mov  rax, rcx
    cqo
    idiv r8
    mov  rax, rdx
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
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
    cmp  rax, 0
    je   .if_next_632
    mov  rax, 0
    mov  [rbp-4072], rax
    lea  rax, [rbp-4056]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4080], rax
    lea  rax, [rbp-4080]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x22
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
    je   .if_next_634
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-4072]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_633
.if_next_634:
.if_end_633:
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x50
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_636
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_638
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_637
.if_next_638:
.if_end_637:
    jmp  .if_end_635
.if_next_636:
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_641
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_643
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_642
.if_next_643:
.if_end_642:
    jmp  .if_end_640
.if_next_641:
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_646
    sub  rsp, 8
    lea  rax, [rbp-4072]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4064]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call hid_key_to_ascii
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4088], rax
    lea  rax, [rbp-4088]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_648
    sub  rsp, 8
    lea  rax, [rbp-3464]
    push rax
    lea  rax, [rbp-3456]
    push rax
    lea  rax, [rbp-3432]
    push rax
    lea  rax, [rbp-3424]
    push rax
    lea  rax, [rbp-3416]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3384]
    push rax
    lea  rax, [rbp-3344]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3408]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3400]
    push rax
    lea  rax, [rbp-3392]
    push rax
    lea  rax, [rbp-3376]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3488]
    push rax
    lea  rax, [rbp-3480]
    push rax
    lea  rax, [rbp-3472]
    push rax
    lea  rax, [rbp-3512]
    push rax
    lea  rax, [rbp-3504]
    push rax
    lea  rax, [rbp-3496]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4088]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call line_apply_char
    add  rsp, 264
    jmp  .if_end_647
.if_next_648:
.if_end_647:
    jmp  .if_end_645
.if_next_646:
.if_end_645:
    jmp  .if_end_640
.if_next_644:
.if_end_640:
    jmp  .if_end_635
.if_next_639:
.if_end_635:
    jmp  .if_end_631
.if_next_632:
.if_end_631:
    jmp  .if_end_628
.if_next_630:
.if_end_628:
    jmp  .if_end_625
.if_next_627:
.if_end_625:
    jmp  .if_end_623
.if_next_624:
.if_end_623:
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4096], rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_650
    sub  rsp, 8
    call kbd_read_scancode_irq
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-4096]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_649
.if_next_650:
    sub  rsp, 8
    call kbd_read_scancode
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-4096]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_649
.if_next_651:
.if_end_649:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_653
    sub  rsp, 8
    call kbd_read_scancode
    add  rsp, 8
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-4096]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_652
.if_next_653:
.if_end_652:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_655
    jmp  .while_start_429
    jmp  .if_end_654
.if_next_655:
.if_end_654:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0xE0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_657
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3448]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .while_start_429
    jmp  .if_end_656
.if_next_657:
.if_end_656:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0xE1
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_659
    jmp  .while_start_429
    jmp  .if_end_658
.if_next_659:
.if_end_658:
    lea  rax, [rbp-3448]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_661
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x48
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_663
    lea  rax, [rbp-3424]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_665
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_up
    add  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_667
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3368]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3440]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_669
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_668
.if_next_669:
.if_end_668:
    jmp  .if_end_666
.if_next_667:
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3424]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-4104], rax
.while_start_671:
    lea  rax, [rbp-4104]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_672
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-4104]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_671
.while_end_672:
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4104]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_674
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_676
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_675
.if_next_676:
.if_end_675:
    jmp  .if_end_673
.if_next_674:
.if_end_673:
    jmp  .if_end_666
.if_next_670:
.if_end_666:
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-4112], rax
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_664
.if_next_665:
.if_end_664:
    jmp  .if_end_662
.if_next_663:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x50
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_679
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_681
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_down
    add  rsp, 8
    lea  rax, [rbp-3416]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-4120], rax
    lea  rax, [rbp-4120]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_683
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-4120]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_682
.if_next_683:
.if_end_682:
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4120]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_685
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3440]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3368]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-3440]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_684
.if_next_685:
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_688
    mov  rax, 8
    mov  r8, rax
    lea  rax, [rbp-3432]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_687
.if_next_688:
.if_end_687:
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-4128], rax
    sub  rsp, 8
    lea  rax, [rbp-3432]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    call hist_get_len
    add  rsp, 24
    mov  r8, rax
    lea  rax, [rbp-3376]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4128]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    jmp  .if_end_684
.if_next_686:
.if_end_684:
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-3392]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_680
.if_next_681:
.if_end_680:
    jmp  .if_end_678
.if_next_679:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_691
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_693
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_left
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    jmp  .if_end_692
.if_next_693:
.if_end_692:
    jmp  .if_end_690
.if_next_691:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_696
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_698
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_log_key_right
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-3400]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3392]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3376]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3464]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3456]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-3400]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3480]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3472]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    jmp  .if_end_697
.if_next_698:
.if_end_697:
    jmp  .if_end_695
.if_next_696:
.if_end_695:
    jmp  .if_end_690
.if_next_694:
.if_end_690:
    jmp  .if_end_678
.if_next_689:
.if_end_678:
    jmp  .if_end_662
.if_next_677:
.if_end_662:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x53
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_700
    sub  rsp, 8
    lea  rax, [rbp-3464]
    push rax
    lea  rax, [rbp-3456]
    push rax
    lea  rax, [rbp-3432]
    push rax
    lea  rax, [rbp-3424]
    push rax
    lea  rax, [rbp-3416]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3384]
    push rax
    lea  rax, [rbp-3344]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3408]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3400]
    push rax
    lea  rax, [rbp-3392]
    push rax
    lea  rax, [rbp-3376]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3488]
    push rax
    lea  rax, [rbp-3480]
    push rax
    lea  rax, [rbp-3472]
    push rax
    lea  rax, [rbp-3512]
    push rax
    lea  rax, [rbp-3504]
    push rax
    lea  rax, [rbp-3496]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x7F
    and  rax, 0xFF
    push rax
    call line_apply_char
    add  rsp, 264
    jmp  .if_end_699
.if_next_700:
.if_end_699:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-3448]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .while_start_429
    jmp  .if_end_660
.if_next_661:
.if_end_660:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
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
    je   .if_next_702
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7F
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4136], rax
    lea  rax, [rbp-4136]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-4136]
    movzx eax, byte [rax]
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
    je   .if_next_704
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .while_start_429
    jmp  .if_end_703
.if_next_704:
.if_end_703:
    jmp  .while_start_429
    jmp  .if_end_701
.if_next_702:
.if_end_701:
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
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
    je   .if_next_706
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .while_start_429
    jmp  .if_end_705
.if_next_706:
.if_end_705:
    sub  rsp, 8
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4096]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call kbd_scancode_to_ascii
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-4144], rax
    lea  rax, [rbp-4144]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_708
    jmp  .while_start_429
    jmp  .if_end_707
.if_next_708:
.if_end_707:
    sub  rsp, 8
    lea  rax, [rbp-3464]
    push rax
    lea  rax, [rbp-3456]
    push rax
    lea  rax, [rbp-3432]
    push rax
    lea  rax, [rbp-3424]
    push rax
    lea  rax, [rbp-3416]
    push rax
    lea  rax, [rbp-3360]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3352]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3384]
    push rax
    lea  rax, [rbp-3344]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3408]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3400]
    push rax
    lea  rax, [rbp-3392]
    push rax
    lea  rax, [rbp-3376]
    push rax
    lea  rax, [rbp-3336]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-3488]
    push rax
    lea  rax, [rbp-3480]
    push rax
    lea  rax, [rbp-3472]
    push rax
    lea  rax, [rbp-3512]
    push rax
    lea  rax, [rbp-3504]
    push rax
    lea  rax, [rbp-3496]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-88]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-4144]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call line_apply_char
    add  rsp, 264
    jmp  .if_end_511
.if_next_512:
.if_end_511:
    jmp  .while_start_429
.while_end_430:
    leave
    ret


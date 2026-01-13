global spc
global eq
global us
global nl
global d0
global d1
global d2
global d3
global d4
global d5
global d6
global d7
global d8
global d9
global A
global B
global C
global D
global E
global F
global G
global H
global I
global J
global K
global L
global M
global N
global O
global P
global Q
global R
global S
global T
global U
global V
global W
global X
global Y
global Z
global a
global b
global c
global d
global e
global f
global g
global h
global i
global j
global k
global l
global m
global n
global o
global p
global q
global r
global s
global t
global u
global v
global w
global x
global y
global z
global fb_glyph
global serial_init
global serial_write_byte
global serial_write_newline
global serial_write_backspace
global uefi_putc
global serial_write_kernel_start
global serial_write_kernel_init_ok
global serial_write_kernel_halt
global tty_write_hex_u64
global fb_clear_screen
global tty_putc
global tty_scroll
global fb_putc
global fb_fill_rect
global kputc
global kputs
global kendl
global kbind_fb
global fb_cursor_xor
global fb_clear_cell
global fb_draw_char_at
global fb_redraw_from
global fb_hex
global khex
global kdigit
global fb_write_hex_u64
global fb_put_hex_nib
global fb_write_hex_u8
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
global fb_write_label_usb_ready
global fb_write_label_ep_id
global fb_write_label_ep_ctx
global fb_write_label_ep_addr
global fb_write_label_ep_mps
global fb_write_label_ep_int
global fb_write_label_if_num
global fb_write_label_alt_num
global fb_write_label_db_slot
global fb_write_label_db_reg
global fb_write_label_db_target
global fb_write_label_ic_dw
global fb_write_label_dc_dw
global fb_write_label_evt_ring
global fb_write_label_erst_base
global fb_write_label_erst_sz
global fb_write_label_erst_ba
global fb_write_label_erdp
global fb_write_port_label
global fb_write_usbcmd_label
global fb_write_usbsts_label
global tty_write_xhci_base_label
global tty_write_caplen_label
global tty_write_hciver_label
global dbg_mark
global dbg_mark2
global kbd_scancode_to_ascii
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
global sel_shift
global dbg_dump_xhci_all
global pci_read32
global pci_cfg_addr
global line_apply_char
global line_redraw
global fb_cursor_set_line
global line_redraw_serial
global line_copy
global hist_entry_ptr
global hist_set_len
global tty_write_prompt
global hid_key_to_ascii

extern uefi_present
extern rt_uefi_tmp
extern uefi_print
extern uefi_has_st
extern run_command
extern uefi_set_cursor_pos

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

spc:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

eq:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

us:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x5F
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

nl:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d0:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d1:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x31
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d2:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x32
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d3:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x33
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d4:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x34
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d5:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x35
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d6:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x36
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d7:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x37
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d8:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x38
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d9:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x39
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

A:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

B:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

C:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x43
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

D:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

E:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x45
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

F:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x46
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

G:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x47
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

H:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x48
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

I:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x49
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

J:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x4A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

K:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x4B
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

L:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x4C
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

M:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x4D
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

N:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x4E
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

O:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x4F
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

P:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x50
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

Q:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x51
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

R:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x52
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

S:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x53
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

T:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x54
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

U:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x55
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

V:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x56
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

W:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x57
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

X:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x58
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

Y:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x59
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

Z:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x5A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

a:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

b:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x62
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

c:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

d:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

e:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

f:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x66
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

g:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x67
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

h:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

i:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

j:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x6A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

k:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

l:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

m:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

n:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

o:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

p:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

q:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x71
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

r:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

s:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

t:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

u:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x75
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

v:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x76
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

w:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x77
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

x:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x78
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

y:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

z:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x7A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

fb_glyph:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
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
    je   .if_next_1
    mov  rax, 0x003C666E7666663C
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    mov  rax, 0x003C181818183818
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_13
    mov  rax, 0x003C66667C60301C
    leave
    ret
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    mov  rax, 0x00786C6666666C78
    leave
    ret
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    mov  rax, 0x003C666E6060663C
    leave
    ret
    jmp  .if_end_32
.if_next_33:
.if_end_32:
    lea  rax, [rbp-8]
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
    je   .if_next_35
    mov  rax, 0x006666667E666666
    leave
    ret
    jmp  .if_end_34
.if_next_35:
.if_end_34:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_39
    mov  rax, 0x00386C0C0C0C0C1E
    leave
    ret
    jmp  .if_end_38
.if_next_39:
.if_end_38:
    lea  rax, [rbp-8]
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
    je   .if_next_41
    mov  rax, 0x0066666C786C6666
    leave
    ret
    jmp  .if_end_40
.if_next_41:
.if_end_40:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_43
    mov  rax, 0x007E606060606060
    leave
    ret
    jmp  .if_end_42
.if_next_43:
.if_end_42:
    lea  rax, [rbp-8]
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
    je   .if_next_45
    mov  rax, 0x006363636B7F7763
    leave
    ret
    jmp  .if_end_44
.if_next_45:
.if_end_44:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_47
    mov  rax, 0x0066666E7E766666
    leave
    ret
    jmp  .if_end_46
.if_next_47:
.if_end_46:
    lea  rax, [rbp-8]
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
    je   .if_next_49
    mov  rax, 0x003C66666666663C
    leave
    ret
    jmp  .if_end_48
.if_next_49:
.if_end_48:
    lea  rax, [rbp-8]
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
    je   .if_next_51
    mov  rax, 0x006060607C66667C
    leave
    ret
    jmp  .if_end_50
.if_next_51:
.if_end_50:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x51
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_53
    mov  rax, 0x063C6E666666663C
    leave
    ret
    jmp  .if_end_52
.if_next_53:
.if_end_52:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x52
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_55
    mov  rax, 0x0066666C7C66667C
    leave
    ret
    jmp  .if_end_54
.if_next_55:
.if_end_54:
    lea  rax, [rbp-8]
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
    je   .if_next_57
    mov  rax, 0x003C66063C60663C
    leave
    ret
    jmp  .if_end_56
.if_next_57:
.if_end_56:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x54
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_59
    mov  rax, 0x001818181818187E
    leave
    ret
    jmp  .if_end_58
.if_next_59:
.if_end_58:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x55
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_61
    mov  rax, 0x003C666666666666
    leave
    ret
    jmp  .if_end_60
.if_next_61:
.if_end_60:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x56
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_63
    mov  rax, 0x00183C6666666666
    leave
    ret
    jmp  .if_end_62
.if_next_63:
.if_end_62:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x57
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_65
    mov  rax, 0x0063777F6B636363
    leave
    ret
    jmp  .if_end_64
.if_next_65:
.if_end_64:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x58
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_67
    mov  rax, 0x0066663C183C6666
    leave
    ret
    jmp  .if_end_66
.if_next_67:
.if_end_66:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x59
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_69
    mov  rax, 0x00181818183C6666
    leave
    ret
    jmp  .if_end_68
.if_next_69:
.if_end_68:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_71
    mov  rax, 0x007E6030180C067E
    leave
    ret
    jmp  .if_end_70
.if_next_71:
.if_end_70:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x61
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_73
    mov  rax, 0x003E663E063C0000
    leave
    ret
    jmp  .if_end_72
.if_next_73:
.if_end_72:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x62
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_75
    mov  rax, 0x007C6666667C6060
    leave
    ret
    jmp  .if_end_74
.if_next_75:
.if_end_74:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x63
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_77
    mov  rax, 0x003C6660663C0000
    leave
    ret
    jmp  .if_end_76
.if_next_77:
.if_end_76:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x64
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_79
    mov  rax, 0x003E6666663E0606
    leave
    ret
    jmp  .if_end_78
.if_next_79:
.if_end_78:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x65
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_81
    mov  rax, 0x003C607E663C0000
    leave
    ret
    jmp  .if_end_80
.if_next_81:
.if_end_80:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x66
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_83
    mov  rax, 0x003030307C30301C
    leave
    ret
    jmp  .if_end_82
.if_next_83:
.if_end_82:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x67
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_85
    mov  rax, 0x7C063E66663E0000
    leave
    ret
    jmp  .if_end_84
.if_next_85:
.if_end_84:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x68
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_87
    mov  rax, 0x00666666667C6060
    leave
    ret
    jmp  .if_end_86
.if_next_87:
.if_end_86:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x69
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_89
    mov  rax, 0x003C181818380018
    leave
    ret
    jmp  .if_end_88
.if_next_89:
.if_end_88:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_91
    mov  rax, 0x386C0C0C0C1C000C
    leave
    ret
    jmp  .if_end_90
.if_next_91:
.if_end_90:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_93
    mov  rax, 0x00666C786C666060
    leave
    ret
    jmp  .if_end_92
.if_next_93:
.if_end_92:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_95
    mov  rax, 0x003C181818181838
    leave
    ret
    jmp  .if_end_94
.if_next_95:
.if_end_94:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_97
    mov  rax, 0x00636B7E7E6C0000
    leave
    ret
    jmp  .if_end_96
.if_next_97:
.if_end_96:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_99
    mov  rax, 0x00666666667C0000
    leave
    ret
    jmp  .if_end_98
.if_next_99:
.if_end_98:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x6F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_101
    mov  rax, 0x003C6666663C0000
    leave
    ret
    jmp  .if_end_100
.if_next_101:
.if_end_100:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x70
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_103
    mov  rax, 0x60607C66667C0000
    leave
    ret
    jmp  .if_end_102
.if_next_103:
.if_end_102:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x71
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_105
    mov  rax, 0x06063E66663E0000
    leave
    ret
    jmp  .if_end_104
.if_next_105:
.if_end_104:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x72
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_107
    mov  rax, 0x00606060766C0000
    leave
    ret
    jmp  .if_end_106
.if_next_107:
.if_end_106:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x73
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_109
    mov  rax, 0x007C063C603E0000
    leave
    ret
    jmp  .if_end_108
.if_next_109:
.if_end_108:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x74
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_111
    mov  rax, 0x001C3030307C3030
    leave
    ret
    jmp  .if_end_110
.if_next_111:
.if_end_110:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x75
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_113
    mov  rax, 0x003E666666660000
    leave
    ret
    jmp  .if_end_112
.if_next_113:
.if_end_112:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x76
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_115
    mov  rax, 0x00183C6666660000
    leave
    ret
    jmp  .if_end_114
.if_next_115:
.if_end_114:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x77
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_117
    mov  rax, 0x00367F7F6B630000
    leave
    ret
    jmp  .if_end_116
.if_next_117:
.if_end_116:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x78
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_119
    mov  rax, 0x00663C183C660000
    leave
    ret
    jmp  .if_end_118
.if_next_119:
.if_end_118:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x79
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_121
    mov  rax, 0x7C063E6666660000
    leave
    ret
    jmp  .if_end_120
.if_next_121:
.if_end_120:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_123
    mov  rax, 0x007E30180C7E0000
    leave
    ret
    jmp  .if_end_122
.if_next_123:
.if_end_122:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_125
    mov  rax, 0x007E000000000000
    leave
    ret
    jmp  .if_end_124
.if_next_125:
.if_end_124:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_127
    mov  rax, 0x00007E00007E0000
    leave
    ret
    jmp  .if_end_126
.if_next_127:
.if_end_126:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_129
    mov  rax, 0x0000007E00000000
    leave
    ret
    jmp  .if_end_128
.if_next_129:
.if_end_128:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_131
    mov  rax, 0x0018187E18181800
    leave
    ret
    jmp  .if_end_130
.if_next_131:
.if_end_130:
    lea  rax, [rbp-8]
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
    je   .if_next_133
    mov  rax, 0x0000663CFF3C6600
    leave
    ret
    jmp  .if_end_132
.if_next_133:
.if_end_132:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_135
    mov  rax, 0x0000060C18306000
    leave
    ret
    jmp  .if_end_134
.if_next_135:
.if_end_134:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_137
    mov  rax, 0x00006030180C0600
    leave
    ret
    jmp  .if_end_136
.if_next_137:
.if_end_136:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_139
    mov  rax, 0x000C18303030180C
    leave
    ret
    jmp  .if_end_138
.if_next_139:
.if_end_138:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x29
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_141
    mov  rax, 0x0030180C0C0C1830
    leave
    ret
    jmp  .if_end_140
.if_next_141:
.if_end_140:
    lea  rax, [rbp-8]
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
    je   .if_next_143
    mov  rax, 0x0000000000000000
    leave
    ret
    jmp  .if_end_142
.if_next_143:
.if_end_142:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_145
    mov  rax, 0x0018180000000000
    leave
    ret
    jmp  .if_end_144
.if_next_145:
.if_end_144:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_147
    mov  rax, 0x3018180000000000
    leave
    ret
    jmp  .if_end_146
.if_next_147:
.if_end_146:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3A
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_149
    mov  rax, 0x1818000018180000
    leave
    ret
    jmp  .if_end_148
.if_next_149:
.if_end_148:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_151
    mov  rax, 0x3018180000181800
    leave
    ret
    jmp  .if_end_150
.if_next_151:
.if_end_150:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x21
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_153
    mov  rax, 0x0018001818181800
    leave
    ret
    jmp  .if_end_152
.if_next_153:
.if_end_152:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_155
    mov  rax, 0x001800180C06663C
    leave
    ret
    jmp  .if_end_154
.if_next_155:
.if_end_154:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x27
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_157
    mov  rax, 0x0000000018180000
    leave
    ret
    jmp  .if_end_156
.if_next_157:
.if_end_156:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x22
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_159
    mov  rax, 0x0000000066660000
    leave
    ret
    jmp  .if_end_158
.if_next_159:
.if_end_158:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_161
    mov  rax, 0x0C18303030180C00
    leave
    ret
    jmp  .if_end_160
.if_next_161:
.if_end_160:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x29
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_163
    mov  rax, 0x30180C0C0C183000
    leave
    ret
    jmp  .if_end_162
.if_next_163:
.if_end_162:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_165
    mov  rax, 0x3C30303030303C00
    leave
    ret
    jmp  .if_end_164
.if_next_165:
.if_end_164:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_167
    mov  rax, 0x3C0C0C0C0C0C3C00
    leave
    ret
    jmp  .if_end_166
.if_next_167:
.if_end_166:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_169
    mov  rax, 0x0E18187018180E00
    leave
    ret
    jmp  .if_end_168
.if_next_169:
.if_end_168:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_171
    mov  rax, 0x7018180E18187000
    leave
    ret
    jmp  .if_end_170
.if_next_171:
.if_end_170:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_173
    mov  rax, 0x0C18306030180C00
    leave
    ret
    jmp  .if_end_172
.if_next_173:
.if_end_172:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_175
    mov  rax, 0x30180C060C183000
    leave
    ret
    jmp  .if_end_174
.if_next_175:
.if_end_174:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_177
    mov  rax, 0x006030180C060000
    leave
    ret
    jmp  .if_end_176
.if_next_177:
.if_end_176:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_179
    mov  rax, 0x00060C1830600000
    leave
    ret
    jmp  .if_end_178
.if_next_179:
.if_end_178:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_181
    mov  rax, 0x1818181818181800
    leave
    ret
    jmp  .if_end_180
.if_next_181:
.if_end_180:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_183
    mov  rax, 0x7E00000000000000
    leave
    ret
    jmp  .if_end_182
.if_next_183:
.if_end_182:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_185
    mov  rax, 0x000000007E000000
    leave
    ret
    jmp  .if_end_184
.if_next_185:
.if_end_184:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2B
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_187
    mov  rax, 0x0018187E18181800
    leave
    ret
    jmp  .if_end_186
.if_next_187:
.if_end_186:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x3D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_189
    mov  rax, 0x00007E00007E0000
    leave
    ret
    jmp  .if_end_188
.if_next_189:
.if_end_188:
    lea  rax, [rbp-8]
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
    je   .if_next_191
    mov  rax, 0x003C663C66000000
    leave
    ret
    jmp  .if_end_190
.if_next_191:
.if_end_190:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x25
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_193
    mov  rax, 0x00466630186C6600
    leave
    ret
    jmp  .if_end_192
.if_next_193:
.if_end_192:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x5E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_195
    mov  rax, 0x00000000663C1800
    leave
    ret
    jmp  .if_end_194
.if_next_195:
.if_end_194:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_197
    mov  rax, 0x00006E3B00000000
    leave
    ret
    jmp  .if_end_196
.if_next_197:
.if_end_196:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x60
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_199
    mov  rax, 0x30180C0000000000
    leave
    ret
    jmp  .if_end_198
.if_next_199:
.if_end_198:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x23
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_201
    mov  rax, 0x367F36367F363600
    leave
    ret
    jmp  .if_end_200
.if_next_201:
.if_end_200:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x26
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_203
    mov  rax, 0x003B66663C386C38
    leave
    ret
    jmp  .if_end_202
.if_next_203:
.if_end_202:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x40
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_205
    mov  rax, 0x3C66606E76663C00
    leave
    ret
    jmp  .if_end_204
.if_next_205:
.if_end_204:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x24
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_207
    mov  rax, 0x187C063C603E1800
    leave
    ret
    jmp  .if_end_206
.if_next_207:
.if_end_206:
    mov  rax, 0
    leave
    ret

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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    mov  dx, ax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_3
    mov  rax, 0x0D
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    mov  rax, 0x0A
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    call uefi_print
    add  rsp, 8
    mov  [rbp-24], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-8]
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
    je   .if_next_5
    mov  rax, 0x08
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    mov  rax, 0x20
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    mov  rax, 0x08
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 3
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    call uefi_print
    add  rsp, 8
    mov  [rbp-32], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-32]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    mov  rax, 0
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  word [rcx], ax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    call uefi_print
    add  rsp, 8
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6B
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  [rbp-56], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-64]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-64]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_2
.if_next_3:
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-64]
    movzx eax, byte [rax]
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
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_2
.if_next_4:
.if_end_2:
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
    lea  rax, [rbp-48]
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

fb_clear_screen:
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
    mov  rax, 0
    mov  [rbp-40], rax
.while_start_0:
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_2:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, 0x00000000
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
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
    jmp  .while_start_0
.while_end_1:
    leave
    ret
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-56], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-64], rax
    mov  rax, 0
    mov  [rbp-72], rax
    lea  rax, [rbp-40]
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
    je   .if_next_1
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_3
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    jmp  .if_end_0
.if_next_1:
    lea  rax, [rbp-40]
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
    je   .if_next_6
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_8
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_7
.if_next_8:
.if_end_7:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_5
.if_next_6:
    lea  rax, [rbp-40]
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
    je   .if_next_11
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_13
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
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
    jmp  .if_end_14
.if_next_15:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_18
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    mov  rax, 79
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_17
.if_next_18:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_17
.if_next_19:
.if_end_17:
    jmp  .if_end_14
.if_next_16:
.if_end_14:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    cmp  rax, 0
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 80
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
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
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    jmp  .if_end_10
.if_next_11:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_24
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call uefi_putc
    add  rsp, 8
    jmp  .if_end_23
.if_next_24:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 80
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-72]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    lea  rax, [rbp-40]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    jmp  .if_end_23
.if_next_25:
.if_end_23:
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
    jmp  .if_end_10
.if_next_22:
.if_end_10:
    jmp  .if_end_5
.if_next_9:
.if_end_5:
    jmp  .if_end_0
.if_next_4:
.if_end_0:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 80
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_27
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 25
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    sub  rsp, 8
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call tty_scroll
    add  rsp, 24
    mov  rax, 24
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1920
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    lea  rax, [rbp-32]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    pop  rcx
    mov  word [rcx], ax
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
    jmp  .while_start_2
.while_end_3:
    mov  rax, 1920
    mov  [rbp-40], rax
.while_start_4:
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 2000
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 2
    add  rax, rcx
    push rax
    mov  rax, 0x20
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-16]
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
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_4
.while_end_5:
    leave
    ret

fb_putc:
    push rbp
    mov  rbp, rsp
    sub  rsp, 224
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
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-80], rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
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
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-88], rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-96], rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-56]
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
    je   .if_next_5
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_6
.if_next_7:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_10
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_9
.if_next_10:
.if_end_9:
    jmp  .if_end_6
.if_next_8:
.if_end_6:
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-104], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-112], rax
    mov  rax, 0x00000000
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
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
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_12
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-120], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-128], rax
    mov  rax, 0x00000000
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-120]
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
    jmp  .if_end_11
.if_next_12:
.if_end_11:
    lea  rax, [rbp-56]
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
    je   .if_next_14
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-88]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_16
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
    call fb_clear_screen
    add  rsp, 40
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_15
.if_next_16:
.if_end_15:
    leave
    ret
    jmp  .if_end_13
.if_next_14:
.if_end_13:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call fb_glyph
    add  rsp, 8
    mov  [rbp-136], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-144], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-152], rax
    lea  rax, [rbp-144]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-160], rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-168], rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_18
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-88]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_20
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
    call fb_clear_screen
    add  rsp, 40
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_19
.if_next_20:
.if_end_19:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-160]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_17
.if_next_18:
.if_end_17:
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_22
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_24
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
    call fb_clear_screen
    add  rsp, 40
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_23
.if_next_24:
    leave
    ret
    jmp  .if_end_23
.if_next_25:
.if_end_23:
    jmp  .if_end_21
.if_next_22:
.if_end_21:
    mov  rax, 0
    mov  [rbp-176], rax
.while_start_26:
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_27
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
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
    mov  [rbp-184], rax
    mov  rax, 0
    mov  [rbp-192], rax
.while_start_28:
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_29
    lea  rax, [rbp-184]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x80
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
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
    je   .if_next_31
    mov  rax, 0
    mov  [rbp-200], rax
.while_start_32:
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_33
    mov  rax, 0
    mov  [rbp-208], rax
.while_start_34:
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_35
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-216], rax
    mov  rax, 0x00FFFFFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-208]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_34
.while_end_35:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-200]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_32
.while_end_33:
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-192]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_28
.while_end_29:
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
    jmp  .while_start_26
.while_end_27:
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
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
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-104], rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-112], rax
    lea  rax, [rbp-72]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
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
    jmp  .while_start_4
.while_end_5:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-80]
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

kputc:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    lea  rax, [rel fb_out]
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
    lea  rax, [rel fb_xp]
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
    lea  rax, [rel fb_yp]
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
    or   rax, rcx
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rel fb_yp]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_xp]
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
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

kputs:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, 0
    mov  [rbp-16], rax
.while_start_0:
    mov  rax, 1
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
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    jmp  .while_end_1
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
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
    leave
    ret

kendl:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x0A
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

kbind_fb:
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
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_xp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rel fb_yp]
    mov  rcx, rax
    mov  rax, r8
    mov  [rcx], rax
    leave
    ret

fb_cursor_xor:
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
    mov  rax, 1
    mov  [rbp-56], rax
    mov  rax, 10
    mov  [rbp-64], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-72], rax
    lea  rax, [rbp-48]
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
    mov  [rbp-80], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
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
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
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
    mov  [rbp-88], rax
.while_start_6:
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-96], rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0x00FFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-88]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_6
.while_end_7:
    leave
    ret

fb_clear_cell:
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
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, 1
    mov  [rbp-56], rax
    mov  rax, 10
    mov  [rbp-64], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-72], rax
    lea  rax, [rbp-48]
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
    mov  [rbp-80], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
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
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
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
    mov  rax, 0x00000000
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
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

fb_draw_char_at:
    push rbp
    mov  rbp, rsp
    sub  rsp, 128
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
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-80], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    mov  [rbp-88], rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    or   rax, rcx
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call fb_clear_cell
    add  rsp, 56
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call fb_glyph
    add  rsp, 8
    mov  [rbp-96], rax
    mov  rax, 0
    mov  [rbp-104], rax
.while_start_6:
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    mov  [rbp-112], rax
    mov  rax, 0
    mov  [rbp-120], rax
.while_start_8:
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_9
    lea  rax, [rbp-112]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x80
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-128], rax
    mov  rax, 0x00FFFFFF
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    imul rcx, 4
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-120]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_8
.while_end_9:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_6
.while_end_7:
    leave
    ret

fb_redraw_from:
    push rbp
    mov  rbp, rsp
    sub  rsp, 128
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
    lea  rax, [rbp-8]
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
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-80]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-80]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    leave
    ret
    jmp  .if_end_6
.if_next_7:
.if_end_6:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-96], rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-104], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-112], rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    mov  [rbp-120], rax
.while_start_8:
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_9
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
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
    call fb_draw_char_at
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-112]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-120]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_8
.while_end_9:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    mov  [rbp-128], rax
.while_start_12:
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_13
    sub  rsp, 8
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-104]
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
    call fb_clear_cell
    add  rsp, 56
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-112]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-128]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_12
.while_end_13:
    leave
    ret

fb_hex:
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
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 4
    pop  rcx
    imul rax, rcx
    mov  [rbp-72], rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-80]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-80]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-88]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_2
.if_next_3:
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-80]
    movzx eax, byte [rax]
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
    mov  r8, rax
    lea  rax, [rbp-88]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_2
.if_next_4:
.if_end_2:
    lea  rax, [rbp-88]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
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
    leave
    ret

khex:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    lea  rax, [rel fb_out]
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
    lea  rax, [rel fb_xp]
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
    lea  rax, [rel fb_yp]
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
    or   rax, rcx
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_yp]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rel fb_xp]
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
    lea  rax, [rel fb_out]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    leave
    ret

kdigit:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 9
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    push rax
    call kputc
    add  rsp, 8
    leave
    ret

fb_write_hex_u64:
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
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_hex
    add  rsp, 56
    leave
    ret

fb_put_hex_nib:
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
    and  rax, 0xFF
    mov  [rbp-56], rax
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 10
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_0
.if_next_1:
    mov  rax, 0x41
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
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
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    jmp  .if_end_0
.if_next_2:
.if_end_0:
    lea  rax, [rbp-64]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    leave
    ret

fb_write_hex_u8:
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
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    mov  [rbp-48], rax
    mov  rax, [rbp+64]
    and  rax, 0xFF
    mov  [rbp-56], rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 4
    and  rax, 0xFF
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  rax, 0xFF
    push rax
    mov  rax, 0xF
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-64], rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0xF
    and  rax, 0xFF
    pop  rcx
    and  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-72], rax
    lea  rax, [rbp-64]
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
    je   .if_next_1
    lea  rax, [rbp-64]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_put_hex_nib
    add  rsp, 56
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-72]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_put_hex_nib
    add  rsp, 56
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call V
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call d2
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call d3
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_write_hex_u8
    add  rsp, 56
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_write_hex_u8
    add  rsp, 56
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_write_hex_u8
    add  rsp, 56
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call d1
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call P
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
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call P
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
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
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
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_usb_ready:
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
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
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
    leave
    ret
    leave
    ret

fb_write_label_ep_id:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_ep_ctx:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call us
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
    leave
    ret
    leave
    ret

fb_write_label_ep_addr:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_ep_mps:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_ep_int:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_if_num:
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
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_alt_num:
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
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_db_slot:
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
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_db_reg:
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
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_db_target:
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
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_ic_dw:
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
    and  rax, 0xFF
    mov  [rbp-56], rax
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call W
    add  rsp, 8
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_dc_dw:
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
    and  rax, 0xFF
    mov  [rbp-56], rax
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call W
    add  rsp, 8
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_evt_ring:
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
    call us
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call G
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_erst_base:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_erst_sz:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call us
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
    leave
    ret
    leave
    ret

fb_write_label_erst_ba:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call us
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
    leave
    ret

fb_write_label_erdp:
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
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    leave
    ret
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
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
    mov  rax, 0x68
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
    mov  rax, 0x63
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
    mov  rax, 0x69
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
    mov  rax, 0x5F
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
    mov  rax, 0x62
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
    mov  rax, 0x61
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
    mov  rax, 0x73
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
    mov  rax, 0x65
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
    mov  rax, 0x3D
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
    mov  rax, 0x30
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
    mov  rax, 0x78
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
    mov  rax, 0x61
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
    mov  rax, 0x70
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
    mov  rax, 0x6C
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
    mov  rax, 0x65
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
    mov  rax, 0x6E
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
    mov  rax, 0x3D
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
    mov  rax, 0x30
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
    mov  rax, 0x78
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
    mov  rax, 0x63
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
    mov  rax, 0x69
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
    mov  rax, 0x76
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
    mov  rax, 0x65
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
    mov  rax, 0x72
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
    mov  rax, 0x3D
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
    mov  rax, 0x30
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
    mov  rax, 0x78
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

dbg_mark:
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
    and  rax, 0xFF
    mov  [rbp-56], rax
    lea  rax, [rbp-8]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-64], rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-56]
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
    je   .if_next_5
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    jmp  .if_end_4
.if_next_5:
    lea  rax, [rbp-56]
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
    je   .if_next_6
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call K
    add  rsp, 8
    jmp  .if_end_4
.if_next_6:
    lea  rax, [rbp-56]
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
    je   .if_next_7
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call d0
    add  rsp, 8
    jmp  .if_end_4
.if_next_7:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 3
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    jmp  .if_end_4
.if_next_8:
    lea  rax, [rbp-56]
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
    je   .if_next_9
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    jmp  .if_end_4
.if_next_9:
    lea  rax, [rbp-56]
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
    je   .if_next_10
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call K
    add  rsp, 8
    jmp  .if_end_4
.if_next_10:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 6
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
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
    jmp  .if_end_4
.if_next_11:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 7
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_12
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
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
    jmp  .if_end_4
.if_next_12:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 8
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
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
    jmp  .if_end_4
.if_next_13:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 9
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_14
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call A
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    jmp  .if_end_4
.if_next_14:
.if_end_4:
    sub  rsp, 8
    call spc
    add  rsp, 8
    leave
    ret

dbg_mark2:
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
    and  rax, 0xFF
    mov  [rbp-56], rax
    lea  rax, [rbp-8]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-64], rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-56]
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
    je   .if_next_5
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call Q
    add  rsp, 8
    jmp  .if_end_4
.if_next_5:
    lea  rax, [rbp-56]
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
    je   .if_next_6
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    jmp  .if_end_4
.if_next_6:
    lea  rax, [rbp-56]
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
    je   .if_next_7
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
    call nl
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    sub  rsp, 8
    call L
    add  rsp, 8
    jmp  .if_end_4
.if_next_7:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 3
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call spc
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
    call nl
    add  rsp, 8
    jmp  .if_end_4
.if_next_8:
    lea  rax, [rbp-56]
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
    je   .if_next_9
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call K
    add  rsp, 8
    jmp  .if_end_4
.if_next_9:
    lea  rax, [rbp-56]
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
    je   .if_next_10
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call Q
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    jmp  .if_end_4
.if_next_10:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 6
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    jmp  .if_end_4
.if_next_11:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 7
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_12
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call U
    add  rsp, 8
    sub  rsp, 8
    call N
    add  rsp, 8
    jmp  .if_end_4
.if_next_12:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 8
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
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
    call nl
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call Y
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    jmp  .if_end_4
.if_next_13:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 9
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_14
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
    call nl
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call Y
    add  rsp, 8
    jmp  .if_end_4
.if_next_14:
    lea  rax, [rbp-56]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 10
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call M
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    jmp  .if_end_4
.if_next_15:
.if_end_4:
    sub  rsp, 8
    call spc
    add  rsp, 8
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_9
    mov  rax, 0x40
    and  rax, 0xFF
    push rax
    mov  rax, 0x32
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_19
    mov  rax, 0x26
    and  rax, 0xFF
    push rax
    mov  rax, 0x37
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_23
    mov  rax, 0x28
    and  rax, 0xFF
    push rax
    mov  rax, 0x39
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_27
    mov  rax, 0x5F
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_29
    mov  rax, 0x2B
    and  rax, 0xFF
    push rax
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_59
    mov  rax, 0x44
    and  rax, 0xFF
    push rax
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_89
    mov  rax, 0x42
    and  rax, 0xFF
    push rax
    mov  rax, 0x62
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    mov  rax, 0x65
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
    mov  rax, 0x6C
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
    mov  rax, 0x70
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
    mov  rax, 0x65
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
    mov  rax, 0x63
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
    mov  rax, 0x68
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
    mov  rax, 0x6F
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
    mov  rax, 0x20
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
    mov  rax, 0x3C
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
    mov  rax, 0x74
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
    mov  rax, 0x65
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
    mov  rax, 0x78
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
    mov  rax, 0x74
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
    mov  rax, 0x3E
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
    mov  rax, 0x63
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
    mov  rax, 0x6C
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
    mov  rax, 0x73
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
    mov  rax, 0x68
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
    mov  rax, 0x61
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
    mov  rax, 0x6C
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
    mov  rax, 0x74
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
    mov  rax, 0x70
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
    mov  rax, 0x61
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
    mov  rax, 0x6E
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
    mov  rax, 0x69
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
    mov  rax, 0x63
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

cmd_is_help:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x73
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x63
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3F
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x75
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x70
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x64
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6F
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x77
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x6C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x66
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
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
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x65
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x79
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x72
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x69
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x67
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x68
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x74
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_1
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret

dbg_dump_xhci_all:
    push rbp
    mov  rbp, rsp
    sub  rsp, 256
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
    lea  rax, [rbp-8]
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
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call kbind_fb
    add  rsp, 56
    mov  rax, 0
    mov  [rbp-56], rax
.while_start_2:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 256
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    mov  rax, 0
    mov  [rbp-64], rax
.while_start_4:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 32
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    mov  rax, 0
    mov  [rbp-72], rax
.while_start_6:
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    sub  rsp, 8
    mov  rax, 0x00
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-80], rax
    lea  rax, [rbp-80]
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
    je   .if_next_9
    sub  rsp, 8
    mov  rax, 0x08
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
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
    mov  [rbp-96], rax
    lea  rax, [rbp-88]
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
    mov  [rbp-104], rax
    lea  rax, [rbp-88]
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
    mov  [rbp-112], rax
    lea  rax, [rbp-112]
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
    lea  rax, [rbp-104]
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
    lea  rax, [rbp-96]
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
    je   .if_next_11
    sub  rsp, 8
    mov  rax, 0x10
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-120], rax
    sub  rsp, 8
    mov  rax, 0x14
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    and  rax, 0xFF
    push rax
    call pci_read32
    add  rsp, 40
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-128], rax
    lea  rax, [rbp-128]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 32
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    push rax
    lea  rax, [rbp-120]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    mov  [rbp-136], rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0xF
    not  rax
    pop  rcx
    and  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-136]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    call X
    add  rsp, 8
    sub  rsp, 8
    call H
    add  rsp, 8
    sub  rsp, 8
    call C
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call B
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
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
    call eq
    add  rsp, 8
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call F
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    call I
    add  rsp, 8
    sub  rsp, 8
    call D
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-80]
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
    call A
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call E
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
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
    mov  rax, 0xFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-160], rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x04
    pop  rcx
    add  rax, rcx
    mov  [rbp-168], rax
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-176], rax
    lea  rax, [rbp-176]
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
    mov  [rbp-184], rax
    sub  rsp, 8
    call P
    add  rsp, 8
    sub  rsp, 8
    call O
    add  rsp, 8
    sub  rsp, 8
    call R
    add  rsp, 8
    sub  rsp, 8
    call T
    add  rsp, 8
    sub  rsp, 8
    call S
    add  rsp, 8
    sub  rsp, 8
    call eq
    add  rsp, 8
    lea  rax, [rbp-184]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-160]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    mov  [rbp-192], rax
    mov  rax, 1
    mov  [rbp-200], rax
.while_start_12:
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
    movzx eax, byte [rax]
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_13
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0x400
    pop  rcx
    add  rax, rcx
    push rax
    lea  rax, [rbp-200]
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
    mov  [rbp-208], rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    mov  [rbp-216], rax
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-224], rax
    lea  rax, [rbp-224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 1
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-232], rax
    lea  rax, [rbp-224]
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
    mov  [rbp-240], rax
    lea  rax, [rbp-224]
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
    mov  [rbp-248], rax
    lea  rax, [rbp-224]
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
    mov  [rbp-256], rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    call fb_write_portsc_label
    add  rsp, 56
    lea  rax, [rbp-224]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call fb_write_ccs_label
    add  rsp, 56
    lea  rax, [rbp-232]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call fb_write_ped_label
    add  rsp, 56
    lea  rax, [rbp-240]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call fb_write_pls_label
    add  rsp, 56
    lea  rax, [rbp-248]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call spc
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
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
    call fb_write_spd_label
    add  rsp, 56
    lea  rax, [rbp-256]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    call khex
    add  rsp, 8
    sub  rsp, 8
    call nl
    add  rsp, 8
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-200]
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
    jmp  .while_start_6
.while_end_7:
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
    jmp  .while_start_4
.while_end_5:
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
    jmp  .while_start_2
.while_end_3:
    leave
    ret
    leave
    ret

pci_read32:
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
    mov  [rbp-40], rax
    mov  rax, 0xCF8
    and  rax, 0xFFFF
    mov  dx, ax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    out  dx, eax
    mov  rax, 0xCFC
    and  rax, 0xFFFF
    mov  dx, ax
    in   eax, dx
    and  eax, 0xFFFFFFFF
    leave
    ret

pci_cfg_addr:
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
    mov  rax, 0x80000000
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-40], rax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
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
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-16]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 11
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
    lea  rax, [rbp-40]
    mov  rcx, rax
    mov  rax, r8
    mov  dword [rcx], eax
    lea  rax, [rbp-40]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rbp-24]
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
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, 0xFC
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
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
    and  eax, 0xFFFFFFFF
    leave
    ret

line_apply_char:
    push rbp
    mov  rbp, rsp
    sub  rsp, 320
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    and  rax, 0xFFFF
    mov  [rbp-40], rax
    mov  rax, [rbp+56]
    and  rax, 0xFFFF
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
    mov  rax, [rbp+160]
    mov  [rbp-152], rax
    mov  rax, [rbp+168]
    mov  [rbp-160], rax
    mov  rax, [rbp+176]
    mov  [rbp-168], rax
    mov  rax, [rbp+184]
    mov  [rbp-176], rax
    mov  rax, [rbp+192]
    mov  [rbp-184], rax
    mov  rax, [rbp+200]
    mov  [rbp-192], rax
    mov  rax, [rbp+208]
    mov  [rbp-200], rax
    mov  rax, [rbp+216]
    mov  [rbp-208], rax
    mov  rax, [rbp+224]
    mov  [rbp-216], rax
    mov  rax, [rbp+232]
    mov  [rbp-224], rax
    mov  rax, [rbp+240]
    mov  [rbp-232], rax
    mov  rax, [rbp+248]
    mov  [rbp-240], rax
    mov  rax, [rbp+256]
    mov  [rbp-248], rax
    mov  rax, [rbp+264]
    mov  [rbp-256], rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-264], rax
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-272], rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  [rbp-280], rax
    lea  rax, [rbp-56]
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
    push rax
    lea  rax, [rbp-144]
    mov  rax, qword [rax]
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
    je   .if_next_1
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-144]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-8]
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
    je   .if_next_3
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-288], rax
.while_start_6:
    lea  rax, [rbp-288]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
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
    je   .while_end_7
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-288]
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
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-288]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-288]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_6
.while_end_7:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-264]
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
    lea  rax, [rbp-280]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-56]
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
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    je   .if_next_9
    sub  rsp, 8
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    sub  rsp, 8
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-256]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-248]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
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
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    sub  rsp, 8
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_redraw_from
    add  rsp, 88
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call line_redraw_serial
    add  rsp, 40
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-272]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x7F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    mov  [rbp-296], rax
.while_start_16:
    lea  rax, [rbp-296]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
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
    je   .while_end_17
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-296]
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
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-296]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-296]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_16
.while_end_17:
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    lea  rax, [rbp-56]
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
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    je   .if_next_19
    sub  rsp, 8
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_18
.if_next_19:
.if_end_18:
    sub  rsp, 8
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-256]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-248]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
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
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    sub  rsp, 8
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_redraw_from
    add  rsp, 88
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    jmp  .if_end_20
.if_next_21:
.if_end_20:
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call line_redraw_serial
    add  rsp, 40
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-272]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_14
.if_next_15:
.if_end_14:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    lea  rax, [rbp-8]
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
    je   .if_next_23
    lea  rax, [rbp-56]
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
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_newline
    add  rsp, 8
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
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
    call tty_putc
    add  rsp, 40
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_27
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_putc
    add  rsp, 56
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-192]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-200]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-224]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-208]
    mov  rax, qword [rax]
    push rax
    call hist_entry_ptr
    add  rsp, 24
    mov  [rbp-304], rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-304]
    mov  rax, qword [rax]
    push rax
    call line_copy
    add  rsp, 24
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-224]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-216]
    mov  rax, qword [rax]
    push rax
    call hist_set_len
    add  rsp, 24
    lea  rax, [rbp-224]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-224]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-224]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_31
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-224]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    lea  rax, [rbp-232]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_33
    lea  rax, [rbp-232]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  r8, rax
    lea  rax, [rbp-232]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_32
.if_next_33:
.if_end_32:
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
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
    call run_command
    add  rsp, 56
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-280]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-272]
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
    lea  rax, [rbp-240]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
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
    call tty_write_prompt
    add  rsp, 40
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-248]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-256]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_35
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-144]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_34
.if_next_35:
.if_end_34:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret
    jmp  .if_end_22
.if_next_23:
.if_end_22:
    lea  rax, [rbp-8]
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
    je   .if_next_37
    leave
    ret
    jmp  .if_end_36
.if_next_37:
.if_end_36:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-184]
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
    je   .if_next_39
    leave
    ret
    jmp  .if_end_38
.if_next_39:
.if_end_38:
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  [rbp-312], rax
.while_start_40:
    lea  rax, [rbp-312]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_41
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-312]
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
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-312]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-312]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    sub  rdx, rax
    mov  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_40
.while_end_41:
    lea  rax, [rbp-56]
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
    push rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
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
    je   .if_next_43
    sub  rsp, 8
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_xor
    add  rsp, 56
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-104]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_42
.if_next_43:
.if_end_42:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-264]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    mov  rax, 1
    mov  r8, rax
    lea  rax, [rbp-280]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    sub  rsp, 8
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-256]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-248]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    movzx eax, word [rax]
    and  rax, 0xFFFF
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
    call line_redraw
    add  rsp, 88
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setne al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_45
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-320], rax
    lea  rax, [rbp-320]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_47
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-320]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_46
.if_next_47:
.if_end_46:
    sub  rsp, 8
    lea  rax, [rbp-320]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_redraw_from
    add  rsp, 88
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    call fb_cursor_set_line
    add  rsp, 56
    jmp  .if_end_44
.if_next_45:
.if_end_44:
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-152]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call line_redraw_serial
    add  rsp, 40
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-272]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-264]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-160]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-272]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-168]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-280]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-176]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
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
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    cmp  rax, 0
    je   .if_next_1
    sub  rsp, 8
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    call uefi_set_cursor_pos
    add  rsp, 24
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-88]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    mov  rax, 0
    mov  [rbp-96], rax
.while_start_2:
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_3
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-96]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-104], rax
    lea  rax, [rbp-104]
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
    lea  rax, [rbp-96]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_2
.while_end_3:
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0
    mov  [rbp-112], rax
.while_start_6:
    lea  rax, [rbp-112]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-112]
    mov  rcx, rax
    mov  rax, rcx
    mov  rax, qword [rax]
    mov  rdx, rax
    mov  rax, r8
    add  rax, rdx
    mov  qword [rcx], rax
    jmp  .while_start_6
.while_end_7:
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-120], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    push rax
    mov  rax, 80
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-128], rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-120]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    push rax
    mov  rax, 25
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_9
    mov  rax, 24
    mov  r8, rax
    lea  rax, [rbp-128]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    mov  rax, 80
    pop  rcx
    cmp  rcx, rax
    setge al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 79
    mov  r8, rax
    lea  rax, [rbp-136]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_10
.if_next_11:
.if_end_10:
    jmp  .if_end_8
.if_next_9:
.if_end_8:
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    sub  rsp, 8
    call uefi_present
    add  rsp, 8
    cmp  rax, 0
    je   .if_next_13
    sub  rsp, 8
    lea  rax, [rbp-128]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-136]
    mov  rax, qword [rax]
    push rax
    call uefi_set_cursor_pos
    add  rsp, 24
    mov  [rbp-144], rax
    lea  rax, [rbp-144]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-144]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_12
.if_next_13:
.if_end_12:
    leave
    ret

fb_cursor_set_line:
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
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 8
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-64], rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setle al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 80
    mov  r8, rax
    lea  rax, [rbp-64]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    pop  rcx
    add  rax, rcx
    mov  [rbp-72], rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-80], rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-72]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    push rax
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    pop  rcx
    imul rax, rcx
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-88], rax
    lea  rax, [rbp-88]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    lea  rax, [rbp-80]
    mov  rax, qword [rax]
    mov  r8, rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
    leave
    ret

line_redraw_serial:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
    mov  rax, [rbp+16]
    and  rax, 0xFFFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp+48]
    mov  [rbp-40], rax
    sub  rsp, 8
    mov  rax, 0x0D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
    mov  rax, 0
    mov  [rbp-48], rax
.while_start_0:
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    sub  rsp, 8
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-48]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
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
    jmp  .while_start_0
.while_end_1:
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_3
    mov  rax, 0
    mov  [rbp-56], rax
.while_start_4:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_5
    sub  rsp, 8
    mov  rax, 0x20
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_byte
    add  rsp, 24
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
    jmp  .while_start_4
.while_end_5:
    mov  rax, 0
    mov  r8, rax
    lea  rax, [rbp-56]
    mov  rcx, rax
    mov  rax, r8
    mov  qword [rcx], rax
.while_start_6:
    lea  rax, [rbp-56]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_7
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_backspace
    add  rsp, 8
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
    jmp  .while_start_6
.while_end_7:
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-40]
    mov  rax, qword [rax]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-64], rax
.while_start_8:
    lea  rax, [rbp-64]
    mov  rax, qword [rax]
    push rax
    mov  rax, 0
    pop  rcx
    cmp  rcx, rax
    setg al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_9
    lea  rax, [rbp-8]
    movzx eax, word [rax]
    and  rax, 0xFFFF
    push rax
    call serial_write_backspace
    add  rsp, 8
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
    jmp  .while_start_8
.while_end_9:
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
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_1
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-32]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
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
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    mov  rax, 256
    pop  rcx
    imul rax, rcx
    mov  rcx, rax
    pop  rax
    add  rax, rcx
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
    lea  rax, [rbp-24]
    mov  rax, qword [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  r8, rax
    lea  rax, [rbp-8]
    mov  rax, qword [rax]
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  rcx, rax
    mov  rax, r8
    mov  byte [rcx], al
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
    mov  rax, 0x20
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

hid_key_to_ascii:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    and  rax, 0xFF
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setae al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setbe al
    movzx eax, al
    cmp  rax, 0
    setne al
    movzx eax, al
    pop  rcx
    and  rax, rcx
    cmp  rax, 0
    je   .if_next_1
    mov  rax, 0x61
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x04
    and  rax, 0xFF
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    and  rax, 0xFF
    pop  rcx
    add  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-24], rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    cmp  rax, 0
    je   .if_next_3
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x20
    and  rax, 0xFF
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_2
.if_next_3:
.if_end_2:
    lea  rax, [rbp-24]
    movzx eax, byte [rax]
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_0
.if_next_1:
.if_end_0:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_5
    mov  rax, 0x21
    and  rax, 0xFF
    push rax
    mov  rax, 0x31
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
    push rax
    call sel_shift
    add  rsp, 24
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_4
.if_next_5:
.if_end_4:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x1F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_7
    mov  rax, 0x40
    and  rax, 0xFF
    push rax
    mov  rax, 0x32
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_9
    mov  rax, 0x23
    and  rax, 0xFF
    push rax
    mov  rax, 0x33
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x21
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_11
    mov  rax, 0x24
    and  rax, 0xFF
    push rax
    mov  rax, 0x34
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x22
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_13
    mov  rax, 0x25
    and  rax, 0xFF
    push rax
    mov  rax, 0x35
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x23
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_15
    mov  rax, 0x5E
    and  rax, 0xFF
    push rax
    mov  rax, 0x36
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x24
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_17
    mov  rax, 0x26
    and  rax, 0xFF
    push rax
    mov  rax, 0x37
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x25
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_19
    mov  rax, 0x2A
    and  rax, 0xFF
    push rax
    mov  rax, 0x38
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x26
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_21
    mov  rax, 0x28
    and  rax, 0xFF
    push rax
    mov  rax, 0x39
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x27
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_23
    mov  rax, 0x29
    and  rax, 0xFF
    push rax
    mov  rax, 0x30
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x28
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_25
    mov  rax, 0x0A
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_24
.if_next_25:
.if_end_24:
    lea  rax, [rbp-8]
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
    je   .if_next_27
    mov  rax, 0x08
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_26
.if_next_27:
.if_end_26:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x4C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_29
    mov  rax, 0x7F
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_28
.if_next_29:
.if_end_28:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2C
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_31
    mov  rax, 0x20
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret
    jmp  .if_end_30
.if_next_31:
.if_end_30:
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_33
    mov  rax, 0x5F
    and  rax, 0xFF
    push rax
    mov  rax, 0x2D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2E
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_35
    mov  rax, 0x2B
    and  rax, 0xFF
    push rax
    mov  rax, 0x3D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x2F
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_37
    mov  rax, 0x7B
    and  rax, 0xFF
    push rax
    mov  rax, 0x5B
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_39
    mov  rax, 0x7D
    and  rax, 0xFF
    push rax
    mov  rax, 0x5D
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x31
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_41
    mov  rax, 0x7C
    and  rax, 0xFF
    push rax
    mov  rax, 0x5C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x33
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_43
    mov  rax, 0x3A
    and  rax, 0xFF
    push rax
    mov  rax, 0x3B
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x34
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_45
    mov  rax, 0x22
    and  rax, 0xFF
    push rax
    mov  rax, 0x27
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x35
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_47
    mov  rax, 0x7E
    and  rax, 0xFF
    push rax
    mov  rax, 0x60
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
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
    je   .if_next_49
    mov  rax, 0x3C
    and  rax, 0xFF
    push rax
    mov  rax, 0x2C
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x37
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_51
    mov  rax, 0x3E
    and  rax, 0xFF
    push rax
    mov  rax, 0x2E
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    lea  rax, [rbp-8]
    movzx eax, byte [rax]
    and  rax, 0xFF
    push rax
    mov  rax, 0x38
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_53
    mov  rax, 0x3F
    and  rax, 0xFF
    push rax
    mov  rax, 0x2F
    and  rax, 0xFF
    push rax
    lea  rax, [rbp-16]
    mov  rax, qword [rax]
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
    mov  rax, 0
    and  rax, 0xFF
    and  rax, 0xFF
    leave
    ret


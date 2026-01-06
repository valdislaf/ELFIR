global _start
global main_d64

extern rt_exit
extern rt_print_f64

section .text

main_d64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0x40140a3d70a3d70a
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x40140b4395810625
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    ucomisd xmm1, xmm1
    jp   .min_nan_l_0
    ucomisd xmm0, xmm0
    jp   .min_nan_r_0
    ucomisd xmm1, xmm0
    jbe  .min_take_l_0
    jmp  .min_done_0
.min_nan_l_0:
    movapd xmm0, xmm1
    jmp  .min_done_0
.min_nan_r_0:
    jmp  .min_done_0
.min_take_l_0:
    movapd xmm0, xmm1
.min_done_0:
    movsd [rbp-8], xmm0
    movsd xmm0, [rbp-8]
    leave
    ret

_start:
    and  rsp, -16
    call main_d64
    call rt_print_f64
    xor  edi, edi
    jmp  rt_exit

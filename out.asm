global _start
global main_d64

extern rt_exit
extern rt_print_f64

section .text

main_d64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0x3ff0000000000000
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x0
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    divsd xmm1, xmm0
    movapd xmm0, xmm1
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

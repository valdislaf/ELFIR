global _start
global main_d64

extern rt_exit
extern rt_print_f64

section .text

main_d64:
    push rbp
    mov  rbp, rsp
    mov  rax, 0x0
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x40140a3d70a3d70a
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    subsd xmm1, xmm0
    movapd xmm0, xmm1
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x4059000000000000
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    mulsd xmm0, xmm1
    mov  rax, 0x7fffffffffffffff
    movq xmm1, rax
    andpd xmm0, xmm1
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x407f500000000000
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    ucomisd xmm1, xmm0
    sete al
    setnp dl
    and  al, dl
    movzx eax, al
    cvtsi2sd xmm0, eax
    leave
    ret

_start:
    and  rsp, -16
    call main_d64
    call rt_print_f64
    xor  edi, edi
    jmp  rt_exit

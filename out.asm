global _start
global main_d64

extern rt_exit
extern rt_print_f64

section .text

main_d64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0x3ff4000000000000
    movq xmm0, rax
    movsd [rbp-8], xmm0
    mov  rax, 0x3ff4000000000000
    movq xmm0, rax
    movsd [rbp-16], xmm0
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    movsd [rsp], xmm0
    movsd xmm0, [rbp-16]
    movsd xmm1, [rsp]
    add  rsp, 8
    ucomisd xmm1, xmm0
    sete al
    setnp dl
    and  al, dl
    movzx eax, al
    cvtsi2sd xmm0, eax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x0
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    ucomisd xmm1, xmm0
    setne al
    setp dl
    or   al, dl
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

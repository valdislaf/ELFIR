global _start
global main

extern rt_exit
extern rt_print_i64
extern rt_print_f64

section .text

main:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 202
    mov  [rbp-8], rax
    mov  rax, 0x400921fb54442d18
    movq xmm0, rax
    movsd [rbp-16], xmm0
    mov  rax, [rbp-8]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64
    add  rsp, 8
    movsd xmm0, [rbp-16]
    sub  rsp, 8
    call rt_print_f64
    add  rsp, 8
    mov  rax, 0
    leave
    ret

_start:
    and  rsp, -16
    call main
    mov  rdi, rax
    jmp  rt_exit

global _start
global main_i64

extern rt_exit
extern rt_print_i64

section .text

main_i64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 5
    push rax
    mov  rax, 2
    pop  rcx
    mov  r8, rax
    mov  rax, rcx
    cqo
    idiv r8
    mov  rax, rdx
    mov  [rbp-8], rax
    mov  rax, [rbp-8]
    leave
    ret

_start:
    and  rsp, -16
    call main_i64
    mov  rdi, rax
    call rt_print_i64
    xor  edi, edi
    jmp  rt_exit

global _start
global main_i64

extern rt_exit
extern rt_print_i64

section .text

main_i64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 1
    push rax
    mov  rax, 2
    pop  rcx
    add  rax, rcx
    mov  [rbp-8], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, 10
    pop  rcx
    add  rax, rcx
    mov  [rbp-16], rax
    mov  rax, [rbp-16]
    push rax
    mov  rax, 5
    pop  rcx
    add  rax, rcx
    leave
    ret

_start:
    and  rsp, -16
    call main_i64
    mov  rdi, rax
    call rt_print_i64
    xor  edi, edi
    jmp  rt_exit

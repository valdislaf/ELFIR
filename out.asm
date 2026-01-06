global _start
global main_i64

extern rt_exit
extern rt_print_i64

section .text

main_i64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, 0
    push rax
    mov  rax, 100
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-8], rax
    mov  rax, 500
    push rax
    mov  rax, [rbp-8]
    pop  rcx
    add  rax, rcx
    mov  [rbp-16], rax
    mov  rax, 1000
    push rax
    mov  rax, 2
    pop  rcx
    imul rax, rcx
    push rax
    mov  rax, [rbp-16]
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    push rax
    mov  rax, 100
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, 10
    pop  rcx
    add  rax, rcx
    push rax
    mov  rax, 10
    pop  rcx
    imul rax, rcx
    mov  [rbp-24], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, 10
    pop  rcx
    xchg rax, rcx
    cqo
    idiv rcx
    mov  [rbp-32], rax
    mov  rax, 0
    push rax
    mov  rax, [rbp-32]
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    leave
    ret

_start:
    and  rsp, -16
    call main_i64
    mov  rdi, rax
    call rt_print_i64
    xor  edi, edi
    jmp  rt_exit

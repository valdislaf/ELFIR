global _start
global main_i64

extern rt_exit
extern rt_print_i64

section .text

main_i64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 3
    push rax
    mov  rax, 7
    push rax
    mov  rax, 2
    pop  rcx
    imul rax, rcx
    pop  rcx
    add  rax, rcx
    mov  [rbp-8], rax
    mov  rax, 0
    push rax
    mov  rax, [rbp-8]
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

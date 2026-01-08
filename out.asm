global _start
global main

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_bytes

section .rodata

str0: db 105, 61, 32
str1: db 10
str2: db 120, 61, 32

section .text

main:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0
    mov  [rbp-8], rax
.for_start_0:
    mov  rax, [rbp-8]
    push rax
    mov  rax, 100
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .for_end_1
    lea  rdi, [rel str0]
    mov  rsi, 3
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-8]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-8]
    push rax
    mov  rax, 1
    pop  rcx
    add  rax, rcx
    mov  [rbp-8], rax
    jmp  .for_start_0
.for_end_1:
    mov  rax, 0x0
    movq xmm0, rax
    movsd [rbp-16], xmm0
.while_start_2:
    movsd xmm0, [rbp-16]
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x4024000000000000
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    ucomisd xmm1, xmm0
    setb al
    setnp dl
    and  al, dl
    movzx eax, al
    cvtsi2sd xmm0, eax
    xorpd xmm1, xmm1
    ucomisd xmm0, xmm1
    jp   .while_end_3
    je   .while_end_3
    lea  rdi, [rel str2]
    mov  rsi, 3
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-16]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-16]
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x4000000000000000
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    addsd xmm0, xmm1
    movsd [rbp-16], xmm0
    jmp  .while_start_2
.while_end_3:
    mov  rax, 0
    leave
    ret

_start:
    and  rsp, -16
    call main
    mov  rdi, rax
    jmp  rt_exit

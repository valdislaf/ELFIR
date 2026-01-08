global _start
global main

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_bytes

section .rodata

str0: db 120, 61
str1: db 10
str2: db 121, 61
str3: db 104, 101, 108, 108, 111
str4: db 104, 101, 108, 108, 111, 33
str5: db 33, 33
str6: db 104, 101, 108, 108, 111, 33, 33, 33
str7: db 115, 61

section .text

main:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, 0
    mov  [rbp-8], rax
    mov  rax, 0
    push rax
    mov  rax, 1
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-8], rax
    mov  rax, 2
    mov  rcx, [rbp-8]
    imul rax, rcx
    mov  [rbp-8], rax
    mov  rax, 6
    mov  rcx, [rbp-8]
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-8], rax
    mov  rax, 2
    mov  rcx, [rbp-8]
    mov  r8, rax
    mov  rax, rcx
    cqo
    idiv r8
    mov  [rbp-8], rax
    mov  rax, 2
    mov  rcx, [rbp-8]
    add  rax, rcx
    mov  [rbp-8], rax
    lea  rdi, [rel str0]
    mov  rsi, 2
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
    mov  rax, 0x3f847ae147ae147b
    movq xmm0, rax
    movsd [rbp-16], xmm0
    mov  rax, 0x0
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x3ff00068db8bac71
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    subsd xmm1, xmm0
    movapd xmm0, xmm1
    movsd [rbp-16], xmm0
    mov  rax, 0x400199999999999a
    movq xmm0, rax
    movsd xmm1, [rbp-16]
    mulsd xmm1, xmm0
    movsd [rbp-16], xmm1
    mov  rax, 0x4018cccccccccccd
    movq xmm0, rax
    movsd xmm1, [rbp-16]
    subsd xmm1, xmm0
    movsd [rbp-16], xmm1
    mov  rax, 0x4000147ae147ae14
    movq xmm0, rax
    movsd xmm1, [rbp-16]
    divsd xmm1, xmm0
    movsd [rbp-16], xmm1
    mov  rax, 0x4007eb851eb851ec
    movq xmm0, rax
    movsd xmm1, [rbp-16]
    addsd xmm1, xmm0
    movsd [rbp-16], xmm1
    lea  rdi, [rel str2]
    mov  rsi, 2
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
    lea  rdi, [rel str7]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel str6]
    mov  rsi, 8
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0
    leave
    ret

_start:
    and  rsp, -16
    call main
    mov  rdi, rax
    jmp  rt_exit

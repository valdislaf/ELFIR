global _start
global main

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_bytes

section .rodata

str0: db 32
str1: db 10
str2: db 120, 32, 61, 32

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
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel str0]
    mov  rsi, 1
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
    lea  rdi, [rel str2]
    mov  rsi, 4
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
    mov  rax, 0
    leave
    ret

_start:
    and  rsp, -16
    call main
    mov  rdi, rax
    jmp  rt_exit

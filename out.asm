global _start
global main_d64

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

main_d64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 0x4069400000000000
    movq xmm0, rax
    movsd [rbp-8], xmm0
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str0]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
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
    mov  rax, 0x4069400000000000
    movq xmm0, rax
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x400921fb54442d18
    movq xmm0, rax
    leave
    ret

_start:
    and  rsp, -16
    call main_d64
    call rt_print_f64
    xor  edi, edi
    jmp  rt_exit

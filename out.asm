global _start
global main_d64

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_bytes

section .rodata

str0: db 105, 102, 40, 120, 60, 50, 48, 49, 41
str1: db 60
str2: db 50, 48, 49, 10
str3: db 101, 108, 115, 101, 105, 102, 40, 120, 61, 61, 112, 105, 41
str4: db 61
str5: db 10
str6: db 101, 108, 115, 101, 40, 120, 33, 61, 112, 105, 41
str7: db 33, 61
str8: db 32
str9: db 120, 32, 61, 32

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
    movsd [rsp], xmm0
    mov  rax, 0x4069200000000000
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
    jp   .if_next_1
    je   .if_next_1
    lea  rdi, [rel str0]
    mov  rsi, 9
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-8]
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
    jmp  .if_end_0
.if_next_1:
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x400921fb54442d18
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    ucomisd xmm1, xmm0
    sete al
    setnp dl
    and  al, dl
    movzx eax, al
    cvtsi2sd xmm0, eax
    xorpd xmm1, xmm1
    ucomisd xmm0, xmm1
    jp   .if_next_2
    je   .if_next_2
    lea  rdi, [rel str3]
    mov  rsi, 13
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str4]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x400921fb54442d18
    movq xmm0, rax
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str5]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_0
.if_next_2:
    lea  rdi, [rel str6]
    mov  rsi, 11
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str7]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x400921fb54442d18
    movq xmm0, rax
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str5]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_0
.if_next_3:
.if_end_0:
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str8]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel str5]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel str9]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x4069400000000000
    movq xmm0, rax
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel str5]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x0
    movq xmm0, rax
    leave
    ret

_start:
    and  rsp, -16
    call main_d64
    call rt_print_f64
    xor  edi, edi
    jmp  rt_exit

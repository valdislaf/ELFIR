global _start
global main

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_bytes
extern rt_str_concat
extern rt_str_copy
extern rt_str_free

section .rodata

str0: db 120, 61
str1: db 10
str2: db 121, 61
str3: db 104, 101, 108, 108, 111
str4: db 104, 101, 108, 108, 111, 33
str5: db 33, 33
str6: db 115, 61
str7: db 0
str8: db 35
str9: db 115, 49, 61

section .text

main:
    push rbp
    mov  rbp, rsp
    sub  rsp, 64
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
    lea  rax, [rel str3]
    mov  rdx, 5
    mov  [rbp-24], rax
    mov  [rbp-32], rdx
    mov  rax, [rbp-32]
    test rax, rax
    jns  .str_free_done_0
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-24]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_0:
    lea  rax, [rel str4]
    mov  rdx, 6
    mov  [rbp-24], rax
    mov  [rbp-32], rdx
    mov  r8, [rbp-24]
    mov  r9, [rbp-32]
    mov  rsi, r9
    test rsi, rsi
    jns  .str_add_len_ok_1
    neg  rsi
    dec  rsi
.str_add_len_ok_1:
    lea  rdx, [rel str5]
    mov  rcx, 2
    cmp  rcx, 0
    je   .str_add_done_1
    cmp  rsi, 0
    je   .str_add_take_rhs_1
    mov  rdi, r8
    sub  rsp, 8
    call rt_str_concat
    add  rsp, 8
    test r9, r9
    jns  .str_add_store_1
    mov  rdi, r8
    mov  rsi, r9
    neg  rsi
    dec  rsi
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_add_store_1:
    neg  rdx
    dec  rdx
    mov  [rbp-24], rax
    mov  [rbp-32], rdx
    jmp  .str_add_done_1
.str_add_take_rhs_1:
    test r9, r9
    jns  .str_add_copy_rhs_1
    mov  rdi, r8
    mov  rsi, r9
    neg  rsi
    dec  rsi
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_add_copy_rhs_1:
    mov  rdi, rdx
    mov  rsi, rcx
    sub  rsp, 8
    call rt_str_copy
    add  rsp, 8
    neg  rdx
    dec  rdx
    mov  [rbp-24], rax
    mov  [rbp-32], rdx
.str_add_done_1:
    lea  rdi, [rel str6]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rdi, [rbp-24]
    mov  rsi, [rbp-32]
    test rsi, rsi
    jns  .str_len_ok_2
    neg  rsi
    dec  rsi
.str_len_ok_2:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0
    mov  [rbp-40], rax
    lea  rax, [rel str7]
    mov  rdx, 0
    mov  [rbp-48], rax
    mov  [rbp-56], rdx
.while_start_3:
    mov  rax, [rbp-40]
    push rax
    mov  rax, 3
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_4
    mov  r8, [rbp-48]
    mov  r9, [rbp-56]
    mov  rsi, r9
    test rsi, rsi
    jns  .str_add_len_ok_5
    neg  rsi
    dec  rsi
.str_add_len_ok_5:
    lea  rdx, [rel str8]
    mov  rcx, 1
    cmp  rcx, 0
    je   .str_add_done_5
    cmp  rsi, 0
    je   .str_add_take_rhs_5
    mov  rdi, r8
    sub  rsp, 8
    call rt_str_concat
    add  rsp, 8
    test r9, r9
    jns  .str_add_store_5
    mov  rdi, r8
    mov  rsi, r9
    neg  rsi
    dec  rsi
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_add_store_5:
    neg  rdx
    dec  rdx
    mov  [rbp-48], rax
    mov  [rbp-56], rdx
    jmp  .str_add_done_5
.str_add_take_rhs_5:
    test r9, r9
    jns  .str_add_copy_rhs_5
    mov  rdi, r8
    mov  rsi, r9
    neg  rsi
    dec  rsi
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_add_copy_rhs_5:
    mov  rdi, rdx
    mov  rsi, rcx
    sub  rsp, 8
    call rt_str_copy
    add  rsp, 8
    neg  rdx
    dec  rdx
    mov  [rbp-48], rax
    mov  [rbp-56], rdx
.str_add_done_5:
    lea  rdi, [rel str9]
    mov  rsi, 3
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rdi, [rbp-48]
    mov  rsi, [rbp-56]
    test rsi, rsi
    jns  .str_len_ok_6
    neg  rsi
    dec  rsi
.str_len_ok_6:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-40]
    add  rax, rcx
    mov  [rbp-40], rax
    jmp  .while_start_3
.while_end_4:
    mov  rax, 0
    leave
    ret

_start:
    and  rsp, -16
    call main
    mov  rdi, rax
    jmp  rt_exit

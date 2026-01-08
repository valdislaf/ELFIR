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

shout_str0: db 33
foo_str0: db 102, 111, 111, 61
foo_str1: db 10
foo2_str0: db 100, 105, 118, 61
foo2_str1: db 10
main_str0: db 120, 61
main_str1: db 10
main_str2: db 121, 61
main_str3: db 104, 101, 108, 108, 111
main_str4: db 104, 101, 108, 108, 111, 33
main_str5: db 33, 33
main_str6: db 115, 61
main_str7: db 0
main_str8: db 35
main_str9: db 115, 49, 61
main_str10: db 105, 61
main_str11: db 120, 49, 61
main_str12: db 104, 105

section .text

add:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  [rbp-8], rax
    mov  rax, [rbp+24]
    mov  [rbp-16], rax
    mov  rax, [rbp-8]
    push rax
    mov  rax, [rbp-16]
    pop  rcx
    add  rax, rcx
    leave
    ret

div:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    movsd xmm0, [rbp+16]
    movsd [rbp-8], xmm0
    movsd xmm0, [rbp+24]
    movsd [rbp-16], xmm0
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    movsd [rsp], xmm0
    movsd xmm0, [rbp-16]
    movsd xmm1, [rsp]
    add  rsp, 8
    divsd xmm1, xmm0
    movapd xmm0, xmm1
    leave
    ret

shout:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  rdx, [rbp+24]
    test rdx, rdx
    jns  .param_str_ok_0
    neg  rdx
    dec  rdx
.param_str_ok_0:
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
    mov  r8, [rbp-8]
    mov  r9, [rbp-16]
    mov  rsi, r9
    test rsi, rsi
    jns  .str_add_len_ok_1
    neg  rsi
    dec  rsi
.str_add_len_ok_1:
    lea  rdx, [rel shout_str0]
    mov  rcx, 1
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
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
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
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
.str_add_done_1:
    mov  rax, [rbp-8]
    mov  rdx, [rbp-16]
    leave
    ret

foo:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, [rbp+16]
    mov  rdx, [rbp+24]
    test rdx, rdx
    jns  .param_str_ok_0
    neg  rdx
    dec  rdx
.param_str_ok_0:
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
    lea  rdi, [rel foo_str0]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_1
    neg  rsi
    dec  rsi
.str_len_ok_1:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel foo_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-16]
    test rax, rax
    jns  .str_free_done_2
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-8]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_2:
    leave
    ret

foo2:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    movsd xmm0, [rbp+16]
    movsd [rbp-8], xmm0
    lea  rdi, [rel foo2_str0]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-8]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel foo2_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    leave
    ret

main:
    push rbp
    mov  rbp, rsp
    sub  rsp, 80
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
    lea  rdi, [rel main_str0]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-8]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
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
    lea  rdi, [rel main_str2]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-16]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rax, [rel main_str3]
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
    lea  rax, [rel main_str4]
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
    lea  rdx, [rel main_str5]
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
    lea  rdi, [rel main_str6]
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
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0
    mov  [rbp-40], rax
    lea  rax, [rel main_str7]
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
    lea  rdx, [rel main_str8]
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
    lea  rdi, [rel main_str9]
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
    lea  rdi, [rel main_str1]
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
    mov  [rbp-40], rax
.while_start_7:
    mov  rax, [rbp-40]
    push rax
    mov  rax, 5
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_8
    mov  rax, [rbp-40]
    push rax
    mov  rax, 3
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_10
    jmp  .while_end_8
    jmp  .if_end_9
.if_next_10:
.if_end_9:
    lea  rdi, [rel main_str10]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-40]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 1
    mov  rcx, [rbp-40]
    add  rax, rcx
    mov  [rbp-40], rax
    jmp  .while_start_7
.while_end_8:
    mov  rax, 0
    mov  [rbp-40], rax
.while_start_11:
    mov  rax, [rbp-40]
    push rax
    mov  rax, 5
    pop  rcx
    cmp  rcx, rax
    setl al
    movzx eax, al
    cmp  rax, 0
    je   .while_end_12
    mov  rax, 1
    mov  rcx, [rbp-40]
    add  rax, rcx
    mov  [rbp-40], rax
    mov  rax, [rbp-40]
    push rax
    mov  rax, 3
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_14
    jmp  .while_start_11
    jmp  .if_end_13
.if_next_14:
.if_end_13:
    lea  rdi, [rel main_str10]
    mov  rsi, 2
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-40]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .while_start_11
.while_end_12:
    sub  rsp, 8
    mov  rax, 3
    push rax
    mov  rax, 2
    push rax
    call add
    add  rsp, 24
    mov  [rbp-64], rax
    lea  rdi, [rel main_str11]
    mov  rsi, 3
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-64]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    sub  rsp, 8
    lea  rax, [rel main_str12]
    mov  rdx, 2
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call shout
    add  rsp, 24
    mov  [rbp-72], rax
    mov  [rbp-80], rdx
    sub  rsp, 8
    mov  rax, [rbp-72]
    mov  rdx, [rbp-80]
    test rdx, rdx
    jns  .str_len_ok_15
    neg  rdx
    dec  rdx
.str_len_ok_15:
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call foo
    add  rsp, 24
    sub  rsp, 8
    mov  rax, 0x4050400000000000
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x403e000000000000
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    call div
    add  rsp, 24
    sub  rsp, 8
    movsd [rsp], xmm0
    call foo2
    add  rsp, 8
    mov  rax, 0
    mov  rax, [rbp-32]
    test rax, rax
    jns  .str_free_done_16
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-24]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_16:
    mov  rax, [rbp-56]
    test rax, rax
    jns  .str_free_done_17
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-48]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_17:
    mov  rax, [rbp-80]
    test rax, rax
    jns  .str_free_done_18
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-72]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_18:
    leave
    ret

_start:
    and  rsp, -16
    call main
    mov  rdi, rax
    jmp  rt_exit

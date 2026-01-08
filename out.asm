global _start
global main

extern rt_exit
extern rt_print_i64
extern rt_print_f64
extern rt_print_i64_raw
extern rt_print_f64_raw
extern rt_print_u64
extern rt_print_u64_raw
extern rt_print_hex_u64
extern rt_print_hex_u64_raw
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
assert_i64_str0: db 61, 116, 114, 117, 101, 10
assert_i64_str1: db 61, 102, 97, 108, 115, 101, 32, 103, 111, 116, 61
assert_i64_str2: db 32, 101, 120, 112, 61
assert_i64_str3: db 10
assert_u64_str0: db 61, 116, 114, 117, 101, 10
assert_u64_str1: db 61, 102, 97, 108, 115, 101, 32, 103, 111, 116, 61
assert_u64_str2: db 32, 101, 120, 112, 61
assert_u64_str3: db 10
assert_d64_eps_str0: db 61, 116, 114, 117, 101, 10
assert_d64_eps_str1: db 61, 102, 97, 108, 115, 101, 32, 103, 111, 116, 61
assert_d64_eps_str2: db 32, 101, 120, 112, 61
assert_d64_eps_str3: db 10
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
main_str13: db 104, 56, 61
main_str14: db 104, 49, 54, 61
main_str15: db 104, 51, 50, 61
main_str16: db 104, 54, 52, 61
main_str17: db 10, 45, 45, 32, 117, 110, 115, 105, 103, 110, 101, 100, 47, 98, 105, 116, 111, 112, 115, 32, 116, 101, 115, 116, 115, 32, 45, 45, 10
main_str18: db 119, 56, 61
main_str19: db 32, 104, 101, 120, 61
main_str20: db 119, 49, 54, 61
main_str21: db 119, 51, 50, 61
main_str22: db 119, 54, 52, 61
main_str23: db 98, 95, 97, 110, 100, 61
main_str24: db 32, 98, 95, 111, 114, 61
main_str25: db 32, 98, 95, 120, 111, 114, 61
main_str26: db 115, 104, 108, 32, 117, 56, 61
main_str27: db 115, 104, 114, 32, 117, 56, 61
main_str28: db 115, 97, 114, 32, 105, 54, 52, 61
main_str29: db 99, 109, 112, 32, 117, 56, 32, 50, 53, 48, 62, 51, 61
main_str30: db 99, 109, 112, 32, 117, 56, 32, 49, 60, 50, 61
main_str31: db 104, 101, 120, 32, 108, 105, 116, 101, 114, 97, 108, 32, 112, 114, 105, 110, 116, 95, 104, 101, 120, 40, 48, 120, 65, 66, 67, 68, 41, 61
main_str32: db 10, 45, 45, 32, 117, 110, 105, 116, 32, 116, 101, 115, 116, 115, 32, 45, 45, 10
main_str33: db 120
main_str34: db 121
main_str35: db 97, 100, 100
main_str36: db 119, 56
main_str37: db 119, 49, 54
main_str38: db 119, 51, 50
main_str39: db 119, 54, 52
main_str40: db 98, 95, 97, 110, 100
main_str41: db 98, 95, 111, 114
main_str42: db 98, 95, 120, 111, 114
main_str43: db 115, 104, 108, 95, 117, 56
main_str44: db 115, 104, 114, 95, 117, 56
main_str45: db 115, 97, 114, 95, 105, 54, 52
main_str46: db 99, 109, 112, 95, 117, 56, 95, 103, 116
main_str47: db 99, 109, 112, 95, 117, 56, 95, 108, 116
main_str48: db 104, 101, 120, 95, 97, 98, 99, 100
main_str49: db 10, 45, 45, 32, 112, 116, 114, 32, 116, 101, 115, 116, 115, 32, 45, 45, 10
main_str50: db 112, 116, 114, 95, 115, 116, 111, 114, 101, 95, 97
main_str51: db 112, 116, 114, 95, 97, 100, 100, 95, 101, 113
main_str52: db 112, 116, 114, 95, 98, 121, 116, 101, 95, 97, 100, 100, 95, 101, 113
main_str53: db 112, 116, 114, 95, 117, 56, 95, 115, 116, 111, 114, 101
main_str54: db 112, 116, 114, 95, 110, 117, 108, 108, 95, 101, 113
main_str55: db 112, 116, 114, 95, 99, 97, 115, 116
main_str56: db 10, 45, 45, 32, 118, 111, 108, 97, 116, 105, 108, 101, 47, 98, 97, 114, 114, 105, 101, 114, 32, 116, 101, 115, 116, 115, 32, 45, 45, 10
main_str57: db 118, 111, 108, 97, 116, 105, 108, 101, 95, 108, 111, 97, 100

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

assert_i64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  rdx, [rbp+24]
    test rdx, rdx
    jns  .param_str_ok_0
    neg  rdx
    dec  rdx
.param_str_ok_0:
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-32]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_2
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_3
    neg  rsi
    dec  rsi
.str_len_ok_3:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel assert_i64_str0]
    mov  rsi, 6
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_1
.if_next_2:
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_5
    neg  rsi
    dec  rsi
.str_len_ok_5:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel assert_i64_str1]
    mov  rsi, 11
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-24]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel assert_i64_str2]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-32]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel assert_i64_str3]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_1
.if_next_4:
.if_end_1:
    mov  rax, [rbp-16]
    test rax, rax
    jns  .str_free_done_6
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-8]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_6:
    leave
    ret

assert_u64:
    push rbp
    mov  rbp, rsp
    sub  rsp, 32
    mov  rax, [rbp+16]
    mov  rdx, [rbp+24]
    test rdx, rdx
    jns  .param_str_ok_0
    neg  rdx
    dec  rdx
.param_str_ok_0:
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
    mov  rax, [rbp+32]
    mov  [rbp-24], rax
    mov  rax, [rbp+40]
    mov  [rbp-32], rax
    mov  rax, [rbp-24]
    push rax
    mov  rax, [rbp-32]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    cmp  rax, 0
    je   .if_next_2
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_3
    neg  rsi
    dec  rsi
.str_len_ok_3:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel assert_u64_str0]
    mov  rsi, 6
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_1
.if_next_2:
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_5
    neg  rsi
    dec  rsi
.str_len_ok_5:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel assert_u64_str1]
    mov  rsi, 11
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-24]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel assert_u64_str2]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-32]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel assert_u64_str3]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_1
.if_next_4:
.if_end_1:
    mov  rax, [rbp-16]
    test rax, rax
    jns  .str_free_done_6
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-8]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_6:
    leave
    ret

assert_d64_eps:
    push rbp
    mov  rbp, rsp
    sub  rsp, 48
    mov  rax, [rbp+16]
    mov  rdx, [rbp+24]
    test rdx, rdx
    jns  .param_str_ok_0
    neg  rdx
    dec  rdx
.param_str_ok_0:
    mov  [rbp-8], rax
    mov  [rbp-16], rdx
    movsd xmm0, [rbp+32]
    movsd [rbp-24], xmm0
    movsd xmm0, [rbp+40]
    movsd [rbp-32], xmm0
    movsd xmm0, [rbp+48]
    movsd [rbp-40], xmm0
    movsd xmm0, [rbp-24]
    sub  rsp, 8
    movsd [rsp], xmm0
    movsd xmm0, [rbp-32]
    movsd xmm1, [rsp]
    add  rsp, 8
    subsd xmm1, xmm0
    movapd xmm0, xmm1
    mov  rax, 0x7fffffffffffffff
    movq xmm1, rax
    andpd xmm0, xmm1
    sub  rsp, 8
    movsd [rsp], xmm0
    movsd xmm0, [rbp-40]
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
    jp   .if_next_2
    je   .if_next_2
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_3
    neg  rsi
    dec  rsi
.str_len_ok_3:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel assert_d64_eps_str0]
    mov  rsi, 6
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_1
.if_next_2:
    mov  rdi, [rbp-8]
    mov  rsi, [rbp-16]
    test rsi, rsi
    jns  .str_len_ok_5
    neg  rsi
    dec  rsi
.str_len_ok_5:
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel assert_d64_eps_str1]
    mov  rsi, 11
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-24]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel assert_d64_eps_str2]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    movsd xmm0, [rbp-32]
    sub  rsp, 8
    call rt_print_f64_raw
    add  rsp, 8
    lea  rdi, [rel assert_d64_eps_str3]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    jmp  .if_end_1
.if_next_4:
.if_end_1:
    mov  rax, [rbp-16]
    test rax, rax
    jns  .str_free_done_6
    mov  rsi, rax
    neg  rsi
    dec  rsi
    mov  rdi, [rbp-8]
    sub  rsp, 8
    call rt_str_free
    add  rsp, 8
.str_free_done_6:
    leave
    ret

main:
    push rbp
    mov  rbp, rsp
    sub  rsp, 304
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
    mov  rax, 128
    and  rax, 0xFF
    mov  [rbp-88], rax
    lea  rdi, [rel main_str13]
    mov  rsi, 3
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-88]
    and  rax, 0xFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-88]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 12316
    and  rax, 0xFFFF
    mov  [rbp-96], rax
    lea  rdi, [rel main_str14]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-96]
    and  rax, 0xFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-96]
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 12332
    and  eax, 0xFFFFFFFF
    mov  [rbp-104], rax
    lea  rdi, [rel main_str15]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-104]
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-104]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 1264
    mov  [rbp-112], rax
    lea  rdi, [rel main_str16]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-112]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-112]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel main_str17]
    mov  rsi, 29
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 300
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-120], rax
    lea  rdi, [rel main_str18]
    mov  rsi, 3
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-120]
    and  rax, 0xFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str19]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-120]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x1234
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  [rbp-128], rax
    lea  rdi, [rel main_str20]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-128]
    and  rax, 0xFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str19]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-128]
    and  rax, 0xFFFF
    and  rax, 0xFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0xFFFFFFF0
    and  eax, 0xFFFFFFFF
    mov  [rbp-136], rax
    lea  rdi, [rel main_str21]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-136]
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str19]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-136]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x8000000000000000
    mov  [rbp-144], rax
    lea  rdi, [rel main_str22]
    mov  rsi, 4
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-144]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str19]
    mov  rsi, 5
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-144]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x0F0F
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-152], rax
    mov  rax, 0xF000
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-160], rax
    mov  rax, [rbp-152]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-160]
    and  eax, 0xFFFFFFFF
    pop  rcx
    and  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-168], rax
    mov  rax, [rbp-152]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-160]
    and  eax, 0xFFFFFFFF
    pop  rcx
    or   rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-176], rax
    mov  rax, [rbp-152]
    and  eax, 0xFFFFFFFF
    push rax
    mov  rax, [rbp-160]
    and  eax, 0xFFFFFFFF
    pop  rcx
    xor  rax, rcx
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-184], rax
    lea  rdi, [rel main_str23]
    mov  rsi, 6
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-168]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str24]
    mov  rsi, 6
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-176]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str25]
    mov  rsi, 7
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-184]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 1
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-192], rax
    mov  rax, [rbp-192]
    and  rax, 0xFF
    push rax
    mov  rax, 7
    mov  rcx, rax
    pop  rax
    shl  rax, cl
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-192], rax
    lea  rdi, [rel main_str26]
    mov  rsi, 7
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-192]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0x80
    and  rax, 0xFF
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    shr  rax, cl
    and  rax, 0xFF
    and  rax, 0xFF
    mov  [rbp-200], rax
    lea  rdi, [rel main_str27]
    mov  rsi, 7
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-200]
    and  rax, 0xFF
    and  rax, 0xFF
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0
    push rax
    mov  rax, 4
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    mov  [rbp-208], rax
    mov  rax, [rbp-208]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    sar  rax, cl
    mov  [rbp-216], rax
    lea  rdi, [rel main_str28]
    mov  rsi, 8
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, [rbp-216]
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel main_str29]
    mov  rsi, 13
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 250
    and  rax, 0xFF
    push rax
    mov  rax, 3
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel main_str30]
    mov  rsi, 11
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 1
    and  rax, 0xFF
    push rax
    mov  rax, 2
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_i64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel main_str31]
    mov  rsi, 30
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0xABCD
    mov  rdi, rax
    sub  rsp, 8
    call rt_print_hex_u64_raw
    add  rsp, 8
    lea  rdi, [rel main_str1]
    mov  rsi, 1
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    lea  rdi, [rel main_str32]
    mov  rsi, 18
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    sub  rsp, 8
    mov  rax, 0
    push rax
    mov  rax, 2
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, [rbp-8]
    push rax
    lea  rax, [rel main_str33]
    mov  rdx, 1
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    mov  rax, 0x3d719799812dea11
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x0
    movq xmm0, rax
    sub  rsp, 8
    movsd [rsp], xmm0
    mov  rax, 0x3ff307052facb1c0
    movq xmm0, rax
    movsd xmm1, [rsp]
    add  rsp, 8
    subsd xmm1, xmm0
    movapd xmm0, xmm1
    sub  rsp, 8
    movsd [rsp], xmm0
    movsd xmm0, [rbp-16]
    sub  rsp, 8
    movsd [rsp], xmm0
    lea  rax, [rel main_str34]
    mov  rdx, 1
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_d64_eps
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 5
    push rax
    mov  rax, [rbp-64]
    push rax
    lea  rax, [rel main_str35]
    mov  rdx, 3
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 44
    push rax
    mov  rax, [rbp-120]
    and  rax, 0xFF
    push rax
    lea  rax, [rel main_str36]
    mov  rdx, 2
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0x1234
    push rax
    mov  rax, [rbp-128]
    and  rax, 0xFFFF
    push rax
    lea  rax, [rel main_str37]
    mov  rdx, 3
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0xFFFFFFF0
    push rax
    mov  rax, [rbp-136]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rel main_str38]
    mov  rdx, 3
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0x8000000000000000
    push rax
    mov  rax, [rbp-144]
    push rax
    lea  rax, [rel main_str39]
    mov  rdx, 3
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    mov  rax, [rbp-168]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rel main_str40]
    mov  rdx, 5
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0xFF0F
    push rax
    mov  rax, [rbp-176]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rel main_str41]
    mov  rdx, 4
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0xFF0F
    push rax
    mov  rax, [rbp-184]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rel main_str42]
    mov  rdx, 5
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0x80
    push rax
    mov  rax, [rbp-192]
    and  rax, 0xFF
    push rax
    lea  rax, [rel main_str43]
    mov  rdx, 6
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0x40
    push rax
    mov  rax, [rbp-200]
    and  rax, 0xFF
    push rax
    lea  rax, [rel main_str44]
    mov  rdx, 6
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0
    push rax
    mov  rax, 2
    pop  rcx
    sub  rcx, rax
    mov  rax, rcx
    push rax
    mov  rax, [rbp-216]
    push rax
    lea  rax, [rel main_str45]
    mov  rdx, 7
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 1
    push rax
    mov  rax, 250
    and  rax, 0xFF
    push rax
    mov  rax, 3
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    seta al
    movzx eax, al
    push rax
    lea  rax, [rel main_str46]
    mov  rdx, 9
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 1
    push rax
    mov  rax, 1
    and  rax, 0xFF
    push rax
    mov  rax, 2
    and  rax, 0xFF
    pop  rcx
    cmp  rcx, rax
    setb al
    movzx eax, al
    push rax
    lea  rax, [rel main_str47]
    mov  rdx, 9
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    sub  rsp, 8
    mov  rax, 0xABCD
    push rax
    mov  rax, 0xABCD
    push rax
    lea  rax, [rel main_str48]
    mov  rdx, 8
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    lea  rdi, [rel main_str49]
    mov  rsi, 17
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0
    mov  [rbp-224], rax
    lea  rax, [rbp-224]
    mov  [rbp-232], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, 11
    pop  rcx
    mov  qword [rcx], rax
    sub  rsp, 8
    mov  rax, 11
    push rax
    mov  rax, [rbp-224]
    push rax
    lea  rax, [rel main_str50]
    mov  rdx, 11
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    mov  rax, [rbp-232]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    imul rcx, 8
    add  rax, rcx
    mov  [rbp-240], rax
    mov  rax, [rbp-232]
    push rax
    mov  rax, 8
    pop  rcx
    add  rax, rcx
    mov  [rbp-248], rax
    sub  rsp, 8
    mov  rax, 1
    push rax
    mov  rax, [rbp-240]
    push rax
    mov  rax, [rbp-248]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    push rax
    lea  rax, [rel main_str51]
    mov  rdx, 10
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    mov  rax, [rbp-232]
    push rax
    mov  rax, 8
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    mov  [rbp-256], rax
    sub  rsp, 8
    mov  rax, 1
    push rax
    mov  rax, [rbp-256]
    push rax
    mov  rax, [rbp-248]
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    push rax
    lea  rax, [rel main_str52]
    mov  rdx, 15
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    mov  rax, [rbp-232]
    push rax
    mov  rax, 0
    pop  rcx
    mov  qword [rcx], rax
    mov  rax, [rbp-232]
    mov  [rbp-264], rax
    mov  rax, [rbp-264]
    push rax
    mov  rax, 0xEF
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    mov  rax, [rbp-264]
    push rax
    mov  rax, 1
    mov  rcx, rax
    pop  rax
    add  rax, rcx
    push rax
    mov  rax, 0xBE
    and  rax, 0xFF
    and  rax, 0xFF
    pop  rcx
    mov  byte [rcx], al
    sub  rsp, 8
    mov  rax, 0xBEEF
    push rax
    mov  rax, [rbp-224]
    push rax
    lea  rax, [rel main_str53]
    mov  rdx, 12
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    xor  eax, eax
    mov  [rbp-272], rax
    sub  rsp, 8
    mov  rax, 1
    push rax
    mov  rax, [rbp-272]
    push rax
    xor  eax, eax
    pop  rcx
    cmp  rcx, rax
    sete al
    movzx eax, al
    push rax
    lea  rax, [rel main_str54]
    mov  rdx, 11
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_i64
    add  rsp, 40
    mov  rax, 0x1000
    mov  [rbp-280], rax
    sub  rsp, 8
    mov  rax, 0x1000
    push rax
    mov  rax, [rbp-280]
    push rax
    lea  rax, [rel main_str55]
    mov  rdx, 8
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
    lea  rdi, [rel main_str56]
    mov  rsi, 30
    sub  rsp, 8
    call rt_print_bytes
    add  rsp, 8
    mov  rax, 0
    and  eax, 0xFFFFFFFF
    mov  [rbp-288], rax
    lea  rax, [rbp-288]
    mov  [rbp-296], rax
    sfence
    mov  rax, [rbp-296]
    push rax
    mov  rax, 0xA5A5A5A5
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    pop  rcx
    mov  dword [rcx], eax
    mfence
    mov  rax, [rbp-296]
    mov  eax, dword [rax]
    and  eax, 0xFFFFFFFF
    and  eax, 0xFFFFFFFF
    mov  [rbp-304], rax
    lfence
    sub  rsp, 8
    mov  rax, 0xA5A5A5A5
    push rax
    mov  rax, [rbp-304]
    and  eax, 0xFFFFFFFF
    push rax
    lea  rax, [rel main_str57]
    mov  rdx, 13
    sub  rsp, 8
    mov  [rsp], rdx
    sub  rsp, 8
    mov  [rsp], rax
    call assert_u64
    add  rsp, 40
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

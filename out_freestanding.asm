global _start

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

section .text

_start:
    push rbp
    mov  rbp, rsp
    sub  rsp, 16
    mov  rax, 1
    mov  [rbp-8], rax
.while_start_0:
    mov  rax, [rbp-8]
    cmp  rax, 0
    je   .while_end_1
    hlt
    jmp  .while_start_0
.while_end_1:
    leave
    ret


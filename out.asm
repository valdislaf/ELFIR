global _start
global main_i64

extern rt_exit
extern rt_print_i64

section .text

main_i64:
    push rbp
    mov  rbp, rsp
    mov  rax, 6
    mov  r8, rax
    mov  rax, 5
    mov  r9, rax
    mov  rax, 1
    cmp  r9, 0
    jl   .ipow_neg_0
    je   .ipow_done_0
.ipow_loop_0:
    test r9, 1
    jz   .ipow_skip_0
    imul rax, r8
.ipow_skip_0:
    imul r8, r8
    shr  r9, 1
    jne  .ipow_loop_0
    jmp  .ipow_done_0
.ipow_neg_0:
    xor  eax, eax
.ipow_done_0:
    leave
    ret

_start:
    and  rsp, -16
    call main_i64
    mov  rdi, rax
    call rt_print_i64
    xor  edi, edi
    jmp  rt_exit

global _start
global main_d64

extern rt_exit
extern rt_print_f64

section .text

main_d64:
    push rbp
    mov  rbp, rsp
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

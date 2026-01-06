; prog.asm  (Linux x86-64, syscalls)
; nasm -felf64 prog.asm -o prog.o
; ld prog.o -o prog
; ./prog
global _start
section .text

; rt_write: write(1, rsi, rdx)
; in:  rsi=buf, rdx=len
rt_write:
    mov     eax, 1      ; SYS_write
    mov     edi, 1      ; fd=stdout
    syscall
    ret

; rt_exit: exit(rdi)
; in: rdi=exit code
rt_exit:
    mov     eax, 60     ; SYS_exit
    syscall

; long add2(long a, long b)
; SysV: a=rdi, b=rsi, return=rax
add2:
    lea     rax, [rdi + rsi]
    ret

; utoa10: unsigned long -> ASCII
; input : rdi = value (uint64), rsi = out buffer
; output: rax = length
utoa10:
    test    rdi, rdi
    jne     .nonzero
    mov     byte [rsi], '0'
    mov     eax, 1
    ret

.nonzero:
    sub     rsp, 40
    lea     r8,  [rsp]
    xor     ecx, ecx

.loop_div:
    xor     edx, edx
    mov     rax, rdi
    mov     r9d, 10
    div     r9
    add     dl, '0'
    mov     [r8 + rcx], dl
    inc     rcx
    mov     rdi, rax
    test    rdi, rdi
    jne     .loop_div

    xor     eax, eax
.rev_copy:
    mov     r10, rcx
    dec     r10
    sub     r10, rax
    mov     dl, [r8 + r10]
    mov     [rsi + rax], dl
    inc     rax
    cmp     rax, rcx
    jne     .rev_copy

    add     rsp, 40
    ret

_start:
    and rsp, -16
    ; rax = add2(3,7)
    mov     edi, 3
    mov     esi, 7
    call    add2

    ; buf on stack
    sub     rsp, 80
    lea     rsi, [rsp]        ; buf

    ; convert rax -> string
    mov     rdi, rax
    call    utoa10            ; rax=len

    ; append '\n'
    mov     byte [rsi + rax], 10
    inc     rax               ; len++

    ; write(buf,len)
    mov     rdx, rax
    call    rt_write

    add     rsp, 80

    ; exit(0)
    xor     edi, edi
    jmp     rt_exit

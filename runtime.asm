; runtime.asm (Linux x86-64, NASM)
; nasm -felf64 runtime.asm -o runtime.o

global rt_exit
global rt_write
global rt_print_i64

section .text

; rt_write: write(1, rsi, rdx)
; in:  rsi=buf, rdx=len
rt_write:
    mov     eax, 1          ; SYS_write
    mov     edi, 1          ; fd=stdout
    syscall
    ret

; rt_exit: exit(rdi)
; in: rdi=exit code
rt_exit:
    mov     eax, 60         ; SYS_exit
    syscall
    ; no return

; utoa10_u64: unsigned 64-bit -> ASCII (no newline)
; input : rdi = value (uint64), rsi = out buffer
; output: rax = length (>=1)
utoa10_u64:
    test    rdi, rdi
    jne     .nonzero
    mov     byte [rsi], '0'
    mov     eax, 1
    ret

.nonzero:
    ; We'll build digits in reverse in a temp buffer on stack
    sub     rsp, 40
    lea     r8, [rsp]       ; temp[0..39]
    xor     ecx, ecx        ; count = 0

.loop_div:
    xor     edx, edx
    mov     rax, rdi
    mov     r9d, 10
    div     r9              ; (rdx:rax)/10 -> rax=quot, rdx=rem
    add     dl, '0'
    mov     [r8 + rcx], dl
    inc     rcx
    mov     rdi, rax
    test    rdi, rdi
    jne     .loop_div

    ; reverse-copy into output
    xor     eax, eax        ; i = 0
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

; rt_print_i64: prints signed i64 in decimal + '\n'
; input : rdi = value (int64)
rt_print_i64:
    push    rbx             ; SysV ABI: RBX is callee-saved
                            ; Also fixes alignment: after push, rsp%16 == 0

    ; stack buffer
    sub     rsp, 96         ; keep rsp 16-byte aligned for calls
    lea     rsi, [rsp]      ; buf base
    xor     ebx, ebx        ; len = 0

    ; if negative: emit '-' and use magnitude as u64
    test    rdi, rdi
    jge     .pos

    mov     byte [rsi], '-'
    inc     ebx

    ; magnitude = -value, computed in two's complement.
    ; For INT64_MIN, NEG keeps the same bit-pattern (0x8000..),
    ; which is correct magnitude as u64: 9223372036854775808.
    mov     rax, rdi
    neg     rax
    mov     rdi, rax
    lea     rsi, [rsp + rbx]   ; write digits after '-'
    call    utoa10_u64
    add     ebx, eax
    jmp     .emit_nl

.pos:
    ; positive or zero
    lea     rsi, [rsp]
    call    utoa10_u64
    mov     ebx, eax

.emit_nl:
    ; append '\n'
    mov     byte [rsp + rbx], 10
    inc     ebx

    ; write(buf, len)
    lea     rsi, [rsp]
    mov     edx, ebx
    call    rt_write

    add     rsp, 96
    pop     rbx
    ret

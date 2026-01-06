; runtime.asm (Linux x86-64, NASM)
; nasm -felf64 runtime.asm -o runtime.o

global rt_exit
global rt_write
global rt_print_i64
global rt_print_i64_raw
global rt_print_f64
global rt_print_f64_raw
global rt_print_bytes

section .rodata
align 8
const_f64_0:  dq 0x0000000000000000
const_f64_1:  dq 0x3ff0000000000000
const_f64_10: dq 0x4024000000000000
mask_f64_exp: dq 0x7ff0000000000000
mask_f64_man: dq 0x000fffffffffffff
mask_f64_sign: dq 0x7fffffffffffffff

section .text

; rt_write: write(1, rsi, rdx)
; in:  rsi=buf, rdx=len
rt_write:
    mov     eax, 1          ; SYS_write
    mov     edi, 1          ; fd=stdout
    syscall
    ret

; rt_print_bytes: write(data,len)
; in: rdi=data, rsi=len
rt_print_bytes:
    mov     rdx, rsi
    mov     rsi, rdi
    sub     rsp, 8
    call    rt_write
    add     rsp, 8
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

; rt_print_i64_raw: prints signed i64 without newline
; input : rdi = value (int64)
rt_print_i64_raw:
    push    rbx             ; SysV ABI: RBX is callee-saved
    sub     rsp, 96         ; keep rsp 16-byte aligned for calls
    lea     rsi, [rsp]      ; buf base
    xor     ebx, ebx        ; len = 0

    test    rdi, rdi
    jge     .pos_raw

    mov     byte [rsi], '-'
    inc     ebx

    mov     rax, rdi
    neg     rax
    mov     rdi, rax
    lea     rsi, [rsp + rbx]
    call    utoa10_u64
    add     ebx, eax
    jmp     .emit_raw

.pos_raw:
    lea     rsi, [rsp]
    call    utoa10_u64
    mov     ebx, eax

.emit_raw:
    lea     rsi, [rsp]
    mov     edx, ebx
    call    rt_write

    add     rsp, 96
    pop     rbx
    ret

; rt_print_f64: prints double in scientific notation + '\n'
; input : xmm0 = value (double)
rt_print_f64:
    push    rbx             ; SysV ABI: RBX is callee-saved
    sub     rsp, 64         ; keep rsp 16-byte aligned for calls
    lea     rsi, [rsp]      ; buf base
    xor     ebx, ebx        ; len = 0

    movq    rax, xmm0
    mov     rcx, rax
    mov     rdx, [rel mask_f64_exp]
    and     rcx, rdx
    cmp     rcx, rdx
    jne     .finite

    mov     rcx, rax
    mov     rdx, [rel mask_f64_man]
    and     rcx, rdx
    jne     .nan

    test    rax, rax
    jns     .inf_pos
    mov     byte [rsi + rbx], '-'
    inc     ebx
.inf_pos:
    mov     byte [rsi + rbx], 'i'
    mov     byte [rsi + rbx + 1], 'n'
    mov     byte [rsi + rbx + 2], 'f'
    add     ebx, 3
    jmp     .emit_nl

.nan:
    mov     byte [rsi + rbx], 'n'
    mov     byte [rsi + rbx + 1], 'a'
    mov     byte [rsi + rbx + 2], 'n'
    add     ebx, 3
    jmp     .emit_nl

.finite:
    test    rax, rax
    jns     .abs_done
    mov     byte [rsi + rbx], '-'
    inc     ebx
    mov     rdx, [rel mask_f64_sign]
    and     rax, rdx
    movq    xmm0, rax
.abs_done:
    ucomisd xmm0, [rel const_f64_0]
    jne     .not_zero
    mov     byte [rsi + rbx], '0'
    mov     byte [rsi + rbx + 1], '.'
    mov     byte [rsi + rbx + 2], '0'
    mov     byte [rsi + rbx + 3], 'e'
    mov     byte [rsi + rbx + 4], '+'
    mov     byte [rsi + rbx + 5], '0'
    mov     byte [rsi + rbx + 6], '0'
    add     ebx, 7
    jmp     .emit_nl

.not_zero:
    xor     ecx, ecx
    movsd   xmm2, [rel const_f64_10]
    movsd   xmm3, [rel const_f64_1]
.norm_hi:
    ucomisd xmm0, xmm2
    jb      .norm_lo
    divsd   xmm0, xmm2
    inc     ecx
    jmp     .norm_hi
.norm_lo:
    ucomisd xmm0, xmm3
    jae     .format
    mulsd   xmm0, xmm2
    dec     ecx
    jmp     .norm_lo

.format:
    cvttsd2si eax, xmm0
    mov     edx, eax
    add     dl, '0'
    mov     [rsi + rbx], dl
    inc     ebx
    mov     byte [rsi + rbx], '.'
    inc     ebx
    mov     r9d, ebx         ; first fractional digit index
    cvtsi2sd xmm4, eax
    subsd   xmm0, xmm4
    mulsd   xmm0, xmm2

    mov     edi, 16
.digit_loop:
    cvttsd2si eax, xmm0
    mov     edx, eax
    add     dl, '0'
    mov     [rsi + rbx], dl
    inc     ebx
    cvtsi2sd xmm4, eax
    subsd   xmm0, xmm4
    mulsd   xmm0, xmm2
    dec     edi
    jne     .digit_loop

    mov     r10d, ebx
.trim_loop:
    cmp     r10d, r9d
    jle     .trim_done
    mov     al, [rsi + r10 - 1]
    cmp     al, '0'
    jne     .trim_done
    dec     r10d
    jmp     .trim_loop
.trim_done:
    cmp     r10d, r9d
    jne     .trim_set
    mov     byte [rsi + r9], '0'
    mov     r10d, r9d
    inc     r10d
.trim_set:
    mov     ebx, r10d

    mov     byte [rsi + rbx], 'e'
    inc     ebx
    mov     eax, ecx
    test    eax, eax
    jns     .exp_pos
    mov     byte [rsi + rbx], '-'
    inc     ebx
    neg     eax
    jmp     .exp_abs
.exp_pos:
    mov     byte [rsi + rbx], '+'
    inc     ebx
.exp_abs:
    cmp     eax, 100
    jb      .exp_two
    xor     edx, edx
    mov     r8d, 100
    div     r8d
    add     al, '0'
    mov     [rsi + rbx], al
    inc     ebx
    mov     eax, edx
.exp_two:
    xor     edx, edx
    mov     r8d, 10
    div     r8d
    add     al, '0'
    mov     [rsi + rbx], al
    inc     ebx
    add     dl, '0'
    mov     [rsi + rbx], dl
    inc     ebx

.emit_nl:
    mov     byte [rsi + rbx], 10
    inc     ebx
    mov     rdx, rbx
    call    rt_write

    add     rsp, 64
    pop     rbx
    ret

; rt_print_f64_raw: prints double in scientific notation without newline
; input : xmm0 = value (double)
rt_print_f64_raw:
    push    rbx             ; SysV ABI: RBX is callee-saved
    sub     rsp, 64         ; keep rsp 16-byte aligned for calls
    lea     rsi, [rsp]      ; buf base
    xor     ebx, ebx        ; len = 0

    movq    rax, xmm0
    mov     rcx, rax
    mov     rdx, [rel mask_f64_exp]
    and     rcx, rdx
    cmp     rcx, rdx
    jne     .finite_raw

    mov     rcx, rax
    mov     rdx, [rel mask_f64_man]
    and     rcx, rdx
    jne     .nan_raw

    test    rax, rax
    jns     .inf_pos_raw
    mov     byte [rsi + rbx], '-'
    inc     ebx
.inf_pos_raw:
    mov     byte [rsi + rbx], 'i'
    mov     byte [rsi + rbx + 1], 'n'
    mov     byte [rsi + rbx + 2], 'f'
    add     ebx, 3
    jmp     .emit_raw

.nan_raw:
    mov     byte [rsi + rbx], 'n'
    mov     byte [rsi + rbx + 1], 'a'
    mov     byte [rsi + rbx + 2], 'n'
    add     ebx, 3
    jmp     .emit_raw

.finite_raw:
    test    rax, rax
    jns     .abs_done_raw
    mov     byte [rsi + rbx], '-'
    inc     ebx
    mov     rdx, [rel mask_f64_sign]
    and     rax, rdx
    movq    xmm0, rax
.abs_done_raw:
    ucomisd xmm0, [rel const_f64_0]
    jne     .not_zero_raw
    mov     byte [rsi + rbx], '0'
    mov     byte [rsi + rbx + 1], '.'
    mov     byte [rsi + rbx + 2], '0'
    mov     byte [rsi + rbx + 3], 'e'
    mov     byte [rsi + rbx + 4], '+'
    mov     byte [rsi + rbx + 5], '0'
    mov     byte [rsi + rbx + 6], '0'
    add     ebx, 7
    jmp     .emit_raw

.not_zero_raw:
    xor     ecx, ecx
    movsd   xmm2, [rel const_f64_10]
    movsd   xmm3, [rel const_f64_1]
.norm_hi_raw:
    ucomisd xmm0, xmm2
    jb      .norm_lo_raw
    divsd   xmm0, xmm2
    inc     ecx
    jmp     .norm_hi_raw
.norm_lo_raw:
    ucomisd xmm0, xmm3
    jae     .format_raw
    mulsd   xmm0, xmm2
    dec     ecx
    jmp     .norm_lo_raw

.format_raw:
    cvttsd2si eax, xmm0
    mov     edx, eax
    add     dl, '0'
    mov     [rsi + rbx], dl
    inc     ebx
    mov     byte [rsi + rbx], '.'
    inc     ebx
    mov     r9d, ebx
    cvtsi2sd xmm4, eax
    subsd   xmm0, xmm4
    mulsd   xmm0, xmm2

    mov     edi, 16
.digit_loop_raw:
    cvttsd2si eax, xmm0
    mov     edx, eax
    add     dl, '0'
    mov     [rsi + rbx], dl
    inc     ebx
    cvtsi2sd xmm4, eax
    subsd   xmm0, xmm4
    mulsd   xmm0, xmm2
    dec     edi
    jne     .digit_loop_raw

    mov     r10d, ebx
.trim_loop_raw:
    cmp     r10d, r9d
    jle     .trim_done_raw
    mov     al, [rsi + r10 - 1]
    cmp     al, '0'
    jne     .trim_done_raw
    dec     r10d
    jmp     .trim_loop_raw
.trim_done_raw:
    cmp     r10d, r9d
    jne     .trim_set_raw
    mov     byte [rsi + r9], '0'
    mov     r10d, r9d
    inc     r10d
.trim_set_raw:
    mov     ebx, r10d

    mov     byte [rsi + rbx], 'e'
    inc     ebx
    mov     eax, ecx
    test    eax, eax
    jns     .exp_pos_raw
    mov     byte [rsi + rbx], '-'
    inc     ebx
    neg     eax
    jmp     .exp_abs_raw
.exp_pos_raw:
    mov     byte [rsi + rbx], '+'
    inc     ebx
.exp_abs_raw:
    cmp     eax, 100
    jb      .exp_two_raw
    xor     edx, edx
    mov     r8d, 100
    div     r8d
    add     al, '0'
    mov     [rsi + rbx], al
    inc     ebx
    mov     eax, edx
.exp_two_raw:
    xor     edx, edx
    mov     r8d, 10
    div     r8d
    add     al, '0'
    mov     [rsi + rbx], al
    inc     ebx
    add     dl, '0'
    mov     [rsi + rbx], dl
    inc     ebx

.emit_raw:
    lea     rsi, [rsp]
    mov     edx, ebx
    call    rt_write

    add     rsp, 64
    pop     rbx
    ret

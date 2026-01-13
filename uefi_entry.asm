; UEFI entry & wrappers (x86-64, NASM)
; Обёртки:
;   uefi_present() -> i64  (1 если UEFI доступен, иначе 0)
;   uefi_print(ptr<u16>) -> EFI_STATUS
;   uefi_clear() -> EFI_STATUS
;   uefi_set_cursor_pos(i64 col, i64 row) -> EFI_STATUS
;   uefi_read_key() -> u64 (low16 = UnicodeChar, hi16 = ScanCode; 0 если нет клавиши)
;   uefi_read_key_wait() -> u64 (ожидание и возврат как выше)
;
; Вызовы внутрь прошивки используют Microsoft x64 ABI (RCX,RDX,R8,R9 + shadow space 32).
; Наши внешние функции вызываются ядром по SysV ABI (RDI,RSI,RDX,RCX,R8,R9).

BITS 64

global uefi_entry
global uefi_present
global uefi_print
global uefi_clear
global uefi_set_cursor_pos
global uefi_read_key
global uefi_read_key_wait
global uefi_print_marker
global uefi_get_xhci_base
global uefi_get_fb_base
global uefi_get_fb_stride
global uefi_get_fb_width
global uefi_get_fb_height
global uefi_has_st

extern _start
extern rt_map_fb
extern idt_init

; -------------------------------
; Константы смещений (x86-64)
; -------------------------------
%define ST_CONIN           56      ; EFI_SYSTEM_TABLE->ConIn
%define ST_CONOUT          72      ; EFI_SYSTEM_TABLE->ConOut
%define ST_BOOTSERVICES    104     ; EFI_SYSTEM_TABLE->BootServices

; SIMPLE_TEXT_OUTPUT_PROTOCOL
%define OFF_Reset                0
%define OFF_OutputString         8
%define OFF_TestString           16
%define OFF_QueryMode            24
%define OFF_SetMode              32
%define OFF_SetAttribute         40
%define OFF_ClearScreen          48
%define OFF_SetCursorPosition    56
%define OFF_EnableCursor         64

; SIMPLE_TEXT_INPUT_PROTOCOL
%define OFF_ReadKeyStroke        8  ; Reset=0, ReadKey=+8

; BOOT SERVICES
%define BS_WaitForEvent          0x140  ; смещение функции WaitForEvent в таблице BS (обычно 0x140 для UEFI 2.x)
; Примечание: если ваша прошивка иная, можно не использовать ожидание и просто опрашивать ReadKeyStroke.

%define COM1 0x3F8
%define UEFI_SKIP_RT_MAP_FB 1
%define UEFI_HANG_IN_ENTRY 0

section .bss
align 8
uefi_st:       resq 1
uefi_xhci_base: resq 1
uefi_fb_base:   resq 1
uefi_fb_stride: resq 1
uefi_fb_width:  resq 1
uefi_fb_height: resq 1
uefi_bs_exited: resb 1
align 16
kernel_stack:  resb 16384
kernel_stack_top:

section .text

uart_init:
    mov     dx, COM1 + 1
    xor     al, al
    out     dx, al          ; IER = 0

    mov     dx, COM1 + 3
    mov     al, 0x80
    out     dx, al          ; DLAB = 1

    mov     dx, COM1 + 0
    mov     al, 0x01
    out     dx, al          ; DLL = 1 (115200)

    mov     dx, COM1 + 1
    xor     al, al
    out     dx, al          ; DLM = 0

    mov     dx, COM1 + 3
    mov     al, 0x03
    out     dx, al          ; 8N1

    mov     dx, COM1 + 2
    mov     al, 0xC7
    out     dx, al          ; FIFO enable + clear

    mov     dx, COM1 + 4
    mov     al, 0x0B
    out     dx, al          ; OUT2 | RTS | DTR
    ret

uart_putc:
    mov     dx, COM1
    out     dx, al
    ret

; ---------------------------------------------------------------------------
; Вход из загрузчика: SystemTable=RDI, xHCI MMIO base=RSI,
; framebuffer в RDX/RCX/R8/R9
; Сохраняем SystemTable и MMIO/FB адреса, передаём управление в _start (ядро)
; ---------------------------------------------------------------------------
uefi_entry:
    cli
    ; RDI=SystemTable, RSI=xHCI, RDX=fb_base, RCX=fb_stride, R8=fb_width, R9=fb_height
    lea     rsp, [rel kernel_stack_top]
    and     rsp, -16
    mov     [rel uefi_st], rdi
    mov     [rel uefi_xhci_base], rsi
    mov     [rel uefi_fb_base], rdx
    mov     [rel uefi_fb_stride], rcx
    mov     [rel uefi_fb_width], r8
    mov     [rel uefi_fb_height], r9
    mov     byte [rel uefi_bs_exited], 1

    call    idt_init

%if UEFI_SKIP_RT_MAP_FB
    nop
%else
    mov     rdi, [rel uefi_fb_base]
    call    rt_map_fb
%endif
%if UEFI_HANG_IN_ENTRY
.hang_entry:
    jmp     .hang_entry
%endif

    call    _start

.hang:
    cli
    hlt
    jmp     .hang

; ---------------------------------------------------------------------------
; uefi_present(): i64 (1 если SystemTable сохранена)
; ---------------------------------------------------------------------------
uefi_present:
    mov     al, [rel uefi_bs_exited]
    cmp     al, 0
    jne     .no_uefi
    mov     rax, [rel uefi_st]
    test    rax, rax
    setne   al
    movzx   eax, al
    ret
.no_uefi:
    xor     eax, eax
    ret

uefi_has_st:
    mov     al, [rel uefi_bs_exited]
    cmp     al, 0
    jne     .no_st
    mov     rax, [rel uefi_st]
    test    rax, rax
    setne   al
    movzx   eax, al
    ret
.no_st:
    xor     eax, eax
    ret

uefi_get_xhci_base:
    mov     rax, [rel uefi_xhci_base]
    ret

uefi_get_fb_base:
    mov     rax, [rel uefi_fb_base]
    ret

uefi_get_fb_stride:
    mov     rax, [rel uefi_fb_stride]
    ret

uefi_get_fb_width:
    mov     rax, [rel uefi_fb_width]
    ret

uefi_get_fb_height:
    mov     rax, [rel uefi_fb_height]
    ret

; ---------------------------------------------------------------------------
; uefi_print(ptr<u16> s): печать UTF-16 через ConOut->OutputString
;  SysV вход: RDI = ptr
;  Возврат: EFI_STATUS в RAX (0 = EFI_SUCCESS); 1 если UEFI нет
; ---------------------------------------------------------------------------
uefi_print:
    push    rbx
    push    r12
    mov     rax, [rel uefi_st]
    test    rax, rax
    jz      .no_uefi
    mov     rbx, [rax + ST_CONOUT]
    test    rbx, rbx
    jz      .no_uefi

    mov     r12, rsp
    and     rsp, -16
    sub     rsp, 32
    mov     rax, [rbx + OFF_OutputString]
    mov     rcx, rbx              ; this
    mov     rdx, rdi              ; CHAR16* String
    call    rax
    mov     rsp, r12
    pop     r12
    pop     rbx
    ret
.no_uefi:
    mov     eax, 1
    pop     r12
    pop     rbx
    ret

; ---------------------------------------------------------------------------
; uefi_clear(): EFI_STATUS (или 1, если UEFI нет)
; ---------------------------------------------------------------------------
uefi_clear:
    push    rbx
    push    r12
    mov     rax, [rel uefi_st]
    test    rax, rax
    jz      .no_uefi2
    mov     rbx, [rax + ST_CONOUT]
    test    rbx, rbx
    jz      .no_uefi2

    mov     r12, rsp
    and     rsp, -16
    sub     rsp, 32
    mov     rax, [rbx + OFF_ClearScreen]
    mov     rcx, rbx              ; this
    call    rax
    mov     rsp, r12
    pop     r12
    pop     rbx
    ret
.no_uefi2:
    mov     eax, 1
    pop     r12
    pop     rbx
    ret

; ---------------------------------------------------------------------------
; uefi_set_cursor_pos(i64 col, i64 row): EFI_STATUS (или 1, если UEFI нет)
;   SysV вход: RDI=col, RSI=row
; ---------------------------------------------------------------------------
uefi_set_cursor_pos:
    push    rbx
    push    r12
    mov     rax, [rel uefi_st]
    test    rax, rax
    jz      .no_uefi3
    mov     rbx, [rax + ST_CONOUT]
    test    rbx, rbx
    jz      .no_uefi3

    mov     r12, rsp
    and     rsp, -16
    sub     rsp, 32
    mov     rax, [rbx + OFF_SetCursorPosition]
    mov     rcx, rbx              ; this
    mov     rdx, rdi              ; Column
    mov     r8,  rsi              ; Row
    call    rax
    mov     rsp, r12
    pop     r12
    pop     rbx
    ret
.no_uefi3:
    mov     eax, 1
    pop     r12
    pop     rbx
    ret

; ---------------------------------------------------------------------------
; uefi_read_key(): u64
;   Возвращает 0 если клавиши нет.
;   Если есть: RAX = (ScanCode<<16) | UnicodeChar
; ---------------------------------------------------------------------------
uefi_read_key:
    push    rbx
    push    r12
    mov     rax, [rel uefi_st]
    test    rax, rax
    jz      .no_key
    mov     rbx, [rax + ST_CONIN]
    test    rbx, rbx
    jz      .no_key

    mov     r12, rsp
    and     rsp, -16
    sub     rsp, 32 + 8           ; shadow + место для EFI_INPUT_KEY (4 байта + выравн.)
    lea     rdx, [rsp + 32]       ; OUT EFI_INPUT_KEY*
    mov     qword [rdx], 0        ; обнулим (Scan=0, Char=0)

    mov     rax, [rbx + OFF_ReadKeyStroke]
    mov     rcx, rbx              ; this
    call    rax                   ; EFI_STATUS в RAX
    test    rax, rax
    jne     .restore_no_key       ; != EFI_SUCCESS => нет клавиши

    ; собрать (Scan<<16) | Unicode
    movzx   eax, word [rdx]       ; ScanCode
    shl     rax, 16
    movzx   r8d, word [rdx + 2]   ; UnicodeChar
    or      rax, r8
    jmp     .restore

.restore_no_key:
    xor     eax, eax
.restore:
    mov     rsp, r12
    pop     r12
    pop     rbx
    ret

.no_key:
    xor     eax, eax
    pop     r12
    pop     rbx
    ret

; ---------------------------------------------------------------------------
; uefi_read_key_wait(): u64
;   Мягкое ожидание события (если BS известна), иначе — просто активный опрос.
; ---------------------------------------------------------------------------
uefi_read_key_wait:
    ; Сначала быстрая попытка
    call    uefi_read_key
    test    rax, rax
    jnz     .done

    ; Попробуем подождать событие, если таблица BS есть
    push    rbx
    push    r12
    mov     rax, [rel uefi_st]
    test    rax, rax
    jz      .poll

    mov     rbx, [rax + ST_CONIN]
    test    rbx, rbx
    jz      .poll

    mov     r12, rsp
    and     rsp, -16
    sub     rsp, 32

    ; WaitForEvent(1, &ConIn->WaitForKey, &Index)
    ; Не у всех прошивок одинаковый оффсет WaitForEvent,
    ; поэтому безопаснее падать обратно к опросу, если вызов не удастся.
    mov     rdx, [rel uefi_st]
    mov     rdx, [rdx + ST_BOOTSERVICES]
    test    rdx, rdx
    jz      .poll_restore

    lea     r8,  [rbx + 16]       ; &WaitForKey (EFI_EVENT)
    lea     r9,  [rsp]            ; &Index (на стеке)
    mov     dword [rsp], 0

    mov     rax, [rdx + BS_WaitForEvent]
    mov     ecx, 1                ; NumberOfEvents
    mov     rdx, r8               ; *Events
    ; r8 = r9 уже выставлены
    call    rax

.poll_restore:
    mov     rsp, r12
    pop     r12
    pop     rbx

.poll:
    ; повторное чтение
    call    uefi_read_key
.done:
    ret

; ---------------------------------------------------------------------------
; Вспомогательная печать "MARK" — просто для отладки
; ---------------------------------------------------------------------------
uefi_print_marker:
    push    rbx
    push    r12
    mov     rax, [rel uefi_st]
    test    rax, rax
    jz      .done_m

    mov     rbx, [rax + ST_CONOUT]
    test    rbx, rbx
    jz      .done_m

    mov     r12, rsp
    and     rsp, -16
    sub     rsp, 32
    mov     rax, [rbx + OFF_OutputString]
    mov     rcx, rbx
    lea     rdx, [rel uefi_marker_msg]
    call    rax
    mov     rsp, r12
.done_m:
    pop     r12
    pop     rbx
    ret

section .rodata
uefi_entry_msg:  dw 'E','N','T','R','Y',0x0D,0x0A,0
uefi_marker_msg: dw 'M','A','R','K',0x0D,0x0A,0

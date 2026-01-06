; -----------------------------------------------------------------------------
; Simple NASM + libc example (x86-64 Linux, SysV ABI)
; Demonstrates PIE-friendly addressing and a call into libc (puts).
; -----------------------------------------------------------------------------
default rel           ; Use RIP-relative addressing by default (PIE-friendly)
global main           ; Export main for the linker/runtime
extern puts           ; Import libc puts symbol

; -----------------------------------------------------------------------------
; Read-only data section
; -----------------------------------------------------------------------------
section .rodata       ; Read-only data section
msg: db "Hello from NASM on WSL2 (Rayzen)!", 0 ; NUL-terminated C string

; -----------------------------------------------------------------------------
; Code section
; -----------------------------------------------------------------------------
section .text         ; Code section
main:                 ; Program entry point (C ABI)
	; Align the stack to 16 before the call (SysV ABI requirement)
	; On entry, RSP is 8-byte misaligned because of the return address.
	sub rsp, 8          ; rsp = rsp - 8, so call sees 16-byte alignment
	lea rdi, [msg]      ; First argument to puts(const char*) goes in RDI
	xor eax, eax        ; Clear AL (required for variadic calls; harmless here)
	call puts wrt ..plt ; Call through PLT for PIE (position-independent code)
	add rsp, 8          ; Restore stack pointer
	xor eax, eax        ; Return 0 (success) from main
	ret                 ; Return to libc runtime

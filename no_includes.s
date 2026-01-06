	.file	"no_includes.cpp"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	add2
	.def	add2;	.scl	2;	.type	32;	.endef
	.seh_proc	add2
add2:
	.seh_endprologue
	lea	eax, [rcx+rdx]
	ret
	.seh_endproc
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	sub	rsp, 104
	.seh_stackalloc	104
	.seh_endprologue
	call	__main
	mov	eax, 12337
	lea	rdx, 32[rsp]
	mov	r8d, 3
	mov	ecx, 1
	mov	WORD PTR 32[rsp], ax
	mov	BYTE PTR 34[rsp], 10
	call	write
	xor	eax, eax
	add	rsp, 104
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.ident	"GCC: (Rev7, Built by MSYS2 project) 15.1.0"
	.def	write;	.scl	2;	.type	32;	.endef

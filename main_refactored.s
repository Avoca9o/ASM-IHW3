	.file	"main_refactored.c"
	.intel_syntax noprefix
	.text
	.globl	getAbs
	.type	getAbs, @function
getAbs:						# в этой функции регистров процессора не используется, поэтому они и не выделяются
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -8[rbp], xmm0
	pxor	xmm0, xmm0
	comisd	xmm0, QWORD PTR -8[rbp]
	jbe	.L6
	movsd	xmm0, QWORD PTR -8[rbp]
	movq	xmm1, QWORD PTR .LC1[rip]
	xorpd	xmm0, xmm1
	jmp	.L4
.L6:
	movsd	xmm0, QWORD PTR -8[rbp]
.L4:
	movq	rax, xmm0
	movq	xmm0, rax
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getAbs, .-getAbs
	.section	.rodata
	.align 8
.LC3:
	.string	"A random number was generated: %lf\n"
	.align 8
.LC4:
	.string	"You should enter only file name or nothing to generate a random argument"
.LC5:
	.string	"r"
.LC6:
	.string	"Wrong filename"
.LC7:
	.string	"%lf"
	.align 8
.LC9:
	.string	"Wrong argument, it should be in (-1, 1)"
.LC10:
	.string	"w+"
.LC11:
	.string	"output.txt"
	.align 8
.LC12:
	.string	"The result is in file \"output.txt\""
.LC13:
	.string	"Working time: %ld ms\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r14				# выделение регистров процессора
	push	r13
	push	r12
	push	rbx
	sub	rsp, 32
	.cfi_offset 14, -24
	.cfi_offset 13, -32
	.cfi_offset 12, -40
	.cfi_offset 3, -48
	mov	DWORD PTR -52[rbp], edi
	mov	QWORD PTR -64[rbp], rsi
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -40[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -52[rbp], 1
	jne	.L8
	mov	edi, 0
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	call	rand@PLT
	sub	eax, 1
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, eax
	movsd	xmm1, QWORD PTR .LC2[rip]
	divsd	xmm0, xmm1
	movsd	QWORD PTR -48[rbp], xmm0
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	jmp	.L9
.L8:
	cmp	DWORD PTR -52[rbp], 2
	jle	.L10
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L16
.L10:
	mov	rax, QWORD PTR -64[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	rbx, rax
	test	rbx, rbx
	jne	.L12
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L16
.L12:
	lea	rax, -48[rbp]
	mov	rdx, rax
	lea	rax, .LC7[rip]
	mov	rsi, rax
	mov	rdi, rbx			# x в rbx вместо rbp
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	call	getAbs
	movq	rax, xmm0
	movq	xmm2, rax
	comisd	xmm2, QWORD PTR .LC8[rip]
	jbe	.L9
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L16
.L9:
	lea	rax, .LC10[rip]
	mov	rsi, rax
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	fopen@PLT
	mov	r14, rax			# output в r14 вместо rbp
	call	clock@PLT
	mov	r13, rax			# start в r13 вместо rbp
	mov	ebx, 0
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -48[rbp]
	movq	xmm0, rax
	call	res@PLT
	movq	r12, xmm0			# ans в r12 вместо rbp
	add	ebx, 1
.L14:
	cmp	ebx, 9999
	jle	.L15
	call	clock@PLT
	mov	rbx, rax
	movq	xmm0, r12			# использование ans в %lf
	lea	rax, .LC7[rip]
	mov	rsi, rax
	mov	rdi, r14			# берем output из r14
	mov	eax, 1
	call	fprintf@PLT
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rcx, rbx
	sub	rcx, r13			# end - start
	movabs	rdx, 2361183241434822607
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	sar	rcx, 63
	mov	rdx, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC13[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	mov	eax, 0
.L16:
	mov	rdx, QWORD PTR -40[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	add	rsp, 32
	pop	rbx				# освобождение регистров процессора
	pop	r12
	pop	r13
	pop	r14
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC1:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.align 8
.LC2:
	.long	-4194304
	.long	1105199103
	.align 8
.LC8:
	.long	-9007
	.long	1072693247
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

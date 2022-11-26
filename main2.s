	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	getAbs
	.type	getAbs, @function
getAbs:
	endbr64
	push	rbp
	mov	rbp, rsp
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
	ret
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
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi
	mov	QWORD PTR -80[rbp], rsi
	cmp	DWORD PTR -68[rbp], 1
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
	movsd	QWORD PTR -56[rbp], xmm0
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	lea	rax, .LC3[rip]
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT
	jmp	.L9
.L8:
	cmp	DWORD PTR -68[rbp], 2
	jle	.L10
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L16
.L10:
	mov	rax, QWORD PTR -80[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -24[rbp], rax
	cmp	QWORD PTR -24[rbp], 0
	jne	.L12
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 1
	jmp	.L16
.L12:
	lea	rdx, -56[rbp]
	mov	rax, QWORD PTR -24[rbp]
	lea	rcx, .LC7[rip]
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT
	mov	rax, QWORD PTR -56[rbp]
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
	mov	QWORD PTR -32[rbp], rax
	call	clock@PLT
	mov	QWORD PTR -40[rbp], rax
	mov	DWORD PTR -12[rbp], 0
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax
	call	res@PLT
	movq	rax, xmm0
	mov	QWORD PTR -8[rbp], rax
	add	DWORD PTR -12[rbp], 1
.L14:
	cmp	DWORD PTR -12[rbp], 9999
	jle	.L15
	call	clock@PLT
	mov	QWORD PTR -48[rbp], rax
	mov	rdx, QWORD PTR -8[rbp]
	mov	rax, QWORD PTR -32[rbp]
	movq	xmm0, rdx
	lea	rdx, .LC7[rip]
	mov	rsi, rdx
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT
	lea	rax, .LC12[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	rax, QWORD PTR -48[rbp]
	sub	rax, QWORD PTR -40[rbp]
	mov	rcx, rax
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
	leave
	ret
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

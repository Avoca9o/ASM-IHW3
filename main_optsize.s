	.file	"main.c"
	.text
	.globl	getAbs
	.type	getAbs, @function
getAbs:
.LFB36:
	.cfi_startproc
	endbr64
	xorps	%xmm1, %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L2
	xorps	.LC1(%rip), %xmm0
.L2:
	ret
	.cfi_endproc
.LFE36:
	.size	getAbs, .-getAbs
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC3:
	.string	"A random number was generated: %lf\n"
.LC4:
	.string	"You should enter only file name or nothing to generate a random argument"
.LC5:
	.string	"r"
.LC6:
	.string	"Wrong filename"
.LC7:
	.string	"%lf"
.LC9:
	.string	"Wrong argument, it should be in (-1, 1)"
.LC10:
	.string	"w+"
.LC11:
	.string	"output.txt"
.LC12:
	.string	"The result is in file \"output.txt\""
.LC13:
	.string	"Working time: %ld ms\n"
	.section	.text.startup,"ax",@progbits
	.globl	main
	.type	main, @function
main:
.LFB37:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	subq	$32, %rsp
	.cfi_def_cfa_offset 64
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	jne	.L7
	xorl	%edi, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	decl	%eax
	cvtsi2sdl	%eax, %xmm0
	movb	$1, %al
	divsd	.LC2(%rip), %xmm0
	movsd	%xmm0, 16(%rsp)
	call	__printf_chk@PLT
	jmp	.L8
.L7:
	cmpl	$2, %edi
	jle	.L9
	leaq	.LC4(%rip), %rdi
	jmp	.L21
.L9:
	movq	8(%rsi), %rdi
	leaq	.LC5(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	jne	.L11
	leaq	.LC6(%rip), %rdi
.L21:
	call	puts@PLT
	movl	$1, %eax
	jmp	.L6
.L11:
	xorl	%eax, %eax
	leaq	16(%rsp), %rdx
	leaq	.LC7(%rip), %rsi
	call	__isoc99_fscanf@PLT
	movsd	16(%rsp), %xmm0
	xorps	%xmm1, %xmm1
	comisd	%xmm0, %xmm1
	jbe	.L12
	xorps	.LC1(%rip), %xmm0
.L12:
	comisd	.LC8(%rip), %xmm0
	jbe	.L8
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	jmp	.L22
.L8:
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	movl	$10000, %ebx
	call	fopen@PLT
	movq	%rax, %r12
	call	clock@PLT
	movq	%rax, %rbp
.L15:
	movsd	16(%rsp), %xmm0
	call	res@PLT
	decl	%ebx
	jne	.L15
	movsd	%xmm0, 8(%rsp)
	call	clock@PLT
	movsd	8(%rsp), %xmm0
	movl	$1, %esi
	movq	%r12, %rdi
	leaq	.LC7(%rip), %rdx
	movq	%rax, %rbx
	movb	$1, %al
	call	__fprintf_chk@PLT
	leaq	.LC12(%rip), %rdi
	call	puts@PLT
	movq	%rbx, %rax
	movl	$1000, %ecx
	leaq	.LC13(%rip), %rsi
	subq	%rbp, %rax
	movl	$1, %edi
	cqto
	idivq	%rcx
	movq	%rax, %rdx
	xorl	%eax, %eax
	call	__printf_chk@PLT
.L22:
	xorl	%eax, %eax
.L6:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	addq	$32, %rsp
	.cfi_def_cfa_offset 32
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE37:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	-2147483648
	.long	0
	.long	0
	.section	.rodata.cst8,"aM",@progbits,8
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

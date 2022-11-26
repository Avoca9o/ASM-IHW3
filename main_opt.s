	.file	"main.c"
	.text
	.p2align 4
	.globl	getAbs
	.type	getAbs, @function
getAbs:
.LFB51:
	.cfi_startproc
	endbr64
	pxor	%xmm1, %xmm1
	comisd	%xmm0, %xmm1
	ja	.L6
	ret
	.p2align 4,,10
	.p2align 3
.L6:
	xorpd	.LC1(%rip), %xmm0
	ret
	.cfi_endproc
.LFE51:
	.size	getAbs, .-getAbs
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"A random number was generated: %lf\n"
	.align 8
.LC4:
	.string	"You should enter only file name or nothing to generate a random argument"
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC5:
	.string	"r"
.LC6:
	.string	"Wrong filename"
.LC7:
	.string	"%lf"
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"Wrong argument, it should be in (-1, 1)"
	.section	.rodata.str1.1
.LC10:
	.string	"w+"
.LC11:
	.string	"output.txt"
	.section	.rodata.str1.8
	.align 8
.LC12:
	.string	"The result is in file \"output.txt\""
	.section	.rodata.str1.1
.LC13:
	.string	"Working time: %ld ms\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB52:
	.cfi_startproc
	endbr64
	pushq	%r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	pushq	%r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	pushq	%rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	pushq	%rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	subq	$40, %rsp
	.cfi_def_cfa_offset 80
	movq	%fs:40, %rax
	movq	%rax, 24(%rsp)
	xorl	%eax, %eax
	cmpl	$1, %edi
	je	.L22
	cmpl	$2, %edi
	jg	.L23
	movq	8(%rsi), %rdi
	leaq	.LC5(%rip), %rsi
	call	fopen@PLT
	movq	%rax, %rdi
	testq	%rax, %rax
	je	.L24
	leaq	.LC7(%rip), %r13
	xorl	%eax, %eax
	leaq	16(%rsp), %rdx
	movq	%r13, %rsi
	call	__isoc99_fscanf@PLT
	movsd	16(%rsp), %xmm0
	pxor	%xmm1, %xmm1
	comisd	%xmm0, %xmm1
	ja	.L25
.L13:
	comisd	.LC8(%rip), %xmm0
	ja	.L26
.L9:
	leaq	.LC10(%rip), %rsi
	leaq	.LC11(%rip), %rdi
	movl	$10000, %ebx
	call	fopen@PLT
	movq	%rax, %r12
	call	clock@PLT
	movq	%rax, %rbp
	.p2align 4,,10
	.p2align 3
.L16:
	movsd	16(%rsp), %xmm0
	call	res@PLT
	subl	$1, %ebx
	jne	.L16
	movsd	%xmm0, 8(%rsp)
	call	clock@PLT
	movq	%r13, %rdx
	movl	$1, %esi
	movq	%r12, %rdi
	movsd	8(%rsp), %xmm0
	movq	%rax, %rbx
	movl	$1, %eax
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
	xorl	%eax, %eax
.L7:
	movq	24(%rsp), %rdx
	subq	%fs:40, %rdx
	jne	.L27
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	popq	%rbx
	.cfi_def_cfa_offset 32
	popq	%rbp
	.cfi_def_cfa_offset 24
	popq	%r12
	.cfi_def_cfa_offset 16
	popq	%r13
	.cfi_def_cfa_offset 8
	ret
.L23:
	.cfi_restore_state
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L7
.L22:
	xorl	%edi, %edi
	leaq	.LC7(%rip), %r13
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	call	rand@PLT
	pxor	%xmm0, %xmm0
	movl	$1, %edi
	leaq	.LC3(%rip), %rsi
	subl	$1, %eax
	cvtsi2sdl	%eax, %xmm0
	movl	$1, %eax
	divsd	.LC2(%rip), %xmm0
	movsd	%xmm0, 16(%rsp)
	call	__printf_chk@PLT
	jmp	.L9
.L25:
	xorpd	.LC1(%rip), %xmm0
	jmp	.L13
.L26:
	leaq	.LC9(%rip), %rdi
	call	puts@PLT
	xorl	%eax, %eax
	jmp	.L7
.L27:
	call	__stack_chk_fail@PLT
.L24:
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$1, %eax
	jmp	.L7
	.cfi_endproc
.LFE52:
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

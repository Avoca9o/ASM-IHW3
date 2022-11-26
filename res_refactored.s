	.file	"res_refactored.c"
	.intel_syntax noprefix
	.text
	.globl	res
	.type	res, @function
res:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movsd	QWORD PTR -8[rbp], xmm0
	movsd	xmm3, QWORD PTR -8[rbp]		# cur в xmm3, а не xmm0
	movsd	QWORD PTR -16[rbp], xmm3
	movsd	xmm4, QWORD PTR .LC0[rip]	# out в xmmr4, а не xmm0
	movsd	QWORD PTR -24[rbp], xmm4
	jmp	.L2
.L3:
	movsd	xmm2, QWORD PTR -24[rbp]	# временные переменные в xmm2 и xmm1, а не все время в xmm0
	movsd	xmm1, QWORD PTR -16[rbp]
	addsd	xmm2, xmm1
	movsd	QWORD PTR -24[rbp], xmm2
	mulsd	xmm1, QWORD PTR -8[rbp]
	movsd	QWORD PTR -16[rbp], xmm1
.L2:
	movsd	xmm0, QWORD PTR -16[rbp]
	call	getAbs@PLT
	movq	rax, xmm0
	movq	xmm5, rax			# результат getAbs в xmm5, а не xmm0
	comisd	xmm5, QWORD PTR .LC1[rip]
	ja	.L3
	mov	rax, QWORD PTR -24[rbp]
	movq	xmm0, rax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	res, .-res
	.section	.rodata
	.align 8
.LC0:
	.long	0
	.long	1072693248
	.align 8
.LC1:
	.long	-755914244
	.long	1061184077
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

	.file	"res.c"
	.text
	.p2align 4
	.globl	res
	.type	res, @function
res:
.LFB23:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movapd	%xmm0, %xmm1
	movsd	.LC0(%rip), %xmm2
	movsd	%xmm0, 24(%rsp)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L3:
	addsd	%xmm1, %xmm2
	mulsd	24(%rsp), %xmm1
.L2:
	movapd	%xmm1, %xmm0
	movsd	%xmm2, 16(%rsp)
	movsd	%xmm1, 8(%rsp)
	call	getAbs@PLT
	comisd	.LC1(%rip), %xmm0
	movsd	8(%rsp), %xmm1
	movsd	16(%rsp), %xmm2
	ja	.L3
	movapd	%xmm2, %xmm0
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	res, .-res
	.section	.rodata.cst8,"aM",@progbits,8
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

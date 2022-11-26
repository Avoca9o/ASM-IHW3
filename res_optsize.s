	.file	"res.c"
	.text
	.globl	res
	.type	res, @function
res:
.LFB13:
	.cfi_startproc
	endbr64
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movsd	.LC0(%rip), %xmm3
	movaps	%xmm0, %xmm2
	movaps	%xmm0, %xmm1
.L2:
	movaps	%xmm1, %xmm0
	movsd	%xmm2, 24(%rsp)
	movsd	%xmm3, 16(%rsp)
	movsd	%xmm1, 8(%rsp)
	call	getAbs@PLT
	comisd	.LC1(%rip), %xmm0
	movsd	8(%rsp), %xmm1
	movsd	16(%rsp), %xmm3
	movsd	24(%rsp), %xmm2
	jbe	.L6
	addsd	%xmm1, %xmm3
	mulsd	%xmm2, %xmm1
	jmp	.L2
.L6:
	movaps	%xmm3, %xmm0
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE13:
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

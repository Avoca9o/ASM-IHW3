	.file	"res.c"				# объявление файла
	.intel_syntax noprefix			# выбор синтаксиса ассемблера
	.text
	.globl	res				# объявление функции res
	.type	res, @function
res:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp				# эпилог функции res
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	movsd	QWORD PTR -24[rbp], xmm0	# принимаем х в качестве параметра (снимаем с верхушки стека)
	movsd	xmm0, QWORD PTR -24[rbp]	# cur = x
	movsd	QWORD PTR -16[rbp], xmm0
	movsd	xmm0, QWORD PTR .LC0[rip]
	movsd	QWORD PTR -8[rbp], xmm0		# out = 1
	jmp	.L2
.L3:	while (getAbs(cur) > 0.0005) - идем сюда
	movsd	xmm0, QWORD PTR -8[rbp]		# получаем out
	addsd	xmm0, QWORD PTR -16[rbp]	# out + cur в переменную 
	movsd	QWORD PTR -8[rbp], xmm0		# out присваиваем значение из переменной
	movsd	xmm0, QWORD PTR -16[rbp]	# cur во временный регистр
	mulsd	xmm0, QWORD PTR -24[rbp]	# cur * x во временный регистр
	movsd	QWORD PTR -16[rbp], xmm0	# cur *= x
.L2:
	mov	rax, QWORD PTR -16[rbp]		# берем cur
	movq	xmm0, rax
	call	getAbs@PLT			# getAbs(cur)
	movq	rax, xmm0
	movq	xmm1, rax
	comisd	xmm1, QWORD PTR .LC1[rip]	# getAbs(cur) > 0.0005
	ja	.L3
	movsd	xmm0, QWORD PTR -8[rbp]		# берем out
	movq	rax, xmm0			# результат на верхушку стека
	movq	xmm0, rax			# return out
	leave
	.cfi_def_cfa 7, 8			# эпилог функции res
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

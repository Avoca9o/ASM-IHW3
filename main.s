	.file	"main.c"			# название файла
	.intel_syntax noprefix			# выбор синтаксиса ассемблера
	.text
	.globl	getAbs				# объявление функции getAbs
	.type	getAbs, @function
getAbs:
.LFB6:
	.cfi_startproc				
	endbr64
	push	rbp				# пролог функции getAbs
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp			
	.cfi_def_cfa_register 6
	movsd	QWORD PTR -8[rbp], xmm0		# копирование х во временный регистр
	pxor	xmm0, xmm0
	comisd	xmm0, QWORD PTR -8[rbp]		# if (x < 0)
	jbe	.L6
	movsd	xmm0, QWORD PTR -8[rbp]		# return -x
	movq	xmm1, QWORD PTR .LC1[rip]
	xorpd	xmm0, xmm1
	jmp	.L4
.L6:
	movsd	xmm0, QWORD PTR -8[rbp]		# else return x
.L4:
	movq	rax, xmm0			# эпилог функции getAbs,
	movq	xmm0, rax			# копирование х в регистр rax
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	getAbs, .-getAbs
	.section	.rodata
	.align 8
.LC3:						# string pool (LC3-LC13)
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
	.globl	main				# объявление функции main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp				# пролог функции main
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 80
	mov	DWORD PTR -68[rbp], edi		# argc
	mov	QWORD PTR -80[rbp], rsi		# argv
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -68[rbp], 1		# if argc == 1
	jne	.L8
	mov	edi, 0				# берем NULL во временное значение
	call	time@PLT			# time(NULL)
	mov	edi, eax			# сохраняем результат
	call	srand@PLT			# srand(time(NULL))
	call	rand@PLT			# вызов rand()
	sub	eax, 1				# rand() - 1
	pxor	xmm0, xmm0			# cast to double
	cvtsi2sd	xmm0, eax		
	movsd	xmm1, QWORD PTR .LC2[rip]	# берем RAND_MAX
	divsd	xmm0, xmm1			# промежуточный результат / RAND_MAX
	movsd	QWORD PTR -56[rbp], xmm0	# x = (double)(rand() - 1) / RAND_MAX
	mov	rax, QWORD PTR -56[rbp]		# подставляем значение в %lf
	movq	xmm0, rax
	lea	rax, .LC3[rip]			# берем строку из L3
	mov	rdi, rax
	mov	eax, 1
	call	printf@PLT			# печатаем эту строку
	jmp	.L9
.L8:
	cmp	DWORD PTR -68[rbp], 2		# else if (argc > 2)
	jle	.L10
	lea	rax, .LC4[rip]			# копируем строку из L4
	mov	rdi, rax
	call	puts@PLT			# printf("You should enter only file name or nothing to generate a random argument\n");
	mov	eax, 1				# return 1
	jmp	.L16
.L10:
	mov	rax, QWORD PTR -80[rbp]		# берем argv[1]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC5[rip]			# берем "r" из LC5
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT			# fopen(argv[1], "r")
	mov	QWORD PTR -40[rbp], rax		# копируем полученный результат в input
	cmp	QWORD PTR -40[rbp], 0		# if ((input = fopen(argv[1], "r")) == 0)
	jne	.L12
	lea	rax, .LC6[rip]			# копируем строку из LC6
	mov	rdi, rax
	call	puts@PLT			# printf("Wrong filename\n")
	mov	eax, 1				# return 1
	jmp	.L16
.L12:
	lea	rdx, -56[rbp]
	mov	rax, QWORD PTR -40[rbp]		# копируем input в rax
	lea	rcx, .LC7[rip]			# "%lf" из LC7
	mov	rsi, rcx
	mov	rdi, rax
	mov	eax, 0
	call	__isoc99_fscanf@PLT		# fscanf(input, "%lf", &x)
	mov	rax, QWORD PTR -56[rbp]
	movq	xmm0, rax			# сохранить х во временном регистре
	call	getAbs				# вызов getabs(x)
	movq	rax, xmm0			
	movq	xmm2, rax			# сохранить результат во временном регистре
	comisd	xmm2, QWORD PTR .LC8[rip]	# if (getAbs(x) > 0.999999999999)
	jbe	.L9
	lea	rax, .LC9[rip]			# берем строку из LC9
	mov	rdi, rax
	call	puts@PLT			# printf("Wrong argument, it should be in (-1, 1)\n")
	mov	eax, 0				# return 0
	jmp	.L16
.L9:
	lea	rax, .LC10[rip]			# берем "output.txt" из LC10
	mov	rsi, rax
	lea	rax, .LC11[rip]			# берем "w+" из LC11
	mov	rdi, rax
	call	fopen@PLT			# fopen("output.txt", "w+")
	mov	QWORD PTR -32[rbp], rax		# output = то что вернул fopen
	call	clock@PLT			# clock()
	mov	QWORD PTR -24[rbp], rax		# start = то что вернул clock()
	mov	DWORD PTR -60[rbp], 0		# i = 0, начало цикла
	jmp	.L14
.L15:
	mov	rax, QWORD PTR -56[rbp]		# передача параметра x в функцию res (если быть точнее, отправление его наверх стека)
	movq	xmm0, rax
	call	res@PLT				# вызов функции res
	movq	rax, xmm0			
	mov	QWORD PTR -48[rbp], rax		# присваивание ans того что вернул res
	add	DWORD PTR -60[rbp], 1		# ++i
.L14:
	cmp	DWORD PTR -60[rbp], 9999	# i < 10000
	jle	.L15
	call	clock@PLT			# clock()
	mov	QWORD PTR -16[rbp], rax		# end = то что вернул clock()
	mov	rdx, QWORD PTR -48[rbp]		# берем ans
	mov	rax, QWORD PTR -32[rbp]		# берем output
	movq	xmm0, rdx			# ans в "%lf"
	lea	rdx, .LC7[rip]			# берем строку из LC7
	mov	rsi, rdx			# подставновка %lf
	mov	rdi, rax
	mov	eax, 1
	call	fprintf@PLT			# fprintf(output, "%lf", ans)
	lea	rax, .LC12[rip]			# берем строку из LC12
	mov	rdi, rax
	call	puts@PLT			# printf("The result is in file \"output.txt\"\n")
	mov	rax, QWORD PTR -16[rbp]		# берем end
	sub	rax, QWORD PTR -24[rbp]		# берем end - start
	mov	rcx, rax
	movabs	rdx, 2361183241434822607	# (end - start) / 1000
	mov	rax, rcx
	imul	rdx
	mov	rax, rdx
	sar	rax, 7
	sar	rcx, 63
	mov	rdx, rcx
	sub	rax, rdx
	mov	rsi, rax
	lea	rax, .LC13[rip]			# берем строку из LC13
	mov	rdi, rax			# подставляем в %ld вычисленное значение
	mov	eax, 0
	call	printf@PLT			# printf("Working time: %ld ms\n", (end - start) / 1000)
	mov	eax, 0				# return 0
.L16:
	mov	rdx, QWORD PTR -8[rbp]		# эпилог функции main
	sub	rdx, QWORD PTR fs:40
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
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

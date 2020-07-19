	.file	"8nnkt.c"
	.text
	.section	.rodata
.LC0:
	.string	"%*d "
.LC1:
	.string	"%d\n"
	.text
	.globl	run
	.type	run, @function
run:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$928, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, -920(%rbp)
	jmp	.L2
.L6:
	movl	-920(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -916(%rbp)
	jmp	.L3
.L5:
	movl	-920(%rbp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	%eax, %ecx
	movl	-916(%rbp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	negl	%eax
	addl	%ecx, %eax
	movl	%eax, -792(%rbp)
	movl	-920(%rbp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	-916(%rbp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -788(%rbp)
	movl	-916(%rbp), %eax
	cltq
	movl	-920(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	d.2950(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-916(%rbp), %eax
	cltq
	movl	-920(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	U.2951(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-916(%rbp), %eax
	cltq
	movl	-920(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	V.2952(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-916(%rbp), %eax
	cltq
	movl	-920(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c.2953(%rip), %rax
	movl	$0, (%rdx,%rax)
	movl	-792(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-788(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	cmpl	$5, %eax
	jne	.L4
	movl	-916(%rbp), %eax
	cltq
	movl	-920(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	d.2950(%rip), %rax
	movl	$1, (%rdx,%rax)
	call	rand@PLT
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	-916(%rbp), %eax
	cltq
	movl	-920(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	V.2952(%rip), %rax
	movl	%ecx, (%rdx,%rax)
.L4:
	addl	$1, -916(%rbp)
.L3:
	cmpl	$63, -916(%rbp)
	jle	.L5
	addl	$1, -920(%rbp)
.L2:
	cmpl	$63, -920(%rbp)
	jle	.L6
	movl	$0, -912(%rbp)
.L56:
	addl	$1, -912(%rbp)
	movl	$0, -908(%rbp)
	jmp	.L7
.L13:
	movl	-908(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -904(%rbp)
	jmp	.L8
.L12:
	movl	-904(%rbp), %eax
	cltq
	movl	-908(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	d.2950(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	jne	.L9
	movl	$4, -900(%rbp)
	movl	$0, -896(%rbp)
	jmp	.L10
.L11:
	movl	-908(%rbp), %eax
	cmpl	%eax, -896(%rbp)
	cmovle	-896(%rbp), %eax
	movl	%eax, -808(%rbp)
	movl	-904(%rbp), %eax
	cmpl	%eax, -896(%rbp)
	cmovle	-896(%rbp), %eax
	movl	%eax, -804(%rbp)
	movl	-908(%rbp), %eax
	cmpl	%eax, -896(%rbp)
	cmovge	-896(%rbp), %eax
	movl	%eax, -800(%rbp)
	movl	-904(%rbp), %eax
	cmpl	%eax, -896(%rbp)
	cmovge	-896(%rbp), %eax
	movl	%eax, -796(%rbp)
	movl	-800(%rbp), %eax
	cltq
	movl	-808(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	d.2950(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-800(%rbp), %eax
	cltq
	movl	-808(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	V.2952(%rip), %rax
	movl	(%rcx,%rax), %eax
	imull	%eax, %edx
	movl	-796(%rbp), %eax
	cltq
	movl	-804(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	d.2950(%rip), %rax
	movl	(%rcx,%rax), %ecx
	movl	-796(%rbp), %eax
	cltq
	movl	-804(%rbp), %esi
	movslq	%esi, %rsi
	salq	$6, %rsi
	addq	%rsi, %rax
	leaq	0(,%rax,4), %rsi
	leaq	V.2952(%rip), %rax
	movl	(%rsi,%rax), %eax
	imull	%ecx, %eax
	addl	%edx, %eax
	subl	%eax, -900(%rbp)
	addl	$1, -896(%rbp)
.L10:
	cmpl	$63, -896(%rbp)
	jle	.L11
	movl	-904(%rbp), %eax
	cltq
	movl	-908(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	c.2953(%rip), %rdx
	movl	-900(%rbp), %eax
	movl	%eax, (%rcx,%rdx)
.L9:
	addl	$1, -904(%rbp)
.L8:
	cmpl	$63, -904(%rbp)
	jle	.L12
	addl	$1, -908(%rbp)
.L7:
	cmpl	$63, -908(%rbp)
	jle	.L13
	movl	$0, -892(%rbp)
	jmp	.L14
.L19:
	movl	-892(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -888(%rbp)
	jmp	.L15
.L18:
	movl	-888(%rbp), %eax
	cltq
	movl	-892(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	U.2951(%rip), %rax
	movl	(%rdx,%rax), %edx
	movl	-888(%rbp), %eax
	cltq
	movl	-892(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	c.2953(%rip), %rax
	movl	(%rcx,%rax), %eax
	leal	(%rdx,%rax), %ecx
	movl	-888(%rbp), %eax
	cltq
	movl	-892(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	U.2951(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	movl	-888(%rbp), %eax
	cltq
	movl	-892(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	U.2951(%rip), %rax
	movl	(%rdx,%rax), %eax
	movl	%eax, -812(%rbp)
	cmpl	$3, -812(%rbp)
	setg	%al
	movzbl	%al, %edx
	cmpl	$3, -812(%rbp)
	jg	.L16
	cmpl	$0, -812(%rbp)
	js	.L16
	movl	$1, %esi
	jmp	.L17
.L16:
	movl	$0, %esi
.L17:
	movl	-888(%rbp), %eax
	cltq
	movl	-892(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rcx, %rax
	leaq	0(,%rax,4), %rcx
	leaq	V.2952(%rip), %rax
	movl	(%rcx,%rax), %eax
	imull	%esi, %eax
	leal	(%rdx,%rax), %ecx
	movl	-888(%rbp), %eax
	cltq
	movl	-892(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	V.2952(%rip), %rax
	movl	%ecx, (%rdx,%rax)
	addl	$1, -888(%rbp)
.L15:
	cmpl	$63, -888(%rbp)
	jle	.L18
	addl	$1, -892(%rbp)
.L14:
	cmpl	$63, -892(%rbp)
	jle	.L19
	movl	-912(%rbp), %edx
	movslq	%edx, %rax
	imulq	$274877907, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$6, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	$1000, %eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L56
	movl	$0, -884(%rbp)
	movl	$0, -880(%rbp)
	movl	$0, -876(%rbp)
	jmp	.L21
.L24:
	movl	-876(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -872(%rbp)
	jmp	.L22
.L23:
	movl	-872(%rbp), %eax
	cltq
	movl	-876(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	c.2953(%rip), %rax
	movl	(%rdx,%rax), %eax
	cltd
	xorl	%edx, %eax
	subl	%edx, %eax
	addl	%eax, -884(%rbp)
	movl	-872(%rbp), %eax
	cltq
	movl	-876(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	U.2951(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	%eax, -880(%rbp)
	cmovge	-880(%rbp), %eax
	movl	%eax, -880(%rbp)
	addl	$1, -872(%rbp)
.L22:
	cmpl	$63, -872(%rbp)
	jle	.L23
	addl	$1, -876(%rbp)
.L21:
	cmpl	$63, -876(%rbp)
	jle	.L24
	cmpl	$1000, -880(%rbp)
	jg	.L25
	cmpl	$250000, -912(%rbp)
	jle	.L26
.L25:
	movl	$0, %eax
	jmp	.L27
.L26:
	cmpl	$0, -884(%rbp)
	jne	.L28
	movl	$0, -868(%rbp)
	movl	$0, -864(%rbp)
	jmp	.L29
.L32:
	movl	-864(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -860(%rbp)
	jmp	.L30
.L31:
	movl	-860(%rbp), %eax
	cltq
	movl	-864(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	V.2952(%rip), %rax
	movl	(%rdx,%rax), %eax
	addl	%eax, -868(%rbp)
	addl	$1, -860(%rbp)
.L30:
	cmpl	$63, -860(%rbp)
	jle	.L31
	addl	$1, -864(%rbp)
.L29:
	cmpl	$63, -864(%rbp)
	jle	.L32
	cmpl	$64, -868(%rbp)
	je	.L33
	movl	$0, %eax
	jmp	.L27
.L33:
	movl	$0, -856(%rbp)
	movl	$0, -852(%rbp)
	jmp	.L35
.L36:
	movl	-852(%rbp), %eax
	cltq
	movl	$0, -784(%rbp,%rax,4)
	movl	-852(%rbp), %eax
	cltq
	movl	$0, -528(%rbp,%rax,4)
	movl	-852(%rbp), %eax
	cltq
	movl	$0, -272(%rbp,%rax,4)
	addl	$1, -852(%rbp)
.L35:
	cmpl	$63, -852(%rbp)
	jle	.L36
	movl	$0, -848(%rbp)
	jmp	.L37
.L41:
	movl	-848(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -844(%rbp)
	jmp	.L38
.L40:
	movl	-844(%rbp), %eax
	cltq
	movl	-848(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rdx, %rax
	leaq	0(,%rax,4), %rdx
	leaq	V.2952(%rip), %rax
	movl	(%rdx,%rax), %eax
	cmpl	$1, %eax
	jne	.L39
	movl	-856(%rbp), %eax
	cltq
	movl	-848(%rbp), %edx
	movl	%edx, -784(%rbp,%rax,4)
	movl	-856(%rbp), %eax
	cltq
	movl	-844(%rbp), %edx
	movl	%edx, -528(%rbp,%rax,4)
	addl	$1, -856(%rbp)
.L39:
	addl	$1, -844(%rbp)
.L38:
	cmpl	$63, -844(%rbp)
	jle	.L40
	addl	$1, -848(%rbp)
.L37:
	cmpl	$63, -848(%rbp)
	jle	.L41
	movl	$1, -272(%rbp)
	movl	$0, -840(%rbp)
	movl	$1, -836(%rbp)
	jmp	.L42
.L50:
	movl	$0, -832(%rbp)
	jmp	.L43
.L49:
	movl	-832(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %eax
	cmpl	%eax, -840(%rbp)
	je	.L44
	movl	-832(%rbp), %eax
	cltq
	movl	-528(%rbp,%rax,4), %eax
	cmpl	%eax, -840(%rbp)
	jne	.L45
.L44:
	movl	-832(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %eax
	cmpl	%eax, -840(%rbp)
	jne	.L46
	movl	-832(%rbp), %eax
	cltq
	movl	-528(%rbp,%rax,4), %eax
	jmp	.L47
.L46:
	movl	-832(%rbp), %eax
	cltq
	movl	-784(%rbp,%rax,4), %eax
.L47:
	movl	%eax, -816(%rbp)
	movl	-816(%rbp), %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L45
	movl	-836(%rbp), %eax
	leal	1(%rax), %edx
	movl	-816(%rbp), %eax
	cltq
	movl	%edx, -272(%rbp,%rax,4)
	movl	-816(%rbp), %eax
	movl	%eax, -840(%rbp)
	jmp	.L48
.L45:
	addl	$1, -832(%rbp)
.L43:
	cmpl	$63, -832(%rbp)
	jle	.L49
.L48:
	addl	$1, -836(%rbp)
.L42:
	cmpl	$63, -836(%rbp)
	jle	.L50
	movl	$1, -828(%rbp)
	movl	$0, -824(%rbp)
	jmp	.L51
.L55:
	movl	$0, -820(%rbp)
	jmp	.L52
.L54:
	movl	-824(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-820(%rbp), %eax
	addl	%edx, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	movl	%eax, %edx
	movl	$2, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	-824(%rbp), %eax
	leal	0(,%rax,8), %edx
	movl	-820(%rbp), %eax
	addl	%edx, %eax
	cltq
	movl	-272(%rbp,%rax,4), %eax
	testl	%eax, %eax
	jne	.L53
	movl	$0, -828(%rbp)
.L53:
	addl	$1, -820(%rbp)
.L52:
	cmpl	$7, -820(%rbp)
	jle	.L54
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -824(%rbp)
.L51:
	cmpl	$7, -824(%rbp)
	jle	.L55
	movl	-828(%rbp), %eax
	jmp	.L27
.L28:
	movl	-912(%rbp), %edx
	movslq	%edx, %rax
	imulq	$351843721, %rax, %rax
	shrq	$32, %rax
	movl	%eax, %ecx
	sarl	$11, %ecx
	movl	%edx, %eax
	sarl	$31, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	imull	$25000, %eax, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	testl	%eax, %eax
	jne	.L56
	movl	-912(%rbp), %eax
	movslq	%eax, %rdx
	imulq	$351843721, %rdx, %rdx
	shrq	$32, %rdx
	sarl	$11, %edx
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L56
.L27:
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L57
	call	__stack_chk_fail@PLT
.L57:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	run, .-run
	.section	.rodata
.LC2:
	.string	"time taken: %ld\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -16(%rbp)
	nop
.L59:
	movl	$0, %eax
	call	run
	testl	%eax, %eax
	je	.L59
	movl	$0, %edi
	call	time@PLT
	movq	%rax, -8(%rbp)
	movq	-8(%rbp), %rax
	subq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.local	d.2950
	.comm	d.2950,16384,32
	.local	U.2951
	.comm	U.2951,16384,32
	.local	V.2952
	.comm	V.2952,16384,32
	.local	c.2953
	.comm	c.2953,16384,32
	.ident	"GCC: (Ubuntu 9.3.0-10ubuntu2) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:

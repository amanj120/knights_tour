	.file	"cfnn.c"
	.text
	.section	.rodata
.LC0:
	.string	"s = ["
.LC1:
	.string	"(%d,%d),"
.LC2:
	.string	"]"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	addq	$-128, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	$0, %edi
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movl	$0, -12412(%rbp)
	jmp	.L2
.L6:
	movl	-12412(%rbp), %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	movl	$0, -12408(%rbp)
	jmp	.L3
.L5:
	movl	-12412(%rbp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	%eax, %ecx
	movl	-12408(%rbp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	negl	%eax
	addl	%ecx, %eax
	movl	%eax, -12376(%rbp)
	movl	-12412(%rbp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	-12408(%rbp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, -12372(%rbp)
	movl	-12408(%rbp), %eax
	cltq
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$12368, %rax
	movb	$0, (%rax)
	movl	-12408(%rbp), %eax
	cltq
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$8272, %rax
	movb	$0, (%rax)
	movl	-12408(%rbp), %eax
	cltq
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$4176, %rax
	movb	$0, (%rax)
	movl	-12376(%rbp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	-12372(%rbp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	cmpl	$5, %eax
	jne	.L4
	movl	-12408(%rbp), %eax
	cltq
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$12368, %rax
	movb	$1, (%rax)
	movl	-12412(%rbp), %eax
	cltq
	movl	-12408(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$12368, %rax
	movb	$1, (%rax)
	call	rand@PLT
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	-12408(%rbp), %eax
	cltq
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$8272, %rax
	movb	%cl, (%rax)
	movl	-12408(%rbp), %eax
	cltq
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$8272, %rax
	movzbl	(%rax), %eax
	movl	-12412(%rbp), %edx
	movslq	%edx, %rdx
	movl	-12408(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rbp, %rcx
	addq	%rcx, %rdx
	subq	$8272, %rdx
	movb	%al, (%rdx)
.L4:
	addl	$1, -12408(%rbp)
.L3:
	cmpl	$63, -12408(%rbp)
	jle	.L5
	addl	$1, -12412(%rbp)
.L2:
	cmpl	$63, -12412(%rbp)
	jle	.L6
	movl	$0, -12404(%rbp)
	jmp	.L7
.L18:
	movl	$0, -12400(%rbp)
	jmp	.L8
.L11:
	movl	-12400(%rbp), %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	movl	$0, -12384(%rbp)
	jmp	.L9
.L10:
	movl	-12400(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movl	%eax, %ecx
	movl	-12384(%rbp), %eax
	cltq
	movl	-12400(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$8272, %rax
	movzbl	(%rax), %eax
	addl	%ecx, %eax
	movl	%eax, %edx
	movl	-12400(%rbp), %eax
	cltq
	movb	%dl, -80(%rbp,%rax)
	addl	$1, -12384(%rbp)
.L9:
	cmpl	$64, -12384(%rbp)
	jl	.L10
	addl	$1, -12400(%rbp)
.L8:
	cmpl	$63, -12400(%rbp)
	jle	.L11
	movl	$0, -12396(%rbp)
	jmp	.L12
.L17:
	movl	$0, -12380(%rbp)
	jmp	.L13
.L16:
	movl	-12380(%rbp), %eax
	cltq
	movl	-12396(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$4176, %rax
	movzbl	(%rax), %eax
	movl	%eax, %ecx
	movl	-12396(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movsbl	%al, %eax
	movl	$4, %edx
	subl	%eax, %edx
	movl	-12380(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	movsbl	%al, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %esi
	movl	-12380(%rbp), %eax
	cltq
	movl	-12396(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$12368, %rax
	movzbl	(%rax), %edx
	movl	%esi, %eax
	imull	%edx, %eax
	addl	%ecx, %eax
	movl	%eax, %ecx
	movl	-12380(%rbp), %eax
	cltq
	movl	-12396(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$4176, %rax
	movb	%cl, (%rax)
	movl	-12380(%rbp), %eax
	cltq
	movl	-12396(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$4176, %rax
	movzbl	(%rax), %eax
	movsbl	%al, %eax
	movl	-12380(%rbp), %edx
	movslq	%edx, %rdx
	movl	-12396(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rbp, %rcx
	addq	%rcx, %rdx
	subq	$4176, %rdx
	movzbl	(%rdx), %edx
	movsbl	%dl, %edx
	andl	$252, %edx
	testl	%edx, %edx
	sete	%dl
	movzbl	%dl, %ecx
	movl	-12380(%rbp), %edx
	movslq	%edx, %rdx
	movl	-12396(%rbp), %esi
	movslq	%esi, %rsi
	salq	$6, %rsi
	addq	%rbp, %rsi
	addq	%rsi, %rdx
	subq	$8272, %rdx
	movzbl	(%rdx), %edx
	movzbl	%dl, %edx
	imull	%ecx, %edx
	addl	$3, %edx
	cmpl	%edx, %eax
	jle	.L14
	movl	-12380(%rbp), %eax
	cltq
	movl	-12396(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$12368, %rax
	movzbl	(%rax), %eax
	jmp	.L15
.L14:
	movl	$0, %eax
.L15:
	movl	-12380(%rbp), %edx
	movslq	%edx, %rdx
	movl	-12396(%rbp), %ecx
	movslq	%ecx, %rcx
	salq	$6, %rcx
	addq	%rbp, %rcx
	addq	%rcx, %rdx
	subq	$8272, %rdx
	movb	%al, (%rdx)
	addl	$1, -12380(%rbp)
.L13:
	cmpl	$64, -12380(%rbp)
	jl	.L16
	addl	$1, -12396(%rbp)
.L12:
	cmpl	$63, -12396(%rbp)
	jle	.L17
	addl	$1, -12404(%rbp)
.L7:
	cmpl	$199999, -12404(%rbp)
	jle	.L18
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, -12392(%rbp)
	jmp	.L19
.L23:
	movl	$0, -12388(%rbp)
	jmp	.L20
.L22:
	movl	-12388(%rbp), %eax
	cltq
	movl	-12392(%rbp), %edx
	movslq	%edx, %rdx
	salq	$6, %rdx
	addq	%rbp, %rdx
	addq	%rdx, %rax
	subq	$8272, %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	je	.L21
	movl	-12388(%rbp), %edx
	movl	-12392(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L21:
	addl	$1, -12388(%rbp)
.L20:
	cmpl	$63, -12388(%rbp)
	jle	.L22
	addl	$1, -12392(%rbp)
.L19:
	cmpl	$63, -12392(%rbp)
	jle	.L23
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	movq	-8(%rbp), %rdi
	xorq	%fs:40, %rdi
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
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

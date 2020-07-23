	.file	"simd.c"
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
.LFB4006:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	andq	$-32, %rsp
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$4096, %rsp
	orq	$0, (%rsp)
	subq	$1408, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movq	%fs:40, %rax
	movq	%rax, 13688(%rsp)
	xorl	%eax, %eax
	movl	$1595392855, %edi
	call	srand@PLT
	movl	$0, 196(%rsp)
	jmp	.L2
.L6:
	movl	$0, 200(%rsp)
	jmp	.L3
.L5:
	movl	196(%rsp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	movl	%eax, %ecx
	movl	200(%rsp), %eax
	leal	7(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$3, %eax
	negl	%eax
	addl	%ecx, %eax
	movl	%eax, 232(%rsp)
	movl	196(%rsp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	200(%rsp), %eax
	cltd
	shrl	$29, %edx
	addl	%edx, %eax
	andl	$7, %eax
	subl	%edx, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	%eax, 236(%rsp)
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$0, 1376(%rsp,%rax)
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$0, 9568(%rsp,%rax)
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$0, 5472(%rsp,%rax)
	movl	196(%rsp), %eax
	cltq
	movb	$0, 1312(%rsp,%rax)
	movl	232(%rsp), %eax
	imull	%eax, %eax
	movl	%eax, %edx
	movl	236(%rsp), %eax
	imull	%eax, %eax
	addl	%edx, %eax
	cmpl	$5, %eax
	jne	.L4
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$-1, 1376(%rsp,%rax)
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$-1, 1376(%rsp,%rax)
	call	rand@PLT
	cltd
	shrl	$31, %edx
	addl	%edx, %eax
	andl	$1, %eax
	subl	%edx, %eax
	movl	%eax, %ecx
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%edx, %eax
	movl	%ecx, %edx
	cltq
	movb	%dl, 9568(%rsp,%rax)
	movl	196(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	200(%rsp), %eax
	addl	%eax, %edx
	movl	200(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %ecx
	movl	196(%rsp), %eax
	addl	%eax, %ecx
	movslq	%edx, %rax
	movzbl	9568(%rsp,%rax), %edx
	movslq	%ecx, %rax
	movb	%dl, 9568(%rsp,%rax)
.L4:
	addl	$1, 200(%rsp)
.L3:
	cmpl	$63, 200(%rsp)
	jle	.L5
	addl	$1, 196(%rsp)
.L2:
	cmpl	$63, 196(%rsp)
	jle	.L6
	movl	$0, 204(%rsp)
	jmp	.L7
.L38:
	movb	$0, 130(%rsp)
	movsbl	130(%rsp), %eax
	movl	%eax, 92(%rsp)
	movsbl	130(%rsp), %ebx
	movl	%ebx, 88(%rsp)
	movsbl	130(%rsp), %esi
	movl	%esi, 84(%rsp)
	movsbl	130(%rsp), %edi
	movl	%edi, 80(%rsp)
	movsbl	130(%rsp), %ecx
	movl	%ecx, 76(%rsp)
	movsbl	130(%rsp), %edx
	movl	%edx, 72(%rsp)
	movsbl	130(%rsp), %r8d
	movl	%r8d, 68(%rsp)
	movsbl	130(%rsp), %r9d
	movl	%r9d, 64(%rsp)
	movsbl	130(%rsp), %r10d
	movl	%r10d, 60(%rsp)
	movsbl	130(%rsp), %r11d
	movl	%r11d, 56(%rsp)
	movsbl	130(%rsp), %r14d
	movl	%r14d, 52(%rsp)
	movsbl	130(%rsp), %r15d
	movl	%r15d, 48(%rsp)
	movsbl	130(%rsp), %r12d
	movl	%r12d, 44(%rsp)
	movsbl	130(%rsp), %r13d
	movl	%r13d, 40(%rsp)
	movsbl	130(%rsp), %eax
	movl	%eax, 36(%rsp)
	movsbl	130(%rsp), %ebx
	movl	%ebx, 32(%rsp)
	movsbl	130(%rsp), %esi
	movl	%esi, 28(%rsp)
	movsbl	130(%rsp), %edi
	movl	%edi, 24(%rsp)
	movsbl	130(%rsp), %r15d
	movsbl	130(%rsp), %r14d
	movsbl	130(%rsp), %r13d
	movsbl	130(%rsp), %r12d
	movsbl	130(%rsp), %ebx
	movsbl	130(%rsp), %r11d
	movsbl	130(%rsp), %r10d
	movsbl	130(%rsp), %r9d
	movsbl	130(%rsp), %r8d
	movsbl	130(%rsp), %edi
	movsbl	130(%rsp), %esi
	movsbl	130(%rsp), %ecx
	movsbl	130(%rsp), %edx
	movsbl	130(%rsp), %eax
	movb	%al, 131(%rsp)
	movb	%dl, 132(%rsp)
	movb	%cl, 133(%rsp)
	movb	%sil, 134(%rsp)
	movb	%dil, 135(%rsp)
	movb	%r8b, 136(%rsp)
	movb	%r9b, 137(%rsp)
	movb	%r10b, 138(%rsp)
	movb	%r11b, 139(%rsp)
	movb	%bl, 140(%rsp)
	movb	%r12b, 141(%rsp)
	movb	%r13b, 142(%rsp)
	movb	%r14b, 143(%rsp)
	movb	%r15b, 144(%rsp)
	movzbl	24(%rsp), %edi
	movb	%dil, 145(%rsp)
	movzbl	28(%rsp), %esi
	movb	%sil, 146(%rsp)
	movzbl	32(%rsp), %ebx
	movb	%bl, 147(%rsp)
	movzbl	36(%rsp), %eax
	movb	%al, 148(%rsp)
	movzbl	40(%rsp), %r13d
	movb	%r13b, 149(%rsp)
	movzbl	44(%rsp), %r12d
	movb	%r12b, 150(%rsp)
	movzbl	48(%rsp), %r15d
	movb	%r15b, 151(%rsp)
	movzbl	52(%rsp), %r14d
	movb	%r14b, 152(%rsp)
	movzbl	56(%rsp), %r11d
	movb	%r11b, 153(%rsp)
	movzbl	60(%rsp), %r10d
	movb	%r10b, 154(%rsp)
	movzbl	64(%rsp), %r9d
	movb	%r9b, 155(%rsp)
	movzbl	68(%rsp), %r8d
	movb	%r8b, 156(%rsp)
	movzbl	72(%rsp), %edx
	movb	%dl, 157(%rsp)
	movzbl	76(%rsp), %ecx
	movb	%cl, 158(%rsp)
	movzbl	80(%rsp), %edi
	movb	%dil, 159(%rsp)
	movzbl	84(%rsp), %esi
	movb	%sil, 160(%rsp)
	movzbl	88(%rsp), %ebx
	movb	%bl, 161(%rsp)
	movzbl	92(%rsp), %eax
	movb	%al, 162(%rsp)
	movzbl	162(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	161(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	160(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	159(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	158(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	157(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	156(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	155(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	154(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	153(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	152(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	151(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	150(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	149(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	148(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	147(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	146(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	145(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	144(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	143(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm9
	movzbl	142(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	141(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	movzbl	140(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	139(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	138(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	137(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	136(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	135(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	134(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	133(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	132(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	131(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm8, %xmm5, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm7, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpcklwd	%xmm6, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpckldq	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpckldq	%xmm4, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	nop
	vmovdqa	%ymm0, 320(%rsp)
	movb	$0, 97(%rsp)
	movsbl	97(%rsp), %eax
	movl	%eax, 92(%rsp)
	movsbl	97(%rsp), %ebx
	movl	%ebx, 88(%rsp)
	movsbl	97(%rsp), %esi
	movl	%esi, 84(%rsp)
	movsbl	97(%rsp), %edi
	movl	%edi, 80(%rsp)
	movsbl	97(%rsp), %ecx
	movl	%ecx, 76(%rsp)
	movsbl	97(%rsp), %edx
	movl	%edx, 72(%rsp)
	movsbl	97(%rsp), %r8d
	movl	%r8d, 68(%rsp)
	movsbl	97(%rsp), %r9d
	movl	%r9d, 64(%rsp)
	movsbl	97(%rsp), %r10d
	movl	%r10d, 60(%rsp)
	movsbl	97(%rsp), %r11d
	movl	%r11d, 56(%rsp)
	movsbl	97(%rsp), %r14d
	movl	%r14d, 52(%rsp)
	movsbl	97(%rsp), %r15d
	movl	%r15d, 48(%rsp)
	movsbl	97(%rsp), %r12d
	movl	%r12d, 44(%rsp)
	movsbl	97(%rsp), %r13d
	movl	%r13d, 40(%rsp)
	movsbl	97(%rsp), %eax
	movl	%eax, 36(%rsp)
	movsbl	97(%rsp), %ebx
	movl	%ebx, 32(%rsp)
	movsbl	97(%rsp), %esi
	movl	%esi, 28(%rsp)
	movsbl	97(%rsp), %edi
	movl	%edi, 24(%rsp)
	movsbl	97(%rsp), %r15d
	movsbl	97(%rsp), %r14d
	movsbl	97(%rsp), %r13d
	movsbl	97(%rsp), %r12d
	movsbl	97(%rsp), %ebx
	movsbl	97(%rsp), %r11d
	movsbl	97(%rsp), %r10d
	movsbl	97(%rsp), %r9d
	movsbl	97(%rsp), %r8d
	movsbl	97(%rsp), %edi
	movsbl	97(%rsp), %esi
	movsbl	97(%rsp), %ecx
	movsbl	97(%rsp), %edx
	movsbl	97(%rsp), %eax
	movb	%al, 98(%rsp)
	movb	%dl, 99(%rsp)
	movb	%cl, 100(%rsp)
	movb	%sil, 101(%rsp)
	movb	%dil, 102(%rsp)
	movb	%r8b, 103(%rsp)
	movb	%r9b, 104(%rsp)
	movb	%r10b, 105(%rsp)
	movb	%r11b, 106(%rsp)
	movb	%bl, 107(%rsp)
	movb	%r12b, 108(%rsp)
	movb	%r13b, 109(%rsp)
	movb	%r14b, 110(%rsp)
	movb	%r15b, 111(%rsp)
	movzbl	24(%rsp), %edi
	movb	%dil, 112(%rsp)
	movzbl	28(%rsp), %esi
	movb	%sil, 113(%rsp)
	movzbl	32(%rsp), %ebx
	movb	%bl, 114(%rsp)
	movzbl	36(%rsp), %eax
	movb	%al, 115(%rsp)
	movzbl	40(%rsp), %r13d
	movb	%r13b, 116(%rsp)
	movzbl	44(%rsp), %r12d
	movb	%r12b, 117(%rsp)
	movzbl	48(%rsp), %r15d
	movb	%r15b, 118(%rsp)
	movzbl	52(%rsp), %r14d
	movb	%r14b, 119(%rsp)
	movzbl	56(%rsp), %r11d
	movb	%r11b, 120(%rsp)
	movzbl	60(%rsp), %r10d
	movb	%r10b, 121(%rsp)
	movzbl	64(%rsp), %r9d
	movb	%r9b, 122(%rsp)
	movzbl	68(%rsp), %r8d
	movb	%r8b, 123(%rsp)
	movzbl	72(%rsp), %edx
	movb	%dl, 124(%rsp)
	movzbl	76(%rsp), %ecx
	movb	%cl, 125(%rsp)
	movzbl	80(%rsp), %edi
	movb	%dil, 126(%rsp)
	movzbl	84(%rsp), %esi
	movb	%sil, 127(%rsp)
	movzbl	88(%rsp), %ebx
	movb	%bl, 128(%rsp)
	movzbl	92(%rsp), %eax
	movb	%al, 129(%rsp)
	movzbl	129(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	128(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	127(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	126(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	125(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	124(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	123(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	122(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	121(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	120(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	119(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	118(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	117(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	116(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	115(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	114(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	113(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	112(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	111(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	110(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm9
	movzbl	109(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	108(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	movzbl	107(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	106(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	105(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	104(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	103(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	102(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	101(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	100(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	99(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	98(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm8, %xmm5, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm7, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpcklwd	%xmm6, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpckldq	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpckldq	%xmm4, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	nop
	vmovdqa	%ymm0, 352(%rsp)
	movl	$0, 208(%rsp)
	jmp	.L12
.L17:
	movl	208(%rsp), %eax
	cltq
	leaq	9568(%rsp), %rdx
	addq	%rdx, %rax
	movq	%rax, 248(%rsp)
	movq	248(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vinserti128	$0x1, 16(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 608(%rsp)
	movl	208(%rsp), %eax
	cltq
	leaq	32(%rax), %rdx
	leaq	9568(%rsp), %rax
	addq	%rdx, %rax
	movq	%rax, 240(%rsp)
	movq	240(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vinserti128	$0x1, 16(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 640(%rsp)
	vmovdqa	608(%rsp), %ymm0
	vmovdqa	%ymm0, 736(%rsp)
	vmovdqa	320(%rsp), %ymm0
	vmovdqa	%ymm0, 768(%rsp)
	vmovdqa	768(%rsp), %ymm0
	vmovdqa	736(%rsp), %ymm1
	vpaddsb	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 320(%rsp)
	vmovdqa	640(%rsp), %ymm0
	vmovdqa	%ymm0, 672(%rsp)
	vmovdqa	352(%rsp), %ymm0
	vmovdqa	%ymm0, 704(%rsp)
	vmovdqa	704(%rsp), %ymm0
	vmovdqa	672(%rsp), %ymm1
	vpaddsb	%ymm0, %ymm1, %ymm0
	nop
	vmovdqa	%ymm0, 352(%rsp)
	addl	$64, 208(%rsp)
.L12:
	cmpl	$4095, 208(%rsp)
	jle	.L17
	leaq	1312(%rsp), %rax
	movq	%rax, 264(%rsp)
	vmovdqa	320(%rsp), %ymm0
	vmovdqa	%ymm0, 832(%rsp)
	vmovdqa	832(%rsp), %ymm0
	movq	264(%rsp), %rax
	vmovups	%xmm0, (%rax)
	vextracti128	$0x1, %ymm0, 16(%rax)
	nop
	leaq	1312(%rsp), %rax
	addq	$32, %rax
	movq	%rax, 256(%rsp)
	vmovdqa	352(%rsp), %ymm0
	vmovdqa	%ymm0, 800(%rsp)
	vmovdqa	800(%rsp), %ymm0
	movq	256(%rsp), %rax
	vmovups	%xmm0, (%rax)
	vextracti128	$0x1, %ymm0, 16(%rax)
	nop
	movl	$0, 212(%rsp)
	jmp	.L18
.L31:
	movl	212(%rsp), %eax
	leal	63(%rax), %edx
	testl	%eax, %eax
	cmovs	%edx, %eax
	sarl	$6, %eax
	cltq
	movzbl	1312(%rsp,%rax), %eax
	movl	$4, %edx
	subl	%eax, %edx
	movl	%edx, %eax
	movb	%al, 96(%rsp)
	movsbl	96(%rsp), %eax
	movb	%al, 163(%rsp)
	movsbl	163(%rsp), %eax
	movl	%eax, 92(%rsp)
	movsbl	163(%rsp), %ebx
	movl	%ebx, 88(%rsp)
	movsbl	163(%rsp), %esi
	movl	%esi, 84(%rsp)
	movsbl	163(%rsp), %edi
	movl	%edi, 80(%rsp)
	movsbl	163(%rsp), %ecx
	movl	%ecx, 76(%rsp)
	movsbl	163(%rsp), %edx
	movl	%edx, 72(%rsp)
	movsbl	163(%rsp), %r8d
	movl	%r8d, 68(%rsp)
	movsbl	163(%rsp), %r9d
	movl	%r9d, 64(%rsp)
	movsbl	163(%rsp), %r10d
	movl	%r10d, 60(%rsp)
	movsbl	163(%rsp), %r11d
	movl	%r11d, 56(%rsp)
	movsbl	163(%rsp), %r14d
	movl	%r14d, 52(%rsp)
	movsbl	163(%rsp), %r15d
	movl	%r15d, 48(%rsp)
	movsbl	163(%rsp), %r12d
	movl	%r12d, 44(%rsp)
	movsbl	163(%rsp), %r13d
	movl	%r13d, 40(%rsp)
	movsbl	163(%rsp), %eax
	movl	%eax, 36(%rsp)
	movsbl	163(%rsp), %ebx
	movl	%ebx, 32(%rsp)
	movsbl	163(%rsp), %esi
	movl	%esi, 28(%rsp)
	movsbl	163(%rsp), %edi
	movl	%edi, 24(%rsp)
	movsbl	163(%rsp), %r15d
	movsbl	163(%rsp), %r14d
	movsbl	163(%rsp), %r13d
	movsbl	163(%rsp), %r12d
	movsbl	163(%rsp), %ebx
	movsbl	163(%rsp), %r11d
	movsbl	163(%rsp), %r10d
	movsbl	163(%rsp), %r9d
	movsbl	163(%rsp), %r8d
	movsbl	163(%rsp), %edi
	movsbl	163(%rsp), %esi
	movsbl	163(%rsp), %ecx
	movsbl	163(%rsp), %edx
	movsbl	163(%rsp), %eax
	movb	%al, 164(%rsp)
	movb	%dl, 165(%rsp)
	movb	%cl, 166(%rsp)
	movb	%sil, 167(%rsp)
	movb	%dil, 168(%rsp)
	movb	%r8b, 169(%rsp)
	movb	%r9b, 170(%rsp)
	movb	%r10b, 171(%rsp)
	movb	%r11b, 172(%rsp)
	movb	%bl, 173(%rsp)
	movb	%r12b, 174(%rsp)
	movb	%r13b, 175(%rsp)
	movb	%r14b, 176(%rsp)
	movb	%r15b, 177(%rsp)
	movzbl	24(%rsp), %ecx
	movb	%cl, 178(%rsp)
	movzbl	28(%rsp), %esi
	movb	%sil, 179(%rsp)
	movzbl	32(%rsp), %ebx
	movb	%bl, 180(%rsp)
	movzbl	36(%rsp), %eax
	movb	%al, 181(%rsp)
	movzbl	40(%rsp), %r13d
	movb	%r13b, 182(%rsp)
	movzbl	44(%rsp), %r12d
	movb	%r12b, 183(%rsp)
	movzbl	48(%rsp), %r15d
	movb	%r15b, 184(%rsp)
	movzbl	52(%rsp), %r14d
	movb	%r14b, 185(%rsp)
	movzbl	56(%rsp), %r11d
	movb	%r11b, 186(%rsp)
	movzbl	60(%rsp), %r10d
	movb	%r10b, 187(%rsp)
	movzbl	64(%rsp), %r9d
	movb	%r9b, 188(%rsp)
	movzbl	68(%rsp), %r8d
	movb	%r8b, 189(%rsp)
	movzbl	72(%rsp), %edx
	movb	%dl, 190(%rsp)
	movzbl	76(%rsp), %ecx
	movb	%cl, 191(%rsp)
	movzbl	80(%rsp), %edi
	movb	%dil, 192(%rsp)
	movzbl	84(%rsp), %esi
	movb	%sil, 193(%rsp)
	movzbl	88(%rsp), %ebx
	movb	%bl, 194(%rsp)
	movzbl	92(%rsp), %eax
	movb	%al, 195(%rsp)
	movzbl	195(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	194(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	193(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	192(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	191(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	190(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	189(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	188(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	187(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	186(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	185(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	184(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	movzbl	183(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	182(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	181(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	180(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm8, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpcklwd	%xmm7, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpcklwd	%xmm6, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm5, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpckldq	%xmm4, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	vpunpckldq	%xmm3, %xmm2, %xmm0
	vpunpcklqdq	%xmm0, %xmm1, %xmm0
	vmovdqa	%xmm0, %xmm1
	movzbl	179(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	178(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm2
	movzbl	177(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	176(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm9
	movzbl	175(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	174(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm5
	movzbl	173(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	172(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm8
	movzbl	171(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	170(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm3
	movzbl	169(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	168(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm7
	movzbl	167(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	166(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm4
	movzbl	165(%rsp), %eax
	vmovd	%eax, %xmm0
	movzbl	164(%rsp), %eax
	vpinsrb	$1, %eax, %xmm0, %xmm0
	vmovdqa	%xmm0, %xmm6
	vpunpcklwd	%xmm9, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpcklwd	%xmm8, %xmm5, %xmm0
	vmovdqa	%xmm0, %xmm5
	vpunpcklwd	%xmm7, %xmm3, %xmm0
	vmovdqa	%xmm0, %xmm3
	vpunpcklwd	%xmm6, %xmm4, %xmm0
	vmovdqa	%xmm0, %xmm4
	vpunpckldq	%xmm5, %xmm2, %xmm0
	vmovdqa	%xmm0, %xmm2
	vpunpckldq	%xmm4, %xmm3, %xmm0
	vpunpcklqdq	%xmm0, %xmm2, %xmm0
	vinserti128	$0x1, %xmm0, %ymm1, %ymm0
	nop
	vmovdqa	%ymm0, 384(%rsp)
	movl	212(%rsp), %eax
	cltq
	leaq	1376(%rsp), %rdx
	addq	%rdx, %rax
	movq	%rax, 312(%rsp)
	movq	312(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vinserti128	$0x1, 16(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 416(%rsp)
	movl	212(%rsp), %eax
	cltq
	leaq	32(%rax), %rdx
	leaq	1376(%rsp), %rax
	addq	%rdx, %rax
	movq	%rax, 304(%rsp)
	movq	304(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vinserti128	$0x1, 16(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 448(%rsp)
	movl	212(%rsp), %eax
	cltq
	leaq	5472(%rsp), %rdx
	addq	%rdx, %rax
	movq	%rax, 296(%rsp)
	movq	296(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vinserti128	$0x1, 16(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 480(%rsp)
	movl	212(%rsp), %eax
	cltq
	leaq	32(%rax), %rdx
	leaq	5472(%rsp), %rax
	addq	%rdx, %rax
	movq	%rax, 288(%rsp)
	movq	288(%rsp), %rax
	vmovdqu	(%rax), %xmm0
	vinserti128	$0x1, 16(%rax), %ymm0, %ymm0
	vmovdqa	%ymm0, 512(%rsp)
	vmovdqa	384(%rsp), %ymm0
	vmovdqa	%ymm0, 1248(%rsp)
	vmovdqa	320(%rsp), %ymm0
	vmovdqa	%ymm0, 1280(%rsp)
	vmovdqa	1280(%rsp), %ymm1
	vmovdqa	1248(%rsp), %ymm0
	vpsubsb	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 544(%rsp)
	vmovdqa	384(%rsp), %ymm0
	vmovdqa	%ymm0, 1184(%rsp)
	vmovdqa	352(%rsp), %ymm0
	vmovdqa	%ymm0, 1216(%rsp)
	vmovdqa	1216(%rsp), %ymm1
	vmovdqa	1184(%rsp), %ymm0
	vpsubsb	%ymm1, %ymm0, %ymm0
	vmovdqa	%ymm0, 576(%rsp)
	vmovdqa	480(%rsp), %ymm0
	vmovdqa	%ymm0, 1120(%rsp)
	vmovdqa	544(%rsp), %ymm0
	vmovdqa	%ymm0, 1152(%rsp)
	vmovdqa	1152(%rsp), %ymm0
	vmovdqa	1120(%rsp), %ymm1
	vpaddsb	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 544(%rsp)
	vmovdqa	512(%rsp), %ymm0
	vmovdqa	%ymm0, 1056(%rsp)
	vmovdqa	576(%rsp), %ymm0
	vmovdqa	%ymm0, 1088(%rsp)
	vmovdqa	1088(%rsp), %ymm0
	vmovdqa	1056(%rsp), %ymm1
	vpaddsb	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 576(%rsp)
	vmovdqa	416(%rsp), %ymm0
	vmovdqa	%ymm0, 992(%rsp)
	vmovdqa	544(%rsp), %ymm0
	vmovdqa	%ymm0, 1024(%rsp)
	vmovdqa	992(%rsp), %ymm1
	vmovdqa	1024(%rsp), %ymm0
	vpand	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 544(%rsp)
	vmovdqa	448(%rsp), %ymm0
	vmovdqa	%ymm0, 928(%rsp)
	vmovdqa	576(%rsp), %ymm0
	vmovdqa	%ymm0, 960(%rsp)
	vmovdqa	928(%rsp), %ymm1
	vmovdqa	960(%rsp), %ymm0
	vpand	%ymm0, %ymm1, %ymm0
	vmovdqa	%ymm0, 576(%rsp)
	movl	212(%rsp), %eax
	cltq
	leaq	5472(%rsp), %rdx
	addq	%rdx, %rax
	movq	%rax, 280(%rsp)
	vmovdqa	544(%rsp), %ymm0
	vmovdqa	%ymm0, 896(%rsp)
	vmovdqa	896(%rsp), %ymm0
	movq	280(%rsp), %rax
	vmovups	%xmm0, (%rax)
	vextracti128	$0x1, %ymm0, 16(%rax)
	nop
	movl	212(%rsp), %eax
	cltq
	leaq	32(%rax), %rdx
	leaq	5472(%rsp), %rax
	addq	%rdx, %rax
	movq	%rax, 272(%rsp)
	vmovdqa	576(%rsp), %ymm0
	vmovdqa	%ymm0, 864(%rsp)
	vmovdqa	864(%rsp), %ymm0
	movq	272(%rsp), %rax
	vmovups	%xmm0, (%rax)
	vextracti128	$0x1, %ymm0, 16(%rax)
	nop
	addl	$64, 212(%rsp)
.L18:
	cmpl	$4095, 212(%rsp)
	jle	.L31
	movl	$0, 216(%rsp)
	jmp	.L32
.L37:
	movl	$0, 220(%rsp)
	jmp	.L33
.L36:
	movl	216(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	220(%rsp), %eax
	addl	%edx, %eax
	cltq
	movzbl	1376(%rsp,%rax), %eax
	testb	%al, %al
	je	.L34
	movl	216(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	220(%rsp), %eax
	addl	%edx, %eax
	cltq
	movzbl	5472(%rsp,%rax), %eax
	cmpb	$3, %al
	jle	.L35
	movl	216(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	220(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$1, 9568(%rsp,%rax)
.L35:
	movl	216(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	220(%rsp), %eax
	addl	%edx, %eax
	cltq
	movzbl	5472(%rsp,%rax), %eax
	testb	%al, %al
	jns	.L34
	movl	216(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	220(%rsp), %eax
	addl	%edx, %eax
	cltq
	movb	$0, 9568(%rsp,%rax)
.L34:
	addl	$1, 220(%rsp)
.L33:
	cmpl	$63, 220(%rsp)
	jle	.L36
	addl	$1, 216(%rsp)
.L32:
	cmpl	$63, 216(%rsp)
	jle	.L37
	addl	$1, 204(%rsp)
.L7:
	cmpl	$349999, 204(%rsp)
	jle	.L38
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$0, 224(%rsp)
	jmp	.L39
.L43:
	movl	$0, 228(%rsp)
	jmp	.L40
.L42:
	movl	224(%rsp), %eax
	sall	$6, %eax
	movl	%eax, %edx
	movl	228(%rsp), %eax
	addl	%edx, %eax
	cltq
	movzbl	9568(%rsp,%rax), %eax
	cmpb	$1, %al
	jne	.L41
	movl	228(%rsp), %edx
	movl	224(%rsp), %eax
	movl	%eax, %esi
	leaq	.LC1(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.L41:
	addl	$1, 228(%rsp)
.L40:
	cmpl	$63, 228(%rsp)
	jle	.L42
	addl	$1, 224(%rsp)
.L39:
	cmpl	$63, 224(%rsp)
	jle	.L43
	leaq	.LC2(%rip), %rdi
	call	puts@PLT
	movl	$0, %eax
	movq	13688(%rsp), %rbx
	xorq	%fs:40, %rbx
	je	.L45
	call	__stack_chk_fail@PLT
.L45:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4006:
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

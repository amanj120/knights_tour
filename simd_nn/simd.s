	.file	"simd.c"
	.text
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"%2d "
	.text
	.p2align 4
	.globl	run
	.type	run, @function
run:
.LFB5307:
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
	subq	$928, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, 12(%rsp)
	leaq	832(%rsp), %rcx
	leaq	896(%rsp), %r14
	leaq	4992(%rsp), %r13
	movq	%fs:40, %rax
	movq	%rax, 13208(%rsp)
	xorl	%eax, %eax
	leaq	9088(%rsp), %rax
	movq	%r14, 16(%rsp)
	movq	%rcx, (%rsp)
	movq	%rax, %r15
	movl	$0, 48(%rsp)
	movq	%rax, 32(%rsp)
	movq	%rax, 40(%rsp)
	movq	%r13, %rax
	movq	%r13, 24(%rsp)
	movq	%rax, %r12
	movq	%rcx, %r13
	.p2align 4,,10
	.p2align 3
.L2:
	movl	48(%rsp), %eax
	movq	%r12, %rcx
	xorl	%ebx, %ebx
	movq	%r13, %r12
	movl	%eax, %edi
	andl	$7, %eax
	sarl	$3, %edi
	movl	%eax, %esi
	movl	%edi, %r13d
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L3:
	addq	$1, %rbx
	cmpq	$64, %rbx
	je	.L53
.L4:
	testl	%ebx, %ebx
	leal	7(%rbx), %eax
	movl	%r13d, %edx
	movl	%ebx, %edi
	cmovns	%ebx, %eax
	andl	$7, %edi
	movb	$0, (%r14,%rbx)
	movb	$0, (%r15,%rbx)
	sarl	$3, %eax
	movb	$0, (%rcx,%rbx)
	subl	%eax, %edx
	movb	$0, (%r12)
	movl	%edx, %eax
	movl	%esi, %edx
	subl	%edi, %edx
	imull	%eax, %eax
	movl	%edx, %edi
	imull	%edx, %edi
	addl	%edi, %eax
	cmpl	$5, %eax
	jne	.L3
	movb	$-1, (%r14,%rbx)
	movl	%esi, 52(%rsp)
	movq	%rcx, 56(%rsp)
	call	rand@PLT
	movq	40(%rsp), %rsi
	movq	56(%rsp), %rcx
	movl	%eax, %edi
	shrl	$31, %edi
	addl	%edi, %eax
	andl	$1, %eax
	subl	%edi, %eax
	movq	%rbx, %rdi
	movb	%al, (%r15,%rbx)
	salq	$6, %rdi
	addq	$1, %rbx
	movb	%al, (%rsi,%rdi)
	movl	52(%rsp), %esi
	cmpq	$64, %rbx
	jne	.L4
.L53:
	addl	$1, 48(%rsp)
	movl	48(%rsp), %eax
	movq	%r12, %r13
	movq	%rcx, %r12
	addq	$64, %r14
	addq	$64, %r15
	addq	$64, %r12
	addq	$1, %r13
	addq	$1, 40(%rsp)
	cmpl	$64, %eax
	jne	.L2
	movslq	12(%rsp), %r10
	imulq	$10000, %r10, %r10
	testq	%r10, %r10
	jle	.L11
	movq	32(%rsp), %rax
	xorl	%r11d, %r11d
	movl	$4, %r8d
	vpxor	%xmm4, %xmm4, %xmm4
	vmovdqa	.LC0(%rip), %ymm5
	vmovdqa	.LC1(%rip), %ymm8
	leaq	4096(%rax), %r9
.L10:
	vpxor	%xmm1, %xmm1, %xmm1
	movq	32(%rsp), %rax
	vmovdqa	%ymm1, %ymm0
	.p2align 4,,10
	.p2align 3
.L8:
	vpaddsb	(%rax), %ymm0, %ymm7
	vpaddsb	32(%rax), %ymm1, %ymm6
	addq	$64, %rax
	vmovdqa	%ymm7, %ymm0
	vmovdqa	%ymm6, %ymm1
	cmpq	%rax, %r9
	jne	.L8
	movq	32(%rsp), %rdx
	movq	24(%rsp), %rax
	xorl	%ecx, %ecx
	vmovdqa	%ymm7, 832(%rsp)
	vmovdqa	%ymm6, 864(%rsp)
	movq	16(%rsp), %rsi
	.p2align 4,,10
	.p2align 3
.L9:
	movl	%ecx, %edi
	movl	%r8d, %ebx
	addl	$64, %ecx
	addq	$64, %rsi
	sarl	$6, %edi
	addq	$64, %rax
	addq	$64, %rdx
	movslq	%edi, %rdi
	subb	832(%rsp,%rdi), %bl
	movl	%ebx, %edi
	vmovd	%edi, %xmm0
	vpbroadcastb	%xmm0, %ymm0
	vpsubsb	%ymm7, %ymm0, %ymm3
	vpsubsb	%ymm6, %ymm0, %ymm0
	vpaddsb	-32(%rax), %ymm0, %ymm0
	vpand	-32(%rsi), %ymm0, %ymm0
	vpaddsb	-64(%rax), %ymm3, %ymm3
	vpand	-64(%rsi), %ymm3, %ymm3
	vpminsb	%ymm0, %ymm4, %ymm1
	vpminsb	%ymm0, %ymm5, %ymm2
	vpcmpgtb	%ymm5, %ymm0, %ymm9
	vmovdqa	%ymm0, -32(%rax)
	vpcmpeqb	%ymm2, %ymm0, %ymm2
	vpcmpeqb	%ymm1, %ymm4, %ymm1
	vmovdqa	%ymm3, -64(%rax)
	vpcmpgtb	%ymm5, %ymm3, %ymm10
	vpand	%ymm2, %ymm1, %ymm1
	vpand	-32(%rsi), %ymm8, %ymm2
	vpand	-32(%rdx), %ymm1, %ymm1
	vpand	%ymm9, %ymm2, %ymm2
	vpminsb	%ymm3, %ymm5, %ymm9
	vpor	%ymm2, %ymm1, %ymm1
	vpcmpeqb	%ymm9, %ymm3, %ymm9
	vpminsb	%ymm3, %ymm4, %ymm2
	vpcmpeqb	%ymm2, %ymm4, %ymm2
	vmovdqa	%ymm1, -32(%rdx)
	vpand	%ymm9, %ymm2, %ymm2
	vpand	-64(%rsi), %ymm8, %ymm9
	vpand	-64(%rdx), %ymm2, %ymm2
	vpand	%ymm10, %ymm9, %ymm9
	vpor	%ymm9, %ymm2, %ymm2
	vmovdqa	%ymm2, -64(%rdx)
	cmpl	$4096, %ecx
	jne	.L9
	addl	$1, %r11d
	cmpl	%r10d, %r11d
	jne	.L10
	vzeroupper
.L11:
	xorl	%esi, %esi
	movl	$1, %edi
	movl	$1, %edx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L7:
	movl	%esi, %eax
	sall	$6, %eax
	addl	%edx, %eax
	addl	$1, %edx
	cltq
	movsbl	9088(%rsp,%rax), %eax
	addl	%eax, %ecx
	cmpl	$64, %edx
	jne	.L7
	leal	1(%rdi), %edx
	cmpl	$63, %edi
	je	.L54
	movl	%edi, %esi
	movl	%edx, %edi
	jmp	.L7
.L54:
	cmpl	$64, %ecx
	jne	.L50
	xorl	%ecx, %ecx
	movl	$1, %edi
	movl	$1, %edx
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L28:
	movl	%ecx, %eax
	sall	$6, %eax
	addl	%edx, %eax
	cltq
	cmpb	$1, 9088(%rsp,%rax)
	jne	.L14
	movslq	%esi, %rax
	addl	$1, %esi
	movl	%ecx, 64(%rsp,%rax,4)
	movl	%edx, 320(%rsp,%rax,4)
	movl	$0, 576(%rsp,%rax,4)
.L14:
	addl	$1, %edx
	cmpl	$64, %edx
	jne	.L28
	leal	1(%rdi), %edx
	cmpl	$63, %edi
	je	.L55
	movl	%edi, %ecx
	movl	%edx, %edi
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L59:
	movl	%ecx, %edx
	movslq	%edx, %rcx
	movl	576(%rsp,%rcx,4), %r10d
	testl	%r10d, %r10d
	jne	.L18
.L61:
	movl	%r9d, 576(%rsp,%rcx,4)
	movl	%edx, %esi
.L19:
	addl	$1, %r9d
	cmpl	$65, %r9d
	jne	.L26
	leaq	576(%rsp), %rax
	movq	%rax, %rdx
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L57:
	addq	$4, %rdx
	cmpq	%rdx, (%rsp)
	je	.L56
.L23:
	movl	(%rdx), %ecx
	testl	%ecx, %ecx
	jne	.L57
.L50:
	movl	$1, %eax
.L1:
	movq	13208(%rsp), %rcx
	xorq	%fs:40, %rcx
	jne	.L58
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_remember_state
	.cfi_def_cfa 7, 8
	ret
.L55:
	.cfi_restore_state
	movl	$2, %r9d
	xorl	%esi, %esi
	movl	$1, 576(%rsp)
	leaq	64(%rsp), %r8
	leaq	320(%rsp), %rdi
.L26:
	xorl	%eax, %eax
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L60:
	cmpl	%edx, %esi
	je	.L59
.L18:
	addq	$4, %rax
	cmpq	$256, %rax
	je	.L19
.L20:
	movl	(%r8,%rax), %ecx
	movl	(%rdi,%rax), %edx
	cmpl	%esi, %ecx
	jne	.L60
	movslq	%edx, %rcx
	movl	576(%rsp,%rcx,4), %r10d
	testl	%r10d, %r10d
	jne	.L18
	jmp	.L61
.L56:
	leaq	32(%rax), %r12
	leaq	288(%rax), %rbx
	leaq	.LC2(%rip), %r14
.L25:
	movl	$10, %edi
	leaq	-32(%r12), %r13
	call	putchar@PLT
.L24:
	movl	0(%r13), %edx
	movq	%r14, %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	addq	$4, %r13
	call	__printf_chk@PLT
	cmpq	%r13, %r12
	jne	.L24
	addq	$32, %r12
	cmpq	%r12, %rbx
	jne	.L25
	movl	$10, %edi
	call	putchar@PLT
	xorl	%eax, %eax
	jmp	.L1
.L58:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE5307:
	.size	run, .-run
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC3:
	.string	"%d0000 iterations per network run"
	.section	.rodata.str1.1
.LC5:
	.string	"%.2f seconds: %d total runs\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB5308:
	.cfi_startproc
	endbr64
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	movq	%rsi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movl	%edi, %ebp
	xorl	%edi, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movl	$10, %ebx
	call	time@PLT
	movq	%rax, %rdi
	call	srand@PLT
	cmpl	$2, %ebp
	je	.L69
.L63:
	movl	%ebx, %edx
	leaq	.LC3(%rip), %rsi
	movl	$1, %edi
	xorl	%eax, %eax
	call	__printf_chk@PLT
	movl	$1, %r12d
	call	clock@PLT
	movq	%rax, %rbp
	jmp	.L64
	.p2align 4,,10
	.p2align 3
.L65:
	addl	$1, %r12d
.L64:
	movl	%ebx, %edi
	call	run
	testl	%eax, %eax
	jne	.L65
	call	clock@PLT
	vxorps	%xmm0, %xmm0, %xmm0
	movl	%r12d, %edx
	leaq	.LC5(%rip), %rsi
	subq	%rbp, %rax
	movl	$1, %edi
	vcvtsi2sdq	%rax, %xmm0, %xmm0
	movl	$1, %eax
	vdivsd	.LC4(%rip), %xmm0, %xmm0
	call	__printf_chk@PLT
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	xorl	%eax, %eax
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L69:
	.cfi_restore_state
	movq	8(%r12), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	movl	$99, %ebx
	call	strtol@PLT
	cmpl	$99, %eax
	jg	.L63
	movq	8(%r12), %rdi
	movl	$10, %edx
	xorl	%esi, %esi
	call	strtol@PLT
	movl	%eax, %ebx
	jmp	.L63
	.cfi_endproc
.LFE5308:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.byte	3
	.align 32
.LC1:
	.quad	72340172838076673
	.quad	72340172838076673
	.quad	72340172838076673
	.quad	72340172838076673
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC4:
	.long	0
	.long	1093567616
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

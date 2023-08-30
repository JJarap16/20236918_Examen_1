	.file	"Divisores.c"
	.section .rdata,"dr"
LC0:
	.ascii "%i - %s\12\0"
	.text
	.globl	_getTypeNumber
	.def	_getTypeNumber;	.scl	2;	.type	32;	.endef
_getTypeNumber:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$56, %esp
	movl	$0, -12(%ebp)
	movl	$1, -16(%ebp)
	jmp	L2
L4:
	movl	8(%ebp), %eax
	cltd
	idivl	-16(%ebp)
	movl	%edx, %eax
	testl	%eax, %eax
	jne	L3
	movl	-16(%ebp), %eax
	addl	%eax, -12(%ebp)
L3:
	addl	$1, -16(%ebp)
L2:
	movl	-16(%ebp), %eax
	cmpl	8(%ebp), %eax
	jl	L4
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jge	L5
	leal	-31(%ebp), %eax
	movl	$1768318276, (%eax)
	movl	$1852139875, 4(%eax)
	movw	$25972, 8(%eax)
	movb	$0, 10(%eax)
	jmp	L6
L5:
	movl	-12(%ebp), %eax
	cmpl	8(%ebp), %eax
	jne	L7
	leal	-31(%ebp), %eax
	movl	$1718773072, (%eax)
	movl	$1869898597, 4(%eax)
	movb	$0, 8(%eax)
	jmp	L6
L7:
	leal	-31(%ebp), %eax
	movl	$1853186625, (%eax)
	movl	$1953390948, 4(%eax)
	movw	$101, 8(%eax)
L6:
	leal	-31(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	8(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	$LC0, (%esp)
	call	_printf
	leave
	ret
	.def	___main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
LC1:
	.ascii "El arreglo es: \0"
LC2:
	.ascii " %i, \0"
LC3:
	.ascii " %i\12\0"
	.text
	.globl	_main
	.def	_main;	.scl	2;	.type	32;	.endef
_main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$96, %esp
	call	___main
	movl	$0, (%esp)
	call	_time
	movl	%eax, (%esp)
	call	_srand
	movl	$0, 92(%esp)
	movl	$LC1, (%esp)
	call	_printf
L11:
	call	_rand
	movl	%eax, %ecx
	movl	$1374389535, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	$5, %edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	imull	$100, %eax, %eax
	subl	%eax, %ecx
	movl	%ecx, %eax
	movl	92(%esp), %edx
	movl	%eax, 28(%esp,%edx,4)
	cmpl	$13, 92(%esp)
	jg	L9
	movl	92(%esp), %eax
	movl	28(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC2, (%esp)
	call	_printf
	jmp	L10
L9:
	movl	92(%esp), %eax
	movl	28(%esp,%eax,4), %eax
	movl	%eax, 4(%esp)
	movl	$LC3, (%esp)
	call	_printf
L10:
	addl	$1, 92(%esp)
	cmpl	$14, 92(%esp)
	jle	L11
	movl	$10, (%esp)
	call	_putchar
	movl	$0, 88(%esp)
	jmp	L12
L13:
	movl	88(%esp), %eax
	movl	28(%esp,%eax,4), %eax
	movl	%eax, (%esp)
	call	_getTypeNumber
	addl	$1, 88(%esp)
L12:
	cmpl	$14, 88(%esp)
	jle	L13
	movl	$0, %eax
	leave
	ret
	.ident	"GCC: (i686-posix-sjlj, built by strawberryperl.com project) 4.9.2"
	.def	_printf;	.scl	2;	.type	32;	.endef
	.def	_time;	.scl	2;	.type	32;	.endef
	.def	_srand;	.scl	2;	.type	32;	.endef
	.def	_rand;	.scl	2;	.type	32;	.endef
	.def	_putchar;	.scl	2;	.type	32;	.endef

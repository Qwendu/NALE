	.text
	.file	"main.cpp"
	.globl	_Z16setFlagRegistersP14ProcessorStatet # -- Begin function _Z16setFlagRegistersP14ProcessorStatet
	.p2align	4, 0x90
	.type	_Z16setFlagRegistersP14ProcessorStatet,@function
_Z16setFlagRegistersP14ProcessorStatet: # @_Z16setFlagRegistersP14ProcessorStatet
	.cfi_startproc
# %bb.0:
	testw	%si, %si
	js	.LBB0_1
# %bb.2:
	je	.LBB0_3
# %bb.4:
	movw	$4, %ax
	testw	%si, %si
	jns	.LBB0_5
# %bb.6:
	retq
.LBB0_1:
	movw	$1, %ax
	jmp	.LBB0_5
.LBB0_3:
	movw	$2, %ax
.LBB0_5:
	movzwl	18(%rdi), %ecx
	andl	$-8, %ecx
	movzwl	%ax, %eax
	orl	%ecx, %eax
	movw	%ax, 18(%rdi)
	retq
.Lfunc_end0:
	.size	_Z16setFlagRegistersP14ProcessorStatet, .Lfunc_end0-_Z16setFlagRegistersP14ProcessorStatet
	.cfi_endproc
                                        # -- End function
	.globl	_Z2UBv                  # -- Begin function _Z2UBv
	.p2align	4, 0x90
	.type	_Z2UBv,@function
_Z2UBv:                                 # @_Z2UBv
	.cfi_startproc
# %bb.0:
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.Lstr, %edi
	callq	puts
	movl	$404, %edi              # imm = 0x194
	callq	exit
.Lfunc_end1:
	.size	_Z2UBv, .Lfunc_end1-_Z2UBv
	.cfi_endproc
                                        # -- End function
	.globl	_Z19createMemoryTrackerv # -- Begin function _Z19createMemoryTrackerv
	.p2align	4, 0x90
	.type	_Z19createMemoryTrackerv,@function
_Z19createMemoryTrackerv:               # @_Z19createMemoryTrackerv
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	$8192, %edi             # imm = 0x2000
	callq	malloc
	testq	%rax, %rax
	je	.LBB2_2
# %bb.1:
	movq	%rax, %rbx
	movl	$8192, %edx             # imm = 0x2000
	movq	%rax, %rdi
	xorl	%esi, %esi
	callq	memset
	movq	%rbx, %rax
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB2_2:
	.cfi_def_cfa_offset 16
	movl	$.L.str.9, %edi
	movl	$.L.str.10, %esi
	movl	$.L__PRETTY_FUNCTION__._Z19createMemoryTrackerv, %ecx
	movl	$23, %edx
	callq	__assert_fail
.Lfunc_end2:
	.size	_Z19createMemoryTrackerv, .Lfunc_end2-_Z19createMemoryTrackerv
	.cfi_endproc
                                        # -- End function
	.globl	_Z18markAddressTouchedP13MemoryTrackert # -- Begin function _Z18markAddressTouchedP13MemoryTrackert
	.p2align	4, 0x90
	.type	_Z18markAddressTouchedP13MemoryTrackert,@function
_Z18markAddressTouchedP13MemoryTrackert: # @_Z18markAddressTouchedP13MemoryTrackert
	.cfi_startproc
# %bb.0:
	movl	%esi, %ecx
	movl	$1, %eax
	shll	%cl, %eax
	cltq
	shrl	$3, %ecx
	andl	$-8, %ecx
	orq	%rax, (%rdi,%rcx)
	retq
.Lfunc_end3:
	.size	_Z18markAddressTouchedP13MemoryTrackert, .Lfunc_end3-_Z18markAddressTouchedP13MemoryTrackert
	.cfi_endproc
                                        # -- End function
	.globl	_Z17getAddressTouchedP13MemoryTrackert # -- Begin function _Z17getAddressTouchedP13MemoryTrackert
	.p2align	4, 0x90
	.type	_Z17getAddressTouchedP13MemoryTrackert,@function
_Z17getAddressTouchedP13MemoryTrackert: # @_Z17getAddressTouchedP13MemoryTrackert
	.cfi_startproc
# %bb.0:
                                        # kill: def $esi killed $esi def $rsi
	movl	%esi, %eax
	shrl	$3, %eax
	andl	$-8, %eax
	movq	(%rdi,%rax), %rax
	btq	%rsi, %rax
	setb	%al
	retq
.Lfunc_end4:
	.size	_Z17getAddressTouchedP13MemoryTrackert, .Lfunc_end4-_Z17getAddressTouchedP13MemoryTrackert
	.cfi_endproc
                                        # -- End function
	.globl	_Z16markRangeTouchedP13MemoryTrackertt # -- Begin function _Z16markRangeTouchedP13MemoryTrackertt
	.p2align	4, 0x90
	.type	_Z16markRangeTouchedP13MemoryTrackertt,@function
_Z16markRangeTouchedP13MemoryTrackertt: # @_Z16markRangeTouchedP13MemoryTrackertt
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -32
	.cfi_offset %r14, -24
	.cfi_offset %rbp, -16
	movl	%edx, %ebx
	testw	%bx, %bx
	je	.LBB5_3
# %bb.1:
	movl	%esi, %ebp
	movq	%rdi, %r14
	.p2align	4, 0x90
.LBB5_2:                                # =>This Inner Loop Header: Depth=1
	movzwl	%bp, %ebp
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	addl	$1, %ebp
	addl	$-1, %ebx
	jne	.LBB5_2
.LBB5_3:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end5:
	.size	_Z16markRangeTouchedP13MemoryTrackertt, .Lfunc_end5-_Z16markRangeTouchedP13MemoryTrackertt
	.cfi_endproc
                                        # -- End function
	.globl	_Z9printablec           # -- Begin function _Z9printablec
	.p2align	4, 0x90
	.type	_Z9printablec,@function
_Z9printablec:                          # @_Z9printablec
	.cfi_startproc
# %bb.0:
                                        # kill: def $edi killed $edi def $rdi
	movl	%edi, %eax
	andb	$-33, %al
	addb	$-65, %al
	cmpb	$26, %al
	jae	.LBB6_1
# %bb.2:
	movl	%edi, %eax
	retq
.LBB6_1:
	leal	-48(%rdi), %eax
	cmpb	$10, %al
	movzbl	%dil, %ecx
	movl	$46, %eax
	cmovbl	%ecx, %eax
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end6:
	.size	_Z9printablec, .Lfunc_end6-_Z9printablec
	.cfi_endproc
                                        # -- End function
	.globl	_Z18printTouchedMemoryP13MemoryTrackerPh # -- Begin function _Z18printTouchedMemoryP13MemoryTrackerPh
	.p2align	4, 0x90
	.type	_Z18printTouchedMemoryP13MemoryTrackerPh,@function
_Z18printTouchedMemoryP13MemoryTrackerPh: # @_Z18printTouchedMemoryP13MemoryTrackerPh
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rsi, %r14
	movq	%rdi, %r12
	movl	$.Lstr.106, %edi
	callq	puts
	movl	$.L.str.12, %edi
	xorl	%eax, %eax
	callq	printf
	movl	$1, %r15d
	xorl	%ebp, %ebp
	jmp	.LBB7_1
	.p2align	4, 0x90
.LBB7_4:                                #   in Loop: Header=BB7_1 Depth=1
	leal	-1(%r15), %esi
	movl	$.L.str.14, %edi
	movl	%r15d, %edx
	xorl	%eax, %eax
	callq	printf
	addl	$1, %ebp
	addl	$2, %r15d
	cmpl	$8, %ebp
	je	.LBB7_5
.LBB7_1:                                # =>This Inner Loop Header: Depth=1
	testl	%ebp, %ebp
	je	.LBB7_4
# %bb.2:                                #   in Loop: Header=BB7_1 Depth=1
	movl	%ebp, %eax
	andl	$3, %eax
	jne	.LBB7_4
# %bb.3:                                #   in Loop: Header=BB7_1 Depth=1
	movl	$9, %edi
	callq	putchar
	jmp	.LBB7_4
.LBB7_5:
	movl	$10, %edi
	callq	putchar
	xorl	%ebx, %ebx
	jmp	.LBB7_6
	.p2align	4, 0x90
.LBB7_13:                               #   in Loop: Header=BB7_6 Depth=1
	movl	$.L.str.18, %edi
	movq	%rsp, %rsi
	xorl	%eax, %eax
	callq	printf
	movq	%rbp, %r12
.LBB7_14:                               #   in Loop: Header=BB7_6 Depth=1
	cmpq	$65519, %r15            # imm = 0xFFEF
	jae	.LBB7_15
.LBB7_6:                                # =>This Loop Header: Depth=1
                                        #     Child Loop BB7_7 Depth 2
                                        #     Child Loop BB7_10 Depth 2
	movq	%rbx, %r15
	xorl	%ebx, %ebx
	xorl	%ebp, %ebp
	.p2align	4, 0x90
.LBB7_7:                                #   Parent Loop BB7_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	leal	(%r15,%rbx), %eax
	movzwl	%ax, %esi
	movq	%r12, %rdi
	callq	_Z17getAddressTouchedP13MemoryTrackert
	orb	%al, %bpl
	addl	$1, %ebx
	cmpl	$16, %ebx
	jne	.LBB7_7
# %bb.8:                                #   in Loop: Header=BB7_6 Depth=1
	leaq	16(%r15), %rbx
	testb	%bpl, %bpl
	je	.LBB7_14
# %bb.9:                                #   in Loop: Header=BB7_6 Depth=1
	movq	%r12, %rbp
	movb	$0, 16(%rsp)
	movl	$.L.str.16, %edi
	movl	%r15d, %esi
	xorl	%eax, %eax
	callq	printf
	leaq	1(%rsp), %r13
	movq	%r15, %r12
	jmp	.LBB7_10
	.p2align	4, 0x90
.LBB7_12:                               #   in Loop: Header=BB7_10 Depth=2
	movzbl	(%r14,%r12), %esi
	movzbl	1(%r14,%r12), %edx
	movl	$.L.str.17, %edi
	xorl	%eax, %eax
	callq	printf
	movsbl	(%r14,%r12), %edi
	callq	_Z9printablec
	movb	%al, -1(%r13)
	movsbl	1(%r14,%r12), %edi
	callq	_Z9printablec
	movb	%al, (%r13)
	addq	$2, %r12
	addq	$2, %r13
	cmpq	%rbx, %r12
	jae	.LBB7_13
.LBB7_10:                               #   Parent Loop BB7_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	testb	$6, %r12b
	jne	.LBB7_12
# %bb.11:                               #   in Loop: Header=BB7_10 Depth=2
	movl	$9, %edi
	callq	putchar
	jmp	.LBB7_12
.LBB7_15:
	movl	$.Lstr.107, %edi
	callq	puts
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end7:
	.size	_Z18printTouchedMemoryP13MemoryTrackerPh, .Lfunc_end7-_Z18printTouchedMemoryP13MemoryTrackerPh
	.cfi_endproc
                                        # -- End function
	.globl	_Z19warnUntouchedMemoryP13MemoryTrackert # -- Begin function _Z19warnUntouchedMemoryP13MemoryTrackert
	.p2align	4, 0x90
	.type	_Z19warnUntouchedMemoryP13MemoryTrackert,@function
_Z19warnUntouchedMemoryP13MemoryTrackert: # @_Z19warnUntouchedMemoryP13MemoryTrackert
	.cfi_startproc
# %bb.0:
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset %rbx, -16
	movl	%esi, %ebx
	callq	_Z17getAddressTouchedP13MemoryTrackert
	testb	%al, %al
	je	.LBB8_1
# %bb.2:
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.LBB8_1:
	.cfi_def_cfa_offset 16
	movq	stderr(%rip), %rdi
	movzwl	%bx, %edx
	movl	$.L.str.20, %esi
	xorl	%eax, %eax
	callq	fprintf
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end8:
	.size	_Z19warnUntouchedMemoryP13MemoryTrackert, .Lfunc_end8-_Z19warnUntouchedMemoryP13MemoryTrackert
	.cfi_endproc
                                        # -- End function
	.globl	_Z10readOptionP8_IO_FILES0_ # -- Begin function _Z10readOptionP8_IO_FILES0_
	.p2align	4, 0x90
	.type	_Z10readOptionP8_IO_FILES0_,@function
_Z10readOptionP8_IO_FILES0_:            # @_Z10readOptionP8_IO_FILES0_
	.cfi_startproc
# %bb.0:
	pushq	%r15
	.cfi_def_cfa_offset 16
	pushq	%r14
	.cfi_def_cfa_offset 24
	pushq	%r13
	.cfi_def_cfa_offset 32
	pushq	%r12
	.cfi_def_cfa_offset 40
	pushq	%rbx
	.cfi_def_cfa_offset 48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -48
	.cfi_offset %r12, -40
	.cfi_offset %r13, -32
	.cfi_offset %r14, -24
	.cfi_offset %r15, -16
	movq	%rsi, %r14
	movq	%rdi, %r13
	movl	$0, 8(%rsp)
	leaq	16(%rsp), %r15
	movl	$0, 16(%rsp)
	leaq	28(%rsp), %r12
	jmp	.LBB9_1
	.p2align	4, 0x90
.LBB9_5:                                #   in Loop: Header=BB9_1 Depth=1
	movl	$2, 8(%rsp)
	movl	$.L.str.45, %esi
	movq	%r13, %rdi
	movq	%r15, %rdx
	xorl	%eax, %eax
	callq	__isoc99_fscanf
.LBB9_35:                               #   in Loop: Header=BB9_1 Depth=1
	testb	%bl, %bl
	je	.LBB9_36
.LBB9_1:                                # =>This Inner Loop Header: Depth=1
	movl	$.L.str.44, %esi
	movl	$buffer, %edx
	movq	%r13, %rdi
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	cmpl	$1, %eax
	setne	%bl
	movq	cli_options_strings+8(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_2
# %bb.4:                                #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+16(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_5
# %bb.6:                                #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+24(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_7
# %bb.8:                                #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+32(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_9
# %bb.10:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+40(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_11
# %bb.12:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+48(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_13
# %bb.20:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+64(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_21
# %bb.22:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+56(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_23
# %bb.24:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+72(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_25
# %bb.26:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+80(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_27
# %bb.30:                               #   in Loop: Header=BB9_1 Depth=1
	movq	cli_options_strings+88(%rip), %rsi
	movl	$buffer, %edi
	callq	strcmp
	testl	%eax, %eax
	je	.LBB9_31
# %bb.32:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$.L.str.50, %edi
	movl	$55, %esi
	jmp	.LBB9_33
	.p2align	4, 0x90
.LBB9_2:                                #   in Loop: Header=BB9_1 Depth=1
	cmpl	$9, 8(%rsp)
	jne	.LBB9_34
# %bb.3:                                #   in Loop: Header=BB9_1 Depth=1
	movl	$15, 8(%rsp)
	jmp	.LBB9_35
.LBB9_34:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$1, 8(%rsp)
	jmp	.LBB9_35
.LBB9_7:                                #   in Loop: Header=BB9_1 Depth=1
	movl	$3, 8(%rsp)
	movl	$.L.str.46, %edi
	movl	$20, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	fwrite
	jmp	.LBB9_35
.LBB9_9:                                #   in Loop: Header=BB9_1 Depth=1
	movl	$4, 8(%rsp)
	jmp	.LBB9_35
.LBB9_11:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$.L.str.47, %edi
	movl	$27, %esi
	movl	$1, %edx
	movq	%r14, %rcx
	callq	fwrite
	movl	$5, 8(%rsp)
	movq	stdout(%rip), %rdi
	callq	fflush
	jmp	.LBB9_1
.LBB9_13:                               #   in Loop: Header=BB9_1 Depth=1
	movl	8(%rsp), %eax
	cmpl	$5, %eax
	je	.LBB9_17
# %bb.14:                               #   in Loop: Header=BB9_1 Depth=1
	cmpl	$9, %eax
	jne	.LBB9_16
# %bb.15:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$17, 8(%rsp)
	jmp	.LBB9_35
.LBB9_21:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$8, 8(%rsp)
	jmp	.LBB9_35
.LBB9_23:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$7, 8(%rsp)
	jmp	.LBB9_35
.LBB9_17:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$-1, 28(%rsp)
	movl	$13, 8(%rsp)
	movl	$.L.str.48, %esi
	movq	%r13, %rdi
	movq	%r12, %rdx
	xorl	%eax, %eax
	callq	__isoc99_fscanf
	cmpl	$1, %eax
	je	.LBB9_19
# %bb.18:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$0, 8(%rsp)
	movb	$1, %bl
.LBB9_19:                               #   in Loop: Header=BB9_1 Depth=1
	movzwl	28(%rsp), %eax
	movw	%ax, 16(%rsp)
	jmp	.LBB9_35
.LBB9_16:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$14, 8(%rsp)
	jmp	.LBB9_35
.LBB9_25:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$9, 8(%rsp)
	movl	$.L.str.49, %edi
	movl	$15, %esi
.LBB9_33:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$1, %edx
	movq	%r14, %rcx
	callq	fwrite
	jmp	.LBB9_1
.LBB9_27:                               #   in Loop: Header=BB9_1 Depth=1
	cmpl	$9, 8(%rsp)
	jne	.LBB9_29
# %bb.28:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$16, 8(%rsp)
	jmp	.LBB9_35
.LBB9_31:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$2, 8(%rsp)
	movl	$1, 16(%rsp)
	jmp	.LBB9_35
.LBB9_29:                               #   in Loop: Header=BB9_1 Depth=1
	movl	$10, 8(%rsp)
	jmp	.LBB9_35
.LBB9_36:
	movl	8(%rsp), %eax
	movq	16(%rsp), %rdx
	addq	$32, %rsp
	.cfi_def_cfa_offset 48
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end9:
	.size	_Z10readOptionP8_IO_FILES0_, .Lfunc_end9-_Z10readOptionP8_IO_FILES0_
	.cfi_endproc
                                        # -- End function
	.globl	_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE # -- Begin function _Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.p2align	4, 0x90
	.type	_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE,@function
_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE: # @_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$24, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, 8(%rsp)           # 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %r14
	movq	%rsi, 16(%rsp)          # 8-byte Spill
.Ltmp0:                                 # Block address taken
.LBB10_1:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB10_7 Depth 2
                                        #     Child Loop BB10_11 Depth 2
                                        #     Child Loop BB10_12 Depth 2
                                        #     Child Loop BB10_15 Depth 2
                                        #     Child Loop BB10_19 Depth 2
                                        #     Child Loop BB10_23 Depth 2
                                        #     Child Loop BB10_25 Depth 2
                                        #     Child Loop BB10_28 Depth 2
                                        #     Child Loop BB10_30 Depth 2
                                        #     Child Loop BB10_34 Depth 2
                                        #     Child Loop BB10_35 Depth 2
                                        #       Child Loop BB10_40 Depth 3
                                        #       Child Loop BB10_44 Depth 3
                                        #     Child Loop BB10_52 Depth 2
                                        #     Child Loop BB10_53 Depth 2
	movq	24(%r14), %rax
	movzwl	16(%r14), %edx
	movzwl	(%rax,%rdx), %ecx
	leal	2(%rdx), %eax
	movw	%ax, 16(%r14)
	movl	%ecx, %eax
	andl	$511, %eax              # imm = 0x1FF
	movl	%ecx, %esi
	shll	$7, %esi
	movswl	%si, %esi
	shrl	$15, %esi
	andl	$32256, %esi            # imm = 0x7E00
	orl	%eax, %esi
	leal	(%rdx,%rsi,2), %eax
	addl	$2, %eax
	movl	%ecx, %edx
	shrl	$11, %edx
	movzwl	18(%r14), %esi
	andl	%esi, %edx
	movb	$1, %r15b
	testb	$1, %dl
	jne	.LBB10_4
# %bb.2:                                #   in Loop: Header=BB10_1 Depth=1
	movzwl	%cx, %edx
	movl	%edx, %edi
	shrl	$10, %edi
	movzwl	%si, %ecx
	movl	%ecx, %esi
	shrl	%esi
	andl	%edi, %esi
	testb	$1, %sil
	jne	.LBB10_4
# %bb.3:                                #   in Loop: Header=BB10_1 Depth=1
	shrl	$9, %edx
	shrl	$2, %ecx
	andl	%edx, %ecx
	andb	$1, %cl
	movl	%ecx, %r15d
	.p2align	4, 0x90
.LBB10_4:                               #   in Loop: Header=BB10_1 Depth=1
	movzwl	%ax, %ebp
	testb	%r15b, %r15b
	je	.LBB10_6
# %bb.5:                                #   in Loop: Header=BB10_1 Depth=1
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movw	%bp, 16(%r14)
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
.LBB10_6:                               #   in Loop: Header=BB10_1 Depth=1
	movzbl	%r15b, %edx
	orl	$48, %edx
	movl	$.L.str.51, %edi
	movl	%ebp, %esi
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp1:                                 # Block address taken
.LBB10_7:                               #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	movl	%ebp, %r12d
	shrl	$9, %r12d
	andl	$7, %r12d
	movq	register_names(,%r12,8), %rsi
	movl	%ebp, %r15d
	shrl	$6, %r15d
	andl	$7, %r15d
	movq	register_names(,%r15,8), %rdx
	movl	$.L.str.52, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$32, %bpl
	jne	.LBB10_9
# %bb.8:                                #   in Loop: Header=BB10_7 Depth=2
	andl	$7, %ebp
	movzwl	(%r14,%rbp,2), %ebx
	movq	register_names(,%rbp,8), %rsi
	movl	$.L.str.44, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB10_10
	.p2align	4, 0x90
.LBB10_9:                               #   in Loop: Header=BB10_7 Depth=2
	movl	%ebp, %eax
	andl	$31, %eax
	shll	$11, %ebp
	movswl	%bp, %ebx
	sarl	$15, %ebx
	andl	$-32, %ebx
	orl	%eax, %ebx
	movzwl	%bx, %esi
	movl	$.L.str.53, %edi
	xorl	%eax, %eax
	callq	printf
.LBB10_10:                              #   in Loop: Header=BB10_7 Depth=2
	addw	(%r14,%r15,2), %bx
	movw	%bx, (%r14,%r12,2)
	movzwl	%bx, %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movl	$10, %edi
	callq	putchar
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp2:                                 # Block address taken
.LBB10_11:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	movl	%ebp, %eax
	shrl	$5, %eax
	addl	$2, %ecx
	movw	%cx, 16(%r14)
	movl	%ebp, %ecx
	andl	$63, %ecx
	movl	%ebp, %edx
	shll	$11, %edx
	movswl	%dx, %edx
	sarl	$15, %edx
	andl	$-32, %edx
	orl	%ecx, %edx
	andl	$14, %eax
	addw	(%r14,%rax), %dx
	movzwl	%dx, %r12d
	movq	%r13, %rdi
	movl	%r12d, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movq	%r13, %rdi
	movl	%r12d, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzbl	(%rax,%r12), %eax
	xorl	%ecx, %ecx
	testb	%al, %al
	setns	%cl
	shll	$8, %ecx
	addl	%ecx, %eax
	addl	$-256, %eax
	shrl	$9, %ebp
	andl	$7, %ebp
	movw	%ax, (%r14,%rbp,2)
	movzwl	%ax, %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movq	register_names(,%rbp,8), %rsi
	movl	$.L.str.54, %edi
	movl	%r12d, %edx
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp3:                                 # Block address taken
.LBB10_12:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	movl	%ebp, %eax
	shrl	$5, %eax
	addl	$2, %ecx
	movw	%cx, 16(%r14)
	andl	$14, %eax
	movl	%ebp, %ecx
	andl	$63, %ecx
	movl	%ebp, %edx
	shll	$10, %edx
	movswl	%dx, %edx
	sarl	$15, %edx
	andl	$-64, %edx
	orl	%ecx, %edx
	addw	(%r14,%rax), %dx
	movzwl	%dx, %r12d
	movq	%r13, %rdi
	movl	%r12d, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	shrl	$9, %ebp
	andl	$7, %ebp
	movzbl	(%r14,%rbp,2), %eax
	movq	24(%r14), %rcx
	movb	%al, (%rcx,%r12)
	movq	24(%r14), %rax
	cmpw	$0, 65030(%rax)
	je	.LBB10_14
# %bb.13:                               #   in Loop: Header=BB10_12 Depth=2
	movsbl	65030(%rax), %edi
	movq	8(%rsp), %rbx           # 8-byte Reload
	movq	%rbx, %rsi
	callq	fputc
	movq	24(%r14), %rax
	movw	$0, 65030(%rax)
	movq	%rbx, %rdi
	callq	fflush
.LBB10_14:                              #   in Loop: Header=BB10_12 Depth=2
	movq	register_names(,%rbp,8), %rdx
	movl	$.L.str.56, %edi
	movl	%r12d, %esi
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp4:                                 # Block address taken
.LBB10_15:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	movw	%ax, 14(%r14)
	movl	$.L.str.57, %edi
	xorl	%eax, %eax
	callq	printf
	testl	$2048, %ebp             # imm = 0x800
	jne	.LBB10_17
# %bb.16:                               #   in Loop: Header=BB10_15 Depth=2
	shrl	$6, %ebp
	andl	$7, %ebp
	movzwl	(%r14,%rbp,2), %ebx
	movq	register_names(,%rbp,8), %rsi
	movzwl	%bx, %edx
	movl	$.L.str.59, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB10_18
	.p2align	4, 0x90
.LBB10_17:                              #   in Loop: Header=BB10_15 Depth=2
	movl	%ebp, %eax
	andl	$2047, %eax             # imm = 0x7FF
	shll	$5, %ebp
	movswl	%bp, %esi
	shrl	$15, %esi
	andl	$30720, %esi            # imm = 0x7800
	orl	%eax, %esi
	addl	%esi, %esi
	movzwl	16(%r14), %ebx
	addw	%si, %bx
	movzwl	%bx, %edx
	movl	$.L.str.58, %edi
	xorl	%eax, %eax
	callq	printf
.LBB10_18:                              #   in Loop: Header=BB10_15 Depth=2
	movl	$10, %edi
	callq	putchar
	movzwl	%bx, %ebp
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movw	%bp, 16(%r14)
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp5:                                 # Block address taken
.LBB10_19:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	movl	%ebp, %r12d
	shrl	$9, %r12d
	andl	$7, %r12d
	movq	register_names(,%r12,8), %rsi
	movl	%ebp, %r15d
	shrl	$6, %r15d
	andl	$7, %r15d
	movq	register_names(,%r15,8), %rdx
	movl	$.L.str.60, %edi
	xorl	%eax, %eax
	callq	printf
	movl	%ebp, %eax
	andl	$31, %eax
	testb	$32, %bpl
	jne	.LBB10_21
# %bb.20:                               #   in Loop: Header=BB10_19 Depth=2
	movl	%eax, %ecx
	andl	$3, %ecx
	movzwl	(%r14,%rcx,2), %ebx
	andl	$7, %eax
	movq	register_names(,%rax,8), %rsi
	movl	$.L.str.44, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB10_22
	.p2align	4, 0x90
.LBB10_21:                              #   in Loop: Header=BB10_19 Depth=2
	shll	$11, %ebp
	movswl	%bp, %ecx
	sarl	$15, %ecx
	andl	$-32, %ecx
	movzwl	%ax, %ebx
	orl	%ecx, %ebx
	movzwl	%bx, %esi
	movl	$.L.str.53, %edi
	xorl	%eax, %eax
	callq	printf
.LBB10_22:                              #   in Loop: Header=BB10_19 Depth=2
	andw	(%r14,%r15,2), %bx
	movw	%bx, (%r14,%r12,2)
	movzwl	%bx, %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movl	$10, %edi
	callq	putchar
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp6:                                 # Block address taken
.LBB10_23:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	movq	%rbp, %rax
	shrq	$5, %rax
	andl	$14, %eax
	movzwl	(%r14,%rax), %eax
	testb	$1, %al
	jne	.LBB10_58
# %bb.24:                               #   in Loop: Header=BB10_23 Depth=2
	movl	%ebp, %ecx
	andl	$63, %ecx
	movl	%ebp, %edx
	shll	$11, %edx
	movswl	%dx, %edx
	shrl	$15, %edx
	andl	$32736, %edx            # imm = 0x7FE0
	orl	%ecx, %edx
	leal	(%rax,%rdx,2), %ebx
	movzwl	%bx, %r12d
	movq	%r13, %rdi
	movl	%r12d, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movq	%r13, %rdi
	movl	%r12d, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzwl	%bx, %ecx
	movzwl	(%rax,%rcx), %r13d
	movq	%r14, %rdi
	movl	%r13d, %esi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	shrl	$9, %ebp
	andl	$7, %ebp
	movw	%r13w, (%r14,%rbp,2)
	movq	16(%rsp), %r13          # 8-byte Reload
	movq	register_names(,%rbp,8), %rsi
	movl	$.L.str.63, %edi
	movl	%r12d, %edx
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp7:                                 # Block address taken
.LBB10_25:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	movl	%ebp, %eax
	shrl	$5, %eax
	addl	$2, %ecx
	movw	%cx, 16(%r14)
	andl	$14, %eax
	movl	%ebp, %ecx
	andl	$63, %ecx
	movl	%ebp, %edx
	shll	$10, %edx
	movswl	%dx, %edx
	shrl	$15, %edx
	andl	$32704, %edx            # imm = 0x7FC0
	orl	%ecx, %edx
	addl	%edx, %edx
	addw	(%r14,%rax), %dx
	movzwl	%dx, %r12d
	movq	%r13, %rdi
	movl	%r12d, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	shrl	$9, %ebp
	andl	$7, %ebp
	movzwl	(%r14,%rbp,2), %ecx
	movq	24(%r14), %rax
	movw	%cx, (%rax,%r12)
	cmpw	$0, 65030(%rax)
	je	.LBB10_27
# %bb.26:                               #   in Loop: Header=BB10_25 Depth=2
	movsbl	65030(%rax), %edi
	movq	8(%rsp), %rbx           # 8-byte Reload
	movq	%rbx, %rsi
	callq	fputc
	movq	24(%r14), %rax
	movw	$0, 65030(%rax)
	movq	%rbx, %rdi
	callq	fflush
.LBB10_27:                              #   in Loop: Header=BB10_25 Depth=2
	movq	register_names(,%rbp,8), %rdx
	movl	$.L.str.64, %edi
	movl	%r12d, %esi
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp8:                                 # Block address taken
.LBB10_28:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addw	$2, 16(%r14)
	testb	$64, 19(%r14)
	jne	.LBB10_57
# %bb.29:                               #   in Loop: Header=BB10_28 Depth=2
	movq	24(%r14), %rax
	movzwl	6(%r14), %ecx
	movzwl	(%rax,%rcx), %ecx
	movw	%cx, 16(%r14)
	movl	12(%r14), %edx
	leal	2(%rdx), %esi
	movw	%si, 12(%r14)
	movzwl	%si, %esi
	movzwl	(%rax,%rsi), %esi
	movw	%si, 18(%r14)
	addl	$4, %edx
	movw	%dx, 12(%r14)
	movzwl	%cx, %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp9:                                 # Block address taken
.LBB10_30:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %ebp
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	testb	$32, %bpl
	jne	.LBB10_32
# %bb.31:                               #   in Loop: Header=BB10_30 Depth=2
	movl	%ebp, %eax
	andl	$7, %eax
	movzwl	(%r14,%rax,2), %eax
	jmp	.LBB10_33
	.p2align	4, 0x90
.LBB10_32:                              #   in Loop: Header=BB10_30 Depth=2
	movl	%ebp, %ecx
	andl	$31, %ecx
	movl	%ebp, %eax
	shll	$11, %eax
	cwtl
	sarl	$15, %eax
	andl	$-32, %eax
	orl	%ecx, %eax
.LBB10_33:                              #   in Loop: Header=BB10_30 Depth=2
	movl	%ebp, %edx
	shrl	$6, %edx
	andl	$7, %edx
	movzwl	%ax, %ecx
	movzwl	(%r14,%rdx,2), %eax
	xorw	%cx, %ax
	shrl	$9, %ebp
	andl	$7, %ebp
	movw	%ax, (%r14,%rbp,2)
	movq	register_names(,%rbp,8), %rsi
	movq	register_names(,%rdx,8), %rdx
	movl	$.L.str.66, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	(%r14,%rbp,2), %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp10:                                # Block address taken
.LBB10_34:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	leal	2(%rcx), %edx
	movzwl	(%rax,%rcx), %ebx
	movw	%dx, 16(%r14)
	shrl	$6, %ebx
	andl	$7, %ebx
	movq	register_names(,%rbx,8), %rsi
	movzwl	(%r14,%rbx,2), %edx
	movl	$.L.str.69, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	(%r14,%rbx,2), %esi
	movw	%si, 16(%r14)
	movq	%r13, %rdi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movzwl	16(%r14), %esi
	movq	%r13, %rdi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp11:                                # Block address taken
.LBB10_35:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB10_40 Depth 3
                                        #       Child Loop BB10_44 Depth 3
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %r13d
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	movl	%r13d, %r15d
	shrl	$6, %r15d
	andl	$7, %r15d
	movzwl	(%r14,%r15,2), %ebp
	testb	$16, %r13b
	movl	$76, %edi
	movl	$82, %eax
	cmovnel	%eax, %edi
	callq	putchar
	movl	$.L.str.72, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$16, %r13b
	je	.LBB10_38
# %bb.36:                               #   in Loop: Header=BB10_35 Depth=2
	testb	$32, %r13b
	jne	.LBB10_41
# %bb.37:                               #   in Loop: Header=BB10_35 Depth=2
	movl	$76, %edi
	callq	putchar
	xorl	%edx, %edx
	jmp	.LBB10_42
	.p2align	4, 0x90
.LBB10_38:                              #   in Loop: Header=BB10_35 Depth=2
	movl	%r13d, %eax
	andl	$15, %eax
	testw	%ax, %ax
	je	.LBB10_45
# %bb.39:                               #   in Loop: Header=BB10_35 Depth=2
	xorl	%ecx, %ecx
	.p2align	4, 0x90
.LBB10_40:                              #   Parent Loop BB10_1 Depth=1
                                        #     Parent Loop BB10_35 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	addl	%ebp, %ebp
	addl	$1, %ecx
	cmpl	%eax, %ecx
	jne	.LBB10_40
	jmp	.LBB10_45
	.p2align	4, 0x90
.LBB10_41:                              #   in Loop: Header=BB10_35 Depth=2
	movl	$65, %edi
	callq	putchar
	movzwl	(%r14,%r15,2), %edx
	shrl	$15, %edx
.LBB10_42:                              #   in Loop: Header=BB10_35 Depth=2
	movl	%r13d, %eax
	andl	$15, %eax
	testw	%ax, %ax
	je	.LBB10_45
# %bb.43:                               #   in Loop: Header=BB10_35 Depth=2
	xorl	%ecx, %ecx
	testw	%dx, %dx
	setne	%cl
	shll	$15, %ecx
	xorl	%edx, %edx
	.p2align	4, 0x90
.LBB10_44:                              #   Parent Loop BB10_1 Depth=1
                                        #     Parent Loop BB10_35 Depth=2
                                        # =>    This Inner Loop Header: Depth=3
	movzwl	%bp, %esi
	shrl	%esi
	movl	%ecx, %ebp
	orl	%esi, %ebp
	addl	$1, %edx
	cmpl	%eax, %edx
	jne	.LBB10_44
.LBB10_45:                              #   in Loop: Header=BB10_35 Depth=2
	movl	%r13d, %r12d
	shrl	$9, %r12d
	andl	$7, %r12d
	movq	register_names(,%r12,8), %rsi
	movq	register_names(,%r15,8), %rdx
	movl	$.L.str.74, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$16, %r13b
	je	.LBB10_48
# %bb.46:                               #   in Loop: Header=BB10_35 Depth=2
	movl	$.L.str.75, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$32, %r13b
	jne	.LBB10_49
# %bb.47:                               #   in Loop: Header=BB10_35 Depth=2
	movl	$76, %edi
	jmp	.LBB10_50
	.p2align	4, 0x90
.LBB10_48:                              #   in Loop: Header=BB10_35 Depth=2
	movl	$.L.str.76, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB10_51
	.p2align	4, 0x90
.LBB10_49:                              #   in Loop: Header=BB10_35 Depth=2
	movl	$65, %edi
.LBB10_50:                              #   in Loop: Header=BB10_35 Depth=2
	callq	putchar
.LBB10_51:                              #   in Loop: Header=BB10_35 Depth=2
	andl	$15, %r13d
	movl	$.L.str.77, %edi
	movl	%r13d, %esi
	xorl	%eax, %eax
	callq	printf
	movw	%bp, (%r14,%r12,2)
	movzwl	%bp, %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	movq	16(%rsp), %r13          # 8-byte Reload
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp12:                                # Block address taken
.LBB10_52:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	leal	2(%rcx), %edx
	movzwl	(%rax,%rcx), %ebx
	movw	%dx, 16(%r14)
	movl	%ebx, %eax
	andl	$511, %eax              # imm = 0x1FF
	movl	%ebx, %edx
	shll	$7, %edx
	movswl	%dx, %edx
	shrl	$15, %edx
	andl	$32256, %edx            # imm = 0x7E00
	orl	%eax, %edx
	leal	(%rcx,%rdx,2), %eax
	addl	$2, %eax
	shrl	$9, %ebx
	andl	$7, %ebx
	movq	register_names(,%rbx,8), %rsi
	movzwl	%ax, %ebp
	movl	$.L.str.78, %edi
	movl	%ebp, %edx
	xorl	%eax, %eax
	callq	printf
	movw	%bp, (%r14,%rbx,2)
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
	.p2align	4, 0x90
.Ltmp13:                                # Block address taken
.LBB10_53:                              #   Parent Loop BB10_1 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzbl	(%rax,%rcx), %r12d
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	movw	%ax, 14(%r14)
	leaq	(%r12,%r12), %rsi
	movl	$.L.str.79, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	(%rax,%r12,2), %ebp
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movw	%bp, 16(%r14)
	movl	$.L.str.80, %edi
	movl	%ebp, %esi
	movl	%r12d, %edx
	xorl	%eax, %eax
	callq	printf
	movq	%r13, %rdi
	movl	%ebp, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %eax
	shrq	$9, %rax
	andl	$120, %eax
	jmpq	*.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table(%rax)
.Ltmp14:                                # Block address taken
.LBB10_54:
	movl	$.L.str.67, %edi
	jmp	.LBB10_56
.Ltmp15:                                # Block address taken
.LBB10_55:
	movl	$.L.str.68, %edi
.LBB10_56:
	movq	24(%r14), %rax
	movzwl	16(%r14), %ecx
	movzwl	(%rax,%rcx), %esi
	leal	2(%rcx), %eax
	movw	%ax, 16(%r14)
	xorl	%eax, %eax
	callq	printf
	movl	$-256, %eax
	addl	16(%r14), %eax
	movzwl	%ax, %esi
	movq	%r13, %rdi
	movl	$288, %edx              # imm = 0x120
	callq	_Z16markRangeTouchedP13MemoryTrackertt
	movq	24(%r14), %rax
	andb	$64, 65535(%rax)
	addq	$24, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB10_57:
	.cfi_def_cfa_offset 80
	movl	$.Lstr.108, %edi
	callq	puts
	movl	$403, %edi              # imm = 0x193
	callq	exit
.LBB10_58:
	movl	$.L.str.61, %edi
	movl	$.L.str.62, %esi
	movl	$.L__PRETTY_FUNCTION__._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE, %ecx
	movl	$119, %edx
	callq	__assert_fail
.Lfunc_end10:
	.size	_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE, .Lfunc_end10-_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.cfi_endproc
                                        # -- End function
	.globl	_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE # -- Begin function _Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.p2align	4, 0x90
	.type	_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE,@function
_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE: # @_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	movq	%rdx, 48(%rsp)          # 8-byte Spill
	movq	%rsi, %r13
	movq	%rdi, %r14
	leaq	8(%rsp), %rdi
	callq	_ZN3CLIC2Ev
	movq	24(%r14), %rax
	cmpb	$0, 65535(%rax)
	js	.LBB11_2
.LBB11_1:
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB11_2:
	.cfi_def_cfa_offset 112
	movq	%r13, 32(%rsp)          # 8-byte Spill
	jmp	.LBB11_6
.LBB11_3:                               #   in Loop: Header=BB11_6 Depth=1
	andl	$511, %r12d             # imm = 0x1FF
	movzwl	%r15w, %eax
	andl	$1, %eax
	negl	%eax
	andl	$32256, %eax            # imm = 0x7E00
	orl	%r12d, %eax
	addl	%eax, %eax
	addw	16(%r14), %ax
	shrl	%r15d
	andl	$7, %r15d
	movq	register_names(,%r15,8), %rsi
	movzwl	%ax, %ebx
	movl	$.L.str.78, %edi
	movl	%ebx, %edx
	xorl	%eax, %eax
	callq	printf
	movw	%bx, (%r14,%r15,2)
	movq	%r14, %rdi
	movl	%ebx, %esi
.LBB11_4:                               #   in Loop: Header=BB11_6 Depth=1
	callq	_Z16setFlagRegistersP14ProcessorStatet
	.p2align	4, 0x90
.LBB11_5:                               #   in Loop: Header=BB11_6 Depth=1
	movq	24(%r14), %rax
	cmpb	$0, 65535(%rax)
	jns	.LBB11_1
.LBB11_6:                               # =>This Loop Header: Depth=1
                                        #     Child Loop BB11_12 Depth 2
                                        #       Child Loop BB11_33 Depth 3
                                        #         Child Loop BB11_36 Depth 4
                                        #     Child Loop BB11_86 Depth 2
                                        #     Child Loop BB11_95 Depth 2
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jg	.LBB11_8
# %bb.7:                                #   in Loop: Header=BB11_6 Depth=1
	cmpb	$0, 9(%rsp)
	jne	.LBB11_10
.LBB11_8:                               #   in Loop: Header=BB11_6 Depth=1
	cmpb	$0, 16(%rsp)
	je	.LBB11_41
# %bb.9:                                #   in Loop: Header=BB11_6 Depth=1
	movzwl	16(%r14), %ecx
	cmpw	18(%rsp), %cx
	jne	.LBB11_41
.LBB11_10:                              #   in Loop: Header=BB11_6 Depth=1
	movb	$0, 16(%rsp)
	movb	$0, 9(%rsp)
	xorl	%r15d, %r15d
	jmp	.LBB11_12
	.p2align	4, 0x90
.LBB11_11:                              #   in Loop: Header=BB11_12 Depth=2
	testb	$1, %r15b
	jne	.LBB11_42
.LBB11_12:                              #   Parent Loop BB11_6 Depth=1
                                        # =>  This Loop Header: Depth=2
                                        #       Child Loop BB11_33 Depth 3
                                        #         Child Loop BB11_36 Depth 4
	movq	stdout(%rip), %rdi
	callq	fflush
	movl	$.L.str.81, %edi
	xorl	%eax, %eax
	callq	printf
	movq	stdout(%rip), %rdi
	callq	fflush
	movq	stdin(%rip), %rdi
	movq	stdout(%rip), %rsi
	callq	_Z10readOptionP8_IO_FILES0_
                                        # kill: def $eax killed $eax def $rax
	addl	$-1, %eax
	cmpl	$16, %eax
	ja	.LBB11_26
# %bb.13:                               #   in Loop: Header=BB11_12 Depth=2
	jmpq	*.LJTI11_0(,%rax,8)
.LBB11_14:                              #   in Loop: Header=BB11_12 Depth=2
	movb	$1, 8(%rsp)
	jmp	.LBB11_27
.LBB11_15:                              #   in Loop: Header=BB11_12 Depth=2
	movb	24(%rsp), %al
	movl	%eax, %ecx
	xorb	$1, %cl
	testb	%al, %al
	movb	%cl, 24(%rsp)
	movl	$.L.str.86, %esi
	movl	$.L.str.85, %eax
	cmoveq	%rax, %rsi
	movl	$.L.str.88, %edi
	jmp	.LBB11_25
.LBB11_16:                              #   in Loop: Header=BB11_12 Depth=2
	movl	$.L.str.83, %edi
	xorl	%esi, %esi
	movl	$1, %edx
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_27
.LBB11_17:                              #   in Loop: Header=BB11_12 Depth=2
	movb	$1, 20(%rsp)
	jmp	.LBB11_27
.LBB11_18:                              #   in Loop: Header=BB11_12 Depth=2
	movl	$.Lstr.112, %edi
	callq	puts
	movw	$257, 20(%rsp)          # imm = 0x101
	jmp	.LBB11_27
.LBB11_19:                              #   in Loop: Header=BB11_12 Depth=2
	movq	24(%r14), %rsi
	movq	32(%rsp), %rdi          # 8-byte Reload
	callq	_Z18printTouchedMemoryP13MemoryTrackerPh
	jmp	.LBB11_27
.LBB11_20:                              #   in Loop: Header=BB11_12 Depth=2
	movb	$1, 9(%rsp)
	movl	%edx, %eax
	addl	$-1, %eax
	movl	%eax, 12(%rsp)
	movl	$115, %eax
	movl	$32, %ecx
	cmovel	%ecx, %eax
	movl	$.L.str.87, %edi
	movl	%edx, %esi
	movl	%eax, %edx
	xorl	%eax, %eax
	callq	printf
	movb	$1, %r15b
	jmp	.LBB11_27
.LBB11_21:                              #   in Loop: Header=BB11_12 Depth=2
	movb	$1, 16(%rsp)
	movw	%dx, 18(%rsp)
	movb	$1, %r15b
	jmp	.LBB11_27
.LBB11_22:                              #   in Loop: Header=BB11_12 Depth=2
	movb	$1, 25(%rsp)
	jmp	.LBB11_27
.LBB11_23:                              #   in Loop: Header=BB11_12 Depth=2
	movb	22(%rsp), %al
	movl	%eax, %ecx
	xorb	$1, %cl
	testb	%al, %al
	movb	%cl, 22(%rsp)
	movl	$.L.str.86, %esi
	movl	$.L.str.85, %eax
	cmoveq	%rax, %rsi
	movl	$.L.str.89, %edi
	jmp	.LBB11_25
.LBB11_24:                              #   in Loop: Header=BB11_12 Depth=2
	movb	23(%rsp), %al
	movl	%eax, %ecx
	xorb	$1, %cl
	testb	%al, %al
	movb	%cl, 23(%rsp)
	movl	$.L.str.86, %esi
	movl	$.L.str.85, %eax
	cmoveq	%rax, %rsi
	movl	$.L.str.84, %edi
.LBB11_25:                              #   in Loop: Header=BB11_12 Depth=2
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_27
.LBB11_26:                              #   in Loop: Header=BB11_12 Depth=2
	movl	$.Lstr.113, %edi
	callq	puts
	.p2align	4, 0x90
.LBB11_27:                              #   in Loop: Header=BB11_12 Depth=2
	movb	8(%rsp), %al
	orb	23(%rsp), %al
	je	.LBB11_29
# %bb.28:                               #   in Loop: Header=BB11_12 Depth=2
	movb	$0, 8(%rsp)
	movl	$.Lstr.111, %edi
	callq	puts
	movzwl	(%r14), %esi
	movzwl	2(%r14), %edx
	movzwl	4(%r14), %ecx
	movzwl	6(%r14), %r8d
	movzwl	8(%r14), %r9d
	movzwl	10(%r14), %r10d
	movzwl	12(%r14), %r11d
	movzwl	14(%r14), %r12d
	movzwl	18(%r14), %ebx
	movl	%ebx, %r13d
	andl	$1, %r13d
	orl	$48, %r13d
	movl	%ebx, %ebp
	shrl	%ebp
	andl	$1, %ebp
	orl	$48, %ebp
	shrl	$2, %ebx
	andl	$1, %ebx
	orl	$48, %ebx
	movl	$.L.str.92, %edi
	movl	$0, %eax
	pushq	%rbx
	.cfi_adjust_cfa_offset 8
	pushq	%rbp
	.cfi_adjust_cfa_offset 8
	pushq	%r13
	.cfi_adjust_cfa_offset 8
	pushq	%r12
	.cfi_adjust_cfa_offset 8
	pushq	%r11
	.cfi_adjust_cfa_offset 8
	pushq	%r10
	.cfi_adjust_cfa_offset 8
	callq	printf
	addq	$48, %rsp
	.cfi_adjust_cfa_offset -48
.LBB11_29:                              #   in Loop: Header=BB11_12 Depth=2
	movb	22(%rsp), %al
	orb	20(%rsp), %al
	je	.LBB11_39
# %bb.30:                               #   in Loop: Header=BB11_12 Depth=2
	movb	$0, 20(%rsp)
	movl	$.Lstr.110, %edi
	callq	puts
	movl	$1, %ebx
	jmp	.LBB11_33
	.p2align	4, 0x90
.LBB11_31:                              #   in Loop: Header=BB11_33 Depth=3
	movq	cli_help(,%rbx,8), %rsi
	movl	$.L.str.44, %edi
	xorl	%eax, %eax
	callq	printf
.LBB11_32:                              #   in Loop: Header=BB11_33 Depth=3
	movl	$10, %edi
	callq	putchar
	addq	$1, %rbx
	cmpq	$12, %rbx
	je	.LBB11_37
.LBB11_33:                              #   Parent Loop BB11_6 Depth=1
                                        #     Parent Loop BB11_12 Depth=2
                                        # =>    This Loop Header: Depth=3
                                        #         Child Loop BB11_36 Depth 4
	movq	cli_options_strings(,%rbx,8), %r12
	movq	%r12, %rdi
	callq	strlen
	movq	%rax, %rbp
	movl	$.L.str.94, %edi
	movl	%ebx, %esi
	movq	%r12, %rdx
	xorl	%eax, %eax
	callq	printf
	cmpb	$0, 21(%rsp)
	je	.LBB11_32
# %bb.34:                               #   in Loop: Header=BB11_33 Depth=3
	movl	$11, %eax
	subl	%ebp, %eax
	testl	%eax, %eax
	jle	.LBB11_31
# %bb.35:                               #   in Loop: Header=BB11_33 Depth=3
	addl	$-11, %ebp
	.p2align	4, 0x90
.LBB11_36:                              #   Parent Loop BB11_6 Depth=1
                                        #     Parent Loop BB11_12 Depth=2
                                        #       Parent Loop BB11_33 Depth=3
                                        # =>      This Inner Loop Header: Depth=4
	movl	$32, %edi
	callq	putchar
	incl	%ebp
	jne	.LBB11_36
	jmp	.LBB11_31
	.p2align	4, 0x90
.LBB11_37:                              #   in Loop: Header=BB11_12 Depth=2
	cmpb	$0, 21(%rsp)
	je	.LBB11_39
# %bb.38:                               #   in Loop: Header=BB11_12 Depth=2
	movb	$0, 21(%rsp)
.LBB11_39:                              #   in Loop: Header=BB11_12 Depth=2
	movb	25(%rsp), %al
	orb	24(%rsp), %al
	je	.LBB11_11
# %bb.40:                               #   in Loop: Header=BB11_12 Depth=2
	movb	$0, 25(%rsp)
	movzwl	16(%r14), %esi
	movl	$.L.str.96, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_11
	.p2align	4, 0x90
.LBB11_41:                              #   in Loop: Header=BB11_6 Depth=1
	addl	$-1, %eax
	movl	%eax, 12(%rsp)
.LBB11_42:                              #   in Loop: Header=BB11_6 Depth=1
	movq	24(%r14), %rax
	movzwl	16(%r14), %esi
	movzbl	(%rax,%rsi), %ebp
	movzbl	1(%rax,%rsi), %r15d
	movq	32(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rdi
                                        # kill: def $esi killed $esi killed $rsi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movzwl	16(%r14), %esi
	movq	%r13, %rdi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movzwl	16(%r14), %esi
	movl	$.L.str.16, %edi
	xorl	%eax, %eax
	callq	printf
	addw	$2, 16(%r14)
	movl	%r15d, %r12d
	shll	$8, %r12d
	orl	%ebp, %r12d
	movl	%r15d, %ebx
	shrl	$4, %ebx
	movl	$.L.str.97, %edi
	movl	%ebx, %esi
	movl	%r12d, %edx
	xorl	%eax, %eax
	callq	printf
	jmpq	*.LJTI11_1(,%rbx,8)
.LBB11_43:                              #   in Loop: Header=BB11_6 Depth=1
	andl	$511, %r12d             # imm = 0x1FF
	movzwl	%r15w, %ecx
	movl	%ecx, %eax
	andl	$1, %eax
	negl	%eax
	andl	$32256, %eax            # imm = 0x7E00
	orl	%r12d, %eax
	addl	%eax, %eax
	addw	16(%r14), %ax
	movl	%ecx, %esi
	shrl	$3, %esi
	movzwl	18(%r14), %edx
	andl	%edx, %esi
	movb	$1, %bpl
	testb	$1, %sil
	je	.LBB11_87
# %bb.44:                               #   in Loop: Header=BB11_6 Depth=1
	movq	32(%rsp), %r13          # 8-byte Reload
	jmp	.LBB11_89
.LBB11_45:                              #   in Loop: Header=BB11_6 Depth=1
	movl	$.L.str.68, %edi
	jmp	.LBB11_73
.LBB11_46:                              #   in Loop: Header=BB11_6 Depth=1
	movzwl	16(%r14), %eax
	movw	%ax, 14(%r14)
	movl	$.L.str.57, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	%r15w, %eax
	testb	$8, %al
	jne	.LBB11_74
# %bb.47:                               #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movzwl	(%r14,%r12,2), %ebx
	movq	register_names(,%r12,8), %rsi
	movzwl	%bx, %edx
	movl	$.L.str.59, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_75
.LBB11_48:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movq	register_names(,%r12,8), %rsi
	movzwl	(%r14,%r12,2), %edx
	movl	$.L.str.69, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	(%r14,%r12,2), %esi
	movw	%si, 16(%r14)
	movq	%r13, %rdi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movzwl	16(%r14), %esi
	movq	%r13, %rdi
	jmp	.LBB11_77
.LBB11_49:                              #   in Loop: Header=BB11_6 Depth=1
	movzwl	%bp, %eax
	testb	$32, %al
	jne	.LBB11_78
# %bb.50:                               #   in Loop: Header=BB11_6 Depth=1
	andl	$7, %ebp
	movzwl	(%r14,%rbp,2), %eax
	jmp	.LBB11_79
.LBB11_51:                              #   in Loop: Header=BB11_6 Depth=1
	movzwl	%bp, %eax
	andl	$63, %eax
	xorl	%ecx, %ecx
	testb	$16, %bpl
	sete	%cl
	shll	$5, %ecx
	addl	$-32, %ecx
	orl	%eax, %ecx
	shrl	$6, %r12d
	andl	$7, %r12d
	addw	(%r14,%r12,2), %cx
	movzwl	%cx, %ebx
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzbl	(%rax,%rbx), %eax
	xorl	%ecx, %ecx
	testb	%al, %al
	setns	%cl
	shll	$8, %ecx
	addl	%ecx, %eax
	addl	$-256, %eax
	shrl	%r15d
	andl	$7, %r15d
	movw	%ax, (%r14,%r15,2)
	movzwl	%ax, %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movq	register_names(,%r15,8), %rsi
	movl	$.L.str.54, %edi
	movl	%ebx, %edx
	jmp	.LBB11_69
.LBB11_52:                              #   in Loop: Header=BB11_6 Depth=1
	movzwl	16(%r14), %eax
	movw	%ax, 14(%r14)
	movq	%rbp, %rsi
	addq	%rbp, %rsi
	movl	$.L.str.79, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movq	24(%r14), %rax
	movzwl	(%rax,%rbp,2), %ebx
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movw	%bx, 16(%r14)
	movl	$.L.str.80, %edi
	movl	%ebx, %esi
	movl	%ebp, %edx
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_76
.LBB11_53:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movzwl	%bp, %eax
	andl	$63, %eax
	movq	%rbp, %rcx
	xorl	%ebp, %ebp
	testb	$32, %cl
	sete	%bpl
	shll	$6, %ebp
	orl	%eax, %ebp
	addw	(%r14,%r12,2), %bp
	addl	$-64, %ebp
	movzwl	%bp, %ebx
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	shrl	%r15d
	andl	$7, %r15d
	movb	(%r14,%r15,2), %al
	movq	24(%r14), %rcx
	movzwl	%bp, %edx
	movb	%al, (%rcx,%rdx)
	movq	24(%r14), %rax
	cmpw	$0, 65030(%rax)
	je	.LBB11_55
# %bb.54:                               #   in Loop: Header=BB11_6 Depth=1
	movsbl	65030(%rax), %edi
	movq	48(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rsi
	callq	fputc
	movq	24(%r14), %rax
	movw	$0, 65030(%rax)
	movq	%rbp, %rdi
	callq	fflush
.LBB11_55:                              #   in Loop: Header=BB11_6 Depth=1
	movq	register_names(,%r15,8), %rdx
	movl	$.L.str.56, %edi
	movl	%ebx, %esi
	jmp	.LBB11_59
.LBB11_56:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movzwl	%bp, %eax
	andl	$63, %eax
	testb	$32, %bpl
	movl	$32704, %ecx            # imm = 0x7FC0
	movl	$0, %edx
	cmovel	%edx, %ecx
	orl	%eax, %ecx
	addl	%ecx, %ecx
	addw	(%r14,%r12,2), %cx
	movzwl	%cx, %ebx
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	shrl	%r15d
	andl	$7, %r15d
	movzwl	(%r14,%r15,2), %ecx
	movq	24(%r14), %rax
	movw	%cx, (%rax,%rbx)
	cmpw	$0, 65030(%rax)
	je	.LBB11_58
# %bb.57:                               #   in Loop: Header=BB11_6 Depth=1
	movsbl	65030(%rax), %edi
	movq	48(%rsp), %rbp          # 8-byte Reload
	movq	%rbp, %rsi
	callq	fputc
	movq	24(%r14), %rax
	movw	$0, 65030(%rax)
	movq	%rbp, %rdi
	callq	fflush
.LBB11_58:                              #   in Loop: Header=BB11_6 Depth=1
	movq	register_names(,%r15,8), %rdx
	movl	$.L.str.64, %edi
	movl	%ebx, %esi
.LBB11_59:                              #   in Loop: Header=BB11_6 Depth=1
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_5
.LBB11_60:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	%r15d
	andl	$7, %r15d
	movq	register_names(,%r15,8), %rsi
	shrl	$6, %r12d
	andl	$7, %r12d
	movq	register_names(,%r12,8), %rdx
	movl	$.L.str.52, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	%bp, %eax
	testb	$32, %al
	jne	.LBB11_80
# %bb.61:                               #   in Loop: Header=BB11_6 Depth=1
	andl	$7, %ebp
	movzwl	(%r14,%rbp,2), %ebx
	movq	register_names(,%rbp,8), %rsi
	movl	$.L.str.44, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_81
.LBB11_62:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	%r15d
	andl	$7, %r15d
	movq	register_names(,%r15,8), %rsi
	shrl	$6, %r12d
	andl	$7, %r12d
	movq	register_names(,%r12,8), %rdx
	movl	$.L.str.60, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	%bp, %ecx
	movl	%ebp, %eax
	andl	$31, %eax
	testb	$32, %cl
	jne	.LBB11_82
# %bb.63:                               #   in Loop: Header=BB11_6 Depth=1
	movl	%eax, %ecx
	andl	$3, %ecx
	movzwl	(%r14,%rcx,2), %ebx
	andl	$7, %eax
	movq	register_names(,%rax,8), %rsi
	movl	$.L.str.44, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_83
.LBB11_64:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movzwl	(%r14,%r12,2), %ebx
	movq	%rbp, %r13
	movzwl	%r13w, %ebp
	testb	$16, %bpl
	movl	$76, %edi
	movl	$82, %eax
	cmovnel	%eax, %edi
	callq	putchar
	movl	$.L.str.72, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$16, %bpl
	movq	%r13, 40(%rsp)          # 8-byte Spill
	je	.LBB11_85
# %bb.65:                               #   in Loop: Header=BB11_6 Depth=1
	testb	$32, %bpl
	jne	.LBB11_92
# %bb.66:                               #   in Loop: Header=BB11_6 Depth=1
	movl	$76, %edi
	callq	putchar
	xorl	%edx, %edx
	jmp	.LBB11_93
.LBB11_67:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movzwl	(%r14,%r12,2), %eax
	testb	$1, %al
	jne	.LBB11_104
# %bb.68:                               #   in Loop: Header=BB11_6 Depth=1
	movzwl	%bp, %ecx
	andl	$63, %ecx
	testb	$16, %bpl
	movl	$32736, %edx            # imm = 0x7FE0
	movl	$0, %esi
	cmovel	%esi, %edx
	orl	%ecx, %edx
	leal	(%rax,%rdx,2), %ebp
	movzwl	%bp, %ebx
	movq	32(%rsp), %r13          # 8-byte Reload
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movq	24(%r14), %rax
	movzwl	%bp, %ecx
	movzwl	(%rax,%rcx), %ebp
	movq	%r14, %rdi
	movl	%ebp, %esi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	shrl	%r15d
	andl	$7, %r15d
	movw	%bp, (%r14,%r15,2)
	movq	register_names(,%r15,8), %rsi
	movl	$.L.str.63, %edi
	movl	%ebx, %edx
.LBB11_69:                              #   in Loop: Header=BB11_6 Depth=1
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_5
.LBB11_70:                              #   in Loop: Header=BB11_6 Depth=1
	testb	$64, 19(%r14)
	jne	.LBB11_105
# %bb.71:                               #   in Loop: Header=BB11_6 Depth=1
	movq	24(%r14), %rax
	movzwl	6(%r14), %ecx
	movzwl	(%rax,%rcx), %ecx
	movw	%cx, 16(%r14)
	movl	12(%r14), %ecx
	leal	2(%rcx), %edx
	movw	%dx, 12(%r14)
	movzwl	%dx, %edx
	movzwl	(%rax,%rdx), %eax
	movw	%ax, 18(%r14)
	addl	$4, %ecx
	movw	%cx, 12(%r14)
	jmp	.LBB11_5
.LBB11_72:                              #   in Loop: Header=BB11_6 Depth=1
	movl	$.L.str.67, %edi
.LBB11_73:                              #   in Loop: Header=BB11_6 Depth=1
	movl	%r12d, %esi
	xorl	%eax, %eax
	callq	printf
	movl	16(%r14), %eax
	movl	$-256, %ecx
	addl	%ecx, %eax
	movzwl	%ax, %esi
	movq	%r13, %rdi
	movl	$288, %edx              # imm = 0x120
	callq	_Z16markRangeTouchedP13MemoryTrackertt
	movq	24(%r14), %rax
	andb	$64, 65535(%rax)
	jmp	.LBB11_5
.LBB11_74:                              #   in Loop: Header=BB11_6 Depth=1
	andl	$2047, %r12d            # imm = 0x7FF
	shll	$13, %eax
	movswl	%ax, %esi
	shrl	$15, %esi
	andl	$30720, %esi            # imm = 0x7800
	orl	%r12d, %esi
	addl	%esi, %esi
	movzwl	16(%r14), %ebx
	addw	%si, %bx
	movzwl	%bx, %edx
	movl	$.L.str.58, %edi
	xorl	%eax, %eax
	callq	printf
.LBB11_75:                              #   in Loop: Header=BB11_6 Depth=1
	movq	32(%rsp), %r13          # 8-byte Reload
	movl	$10, %edi
	callq	putchar
	movzwl	%bx, %ebx
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
	movw	%bx, 16(%r14)
.LBB11_76:                              #   in Loop: Header=BB11_6 Depth=1
	movq	%r13, %rdi
	movl	%ebx, %esi
.LBB11_77:                              #   in Loop: Header=BB11_6 Depth=1
	callq	_Z18markAddressTouchedP13MemoryTrackert
	jmp	.LBB11_5
.LBB11_78:                              #   in Loop: Header=BB11_6 Depth=1
	andl	$31, %eax
	xorl	%ecx, %ecx
	testb	$16, %bpl
	sete	%cl
	shll	$5, %ecx
	addl	%ecx, %eax
	addl	$-32, %eax
.LBB11_79:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	$6, %r12d
	andl	$7, %r12d
	movzwl	%ax, %ecx
	movzwl	(%r14,%r12,2), %eax
	xorw	%cx, %ax
	shrl	%r15d
	andl	$7, %r15d
	movw	%ax, (%r14,%r15,2)
	movq	register_names(,%r15,8), %rsi
	movq	register_names(,%r12,8), %rdx
	movl	$.L.str.66, %edi
	xorl	%eax, %eax
	callq	printf
	movzwl	(%r14,%r15,2), %esi
	jmp	.LBB11_103
.LBB11_80:                              #   in Loop: Header=BB11_6 Depth=1
	andl	$31, %eax
	xorl	%ecx, %ecx
	testb	$16, %bpl
	sete	%cl
	shll	$5, %ecx
	leal	(%rcx,%rax), %ebx
	addl	$-32, %ebx
	movzwl	%bx, %esi
	movl	$.L.str.53, %edi
	xorl	%eax, %eax
	callq	printf
.LBB11_81:                              #   in Loop: Header=BB11_6 Depth=1
	addw	(%r14,%r12,2), %bx
	jmp	.LBB11_84
.LBB11_82:                              #   in Loop: Header=BB11_6 Depth=1
	xorl	%ecx, %ecx
	testb	$16, %bpl
	sete	%cl
	shll	$5, %ecx
	movzwl	%ax, %eax
	leal	(%rcx,%rax), %ebx
	addl	$-32, %ebx
	movzwl	%bx, %esi
	movl	$.L.str.53, %edi
	xorl	%eax, %eax
	callq	printf
.LBB11_83:                              #   in Loop: Header=BB11_6 Depth=1
	andw	(%r14,%r12,2), %bx
.LBB11_84:                              #   in Loop: Header=BB11_6 Depth=1
	movw	%bx, (%r14,%r15,2)
	movzwl	%bx, %esi
	movq	%r14, %rdi
	callq	_Z16setFlagRegistersP14ProcessorStatet
	movl	$10, %edi
	callq	putchar
	jmp	.LBB11_5
.LBB11_85:                              #   in Loop: Header=BB11_6 Depth=1
	movl	%r13d, %eax
	andl	$15, %eax
	testw	%ax, %ax
	je	.LBB11_96
	.p2align	4, 0x90
.LBB11_86:                              #   Parent Loop BB11_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	addl	%ebx, %ebx
	addl	$-1, %eax
	jne	.LBB11_86
	jmp	.LBB11_96
.LBB11_87:                              #   in Loop: Header=BB11_6 Depth=1
	movl	%ecx, %esi
	shrl	$2, %esi
	movzwl	%dx, %edx
	movl	%edx, %edi
	shrl	%edi
	andl	%esi, %edi
	testb	$1, %dil
	movq	32(%rsp), %r13          # 8-byte Reload
	jne	.LBB11_89
# %bb.88:                               #   in Loop: Header=BB11_6 Depth=1
	shrl	%ecx
	shrl	$2, %edx
	andl	%ecx, %edx
	andb	$1, %dl
	movl	%edx, %ebp
.LBB11_89:                              #   in Loop: Header=BB11_6 Depth=1
	movzwl	%ax, %ebx
	testb	%bpl, %bpl
	je	.LBB11_91
# %bb.90:                               #   in Loop: Header=BB11_6 Depth=1
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z19warnUntouchedMemoryP13MemoryTrackert
	movw	%bx, 16(%r14)
	movq	%r13, %rdi
	movl	%ebx, %esi
	callq	_Z18markAddressTouchedP13MemoryTrackert
.LBB11_91:                              #   in Loop: Header=BB11_6 Depth=1
	movzbl	%bpl, %edx
	orl	$48, %edx
	movl	$.L.str.51, %edi
	movl	%ebx, %esi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_5
.LBB11_92:                              #   in Loop: Header=BB11_6 Depth=1
	movl	$65, %edi
	callq	putchar
	movzwl	(%r14,%r12,2), %edx
	shrl	$15, %edx
.LBB11_93:                              #   in Loop: Header=BB11_6 Depth=1
	movq	40(%rsp), %rax          # 8-byte Reload
                                        # kill: def $eax killed $eax killed $rax
	andl	$15, %eax
	testw	%ax, %ax
	je	.LBB11_96
# %bb.94:                               #   in Loop: Header=BB11_6 Depth=1
	xorl	%ecx, %ecx
	testw	%dx, %dx
	setne	%cl
	shll	$15, %ecx
	.p2align	4, 0x90
.LBB11_95:                              #   Parent Loop BB11_6 Depth=1
                                        # =>  This Inner Loop Header: Depth=2
	movzwl	%bx, %edx
	shrl	%edx
	movl	%ecx, %ebx
	orl	%edx, %ebx
	addl	$-1, %eax
	jne	.LBB11_95
.LBB11_96:                              #   in Loop: Header=BB11_6 Depth=1
	shrl	%r15d
	andl	$7, %r15d
	movq	register_names(,%r15,8), %rsi
	movq	register_names(,%r12,8), %rdx
	movl	$.L.str.74, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$16, %bpl
	je	.LBB11_99
# %bb.97:                               #   in Loop: Header=BB11_6 Depth=1
	movl	$.L.str.75, %edi
	xorl	%eax, %eax
	callq	printf
	testb	$32, %bpl
	jne	.LBB11_100
# %bb.98:                               #   in Loop: Header=BB11_6 Depth=1
	movl	$76, %edi
	jmp	.LBB11_101
.LBB11_99:                              #   in Loop: Header=BB11_6 Depth=1
	movl	$.L.str.76, %edi
	xorl	%eax, %eax
	callq	printf
	jmp	.LBB11_102
.LBB11_100:                             #   in Loop: Header=BB11_6 Depth=1
	movl	$65, %edi
.LBB11_101:                             #   in Loop: Header=BB11_6 Depth=1
	callq	putchar
.LBB11_102:                             #   in Loop: Header=BB11_6 Depth=1
	movq	40(%rsp), %rsi          # 8-byte Reload
	andl	$15, %esi
	movl	$.L.str.77, %edi
                                        # kill: def $esi killed $esi killed $rsi
	xorl	%eax, %eax
	callq	printf
	movw	%bx, (%r14,%r15,2)
	movzwl	%bx, %esi
.LBB11_103:                             #   in Loop: Header=BB11_6 Depth=1
	movq	%r14, %rdi
	jmp	.LBB11_4
.LBB11_104:
	movl	$.L.str.61, %edi
	movl	$.L.str.62, %esi
	movl	$.L__PRETTY_FUNCTION__._Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE, %ecx
	movl	$376, %edx              # imm = 0x178
	callq	__assert_fail
.LBB11_105:
	movl	$.Lstr.109, %edi
	callq	puts
	movl	$403, %edi              # imm = 0x193
	callq	exit
.Lfunc_end11:
	.size	_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE, .Lfunc_end11-_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.cfi_endproc
	.section	.rodata,"a",@progbits
	.p2align	3
.LJTI11_0:
	.quad	.LBB11_14
	.quad	.LBB11_20
	.quad	.LBB11_26
	.quad	.LBB11_19
	.quad	.LBB11_26
	.quad	.LBB11_26
	.quad	.LBB11_18
	.quad	.LBB11_16
	.quad	.LBB11_26
	.quad	.LBB11_17
	.quad	.LBB11_26
	.quad	.LBB11_26
	.quad	.LBB11_21
	.quad	.LBB11_22
	.quad	.LBB11_24
	.quad	.LBB11_23
	.quad	.LBB11_15
.LJTI11_1:
	.quad	.LBB11_43
	.quad	.LBB11_60
	.quad	.LBB11_51
	.quad	.LBB11_53
	.quad	.LBB11_46
	.quad	.LBB11_62
	.quad	.LBB11_67
	.quad	.LBB11_56
	.quad	.LBB11_70
	.quad	.LBB11_49
	.quad	.LBB11_72
	.quad	.LBB11_45
	.quad	.LBB11_48
	.quad	.LBB11_64
	.quad	.LBB11_3
	.quad	.LBB11_52
                                        # -- End function
	.section	.text._ZN3CLIC2Ev,"axG",@progbits,_ZN3CLIC2Ev,comdat
	.weak	_ZN3CLIC2Ev             # -- Begin function _ZN3CLIC2Ev
	.p2align	4, 0x90
	.type	_ZN3CLIC2Ev,@function
_ZN3CLIC2Ev:                            # @_ZN3CLIC2Ev
	.cfi_startproc
# %bb.0:
	movw	$256, (%rdi)            # imm = 0x100
	movl	$0, 4(%rdi)
	movb	$0, 8(%rdi)
	movq	$0, 10(%rdi)
	retq
.Lfunc_end12:
	.size	_ZN3CLIC2Ev, .Lfunc_end12-_ZN3CLIC2Ev
	.cfi_endproc
                                        # -- End function
	.text
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%r15
	.cfi_def_cfa_offset 24
	pushq	%r14
	.cfi_def_cfa_offset 32
	pushq	%r13
	.cfi_def_cfa_offset 40
	pushq	%r12
	.cfi_def_cfa_offset 48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	.cfi_offset %rbx, -56
	.cfi_offset %r12, -48
	.cfi_offset %r13, -40
	.cfi_offset %r14, -32
	.cfi_offset %r15, -24
	.cfi_offset %rbp, -16
	cmpl	$1, %edi
	jle	.LBB13_10
# %bb.1:
	movq	%rsi, %r14
	movl	%edi, %r15d
	leaq	8(%rsp), %rdi
	callq	_ZN14ProcessorStateC2Ev
	movq	8(%r14), %rdi
	movl	$.L.str.99, %esi
	callq	fopen
	testq	%rax, %rax
	je	.LBB13_11
# %bb.2:
	movq	%rax, %rbx
	movq	%rax, %rdi
	xorl	%esi, %esi
	movl	$2, %edx
	callq	fseek
	movq	%rbx, %rdi
	callq	ftell
	movq	%rax, %r13
	cmpq	$65535, %rax            # imm = 0xFFFF
	movl	$65535, %eax            # imm = 0xFFFF
	cmovaeq	%rax, %r13
	movq	%rbx, %rdi
	xorl	%esi, %esi
	xorl	%edx, %edx
	callq	fseek
	movl	$65535, %edi            # imm = 0xFFFF
	callq	malloc
	movq	%rax, 32(%rsp)
	testq	%rax, %rax
	je	.LBB13_12
# %bb.3:
	movq	%rax, %rbp
	movl	$65535, %edx            # imm = 0xFFFF
	movq	%rax, %rdi
	movl	$170, %esi
	callq	memset
	movl	$0, 65028(%rbp)
	movb	$0, 65534(%rbp)
	movl	$1, %esi
	movq	%rbp, %rdi
	movq	%r13, %rdx
	movq	%rbx, %rcx
	callq	fread_unlocked
	movl	$.L.str.102, %edi
	movl	$.L.str.103, %esi
	callq	fopen
	movq	%rax, %r12
	cmpl	$3, %r15d
	jl	.LBB13_4
# %bb.5:
	movq	16(%r14), %rsi
	movl	$.L.str.104, %edi
	callq	strcmp
	testl	%eax, %eax
	sete	%bpl
	jmp	.LBB13_6
.LBB13_4:
	xorl	%ebp, %ebp
.LBB13_6:
	movw	$1024, 24(%rsp)         # imm = 0x400
	movq	32(%rsp), %rax
	orb	$-128, 65535(%rax)
	callq	_Z19createMemoryTrackerv
	movq	%rax, %rbx
	movzwl	%r13w, %edx
	movq	%rax, %rdi
	xorl	%esi, %esi
	callq	_Z16markRangeTouchedP13MemoryTrackertt
	movl	$.Lstr.114, %edi
	callq	puts
	leaq	8(%rsp), %rdi
	movq	%rbx, %rsi
	movq	%r12, %rdx
	testb	%bpl, %bpl
	je	.LBB13_8
# %bb.7:
	callq	_Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	jmp	.LBB13_9
.LBB13_8:
	callq	_Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
.LBB13_9:
	movq	32(%rsp), %rsi
	movq	%rbx, %rdi
	callq	_Z18printTouchedMemoryP13MemoryTrackerPh
	movq	stdout(%rip), %rdi
	callq	fflush
	movq	%r12, %rdi
	callq	fflush
	movq	%r12, %rdi
	callq	fclose
	xorl	%eax, %eax
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%r12
	.cfi_def_cfa_offset 40
	popq	%r13
	.cfi_def_cfa_offset 32
	popq	%r14
	.cfi_def_cfa_offset 24
	popq	%r15
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.LBB13_10:
	.cfi_def_cfa_offset 96
	movl	$.Lstr.115, %edi
	callq	puts
	movl	$403, %edi              # imm = 0x193
	callq	exit
.LBB13_11:
	movq	stderr(%rip), %rdi
	movq	8(%r14), %rdx
	movl	$.L.str.100, %esi
	xorl	%eax, %eax
	callq	fprintf
	movl	$404, %edi              # imm = 0x194
	callq	exit
.LBB13_12:
	movl	$.L.str.101, %edi
	movl	$.L.str.62, %esi
	movl	$.L__PRETTY_FUNCTION__.main, %ecx
	movl	$444, %edx              # imm = 0x1BC
	callq	__assert_fail
.Lfunc_end13:
	.size	main, .Lfunc_end13-main
	.cfi_endproc
                                        # -- End function
	.section	.text._ZN14ProcessorStateC2Ev,"axG",@progbits,_ZN14ProcessorStateC2Ev,comdat
	.weak	_ZN14ProcessorStateC2Ev # -- Begin function _ZN14ProcessorStateC2Ev
	.p2align	4, 0x90
	.type	_ZN14ProcessorStateC2Ev,@function
_ZN14ProcessorStateC2Ev:                # @_ZN14ProcessorStateC2Ev
	.cfi_startproc
# %bb.0:
	xorps	%xmm0, %xmm0
	movups	%xmm0, (%rdi)
	movw	$0, 16(%rdi)
	andw	$-32768, 18(%rdi)       # imm = 0x8000
	movl	$0, 20(%rdi)
	movq	$0, 24(%rdi)
	retq
.Lfunc_end14:
	.size	_ZN14ProcessorStateC2Ev, .Lfunc_end14-_ZN14ProcessorStateC2Ev
	.cfi_endproc
                                        # -- End function
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"R0"
	.size	.L.str, 3

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"R1"
	.size	.L.str.1, 3

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"R2"
	.size	.L.str.2, 3

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"R3"
	.size	.L.str.3, 3

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"R4"
	.size	.L.str.4, 3

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"R5"
	.size	.L.str.5, 3

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"R6"
	.size	.L.str.6, 3

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"R7"
	.size	.L.str.7, 3

	.type	register_names,@object  # @register_names
	.data
	.globl	register_names
	.p2align	4
register_names:
	.quad	.L.str
	.quad	.L.str.1
	.quad	.L.str.2
	.quad	.L.str.3
	.quad	.L.str.4
	.quad	.L.str.5
	.quad	.L.str.6
	.quad	.L.str.7
	.size	register_names, 64

	.type	.L.str.9,@object        # @.str.9
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.9:
	.asciz	"mem != 0"
	.size	.L.str.9, 9

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"./src/memory_tracker.cpp"
	.size	.L.str.10, 25

	.type	.L__PRETTY_FUNCTION__._Z19createMemoryTrackerv,@object # @__PRETTY_FUNCTION__._Z19createMemoryTrackerv
.L__PRETTY_FUNCTION__._Z19createMemoryTrackerv:
	.asciz	"MemoryTracker *createMemoryTracker()"
	.size	.L__PRETTY_FUNCTION__._Z19createMemoryTrackerv, 37

	.type	.L.str.12,@object       # @.str.12
.L.str.12:
	.asciz	"ADDRESS:\t"
	.size	.L.str.12, 10

	.type	.L.str.14,@object       # @.str.14
.L.str.14:
	.asciz	"  %01x  %01x "
	.size	.L.str.14, 14

	.type	.L.str.16,@object       # @.str.16
.L.str.16:
	.asciz	"0x%04x: "
	.size	.L.str.16, 9

	.type	.L.str.17,@object       # @.str.17
.L.str.17:
	.asciz	"0x%02x%02x "
	.size	.L.str.17, 12

	.type	.L.str.18,@object       # @.str.18
.L.str.18:
	.asciz	"\t%s\n"
	.size	.L.str.18, 5

	.type	.L.str.20,@object       # @.str.20
.L.str.20:
	.asciz	"WARNING: The Address 0x%04x has never been stored to.\n"
	.size	.L.str.20, 55

	.type	.L.str.21,@object       # @.str.21
.L.str.21:
	.zero	1
	.size	.L.str.21, 1

	.type	.L.str.22,@object       # @.str.22
.L.str.22:
	.asciz	"regs"
	.size	.L.str.22, 5

	.type	.L.str.23,@object       # @.str.23
.L.str.23:
	.asciz	"cycle"
	.size	.L.str.23, 6

	.type	.L.str.24,@object       # @.str.24
.L.str.24:
	.asciz	"run"
	.size	.L.str.24, 4

	.type	.L.str.25,@object       # @.str.25
.L.str.25:
	.asciz	"memory"
	.size	.L.str.25, 7

	.type	.L.str.26,@object       # @.str.26
.L.str.26:
	.asciz	"if"
	.size	.L.str.26, 3

	.type	.L.str.27,@object       # @.str.27
.L.str.27:
	.asciz	"pc"
	.size	.L.str.27, 3

	.type	.L.str.28,@object       # @.str.28
.L.str.28:
	.asciz	"help"
	.size	.L.str.28, 5

	.type	.L.str.29,@object       # @.str.29
.L.str.29:
	.asciz	"version"
	.size	.L.str.29, 8

	.type	.L.str.30,@object       # @.str.30
.L.str.30:
	.asciz	"always"
	.size	.L.str.30, 7

	.type	.L.str.31,@object       # @.str.31
.L.str.31:
	.asciz	"commands"
	.size	.L.str.31, 9

	.type	.L.str.32,@object       # @.str.32
.L.str.32:
	.asciz	"step"
	.size	.L.str.32, 5

	.type	cli_options_strings,@object # @cli_options_strings
	.data
	.globl	cli_options_strings
	.p2align	4
cli_options_strings:
	.quad	.L.str.21
	.quad	.L.str.22
	.quad	.L.str.23
	.quad	.L.str.24
	.quad	.L.str.25
	.quad	.L.str.26
	.quad	.L.str.27
	.quad	.L.str.28
	.quad	.L.str.29
	.quad	.L.str.30
	.quad	.L.str.31
	.quad	.L.str.32
	.size	cli_options_strings, 96

	.type	.L.str.33,@object       # @.str.33
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.33:
	.asciz	"Displays the register contents >> always regs =>displays the registers after every command"
	.size	.L.str.33, 91

	.type	.L.str.34,@object       # @.str.34
.L.str.34:
	.asciz	"Run n cycles uninterrupted"
	.size	.L.str.34, 27

	.type	.L.str.35,@object       # @.str.35
.L.str.35:
	.asciz	"Run assembly"
	.size	.L.str.35, 13

	.type	.L.str.36,@object       # @.str.36
.L.str.36:
	.asciz	"Display the entire tracked memory"
	.size	.L.str.36, 34

	.type	.L.str.37,@object       # @.str.37
.L.str.37:
	.asciz	"Specify a conditional"
	.size	.L.str.37, 22

	.type	.L.str.38,@object       # @.str.38
.L.str.38:
	.asciz	"display the program counter >> always pc => displays the registers after every command"
	.size	.L.str.38, 87

	.type	.L.str.39,@object       # @.str.39
.L.str.39:
	.asciz	"Displays help"
	.size	.L.str.39, 14

	.type	.L.str.40,@object       # @.str.40
.L.str.40:
	.asciz	"Displays the version"
	.size	.L.str.40, 21

	.type	.L.str.41,@object       # @.str.41
.L.str.41:
	.asciz	"always modifier, does something after every command"
	.size	.L.str.41, 52

	.type	.L.str.42,@object       # @.str.42
.L.str.42:
	.asciz	"displays the commands >> always commands =>displays the commands after every command"
	.size	.L.str.42, 85

	.type	.L.str.43,@object       # @.str.43
.L.str.43:
	.asciz	"steps one cycle equivalent to cycle 1"
	.size	.L.str.43, 38

	.type	cli_help,@object        # @cli_help
	.data
	.globl	cli_help
	.p2align	4
cli_help:
	.quad	.L.str.21
	.quad	.L.str.33
	.quad	.L.str.34
	.quad	.L.str.35
	.quad	.L.str.36
	.quad	.L.str.37
	.quad	.L.str.38
	.quad	.L.str.39
	.quad	.L.str.40
	.quad	.L.str.41
	.quad	.L.str.42
	.quad	.L.str.43
	.size	cli_help, 96

	.type	buffer,@object          # @buffer
	.bss
	.globl	buffer
	.p2align	4
buffer:
	.zero	256
	.size	buffer, 256

	.type	.L.str.44,@object       # @.str.44
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.44:
	.asciz	"%s"
	.size	.L.str.44, 3

	.type	.L.str.45,@object       # @.str.45
.L.str.45:
	.asciz	"%d"
	.size	.L.str.45, 3

	.type	.L.str.46,@object       # @.str.46
.L.str.46:
	.asciz	"Not implemented yet\n"
	.size	.L.str.46, 21

	.type	.L.str.47,@object       # @.str.47
.L.str.47:
	.asciz	"Please enter the condition\n"
	.size	.L.str.47, 28

	.type	.L.str.48,@object       # @.str.48
.L.str.48:
	.asciz	"%04x"
	.size	.L.str.48, 5

	.type	.L.str.49,@object       # @.str.49
.L.str.49:
	.asciz	"Always display "
	.size	.L.str.49, 16

	.type	.L.str.50,@object       # @.str.50
.L.str.50:
	.asciz	"Did not recognize any of the options\nPlease try again!\n"
	.size	.L.str.50, 56

	.type	.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table,@object # @__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table
	.section	.rodata,"a",@progbits
	.p2align	4
.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table:
	.quad	.Ltmp0
	.quad	.Ltmp1
	.quad	.Ltmp2
	.quad	.Ltmp3
	.quad	.Ltmp4
	.quad	.Ltmp5
	.quad	.Ltmp6
	.quad	.Ltmp7
	.quad	.Ltmp8
	.quad	.Ltmp9
	.quad	.Ltmp14
	.quad	.Ltmp15
	.quad	.Ltmp10
	.quad	.Ltmp11
	.quad	.Ltmp12
	.quad	.Ltmp13
	.size	.L__const._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE.instr_table, 128

	.type	.L.str.51,@object       # @.str.51
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str.51:
	.asciz	"BR  PC <- 0x%04x\tTaken %c\n"
	.size	.L.str.51, 27

	.type	.L.str.52,@object       # @.str.52
.L.str.52:
	.asciz	"ADD %s <- %s + "
	.size	.L.str.52, 16

	.type	.L.str.53,@object       # @.str.53
.L.str.53:
	.asciz	"0x%04x"
	.size	.L.str.53, 7

	.type	.L.str.54,@object       # @.str.54
.L.str.54:
	.asciz	"LDB %s <- SEXT(MEM[0x%04x])\n"
	.size	.L.str.54, 29

	.type	.L.str.56,@object       # @.str.56
.L.str.56:
	.asciz	"STB 0x%04x <- %s\n"
	.size	.L.str.56, 18

	.type	.L.str.57,@object       # @.str.57
.L.str.57:
	.asciz	"JSR "
	.size	.L.str.57, 5

	.type	.L.str.58,@object       # @.str.58
.L.str.58:
	.asciz	"Offset 0x%04x with effective adress 0x%04x"
	.size	.L.str.58, 43

	.type	.L.str.59,@object       # @.str.59
.L.str.59:
	.asciz	"Register %s with address 0x%04x"
	.size	.L.str.59, 32

	.type	.L.str.60,@object       # @.str.60
.L.str.60:
	.asciz	"AND %s <- %s AND "
	.size	.L.str.60, 18

	.type	.L.str.61,@object       # @.str.61
.L.str.61:
	.asciz	"!(state->registers[l.base_r] & 0b1)"
	.size	.L.str.61, 36

	.type	.L.str.62,@object       # @.str.62
.L.str.62:
	.asciz	"main.cpp"
	.size	.L.str.62, 9

	.type	.L__PRETTY_FUNCTION__._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE,@object # @__PRETTY_FUNCTION__._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
.L__PRETTY_FUNCTION__._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE:
	.asciz	"void runNonInterruptable(ProcessorState *, MemoryTracker *, FILE *)"
	.size	.L__PRETTY_FUNCTION__._Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE, 68

	.type	.L.str.63,@object       # @.str.63
.L.str.63:
	.asciz	"LDW %s <- MEM[0x%04x]\n"
	.size	.L.str.63, 23

	.type	.L.str.64,@object       # @.str.64
.L.str.64:
	.asciz	"STW 0x%04x <- %s\n"
	.size	.L.str.64, 18

	.type	.L.str.66,@object       # @.str.66
.L.str.66:
	.asciz	"XOR %s <- %s XOR 0x%04x\n"
	.size	.L.str.66, 25

	.type	.L.str.67,@object       # @.str.67
.L.str.67:
	.asciz	"\nOp Code: 0x%01x is undefined in the current ISA\nExiting main loop\n"
	.size	.L.str.67, 68

	.type	.L.str.68,@object       # @.str.68
.L.str.68:
	.asciz	"0x%01x op_code is undefined in the current ISA\nExiting main loop\n"
	.size	.L.str.68, 66

	.type	.L.str.69,@object       # @.str.69
.L.str.69:
	.asciz	"JUMP PC <- %s, jumping to Address 0x%04x\n"
	.size	.L.str.69, 42

	.type	.L.str.72,@object       # @.str.72
.L.str.72:
	.asciz	"SHF"
	.size	.L.str.72, 4

	.type	.L.str.74,@object       # @.str.74
.L.str.74:
	.asciz	" %s <- %s"
	.size	.L.str.74, 10

	.type	.L.str.75,@object       # @.str.75
.L.str.75:
	.asciz	">>"
	.size	.L.str.75, 3

	.type	.L.str.76,@object       # @.str.76
.L.str.76:
	.asciz	"<< "
	.size	.L.str.76, 4

	.type	.L.str.77,@object       # @.str.77
.L.str.77:
	.asciz	"0x%01x\n"
	.size	.L.str.77, 8

	.type	.L.str.78,@object       # @.str.78
.L.str.78:
	.asciz	"LEA %s <- 0x%04x\n"
	.size	.L.str.78, 18

	.type	.L.str.79,@object       # @.str.79
.L.str.79:
	.asciz	"Raw Address 0x%04x\n"
	.size	.L.str.79, 20

	.type	.L.str.80,@object       # @.str.80
.L.str.80:
	.asciz	"TRAP jumping to address 0x%04x\n0x%04x\n"
	.size	.L.str.80, 39

	.type	.L.str.81,@object       # @.str.81
.L.str.81:
	.asciz	"> "
	.size	.L.str.81, 3

	.type	.L.str.83,@object       # @.str.83
.L.str.83:
	.asciz	"NALE Version %d.%d\n"
	.size	.L.str.83, 20

	.type	.L.str.84,@object       # @.str.84
.L.str.84:
	.asciz	"Printing registers after every command %s\n"
	.size	.L.str.84, 43

	.type	.L.str.85,@object       # @.str.85
.L.str.85:
	.asciz	"on"
	.size	.L.str.85, 3

	.type	.L.str.86,@object       # @.str.86
.L.str.86:
	.asciz	"off"
	.size	.L.str.86, 4

	.type	.L.str.87,@object       # @.str.87
.L.str.87:
	.asciz	"Executing %d Cycle%c\n"
	.size	.L.str.87, 22

	.type	.L.str.88,@object       # @.str.88
.L.str.88:
	.asciz	"Printing pc after every command is %s\n"
	.size	.L.str.88, 39

	.type	.L.str.89,@object       # @.str.89
.L.str.89:
	.asciz	"Printing commands after every command is %s\n"
	.size	.L.str.89, 45

	.type	.L.str.92,@object       # @.str.92
.L.str.92:
	.asciz	"\n\t\tR0: 0x%04x \tR1: 0x%04x \tR2: 0x%04x \tR3: 0x%04x \t\n\t\tR4: 0x%04x \tR5: 0x%04x \tR6: 0x%04x \tR7: 0x%04x \t\n\t\tN:  %c      \tZ:  %c      \tP:  %c\t\n"
	.size	.L.str.92, 140

	.type	.L.str.94,@object       # @.str.94
.L.str.94:
	.asciz	"%02d: %s "
	.size	.L.str.94, 10

	.type	.L.str.96,@object       # @.str.96
.L.str.96:
	.asciz	"PC: 0x%04x\n"
	.size	.L.str.96, 12

	.type	.L.str.97,@object       # @.str.97
.L.str.97:
	.asciz	"\tOPCODE: 0x%01x\tINSTR: 0x%04x "
	.size	.L.str.97, 31

	.type	.L__PRETTY_FUNCTION__._Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE,@object # @__PRETTY_FUNCTION__._Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
.L__PRETTY_FUNCTION__._Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE:
	.asciz	"void runInterruptable(ProcessorState *, MemoryTracker *, FILE *)"
	.size	.L__PRETTY_FUNCTION__._Z16runInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE, 65

	.type	.L.str.99,@object       # @.str.99
.L.str.99:
	.asciz	"rb"
	.size	.L.str.99, 3

	.type	.L.str.100,@object      # @.str.100
.L.str.100:
	.asciz	"Could not find %s\n Exiting.\n"
	.size	.L.str.100, 29

	.type	.L.str.101,@object      # @.str.101
.L.str.101:
	.asciz	"state.memory"
	.size	.L.str.101, 13

	.type	.L__PRETTY_FUNCTION__.main,@object # @__PRETTY_FUNCTION__.main
.L__PRETTY_FUNCTION__.main:
	.asciz	"int main(int, const char **)"
	.size	.L__PRETTY_FUNCTION__.main, 29

	.type	.L.str.102,@object      # @.str.102
.L.str.102:
	.asciz	"display.txt"
	.size	.L.str.102, 12

	.type	.L.str.103,@object      # @.str.103
.L.str.103:
	.asciz	"w"
	.size	.L.str.103, 2

	.type	.L.str.104,@object      # @.str.104
.L.str.104:
	.asciz	"-I"
	.size	.L.str.104, 3

	.type	.Lstr,@object           # @str
.Lstr:
	.asciz	"\nInstruction is not implemented or not defined in the ISA\nExiting"
	.size	.Lstr, 66

	.type	.Lstr.106,@object       # @str.106
.Lstr.106:
	.asciz	"MEMORY: ------"
	.size	.Lstr.106, 15

	.type	.Lstr.107,@object       # @str.107
.Lstr.107:
	.asciz	"/MEMORY ------"
	.size	.Lstr.107, 15

	.type	.Lstr.108,@object       # @str.108
.Lstr.108:
	.asciz	"Priviledge mode violation\nExiting"
	.size	.Lstr.108, 34

	.type	.Lstr.109,@object       # @str.109
.Lstr.109:
	.asciz	"Priviledge mode violation\nExiting"
	.size	.Lstr.109, 34

	.type	.Lstr.110,@object       # @str.110
.Lstr.110:
	.asciz	"\nCommands:"
	.size	.Lstr.110, 11

	.type	.Lstr.111,@object       # @str.111
.Lstr.111:
	.asciz	"Registers:"
	.size	.Lstr.111, 11

	.type	.Lstr.112,@object       # @str.112
.Lstr.112:
	.asciz	"Type any of the commands that get printed"
	.size	.Lstr.112, 42

	.type	.Lstr.113,@object       # @str.113
.Lstr.113:
	.asciz	"It seems that the option is not yet implemented\nTrying again"
	.size	.Lstr.113, 61

	.type	.Lstr.114,@object       # @str.114
.Lstr.114:
	.asciz	"NALE"
	.size	.Lstr.114, 5

	.type	.Lstr.115,@object       # @str.115
.Lstr.115:
	.asciz	"LC-3 args: <program> [-I]\nExiting"
	.size	.Lstr.115, 34

	.section	".linker-options","e",@llvm_linker_options
	.ident	"clang version 10.0.0-4ubuntu1 "
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym _Z19runNonInterruptableP14ProcessorStateP13MemoryTrackerP8_IO_FILE
	.addrsig_sym buffer

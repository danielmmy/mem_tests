	.arch armv8-a
	.file	"serial_read_test.c"
	.text
	.align	2
	.p2align 3,,7
	.global	perf_event_open
	.type	perf_event_open, %function
perf_event_open:
	mov	x5, x4
	mov	w4, w3
	mov	w3, w2
	mov	w2, w1
	mov	x1, x0
	mov	x0, 241
	b	syscall
	.size	perf_event_open, .-perf_event_open
	.section	.text.startup,"ax",@progbits
	.align	2
	.p2align 3,,7
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -304]!
	mov	w2, 10
	add	x29, sp, 0
	stp	x23, x24, [sp, 48]
	adrp	x23, __stack_chk_guard
	add	x3, x23, :lo12:__stack_chk_guard
	ldr	x0, [x1, 8]
	ldr	x4, [x3]
	str	x4, [x29, 296]
	mov	x4,0
	add	x1, x29, 96
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x25, x26, [sp, 64]
	stp	x27, x28, [sp, 80]
	bl	strtoull
	lsl	x1, x0, 3
	mov	x19, x0
	add	x1, x1, 22
	mov	x0, 0
	and	x1, x1, -16
	sub	sp, sp, x1
	mov	x21, sp
	cbz	x19, .L7
	.p2align 2
.L32:
	str	x0, [x21, x0, lsl 3]
	add	x0, x0, 1
	cmp	x19, x0
	bne	.L32
.L7:
	add	x0, x29, 168
	add	x1, x29, 136
	add	x5, x29, 152
	mov	w4, -1
	mov	w2, 112
	mov	w3, w4
	stp	xzr, xzr, [x0]
	mov	x20, 3
	ldrb	w0, [x29, 176]
	stp	xzr, xzr, [x1]
	orr	w0, w0, 1
	stp	xzr, xzr, [x5]
	orr	w0, w0, 96
	add	x5, x29, 184
	strb	w0, [x29, 176]
	add	x0, x29, 200
	str	w2, [x29, 140]
	mov	w2, 0
	stp	xzr, xzr, [x5]
	mov	x5, 0
	stp	xzr, xzr, [x0]
	add	x0, x29, 216
	str	x20, [x29, 168]
	stp	xzr, xzr, [x0]
	add	x0, x29, 232
	stp	xzr, xzr, [x0]
	mov	x0, 1
	str	x0, [x29, 144]
	mov	x0, 241
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 248]
	mov	x22, x0
	beq	.L40
	mov	w4, -1
	add	x1, x29, 136
	mov	w3, w4
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	wzr, [x29, 136]
	str	xzr, [x29, 144]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 252]
	mov	x24, x0
	beq	.L41
	mov	w4, -1
	add	x1, x29, 136
	mov	w3, w4
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	w20, [x29, 136]
	str	xzr, [x29, 144]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 256]
	mov	x27, x0
	beq	.L42
	mov	w4, -1
	mov	x0, 65536
	mov	w3, w4
	add	x1, x29, 136
	str	x0, [x29, 144]
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	w20, [x29, 136]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 260]
	mov	x26, x0
	beq	.L43
	mov	w0, 4
	mov	w4, -1
	add	x1, x29, 136
	mov	w3, w4
	str	w0, [x29, 136]
	mov	x0, 22
	mov	x5, 0
	mov	w2, 0
	str	x0, [x29, 144]
	mov	x0, 241
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 264]
	mov	x25, x0
	beq	.L11
	mov	w0, w22
	mov	w2, 0
	mov	x1, 9219
	mov	x20, 0
	add	x20, x20, 1
	add	x28, x29, 248
	bl	ioctl
	cmp	x20, 5
	beq	.L44
.L13:
	ldr	w0, [x28, x20, lsl 2]
	mov	w2, 0
	mov	x1, 9219
	add	x20, x20, 1
	bl	ioctl
	cmp	x20, 5
	bne	.L13
.L44:
	mov	w0, w22
	mov	w2, 0
	mov	x1, 9216
	mov	x20, 0
	add	x20, x20, 1
	add	x28, x29, 248
	bl	ioctl
	cmp	x20, 5
	beq	.L15
	.p2align 2
.L45:
	ldr	w0, [x28, x20, lsl 2]
	mov	w2, 0
	mov	x1, 9216
	add	x20, x20, 1
	bl	ioctl
	cmp	x20, 5
	bne	.L45
.L15:
	add	x0, x29, 104
	mov	x1, 0
	mov	x20, 0
	bl	gettimeofday
	cbz	x19, .L16
	mov	x0, 0
	.p2align 2
.L17:
	ldr	x1, [x21, x0, lsl 3]
	add	x0, x0, 1
	cmp	x19, x0
	bne	.L17
.L16:
	mov	w0, w22
	mov	w2, 0
	mov	x1, 9217
	mov	x19, 0
	add	x19, x19, 1
	add	x21, x29, 248
	bl	ioctl
	cmp	x19, 5
	beq	.L18
	.p2align 2
.L46:
	ldr	w0, [x21, x19, lsl 2]
	mov	w2, 0
	mov	x1, 9217
	add	x19, x19, 1
	bl	ioctl
	cmp	x19, 5
	bne	.L46
.L18:
	add	x0, x29, 120
	mov	x1, 0
	bl	gettimeofday
	ldp	x1, x0, [x29, 120]
	mov	x2, 16960
	ldr	x3, [x29, 104]
	movk	x2, 0xf, lsl 16
	sub	x1, x1, x3
	ldr	x3, [x29, 112]
	sub	x0, x0, x3
	madd	x2, x1, x2, x0
	adrp	x1, .LC7
	add	x1, x1, :lo12:.LC7
	mov	w0, 1
	bl	__printf_chk
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	add	x1, x29, 272
	mov	w0, w22
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 272]
	ucvtf	s2, x2
	ldr	x1, [x29, 288]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L47
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L20:
	adrp	x1, .LC9
	mov	w0, 1
	add	x1, x1, :lo12:.LC9
	bl	__printf_chk
	add	x1, x29, 272
	mov	w0, w24
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 272]
	ucvtf	s2, x2
	ldr	x1, [x29, 288]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L48
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L21:
	adrp	x1, .LC10
	mov	w0, 1
	add	x1, x1, :lo12:.LC10
	bl	__printf_chk
	add	x1, x29, 272
	mov	w0, w27
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 272]
	ucvtf	s2, x2
	ldr	x1, [x29, 288]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L49
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L22:
	adrp	x1, .LC11
	mov	w0, 1
	add	x1, x1, :lo12:.LC11
	bl	__printf_chk
	add	x1, x29, 272
	mov	w0, w26
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 272]
	ucvtf	s2, x2
	ldr	x1, [x29, 288]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L50
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L23:
	adrp	x1, .LC12
	mov	w0, 1
	add	x1, x1, :lo12:.LC12
	bl	__printf_chk
	add	x1, x29, 272
	mov	w0, w25
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 272]
	ucvtf	s2, x2
	ldr	x1, [x29, 288]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L51
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L24:
	adrp	x1, .LC13
	mov	w0, 1
	add	x1, x1, :lo12:.LC13
	add	x23, x23, :lo12:__stack_chk_guard
	bl	__printf_chk
	adrp	x1, .LC14
	mov	x2, x20
	add	x1, x1, :lo12:.LC14
	mov	w0, 1
	bl	__printf_chk
	ldr	x0, [x29, 296]
	ldr	x1, [x23]
	eor	x1, x0, x1
	mov	w0, 0
	cbnz	x1, .L52
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
.L47:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L20
.L50:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L23
.L49:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L22
.L48:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L21
.L51:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L24
.L52:
	bl	__stack_chk_fail
.L11:
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	mov	w0, 0
	bl	exit
.L43:
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	mov	w0, 0
	bl	exit
.L42:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	mov	w0, 0
	bl	exit
.L41:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
	mov	w0, 0
	bl	exit
.L40:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	mov	w0, 0
	bl	exit
	.size	main, .-main
	.comm	EVENTS,4,4
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align	3
.LC0:
	.string	"real"
	.zero	3
.LC1:
	.string	"scaled"
	.zero	1
.LC2:
	.string	"cannot open perf_counter for instructions"
	.zero	6
.LC3:
	.string	"cannot open perf_counter for cycles"
	.zero	4
.LC4:
	.string	"cannot open perf_counter for L1_DCACHE_ACCESS"
	.zero	2
.LC5:
	.string	"cannot open perf_counter for L1_DCACHE_MISSES"
	.zero	2
.LC6:
	.string	"cannot open perf_counter for L2_CACHE_ACCESS"
	.zero	3
.LC7:
	.string	"Wall clock time[gettimeofday(2)] = %llu us\n"
	.zero	4
.LC8:
	.string	"PMU statistics:"
.LC9:
	.string	"Instructions = %llu %s.\n"
	.zero	7
.LC10:
	.string	"Cycles = %llu %s.\n"
	.zero	5
.LC11:
	.string	"L1 data cache access = %llu %s.\n"
	.zero	7
.LC12:
	.string	"L1 data cache misses = %llu %s.\n"
	.zero	7
.LC13:
	.string	"L2 cache ACCESS = %llu %s.\n"
	.zero	4
.LC14:
	.string	"Result %llu\n"
	.ident	"GCC: (Ubuntu/Linaro 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits

	.arch armv8-a
	.file	"rand_read_test.c"
	.text
	.align	2
	.global	perf_event_open
	.type	perf_event_open, %function
perf_event_open:
	stp	x29, x30, [sp, -16]!
	add	x29, sp, 0
	mov	x5, x4
	mov	w4, w3
	mov	w3, w2
	mov	w2, w1
	mov	x1, x0
	mov	x0, 241
	bl	syscall
	ldp	x29, x30, [sp], 16
	ret
	.size	perf_event_open, .-perf_event_open
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -304]!
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	mov	x19, x1
	adrp	x0, __stack_chk_guard
	ldr	x1, [x0, #:lo12:__stack_chk_guard]
	str	x1, [x29, 296]
	mov	x1,0
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	ldr	x0, [x19, 8]
	bl	fopen
	mov	x24, x0
	mov	w2, 10
	add	x1, x29, 96
	ldr	x0, [x19, 16]
	bl	strtoull
	mov	x21, x0
	lsl	x0, x0, 3
	add	x0, x0, 22
	and	x0, x0, -16
	sub	sp, sp, x0
	mov	x22, sp
	cbz	x21, .L4
	mov	x20, sp
	mov	x19, 0
	adrp	x23, .LC3
	add	x23, x23, :lo12:.LC3
.L5:
	mov	x2, x20
	mov	x1, x23
	mov	x0, x24
	bl	__isoc99_fscanf
	add	x19, x19, 1
	add	x20, x20, 8
	cmp	x21, x19
	bne	.L5
.L4:
	add	x0, x29, 136
	stp	xzr, xzr, [x0]
	add	x0, x29, 152
	stp	xzr, xzr, [x0]
	add	x0, x29, 168
	stp	xzr, xzr, [x0]
	add	x0, x29, 184
	stp	xzr, xzr, [x0]
	add	x0, x29, 200
	stp	xzr, xzr, [x0]
	add	x0, x29, 216
	stp	xzr, xzr, [x0]
	add	x0, x29, 232
	stp	xzr, xzr, [x0]
	mov	w0, 112
	str	w0, [x29, 140]
	mov	x0, 3
	str	x0, [x29, 168]
	mov	x0, 1
	str	x0, [x29, 144]
	ldrb	w0, [x29, 176]
	orr	w0, w0, 1
	orr	w0, w0, 96
	strb	w0, [x29, 176]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 136
	bl	perf_event_open
	mov	x25, x0
	str	w0, [x29, 248]
	cmn	w0, #1
	bne	.L6
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	mov	w0, 0
	bl	exit
.L6:
	str	wzr, [x29, 136]
	str	xzr, [x29, 144]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 136
	bl	perf_event_open
	mov	x24, x0
	str	w0, [x29, 252]
	cmn	w0, #1
	bne	.L7
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	mov	w0, 0
	bl	exit
.L7:
	mov	w0, 3
	str	w0, [x29, 136]
	str	xzr, [x29, 144]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 136
	bl	perf_event_open
	mov	x23, x0
	str	w0, [x29, 256]
	cmn	w0, #1
	bne	.L8
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	mov	w0, 0
	bl	exit
.L8:
	mov	w0, 3
	str	w0, [x29, 136]
	mov	x0, 65536
	str	x0, [x29, 144]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 136
	bl	perf_event_open
	mov	x21, x0
	str	w0, [x29, 260]
	cmn	w0, #1
	bne	.L9
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	mov	w0, 0
	bl	exit
.L9:
	mov	w0, 4
	str	w0, [x29, 136]
	mov	x0, 22
	str	x0, [x29, 144]
	mov	x4, 0
	mov	w3, -1
	mov	w2, w3
	mov	w1, 0
	add	x0, x29, 136
	bl	perf_event_open
	mov	x20, x0
	str	w0, [x29, 264]
	mov	x19, 0
	add	x27, x29, 248
	mov	x26, 9219
	cmn	w0, #1
	bne	.L27
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	mov	w0, 0
	bl	exit
.L27:
	mov	w2, 0
	mov	x1, x26
	ldr	w0, [x27, x19, lsl 2]
	bl	ioctl
	add	x19, x19, 1
	cmp	x19, 5
	bne	.L27
	mov	x19, 0
	add	x27, x29, 248
	mov	x26, 9216
.L11:
	mov	w2, 0
	mov	x1, x26
	ldr	w0, [x27, x19, lsl 2]
	bl	ioctl
	add	x19, x19, 1
	cmp	x19, 5
	bne	.L11
	mov	x1, 0
	add	x0, x29, 104
	bl	gettimeofday
	mov	x19, 0
	mov	x9, 0
.L12:
	lsl	x9, x19, 3
	ldr	x19, [x22, x9]
	cbnz	x19, .L12
	add	x26, x29, 248
	mov	x22, 9217
.L26:
	mov	w2, 0
	mov	x1, x22
	ldr	w0, [x26, x19, lsl 2]
	bl	ioctl
	add	x19, x19, 1
	cmp	x19, 5
	bne	.L26
	mov	x1, 0
	add	x0, x29, 120
	bl	gettimeofday
	ldr	x2, [x29, 104]
	ldr	x1, [x29, 120]
	sub	x1, x1, x2
	ldr	x2, [x29, 112]
	ldr	x0, [x29, 128]
	sub	x0, x0, x2
	mov	x2, 16960
	movk	x2, 0xf, lsl 16
	madd	x2, x1, x2, x0
	adrp	x1, .LC9
	add	x1, x1, :lo12:.LC9
	mov	w0, 1
	bl	__printf_chk
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	puts
	mov	x2, 24
	add	x1, x29, 272
	mov	w0, w25
	bl	read
	ldr	x3, [x29, 280]
	ldr	x1, [x29, 288]
	ldr	x0, [x29, 272]
	ucvtf	s0, x0
	ucvtf	s1, x3
	fmul	s0, s0, s1
	ucvtf	s1, x1
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	cmp	x3, x1
	beq	.L21
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
	b	.L14
.L21:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
.L14:
	adrp	x1, .LC11
	add	x1, x1, :lo12:.LC11
	mov	w0, 1
	bl	__printf_chk
	mov	x2, 24
	add	x1, x29, 272
	mov	w0, w24
	bl	read
	ldr	x3, [x29, 280]
	ldr	x1, [x29, 288]
	ldr	x0, [x29, 272]
	ucvtf	s0, x0
	ucvtf	s1, x3
	fmul	s0, s0, s1
	ucvtf	s1, x1
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	cmp	x3, x1
	beq	.L22
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
	b	.L15
.L22:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
.L15:
	adrp	x1, .LC12
	add	x1, x1, :lo12:.LC12
	mov	w0, 1
	bl	__printf_chk
	mov	x2, 24
	add	x1, x29, 272
	mov	w0, w23
	bl	read
	ldr	x3, [x29, 280]
	ldr	x1, [x29, 288]
	ldr	x0, [x29, 272]
	ucvtf	s0, x0
	ucvtf	s1, x3
	fmul	s0, s0, s1
	ucvtf	s1, x1
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	cmp	x3, x1
	beq	.L23
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
	b	.L16
.L23:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
.L16:
	adrp	x1, .LC13
	add	x1, x1, :lo12:.LC13
	mov	w0, 1
	bl	__printf_chk
	mov	x2, 24
	add	x1, x29, 272
	mov	w0, w21
	bl	read
	ldr	x3, [x29, 280]
	ldr	x1, [x29, 288]
	ldr	x0, [x29, 272]
	ucvtf	s0, x0
	ucvtf	s1, x3
	fmul	s0, s0, s1
	ucvtf	s1, x1
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	cmp	x3, x1
	beq	.L24
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
	b	.L17
.L24:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
.L17:
	adrp	x1, .LC14
	add	x1, x1, :lo12:.LC14
	mov	w0, 1
	bl	__printf_chk
	mov	x2, 24
	add	x1, x29, 272
	mov	w0, w20
	bl	read
	ldr	x3, [x29, 280]
	ldr	x1, [x29, 288]
	ldr	x0, [x29, 272]
	ucvtf	s0, x0
	ucvtf	s1, x3
	fmul	s0, s0, s1
	ucvtf	s1, x1
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	cmp	x3, x1
	beq	.L25
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
	b	.L18
.L25:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
.L18:
	adrp	x1, .LC15
	add	x1, x1, :lo12:.LC15
	mov	w0, 1
	bl	__printf_chk
	mov	w0, 0
	adrp	x1, __stack_chk_guard
	ldr	x2, [x29, 296]
	ldr	x1, [x1, #:lo12:__stack_chk_guard]
	eor	x1, x2, x1
	cbz	x1, .L19
	bl	__stack_chk_fail
.L19:
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldr	x27, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
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
	.string	"r"
	.zero	6
.LC3:
	.string	"%llu/"
	.zero	2
.LC4:
	.string	"cannot open perf_counter for instructions"
	.zero	6
.LC5:
	.string	"cannot open perf_counter for cycles"
	.zero	4
.LC6:
	.string	"cannot open perf_counter for L1_DCACHE_ACCESS"
	.zero	2
.LC7:
	.string	"cannot open perf_counter for L1_DCACHE_MISSES"
	.zero	2
.LC8:
	.string	"cannot open perf_counter for L2_CACHE_ACCESS"
	.zero	3
.LC9:
	.string	"Wall clock time[gettimeofday(2)] = %llu us\n"
	.zero	4
.LC10:
	.string	"PMU statistics:"
.LC11:
	.string	"Instructions = %llu %s.\n"
	.zero	7
.LC12:
	.string	"Cycles = %llu %s.\n"
	.zero	5
.LC13:
	.string	"L1 data cache access = %llu %s.\n"
	.zero	7
.LC14:
	.string	"L1 data cache misses = %llu %s.\n"
	.zero	7
.LC15:
	.string	"L2 cache ACCESS = %llu %s.\n"
	.ident	"GCC: (Ubuntu/Linaro 5.4.1-2ubuntu1~16.04) 5.4.1 20160904"
	.section	.note.GNU-stack,"",@progbits

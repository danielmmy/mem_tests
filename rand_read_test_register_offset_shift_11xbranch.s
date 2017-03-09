	.arch armv8-a
	.file	"rand_read_test.c"
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
	add	x29, sp, 0
	stp	x19, x20, [sp, 16]
	mov	x19, x1
	stp	x21, x22, [sp, 32]
	adrp	x22, __stack_chk_guard
	add	x2, x22, :lo12:__stack_chk_guard
	adrp	x1, .LC2
	ldr	x0, [x19, 8]
	ldr	x3, [x2]
	str	x3, [x29, 296]
	mov	x3,0
	add	x1, x1, :lo12:.LC2
	stp	x23, x24, [sp, 48]
	stp	x25, x26, [sp, 64]
	str	x27, [sp, 80]
	bl	fopen
	mov	x25, x0
	ldr	x0, [x19, 16]
	add	x1, x29, 96
	mov	w2, 10
	bl	strtoull
	mov	x23, x0
	lsl	x0, x0, 3
	add	x0, x0, 22
	and	x0, x0, -16
	sub	sp, sp, x0
	mov	x21, sp
	cbz	x23, .L7
	adrp	x24, .LC3
	mov	x20, sp
	add	x24, x24, :lo12:.LC3
	mov	x19, 0
	.p2align 2
.L6:
	mov	x2, x20
	mov	x1, x24
	mov	x0, x25
	add	x19, x19, 1
	add	x20, x20, 8
	bl	__isoc99_fscanf
	cmp	x23, x19
	bne	.L6
.L7:
	add	x0, x29, 168
	add	x1, x29, 136
	add	x6, x29, 152
	mov	w4, -1
	mov	w5, 112
	mov	x2, 1
	stp	xzr, xzr, [x0]
	mov	w3, w4
	mov	x19, 3
	ldrb	w0, [x29, 176]
	stp	xzr, xzr, [x1]
	stp	xzr, xzr, [x6]
	add	x6, x29, 184
	orr	w0, w0, 1
	str	w5, [x29, 140]
	orr	w0, w0, 96
	str	x2, [x29, 144]
	stp	xzr, xzr, [x6]
	add	x6, x29, 200
	strb	w0, [x29, 176]
	mov	x5, 0
	mov	x0, 241
	mov	w2, 0
	stp	xzr, xzr, [x6]
	add	x6, x29, 216
	str	x19, [x29, 168]
	stp	xzr, xzr, [x6]
	add	x6, x29, 232
	stp	xzr, xzr, [x6]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 248]
	mov	x24, x0
	beq	.L36
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
	mov	x23, x0
	beq	.L37
	mov	w4, -1
	add	x1, x29, 136
	mov	w3, w4
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	w19, [x29, 136]
	str	xzr, [x29, 144]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 256]
	mov	x27, x0
	beq	.L38
	mov	w4, -1
	mov	x0, 65536
	mov	w3, w4
	add	x1, x29, 136
	str	x0, [x29, 144]
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	w19, [x29, 136]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 260]
	mov	x26, x0
	beq	.L39
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
	add	x20, x29, 248
	mov	x19, 0
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 264]
	mov	x25, x0
	beq	.L40
.L12:
	ldr	w0, [x20, x19, lsl 2]
	mov	w2, 0
	mov	x1, 9219
	add	x19, x19, 1
	bl	ioctl
	cmp	x19, 5
	bne	.L12
	mov	x19, 0
.L13:
	ldr	w0, [x20, x19, lsl 2]
	mov	w2, 0
	mov	x1, 9216
	add	x19, x19, 1
	bl	ioctl
	cmp	x19, 5
	bne	.L13
	add	x0, x29, 104
	mov	x1, 0
	mov	x19, 0
	bl	gettimeofday
	mov	x9, 0
	.p2align 2
.L14:
        cbnz    x19, .L14_2
.L14_2:
        cbnz    x19, .L14_3
.L14_3:
        cbnz    x19, .L14_4
.L14_4:
        cbnz    x19, .L14_5
.L14_5:
        cbnz    x19, .L14_6
.L14_6:
        cbnz    x19, .L14_7
.L14_7:
        cbnz    x19, .L14_8
.L14_8:
        cbnz    x19, .L14_9
.L14_9:
        cbnz    x19, .L14_10
.L14_10:
        cbnz    x19, .L14_11
.L14_11:
	lsl	x9, x19, 3
	ldr	x19, [x21, x9]
	cbnz	x19, .L14
.L15:
	ldr	w0, [x20, x19, lsl 2]
	mov	w2, 0
	mov	x1, 9217
	add	x19, x19, 1
	bl	ioctl
	cmp	x19, 5
	bne	.L15
	add	x0, x29, 120
	mov	x1, 0
	bl	gettimeofday
	ldp	x3, x4, [x29, 104]
	mov	x2, 16960
	ldp	x1, x0, [x29, 120]
	movk	x2, 0xf, lsl 16
	sub	x1, x1, x3
	sub	x0, x0, x4
	madd	x2, x1, x2, x0
	adrp	x1, .LC9
	add	x1, x1, :lo12:.LC9
	mov	w0, 1
	bl	__printf_chk
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	puts
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
	beq	.L22
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L16:
	adrp	x1, .LC11
	mov	w0, 1
	add	x1, x1, :lo12:.LC11
	bl	__printf_chk
	add	x1, x29, 272
	mov	w0, w23
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
	beq	.L23
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L17:
	adrp	x1, .LC12
	mov	w0, 1
	add	x1, x1, :lo12:.LC12
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
	beq	.L24
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L18:
	adrp	x1, .LC13
	mov	w0, 1
	add	x1, x1, :lo12:.LC13
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
	beq	.L25
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L19:
	adrp	x1, .LC14
	mov	w0, 1
	add	x1, x1, :lo12:.LC14
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
	beq	.L26
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L20:
	adrp	x1, .LC15
	mov	w0, 1
	add	x1, x1, :lo12:.LC15
	add	x22, x22, :lo12:__stack_chk_guard
	bl	__printf_chk
	ldr	x0, [x29, 296]
	ldr	x1, [x22]
	eor	x1, x0, x1
	mov	w0, 0
	cbnz	x1, .L41
	add	sp, x29, 0
	ldr	x27, [sp, 80]
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x29, x30, [sp], 304
	ret
.L22:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L16
.L25:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L19
.L24:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L18
.L23:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L17
.L26:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L20
.L41:
	bl	__stack_chk_fail
.L40:
	adrp	x0, .LC8
	add	x0, x0, :lo12:.LC8
	bl	puts
	mov	w0, 0
	bl	exit
.L39:
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	mov	w0, 0
	bl	exit
.L38:
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	mov	w0, 0
	bl	exit
.L37:
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
	bl	puts
	mov	w0, 0
	bl	exit
.L36:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
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

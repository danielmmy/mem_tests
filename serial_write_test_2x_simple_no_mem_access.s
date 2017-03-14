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
	adrp	x3, __stack_chk_guard
	add	x3, x3, :lo12:__stack_chk_guard
	mov	w2, 10
	add	x29, sp, 0
	ldr	x0, [x1, 8]
	ldr	x4, [x3]
	str	x4, [x29, 296]
	mov	x4,0
	add	x1, x29, 96
	stp	x19, x20, [sp, 16]
	stp	x21, x22, [sp, 32]
	stp	x23, x24, [sp, 48]
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
.L35:
	str	x0, [x21, x0, lsl 3]
	add	x0, x0, 1
	cmp	x19, x0
	bne	.L35
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
	str	w0, [x29, 272]
	mov	x22, x0
	beq	.L43
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
	str	w0, [x29, 276]
	mov	x24, x0
	beq	.L44
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
	str	w0, [x29, 280]
	mov	x28, x0
	beq	.L45
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
	str	w0, [x29, 284]
	mov	x27, x0
	beq	.L46
	mov	x0, 22
	mov	w4, -1
	mov	w3, w4
	add	x1, x29, 136
	str	x0, [x29, 144]
	mov	w20, 4
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	w20, [x29, 136]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 288]
	mov	x26, x0
	beq	.L47
	mov	x0, 23
	mov	w4, -1
	add	x1, x29, 136
	mov	w3, w4
	str	x0, [x29, 144]
	mov	x5, 0
	mov	w2, 0
	mov	x0, 241
	str	w20, [x29, 136]
	bl	syscall
	cmn	w0, #1
	str	w0, [x29, 292]
	mov	x25, x0
	beq	.L12
	mov	w0, w22
	mov	x23, 0
	add	x20, x29, 272
	b	.L13
	.p2align 3
.L14:
	ldr	w0, [x20, x23, lsl 2]
.L13:
	mov	w2, 0
	mov	x1, 9219
	add	x23, x23, 1
	bl	ioctl
	cmp	x23, 6
	bne	.L14
	mov	w0, w22
	mov	x23, 0
	add	x20, x29, 272
	b	.L15
	.p2align 3
.L48:
	ldr	w0, [x20, x23, lsl 2]
.L15:
	mov	w2, 0
	mov	x1, 9216
	add	x23, x23, 1
	bl	ioctl
	cmp	x23, 6
	bne	.L48
	add	x0, x29, 104
	mov	x1, 0
	mov	x20, 0
	bl	gettimeofday
	cbz	x19, .L17
	mov	x9, x21
	lsl	x0, x19, 3
	add	x0, x21, x0
	.p2align 2
.L18:
	add	x9, x9, 16
	cmp	x9, x0
	bne	.L18
.L17:
	mov	w0, w22
	mov	x19, 0
	add	x21, x29, 272
	b	.L20
	.p2align 3
.L49:
	ldr	w0, [x21, x19, lsl 2]
.L20:
	mov	w2, 0
	mov	x1, 9217
	add	x19, x19, 1
	bl	ioctl
	cmp	x19, 6
	bne	.L49
	add	x0, x29, 120
	mov	x1, 0
	bl	gettimeofday
	ldp	x2, x3, [x29, 104]
	ldp	x1, x0, [x29, 120]
	sub	x1, x1, x2
	mov	x2, 16960
	movk	x2, 0xf, lsl 16
	sub	x0, x0, x3
	madd	x2, x1, x2, x0
	adrp	x1, .LC8
	add	x1, x1, :lo12:.LC8
	mov	w0, 1
	bl	__printf_chk
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	add	x1, x29, 248
	mov	w0, w22
	mov	x2, 24
	bl	read
	ldp	x1, x0, [x29, 256]
	ucvtf	s1, x0
	ucvtf	s2, x1
	cmp	x1, x0
	ldr	x0, [x29, 248]
	ucvtf	s0, x0
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L50
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L21:
	adrp	x1, .LC10
	mov	w0, 1
	add	x1, x1, :lo12:.LC10
	bl	__printf_chk
	add	x1, x29, 248
	mov	w0, w24
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 248]
	ucvtf	s2, x2
	ldr	x1, [x29, 264]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L51
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L22:
	adrp	x1, .LC11
	mov	w0, 1
	add	x1, x1, :lo12:.LC11
	bl	__printf_chk
	add	x1, x29, 248
	mov	w0, w28
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 248]
	ucvtf	s2, x2
	ldr	x1, [x29, 264]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L52
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L23:
	adrp	x1, .LC12
	mov	w0, 1
	add	x1, x1, :lo12:.LC12
	bl	__printf_chk
	add	x1, x29, 248
	mov	w0, w27
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 248]
	ucvtf	s2, x2
	ldr	x1, [x29, 264]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L53
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L24:
	adrp	x1, .LC13
	mov	w0, 1
	add	x1, x1, :lo12:.LC13
	bl	__printf_chk
	add	x1, x29, 248
	mov	w0, w26
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 248]
	ucvtf	s2, x2
	ldr	x1, [x29, 264]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L54
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L25:
	adrp	x1, .LC14
	mov	w0, 1
	add	x1, x1, :lo12:.LC14
	bl	__printf_chk
	add	x1, x29, 248
	mov	w0, w25
	mov	x2, 24
	bl	read
	ldp	x0, x2, [x29, 248]
	ucvtf	s2, x2
	ldr	x1, [x29, 264]
	ucvtf	s0, x0
	ucvtf	s1, x1
	cmp	x2, x1
	fmul	s0, s0, s2
	fdiv	s0, s0, s1
	fcvtzu	x2, s0
	beq	.L55
	adrp	x3, .LC1
	add	x3, x3, :lo12:.LC1
.L26:
	adrp	x1, .LC15
	mov	w0, 1
	add	x1, x1, :lo12:.LC15
	bl	__printf_chk
	adrp	x1, .LC16
	mov	x2, x20
	add	x1, x1, :lo12:.LC16
	mov	w0, 1
	bl	__printf_chk
	adrp	x0, __stack_chk_guard
	add	x23, x0, :lo12:__stack_chk_guard
	ldr	x0, [x29, 296]
	ldr	x1, [x23]
	eor	x1, x0, x1
	mov	w0, 0
	cbnz	x1, .L56
	add	sp, x29, 0
	ldp	x19, x20, [sp, 16]
	ldp	x21, x22, [sp, 32]
	ldp	x23, x24, [sp, 48]
	ldp	x25, x26, [sp, 64]
	ldp	x27, x28, [sp, 80]
	ldp	x29, x30, [sp], 304
	ret
.L50:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L21
.L54:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L25
.L53:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L24
.L52:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L23
.L51:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L22
.L55:
	adrp	x3, .LC0
	add	x3, x3, :lo12:.LC0
	b	.L26
.L45:
	adrp	x0, .LC4
	add	x0, x0, :lo12:.LC4
	bl	puts
	mov	w0, 0
	bl	exit
.L56:
	bl	__stack_chk_fail
.L44:
	adrp	x0, .LC3
	add	x0, x0, :lo12:.LC3
	bl	puts
	mov	w0, 0
	bl	exit
.L43:
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	bl	puts
	mov	w0, 0
	bl	exit
.L12:
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	mov	w0, 0
	bl	exit
.L47:
	adrp	x0, .LC6
	add	x0, x0, :lo12:.LC6
	bl	puts
	mov	w0, 0
	bl	exit
.L46:
	adrp	x0, .LC5
	add	x0, x0, :lo12:.LC5
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
	.string	"cannot open perf_counter for INSTRUCTIONS"
	.zero	6
.LC3:
	.string	"cannot open perf_counter for CYCLES"
	.zero	4
.LC4:
	.string	"cannot open perf_counter for L1_DCACHE_ACCESS"
	.zero	2
.LC5:
	.string	"cannot open perf_counter for L1_DCACHE_REFILL"
	.zero	2
.LC6:
	.string	"cannot open perf_counter for L2_CACHE_ACCESS"
	.zero	3
.LC7:
	.string	"cannot open perf_counter for L2_CACHE_REFILL"
	.zero	3
.LC8:
	.string	"Wall clock time[gettimeofday(2)] = %llu us\n"
	.zero	4
.LC9:
	.string	"PMU statistics:"
.LC10:
	.string	"Instructions = %llu %s.\n"
	.zero	7
.LC11:
	.string	"Cycles = %llu %s.\n"
	.zero	5
.LC12:
	.string	"L1 data cache access = %llu %s.\n"
	.zero	7
.LC13:
	.string	"L1 data cache refill = %llu %s.\n"
	.zero	7
.LC14:
	.string	"L2 cache access = %llu %s.\n"
	.zero	4
.LC15:
	.string	"L2 cache refill = %llu %s.\n"
	.zero	4
.LC16:
	.string	"Result %llu\n"
	.ident	"GCC: (Ubuntu/Linaro 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609"
	.section	.note.GNU-stack,"",@progbits

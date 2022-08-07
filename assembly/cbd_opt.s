	.arch armv4t
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 18, 4
	.file	"cbd_opt.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"frame_1.bmp\000"
	.align	2
.LC1:
	.ascii	"block [%i][%i] has motion vector (%i, %i)\012\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 154232
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #153600
	sub	sp, sp, #644
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #8
	ldr	r0, .L12
	mov	r1, r3
	bl	readImage
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #8
	ldr	r0, .L12
	mov	r1, r3
	bl	readImage
	mvn	r3, #153600
	sub	r3, r3, #604
	sub	r3, r3, #3
	sub	r0, fp, #12
	add	r3, r0, r3
	mov	r2, #600
	mov	r0, r3
	mov	r1, #0
	bl	memset
	mov	r2, #0
	sub	r1, fp, #151552
	str	r2, [r1, #-2684]
	b	.L2
.L10:
	sub	r0, fp, #151552
	ldr	r3, [r0, #-2684]
	mov	r3, r3, asl #4
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	sub	r2, fp, #151552
	str	r1, [r2, #-2680]
	mov	r0, #0
	sub	r3, fp, #151552
	str	r0, [r3, #-2688]
	b	.L3
.L9:
	sub	r1, fp, #151552
	ldr	r3, [r1, #-2688]
	mov	r3, r3, asl #4
	mov	r3, r3, asl #16
	mov	r2, r3, lsr #16
	sub	r0, fp, #151552
	str	r2, [r0, #-2676]
	mvn	r3, #0
	strh	r3, [fp, #-20]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-17]
	mov	r3, #0
	strb	r3, [fp, #-15]
	b	.L4
.L8:
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	sub	r2, fp, #151552
	str	r1, [r2, #-2672]
	mov	r3, #0
	strb	r3, [fp, #-16]
	b	.L5
.L7:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	mov	r3, r3, asl #16
	mov	ip, r3, lsr #16
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [sp, #0]
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #8
	str	r3, [sp, #4]
	sub	r3, fp, #151552
	ldr	r0, [r3, #-2680]
	sub	r2, fp, #151552
	ldr	r1, [r2, #-2676]
	sub	r3, fp, #151552
	ldr	r2, [r3, #-2672]
	mov	r3, ip
	bl	calc_block_diff
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r2, [fp, #-14]
	ldrh	r3, [fp, #-20]
	cmp	r2, r3
	bcs	.L6
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [fp, #-20]	@ movhi
	ldrb	r3, [fp, #-15]
	strb	r3, [fp, #-18]
	ldrb	r3, [fp, #-16]
	strb	r3, [fp, #-17]
.L6:
	ldrb	r3, [fp, #-16]
	add	r3, r3, #1
	strb	r3, [fp, #-16]
.L5:
	ldrb	r3, [fp, #-16]	@ zero_extendqisi2
	cmp	r3, #14
	bls	.L7
	ldrb	r3, [fp, #-15]
	add	r3, r3, #1
	strb	r3, [fp, #-15]
.L4:
	ldrb	r3, [fp, #-15]	@ zero_extendqisi2
	cmp	r3, #19
	bls	.L8
	sub	r0, fp, #151552
	ldr	r2, [r0, #-2688]
	sub	r1, fp, #151552
	ldr	r0, [r1, #-2684]
	ldrb	r3, [fp, #-18]
	sub	r1, fp, #151552
	ldr	r1, [r1, #-2684]
	rsb	r3, r1, r3
	and	r3, r3, #255
	mov	ip, r3
	mvn	r1, #153600
	sub	r1, r1, #604
	sub	r1, r1, #3
	mov	r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r3, r3, asl #1
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r2, r3, r1
	mov	r3, ip
	strb	r3, [r2, #0]
	sub	r3, fp, #151552
	ldr	r2, [r3, #-2688]
	sub	r1, fp, #151552
	ldr	r0, [r1, #-2684]
	ldrb	r3, [fp, #-17]
	sub	r1, fp, #151552
	ldr	r1, [r1, #-2688]
	rsb	r3, r1, r3
	and	r3, r3, #255
	mov	ip, r3
	mvn	r1, #153600
	sub	r1, r1, #604
	sub	r1, r1, #3
	mov	r3, r2
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #1
	mov	r3, r3, asl #1
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r1
	add	r2, r3, r2
	mov	r3, ip
	strb	r3, [r2, #0]
	sub	r1, fp, #151552
	ldr	ip, [r1, #-2688]
	sub	r2, fp, #151552
	ldr	lr, [r2, #-2684]
	sub	r0, fp, #151552
	ldr	r3, [r0, #-2688]
	sub	r1, fp, #151552
	ldr	r0, [r1, #-2684]
	mvn	r1, #153600
	sub	r1, r1, #604
	sub	r1, r1, #3
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r3, r3, asl #1
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r4, r3, asr #24
	sub	r0, fp, #151552
	ldr	r3, [r0, #-2688]
	sub	r1, fp, #151552
	ldr	r0, [r1, #-2684]
	mvn	r1, #153600
	sub	r1, r1, #604
	sub	r1, r1, #3
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, r0
	mov	r2, #1
	mov	r3, r3, asl #1
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r1
	add	r3, r3, r2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r3, r3, asl #24
	mov	r3, r3, asr #24
	str	r3, [sp, #0]
	ldr	r0, .L12+4
	mov	r1, ip
	mov	r2, lr
	mov	r3, r4
	bl	printf
	sub	r1, fp, #151552
	ldr	r1, [r1, #-2688]
	add	r3, r1, #1
	and	r2, r3, #255
	sub	r0, fp, #151552
	str	r2, [r0, #-2688]
.L3:
	sub	r1, fp, #151552
	ldr	r1, [r1, #-2688]
	cmp	r1, #14
	bls	.L9
	sub	r2, fp, #151552
	ldr	r2, [r2, #-2684]
	add	r3, r2, #1
	and	r0, r3, #255
	sub	r1, fp, #151552
	str	r0, [r1, #-2684]
.L2:
	sub	r2, fp, #151552
	ldr	r2, [r2, #-2684]
	cmp	r2, #19
	bls	.L10
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC0
	.word	.LC1
	.size	main, .-main
	.section	.rodata
	.align	2
.LC2:
	.ascii	"rb\000"
	.text
	.align	2
	.type	readImage, %function
readImage:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {fp, lr}
	add	fp, sp, #4
	sub	sp, sp, #40
	str	r0, [fp, #-40]
	str	r1, [fp, #-44]
	ldr	r0, [fp, #-40]
	ldr	r1, .L20
	bl	fopen
	mov	r3, r0
	str	r3, [fp, #-24]
	ldr	r0, [fp, #-24]
	mov	r1, #10
	mov	r2, #0
	bl	fseek
	sub	r3, fp, #28
	mov	r0, r3
	mov	r1, #4
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fread
	ldr	r0, [fp, #-24]
	mov	r1, #28
	mov	r2, #0
	bl	fseek
	sub	r3, fp, #32
	mov	r0, r3
	mov	r1, #2
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fread
	ldr	r3, [fp, #-32]
	mov	r3, r3, lsr #3
	str	r3, [fp, #-20]
	ldr	r3, [fp, #-20]
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r3, r2, r3
	str	r3, [fp, #-16]
	mov	r3, #0
	str	r3, [fp, #-12]
	b	.L15
.L18:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L16
.L17:
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	mul	r1, r3, r2
	ldr	r2, [fp, #-8]
	ldr	r3, [fp, #-20]
	mul	r3, r2, r3
	add	r2, r1, r3
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldr	r0, [fp, #-24]
	mov	r1, r3
	mov	r2, #0
	bl	fseek
	ldr	r1, [fp, #-44]
	ldr	r3, [fp, #-12]
	rsb	r3, r3, #239
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #-8]
	add	r3, r2, r3
	add	r3, r1, r3
	mov	r0, r3
	mov	r1, #1
	mov	r2, #1
	ldr	r3, [fp, #-24]
	bl	fread
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	str	r3, [fp, #-8]
.L16:
	ldr	r2, [fp, #-8]
	mov	r3, #316
	add	r3, r3, #3
	cmp	r2, r3
	bls	.L17
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L15:
	ldr	r3, [fp, #-12]
	cmp	r3, #239
	bls	.L18
	ldr	r0, [fp, #-24]
	bl	fclose
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L21:
	.align	2
.L20:
	.word	.LC2
	.size	readImage, .-readImage
	.align	2
	.type	calc_block_diff, %function
calc_block_diff:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #28
	strh	r0, [fp, #-14]	@ movhi
	strh	r1, [fp, #-16]	@ movhi
	strh	r2, [fp, #-18]	@ movhi
	strh	r3, [fp, #-20]	@ movhi
	mov	r2, #0
	str	r2, [fp, #-28]
	mov	r3, #0
	str	r3, [fp, #-24]
	b	.L23
.L24:
	ldr	r1, [fp, #4]
	ldrh	r2, [fp, #-16]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldrh	r3, [fp, #-14]
	add	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-12]
	ldr	r1, [fp, #8]
	ldrh	r2, [fp, #-20]
	ldr	r3, [fp, #-24]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldrh	r3, [fp, #-18]
	add	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #2
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #3
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #4
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #5
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #6
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #6
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #7
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #7
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #8
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #9
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #9
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #10
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #10
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #11
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #12
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #13
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #13
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #14
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #14
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r1, r3, lsr #16
	ldr	r3, [fp, #-8]
	add	r3, r3, #15
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	mov	r2, r3
	ldr	r3, [fp, #-12]
	add	r3, r3, #15
	ldrb	r3, [r3, #0]	@ zero_extendqisi2
	rsb	r3, r3, r2
	cmp	r3, #0
	rsblt	r3, r3, #0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	add	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldr	r2, [fp, #-28]
	add	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-24]
	add	r3, r2, #1
	and	r3, r3, #255
	str	r3, [fp, #-24]
.L23:
	ldr	r3, [fp, #-24]
	cmp	r3, #15
	bls	.L24
	ldr	r3, [fp, #-28]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	calc_block_diff, .-calc_block_diff
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

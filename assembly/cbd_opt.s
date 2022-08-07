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
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 154224
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #153600
	sub	sp, sp, #636
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #18
	ldr	r0, .L12
	mov	r1, r3
	bl	readImage
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #18
	ldr	r0, .L12
	mov	r1, r3
	bl	readImage
	mvn	r3, #153600
	sub	r3, r3, #616
	sub	r3, r3, #1
	sub	r0, fp, #12
	add	r3, r0, r3
	mov	r2, #600
	mov	r0, r3
	mov	r1, #0
	bl	memset
	mov	r3, #0
	strb	r3, [fp, #-29]
	b	.L2
.L10:
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-28]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-30]
	b	.L3
.L9:
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-26]	@ movhi
	mvn	r3, #0
	strh	r3, [fp, #-24]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-21]
	mov	r3, #0
	strb	r3, [fp, #-19]
	b	.L4
.L8:
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-18]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-20]
	b	.L5
.L7:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-16]	@ movhi
	ldrh	r2, [fp, #-28]
	ldrh	r1, [fp, #-26]
	ldrh	ip, [fp, #-18]
	ldrh	lr, [fp, #-16]
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #18
	str	r3, [sp, #0]
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #18
	str	r3, [sp, #4]
	mov	r0, r2
	mov	r2, ip
	mov	r3, lr
	bl	calc_block_diff
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r2, [fp, #-14]
	ldrh	r3, [fp, #-24]
	cmp	r2, r3
	bcs	.L6
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [fp, #-24]	@ movhi
	ldrb	r3, [fp, #-19]
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-20]
	strb	r3, [fp, #-21]
.L6:
	ldrb	r3, [fp, #-20]
	add	r3, r3, #1
	strb	r3, [fp, #-20]
.L5:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	cmp	r3, #14
	bls	.L7
	ldrb	r3, [fp, #-19]
	add	r3, r3, #1
	strb	r3, [fp, #-19]
.L4:
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	cmp	r3, #19
	bls	.L8
	ldrb	r0, [fp, #-30]	@ zero_extendqisi2
	ldrb	ip, [fp, #-29]	@ zero_extendqisi2
	ldrb	r2, [fp, #-22]
	ldrb	r3, [fp, #-29]
	rsb	r3, r3, r2
	and	r3, r3, #255
	mov	r4, r3
	mvn	r1, #153600
	sub	r1, r1, #616
	sub	r1, r1, #1
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	mov	r3, r3, asl #1
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r2, r3, r1
	mov	r3, r4
	strb	r3, [r2, #0]
	ldrb	r0, [fp, #-30]	@ zero_extendqisi2
	ldrb	ip, [fp, #-29]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]
	ldrb	r3, [fp, #-30]
	rsb	r3, r3, r2
	and	r3, r3, #255
	mov	r4, r3
	mvn	r1, #153600
	sub	r1, r1, #616
	sub	r1, r1, #1
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	mov	r2, #1
	mov	r3, r3, asl #1
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r3, r3, r1
	add	r2, r3, r2
	mov	r3, r4
	strb	r3, [r2, #0]
	ldrb	r3, [fp, #-30]
	add	r3, r3, #1
	strb	r3, [fp, #-30]
.L3:
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	cmp	r3, #14
	bls	.L9
	ldrb	r3, [fp, #-29]
	add	r3, r3, #1
	strb	r3, [fp, #-29]
.L2:
	ldrb	r3, [fp, #-29]	@ zero_extendqisi2
	cmp	r3, #19
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
	.size	main, .-main
	.section	.rodata
	.align	2
.LC1:
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
	mov	r3, r3, asl #3
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
	.word	.LC1
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
	strh	r0, [fp, #-22]	@ movhi
	strh	r1, [fp, #-24]	@ movhi
	strh	r2, [fp, #-26]	@ movhi
	strh	r3, [fp, #-28]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-16]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-13]
	b	.L23
.L24:
	ldr	r1, [fp, #4]
	ldrh	r2, [fp, #-24]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldrh	r3, [fp, #-22]
	add	r3, r2, r3
	add	r3, r1, r3
	str	r3, [fp, #-12]
	ldr	r1, [fp, #8]
	ldrh	r2, [fp, #-28]
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldrh	r3, [fp, #-26]
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
	mov	r2, r3, lsr #16
	ldrh	r3, [fp, #-16]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-16]	@ movhi
	ldrb	r3, [fp, #-13]
	add	r3, r3, #1
	strb	r3, [fp, #-13]
.L23:
	ldrb	r3, [fp, #-13]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L24
	ldrh	r3, [fp, #-16]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	calc_block_diff, .-calc_block_diff
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

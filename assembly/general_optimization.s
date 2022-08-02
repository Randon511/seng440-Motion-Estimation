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
	.file	"general_optimization.c"
	.section	.rodata
	.align	2
.LC0:
	.ascii	"frame_1.bmp\000"
	.align	2
.LC1:
	.ascii	"frame_2.bmp\000"
	.align	2
.LC2:
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
	sub	r3, r3, #16
	ldr	r0, .L12
	mov	r1, r3
	bl	readImage
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #16
	ldr	r0, .L12+4
	mov	r1, r3
	bl	readImage
	mvn	r3, #153600
	sub	r3, r3, #612
	sub	r3, r3, #3
	sub	r0, fp, #12
	add	r3, r0, r3
	mov	r2, #600
	mov	r0, r3
	mov	r1, #0
	bl	memset
	mov	r3, #0
	strb	r3, [fp, #-27]
	b	.L2
.L10:
	ldrb	r3, [fp, #-27]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-26]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-28]
	b	.L3
.L9:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-24]	@ movhi
	mvn	r3, #0
	strh	r3, [fp, #-22]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-19]
	mov	r2, #0
	sub	r1, fp, #151552
	str	r2, [r1, #-2680]
	b	.L4
.L8:
	sub	r0, fp, #151552
	ldr	r3, [r0, #-2680]
	mov	r3, r3, asl #4
	strh	r3, [fp, #-18]	@ movhi
	mov	r2, #0
	sub	r1, fp, #151552
	str	r2, [r1, #-2684]
	b	.L5
.L7:
	sub	r0, fp, #151552
	ldr	r3, [r0, #-2684]
	mov	r3, r3, asl #4
	strh	r3, [fp, #-16]	@ movhi
	ldrh	r2, [fp, #-26]
	ldrh	r1, [fp, #-24]
	ldrh	ip, [fp, #-18]
	ldrh	lr, [fp, #-16]
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #16
	str	r3, [sp, #0]
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #16
	str	r3, [sp, #4]
	mov	r0, r2
	mov	r2, ip
	mov	r3, lr
	bl	calc_block_diff
	mov	r3, r0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r2, [fp, #-14]
	ldrh	r3, [fp, #-22]
	cmp	r2, r3
	bcs	.L6
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [fp, #-22]	@ movhi
	sub	r1, fp, #153600
	sub	r1, r1, #512
	ldrb	r3, [r1, #-120]
	strb	r3, [fp, #-20]
	sub	r2, fp, #153600
	sub	r2, r2, #512
	ldrb	r3, [r2, #-124]
	strb	r3, [fp, #-19]
.L6:
	sub	r0, fp, #151552
	ldr	r0, [r0, #-2684]
	add	r3, r0, #1
	and	r1, r3, #255
	sub	r2, fp, #151552
	str	r1, [r2, #-2684]
.L5:
	sub	r3, fp, #151552
	ldr	r3, [r3, #-2684]
	cmp	r3, #14
	bls	.L7
	sub	r0, fp, #151552
	ldr	r0, [r0, #-2680]
	add	r3, r0, #1
	and	r1, r3, #255
	sub	r2, fp, #151552
	str	r1, [r2, #-2680]
.L4:
	sub	r3, fp, #151552
	ldr	r3, [r3, #-2680]
	cmp	r3, #19
	bls	.L8
	ldrb	r0, [fp, #-28]	@ zero_extendqisi2
	ldrb	ip, [fp, #-27]	@ zero_extendqisi2
	ldrb	r2, [fp, #-20]
	ldrb	r3, [fp, #-27]
	rsb	r3, r3, r2
	and	r3, r3, #255
	mov	lr, r3
	mvn	r1, #153600
	sub	r1, r1, #612
	sub	r1, r1, #3
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	mov	r3, r3, asl #1
	sub	r0, fp, #12
	add	r3, r0, r3
	add	r2, r3, r1
	mov	r3, lr
	strb	r3, [r2, #0]
	ldrb	r0, [fp, #-28]	@ zero_extendqisi2
	ldrb	ip, [fp, #-27]	@ zero_extendqisi2
	ldrb	r2, [fp, #-19]
	ldrb	r3, [fp, #-28]
	rsb	r3, r3, r2
	and	r3, r3, #255
	mov	lr, r3
	mvn	r1, #153600
	sub	r1, r1, #612
	sub	r1, r1, #3
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
	mov	r3, lr
	strb	r3, [r2, #0]
	ldrb	ip, [fp, #-28]	@ zero_extendqisi2
	ldrb	lr, [fp, #-27]	@ zero_extendqisi2
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	ldrb	r0, [fp, #-27]	@ zero_extendqisi2
	mvn	r1, #153600
	sub	r1, r1, #612
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
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	ldrb	r0, [fp, #-27]	@ zero_extendqisi2
	mvn	r1, #153600
	sub	r1, r1, #612
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
	ldr	r0, .L12+8
	mov	r1, ip
	mov	r2, lr
	mov	r3, r4
	bl	printf
	ldrb	r3, [fp, #-28]
	add	r3, r3, #1
	strb	r3, [fp, #-28]
.L3:
	ldrb	r3, [fp, #-28]	@ zero_extendqisi2
	cmp	r3, #14
	bls	.L9
	ldrb	r3, [fp, #-27]
	add	r3, r3, #1
	strb	r3, [fp, #-27]
.L2:
	ldrb	r3, [fp, #-27]	@ zero_extendqisi2
	cmp	r3, #19
	bls	.L10
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L13:
	.align	2
.L12:
	.word	.LC0
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.section	.rodata
	.align	2
.LC3:
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
	.word	.LC3
	.size	readImage, .-readImage
	.align	2
	.type	calc_block_diff, %function
calc_block_diff:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #20
	strh	r0, [fp, #-14]	@ movhi
	strh	r1, [fp, #-16]	@ movhi
	strh	r2, [fp, #-18]	@ movhi
	strh	r3, [fp, #-20]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-10]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-8]
	b	.L23
.L28:
	mov	r3, #0
	strb	r3, [fp, #-7]
	b	.L24
.L27:
	ldrh	r2, [fp, #-20]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r1, r3, r2
	ldrh	r2, [fp, #-18]
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	mov	r0, r3
	ldrh	r2, [fp, #-16]
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r1, r3, r2
	ldrh	r2, [fp, #-14]
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	rsb	r3, r3, r0
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-6]	@ movhi
	ldrsh	r3, [fp, #-6]
	cmp	r3, #0
	bge	.L25
	ldrh	r3, [fp, #-6]
	ldrh	r2, [fp, #-10]	@ movhi
	rsb	r3, r3, r2
	strh	r3, [fp, #-10]	@ movhi
	b	.L26
.L25:
	ldrh	r3, [fp, #-6]
	ldrh	r2, [fp, #-10]	@ movhi
	add	r3, r3, r2
	strh	r3, [fp, #-10]	@ movhi
.L26:
	ldrb	r3, [fp, #-7]
	add	r3, r3, #1
	strb	r3, [fp, #-7]
.L24:
	ldrb	r3, [fp, #-7]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L27
	ldrb	r3, [fp, #-8]
	add	r3, r3, #1
	strb	r3, [fp, #-8]
.L23:
	ldrb	r3, [fp, #-8]	@ zero_extendqisi2
	cmp	r3, #15
	bls	.L28
	ldrh	r3, [fp, #-10]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	calc_block_diff, .-calc_block_diff
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

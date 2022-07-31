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
	@ args = 0, pretend = 0, frame = 155448
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, fp, lr}
	add	fp, sp, #12
	sub	sp, sp, #154624
	sub	sp, sp, #832
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #22
	ldr	r0, .L16
	mov	r1, r3
	bl	readImage
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #22
	ldr	r0, .L16+4
	mov	r1, r3
	bl	readImage
	mvn	r3, #154624
	sub	r3, r3, #796
	sub	r3, r3, #1
	sub	r1, fp, #12
	add	r2, r1, r3
	mov	r3, #1792
	add	r3, r3, #8
	mov	r0, r2
	mov	r1, #0
	mov	r2, r3
	bl	memset
	mov	r3, #0
	strb	r3, [fp, #-34]
	b	.L2
.L14:
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-32]	@ movhi
	ldrb	r3, [fp, #-34]
	add	r3, r3, #5
	and	r2, r3, #255
	ldrb	r3, [fp, #-34]
	sub	r3, r3, #4
	and	r3, r3, #255
	sub	r1, fp, #151552
	str	r3, [r1, #-3892]
	eor	r3, r2, #15
	and	r3, r3, #255
	mov	r1, r3
	cmp	r2, #14
	movhi	r3, #0
	movls	r3, #1
	rsb	r3, r3, #0
	and	r3, r3, #255
	mov	r2, r1
	and	r3, r2, r3
	and	r3, r3, #255
	eor	r3, r3, #15
	and	r3, r3, #255
	strb	r3, [fp, #-30]
	sub	r2, fp, #151552
	ldr	r2, [r2, #-3892]
	mov	r3, r2, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L3
	mov	r1, #0
	sub	r3, fp, #151552
	str	r1, [r3, #-3900]
	b	.L4
.L3:
	mov	r3, #255
	sub	r2, fp, #151552
	str	r3, [r2, #-3900]
.L4:
	sub	r1, fp, #154624
	sub	r1, r1, #768
	ldrb	r2, [r1, #-60]
	sub	r1, fp, #154624
	sub	r1, r1, #768
	ldrb	r3, [r1, #-52]
	and	r3, r2, r3
	and	r3, r3, #255
	strb	r3, [fp, #-29]
	mov	r3, #0
	strb	r3, [fp, #-33]
	b	.L5
.L13:
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-28]	@ movhi
	ldrb	r3, [fp, #-33]
	add	r3, r3, #5
	and	r2, r3, #255
	ldrb	r3, [fp, #-33]
	sub	r3, r3, #4
	and	r3, r3, #255
	sub	r1, fp, #151552
	str	r3, [r1, #-3888]
	eor	r3, r2, #20
	and	r3, r3, #255
	mov	r1, r3
	cmp	r2, #19
	movhi	r3, #0
	movls	r3, #1
	rsb	r3, r3, #0
	and	r3, r3, #255
	mov	r2, r1
	and	r3, r2, r3
	and	r3, r3, #255
	eor	r3, r3, #20
	and	r3, r3, #255
	strb	r3, [fp, #-26]
	sub	r2, fp, #151552
	ldr	r2, [r2, #-3888]
	mov	r3, r2, asl #24
	mov	r3, r3, asr #24
	cmp	r3, #0
	bge	.L6
	mov	r1, #0
	sub	r3, fp, #151552
	str	r1, [r3, #-3896]
	b	.L7
.L6:
	mov	r3, #255
	sub	r2, fp, #151552
	str	r3, [r2, #-3896]
.L7:
	sub	r1, fp, #154624
	sub	r1, r1, #768
	ldrb	r2, [r1, #-56]
	sub	r1, fp, #154624
	sub	r1, r1, #768
	ldrb	r3, [r1, #-48]
	and	r3, r2, r3
	and	r3, r3, #255
	strb	r3, [fp, #-25]
	mvn	r3, #0
	strh	r3, [fp, #-24]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-21]
	ldrb	r3, [fp, #-29]
	strb	r3, [fp, #-20]
	b	.L8
.L12:
	ldrb	r3, [fp, #-20]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-18]	@ movhi
	ldrb	r3, [fp, #-25]
	strb	r3, [fp, #-19]
	b	.L9
.L11:
	ldrb	r3, [fp, #-19]	@ zero_extendqisi2
	mov	r3, r3, asl #4
	strh	r3, [fp, #-16]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r2, [fp, #-28]
	ldrh	r1, [fp, #-32]
	ldrh	ip, [fp, #-16]
	ldrh	lr, [fp, #-18]
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #22
	str	r3, [sp, #0]
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #22
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
	bcs	.L10
	ldrh	r3, [fp, #-14]	@ movhi
	strh	r3, [fp, #-24]	@ movhi
	ldrb	r3, [fp, #-19]
	strb	r3, [fp, #-22]
	ldrb	r3, [fp, #-20]
	strb	r3, [fp, #-21]
.L10:
	ldrb	r3, [fp, #-19]
	add	r3, r3, #1
	strb	r3, [fp, #-19]
.L9:
	ldrb	r2, [fp, #-19]	@ zero_extendqisi2
	ldrb	r3, [fp, #-26]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L11
	ldrb	r3, [fp, #-20]
	add	r3, r3, #1
	strb	r3, [fp, #-20]
.L8:
	ldrb	r2, [fp, #-20]	@ zero_extendqisi2
	ldrb	r3, [fp, #-30]	@ zero_extendqisi2
	cmp	r2, r3
	bcc	.L12
	ldrb	r2, [fp, #-34]	@ zero_extendqisi2
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	ldrh	ip, [fp, #-24]
	mvn	r0, #154624
	sub	r0, r0, #796
	sub	r0, r0, #1
	mov	r3, r3, asl #1
	mov	r1, r3, asl #2
	rsb	r1, r3, r1
	mov	r3, r2
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r1, r3
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r0
	strh	ip, [r3, #0]	@ movhi
	ldrb	ip, [fp, #-34]	@ zero_extendqisi2
	ldrb	r1, [fp, #-33]	@ zero_extendqisi2
	ldrb	r2, [fp, #-22]	@ zero_extendqisi2
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	lr, r3
	mvn	r0, #154624
	sub	r0, r0, #796
	sub	r0, r0, #1
	mov	r4, #2
	mov	r3, r1
	mov	r3, r3, asl #1
	mov	r1, r3, asl #2
	rsb	r1, r3, r1
	mov	r3, ip
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r1, r3
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r3, r3, r0
	add	r3, r3, r4
	strh	lr, [r3, #0]	@ movhi
	ldrb	ip, [fp, #-34]	@ zero_extendqisi2
	ldrb	r1, [fp, #-33]	@ zero_extendqisi2
	ldrb	r2, [fp, #-21]	@ zero_extendqisi2
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	mov	lr, r3
	mvn	r0, #154624
	sub	r0, r0, #796
	sub	r0, r0, #1
	mov	r4, #4
	mov	r3, r1
	mov	r3, r3, asl #1
	mov	r1, r3, asl #2
	rsb	r1, r3, r1
	mov	r3, ip
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r1, r3
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r0
	add	r3, r3, r4
	strh	lr, [r3, #0]	@ movhi
	ldrb	ip, [fp, #-34]	@ zero_extendqisi2
	ldrb	lr, [fp, #-33]	@ zero_extendqisi2
	ldrb	r2, [fp, #-34]	@ zero_extendqisi2
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	mvn	r0, #154624
	sub	r0, r0, #796
	sub	r0, r0, #1
	mov	r4, #2
	mov	r3, r3, asl #1
	mov	r1, r3, asl #2
	rsb	r1, r3, r1
	mov	r3, r2
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r1, r3
	sub	r1, fp, #12
	add	r3, r1, r3
	add	r3, r3, r0
	add	r3, r3, r4
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r4, r3, asr #16
	ldrb	r2, [fp, #-34]	@ zero_extendqisi2
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	mvn	r0, #154624
	sub	r0, r0, #796
	sub	r0, r0, #1
	mov	r5, #4
	mov	r3, r3, asl #1
	mov	r1, r3, asl #2
	rsb	r1, r3, r1
	mov	r3, r2
	mov	r2, r3, asl #3
	mov	r3, r2, asl #4
	rsb	r3, r2, r3
	add	r3, r1, r3
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r0
	add	r3, r3, r5
	ldrh	r3, [r3, #0]
	mov	r3, r3, asl #16
	mov	r3, r3, asr #16
	str	r3, [sp, #0]
	ldr	r0, .L16+8
	mov	r1, ip
	mov	r2, lr
	mov	r3, r4
	bl	printf
	ldrb	r3, [fp, #-33]
	add	r3, r3, #1
	strb	r3, [fp, #-33]
.L5:
	ldrb	r3, [fp, #-33]	@ zero_extendqisi2
	cmp	r3, #19
	bls	.L13
	ldrb	r3, [fp, #-34]
	add	r3, r3, #1
	strb	r3, [fp, #-34]
.L2:
	ldrb	r3, [fp, #-34]	@ zero_extendqisi2
	cmp	r3, #14
	bls	.L14
	sub	sp, fp, #12
	ldmfd	sp!, {r4, r5, fp, lr}
	bx	lr
.L17:
	.align	2
.L16:
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
	ldr	r1, .L24
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
	b	.L19
.L22:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L20
.L21:
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
.L20:
	ldr	r2, [fp, #-8]
	mov	r3, #316
	add	r3, r3, #3
	cmp	r2, r3
	bls	.L21
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L19:
	ldr	r3, [fp, #-12]
	cmp	r3, #239
	bls	.L22
	ldr	r0, [fp, #-24]
	bl	fclose
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L25:
	.align	2
.L24:
	.word	.LC3
	.size	readImage, .-readImage
	.align	2
	.type	calc_block_diff, %function
calc_block_diff:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #52
	strh	r0, [fp, #-46]	@ movhi
	strh	r1, [fp, #-48]	@ movhi
	strh	r2, [fp, #-50]	@ movhi
	strh	r3, [fp, #-52]	@ movhi
	mov	r3, #0
	strh	r3, [fp, #-42]	@ movhi
	ldrh	r3, [fp, #-48]
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r2, r3, r2
	ldrh	r3, [fp, #-46]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-40]	@ movhi
	ldrh	r3, [fp, #-52]
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r3, r2
	ldrh	r3, [fp, #-50]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-38]	@ movhi
	mov	r3, #0
	strb	r3, [fp, #-36]
	b	.L27
.L30:
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L28
.L29:
	ldrh	r2, [fp, #-38]
	ldrh	r3, [fp, #-40]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-16]	@ movhi
	ldrsh	r3, [fp, #-16]
	mov	r3, r3, asr #15
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-12]	@ movhi
	ldrh	r2, [fp, #-16]
	ldrh	r3, [fp, #-12]	@ movhi
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldrh	r2, [fp, #-12]
	mov	r1, r3	@ movhi
	mov	r3, r2	@ movhi
	eor	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-14]	@ movhi
	ldrh	r2, [fp, #-42]	@ movhi
	ldrh	r3, [fp, #-14]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-42]	@ movhi
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldrh	r2, [fp, #-48]
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r1, r3, r2
	ldrh	r2, [fp, #-46]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-40]	@ movhi
	ldrh	r2, [fp, #-52]
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r1, r3, r2
	ldrh	r2, [fp, #-50]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-38]	@ movhi
.L28:
	ldr	r3, [fp, #-28]
	cmp	r3, #15
	bne	.L29
	ldrh	r2, [fp, #-38]
	ldrh	r3, [fp, #-40]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-22]	@ movhi
	ldrsh	r3, [fp, #-22]
	mov	r3, r3, asr #15
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-18]	@ movhi
	ldrh	r2, [fp, #-22]
	ldrh	r3, [fp, #-18]	@ movhi
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldrh	r2, [fp, #-18]
	mov	r1, r3	@ movhi
	mov	r3, r2	@ movhi
	eor	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-20]	@ movhi
	ldrh	r2, [fp, #-42]	@ movhi
	ldrh	r3, [fp, #-20]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-42]	@ movhi
	ldrb	r3, [fp, #-36]
	add	r3, r3, #1
	strb	r3, [fp, #-36]
	ldrh	r2, [fp, #-48]
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r2, r3, r2
	ldrh	r3, [fp, #-46]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-40]	@ movhi
	ldrh	r2, [fp, #-52]
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r3, r2
	ldrh	r3, [fp, #-50]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-38]	@ movhi
.L27:
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	cmp	r3, #15
	bne	.L30
	mov	r3, #0
	strb	r3, [fp, #-35]
	b	.L31
.L32:
	ldrh	r2, [fp, #-38]
	ldrh	r3, [fp, #-40]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-10]	@ movhi
	ldrsh	r3, [fp, #-10]
	mov	r3, r3, asr #15
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-6]	@ movhi
	ldrh	r2, [fp, #-10]
	ldrh	r3, [fp, #-6]	@ movhi
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldrh	r2, [fp, #-6]
	mov	r1, r3	@ movhi
	mov	r3, r2	@ movhi
	eor	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-8]	@ movhi
	ldrh	r2, [fp, #-42]	@ movhi
	ldrh	r3, [fp, #-8]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-42]	@ movhi
	ldrb	r3, [fp, #-35]
	add	r3, r3, #1
	strb	r3, [fp, #-35]
	ldrh	r2, [fp, #-48]
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r1, r3, r2
	ldrh	r2, [fp, #-46]
	ldrb	r3, [fp, #-35]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-40]	@ movhi
	ldrh	r2, [fp, #-52]
	ldrb	r3, [fp, #-36]	@ zero_extendqisi2
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r1, r3, r2
	ldrh	r2, [fp, #-50]
	ldrb	r3, [fp, #-35]	@ zero_extendqisi2
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	strh	r3, [fp, #-38]	@ movhi
.L31:
	ldrb	r3, [fp, #-35]	@ zero_extendqisi2
	cmp	r3, #15
	bne	.L32
	ldrh	r2, [fp, #-38]
	ldrh	r3, [fp, #-40]
	rsb	r3, r3, r2
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-34]	@ movhi
	ldrsh	r3, [fp, #-34]
	mov	r3, r3, asr #15
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-30]	@ movhi
	ldrh	r2, [fp, #-34]
	ldrh	r3, [fp, #-30]	@ movhi
	add	r3, r2, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	ldrh	r2, [fp, #-30]
	mov	r1, r3	@ movhi
	mov	r3, r2	@ movhi
	eor	r3, r1, r3
	mov	r3, r3, asl #16
	mov	r3, r3, lsr #16
	strh	r3, [fp, #-32]	@ movhi
	ldrh	r2, [fp, #-42]	@ movhi
	ldrh	r3, [fp, #-32]	@ movhi
	add	r3, r2, r3
	strh	r3, [fp, #-42]	@ movhi
	ldrh	r3, [fp, #-42]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	calc_block_diff, .-calc_block_diff
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
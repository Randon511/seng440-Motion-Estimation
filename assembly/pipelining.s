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
	.file	"pipelining.c"
	.section	.rodata
	.align	2
.LC0:
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
	ldr	r1, .L7
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
	b	.L2
.L5:
	mov	r3, #0
	str	r3, [fp, #-8]
	b	.L3
.L4:
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
.L3:
	ldr	r2, [fp, #-8]
	mov	r3, #316
	add	r3, r3, #3
	cmp	r2, r3
	bls	.L4
	ldr	r3, [fp, #-12]
	add	r3, r3, #1
	str	r3, [fp, #-12]
.L2:
	ldr	r3, [fp, #-12]
	cmp	r3, #239
	bls	.L5
	ldr	r0, [fp, #-24]
	bl	fclose
	sub	sp, fp, #4
	ldmfd	sp!, {fp, lr}
	bx	lr
.L8:
	.align	2
.L7:
	.word	.LC0
	.size	readImage, .-readImage
	.align	2
	.type	calc_block_diff, %function
calc_block_diff:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 56
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	str	fp, [sp, #-4]!
	add	fp, sp, #0
	sub	sp, sp, #60
	str	r0, [fp, #-48]
	str	r1, [fp, #-52]
	str	r2, [fp, #-56]
	str	r3, [fp, #-60]
	mov	r3, #0
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-52]
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r2, r3, r2
	ldr	r3, [fp, #-48]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-60]
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r3, r2
	ldr	r3, [fp, #-56]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L10
.L17:
	mov	r3, #0
	str	r3, [fp, #-20]
	b	.L11
.L14:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	rsb	r3, r3, r2
	str	r3, [fp, #-12]
	ldr	r3, [fp, #-12]
	cmp	r3, #0
	bge	.L12
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-12]
	rsb	r3, r2, r3
	str	r3, [fp, #-44]
	b	.L13
.L12:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-12]
	add	r3, r3, r2
	str	r3, [fp, #-44]
.L13:
	ldr	r3, [fp, #-20]
	add	r3, r3, #1
	str	r3, [fp, #-20]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r1, r3, r2
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r1, r3, r2
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
.L11:
	ldr	r3, [fp, #-20]
	cmp	r3, #15
	bne	.L14
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	rsb	r3, r3, r2
	str	r3, [fp, #-16]
	ldr	r3, [fp, #-16]
	cmp	r3, #0
	bge	.L15
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-16]
	rsb	r3, r2, r3
	str	r3, [fp, #-44]
	b	.L16
.L15:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-16]
	add	r3, r3, r2
	str	r3, [fp, #-44]
.L16:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r2, r3, r2
	ldr	r3, [fp, #-48]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-20]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r2, r3, r2
	ldr	r3, [fp, #-56]
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
.L10:
	ldr	r3, [fp, #-32]
	cmp	r3, #15
	bne	.L17
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L18
.L21:
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	rsb	r3, r3, r2
	str	r3, [fp, #-8]
	ldr	r3, [fp, #-8]
	cmp	r3, #0
	bge	.L19
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-8]
	rsb	r3, r2, r3
	str	r3, [fp, #-44]
	b	.L20
.L19:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-8]
	add	r3, r3, r2
	str	r3, [fp, #-44]
.L20:
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
	ldr	r2, [fp, #-52]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #4]
	add	r1, r3, r2
	ldr	r2, [fp, #-48]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	str	r3, [fp, #-40]
	ldr	r2, [fp, #-60]
	ldr	r3, [fp, #-28]
	add	r3, r2, r3
	mov	r2, r3, asl #6
	mov	r3, r2, asl #2
	add	r2, r2, r3
	ldr	r3, [fp, #8]
	add	r1, r3, r2
	ldr	r2, [fp, #-56]
	ldr	r3, [fp, #-32]
	add	r3, r2, r3
	ldrb	r3, [r1, r3]	@ zero_extendqisi2
	str	r3, [fp, #-36]
.L18:
	ldr	r3, [fp, #-28]
	cmp	r3, #15
	bne	.L21
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-40]
	rsb	r3, r3, r2
	str	r3, [fp, #-24]
	ldr	r3, [fp, #-24]
	cmp	r3, #0
	bge	.L22
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-24]
	rsb	r3, r2, r3
	str	r3, [fp, #-44]
	b	.L23
.L22:
	ldr	r3, [fp, #-44]
	ldr	r2, [fp, #-24]
	add	r3, r3, r2
	str	r3, [fp, #-44]
.L23:
	ldr	r3, [fp, #-44]
	mov	r0, r3
	add	sp, fp, #0
	ldmfd	sp!, {fp}
	bx	lr
	.size	calc_block_diff, .-calc_block_diff
	.section	.rodata
	.align	2
.LC1:
	.ascii	"frame_1.bmp\000"
	.align	2
.LC2:
	.ascii	"frame_2.bmp\000"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 156048
	@ frame_needed = 1, uses_anonymous_args = 0
	stmfd	sp!, {r4, fp, lr}
	add	fp, sp, #8
	sub	sp, sp, #155648
	sub	sp, sp, #412
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #48
	ldr	r0, .L36
	mov	r1, r3
	bl	readImage
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #48
	ldr	r0, .L36+4
	mov	r1, r3
	bl	readImage
	mvn	r3, #155648
	sub	r3, r3, #396
	sub	r3, r3, #3
	sub	r2, fp, #12
	add	r3, r2, r3
	mov	r2, #2400
	mov	r0, r3
	mov	r1, #0
	bl	memset
	mov	r3, #0
	str	r3, [fp, #-56]
	b	.L26
.L34:
	ldr	r3, [fp, #-56]
	mov	r3, r3, asl #4
	str	r3, [fp, #-52]
	mov	r3, #0
	str	r3, [fp, #-60]
	b	.L27
.L33:
	ldr	r3, [fp, #-60]
	mov	r3, r3, asl #4
	str	r3, [fp, #-48]
	mvn	r3, #-2147483648
	str	r3, [fp, #-44]
	mov	r3, #0
	str	r3, [fp, #-36]
	mov	r3, #0
	str	r3, [fp, #-28]
	b	.L28
.L32:
	ldr	r3, [fp, #-28]
	mov	r3, r3, asl #4
	str	r3, [fp, #-24]
	mov	r3, #0
	str	r3, [fp, #-32]
	b	.L29
.L31:
	ldr	r3, [fp, #-32]
	mov	r3, r3, asl #4
	str	r3, [fp, #-20]
	sub	r3, fp, #76800
	sub	r3, r3, #12
	sub	r3, r3, #48
	str	r3, [sp, #0]
	sub	r3, fp, #153600
	sub	r3, r3, #12
	sub	r3, r3, #48
	str	r3, [sp, #4]
	ldr	r0, [fp, #-52]
	ldr	r1, [fp, #-48]
	ldr	r2, [fp, #-24]
	ldr	r3, [fp, #-20]
	bl	calc_block_diff
	mov	r3, r0
	str	r3, [fp, #-16]
	ldr	r2, [fp, #-16]
	ldr	r3, [fp, #-44]
	cmp	r2, r3
	bge	.L30
	ldr	r3, [fp, #-16]
	str	r3, [fp, #-44]
	ldr	r3, [fp, #-28]
	str	r3, [fp, #-40]
	ldr	r3, [fp, #-32]
	str	r3, [fp, #-36]
.L30:
	ldr	r3, [fp, #-32]
	add	r3, r3, #1
	str	r3, [fp, #-32]
.L29:
	ldr	r3, [fp, #-32]
	cmp	r3, #14
	ble	.L31
	ldr	r3, [fp, #-28]
	add	r3, r3, #1
	str	r3, [fp, #-28]
.L28:
	ldr	r3, [fp, #-28]
	cmp	r3, #19
	ble	.L32
	ldr	r0, [fp, #-60]
	ldr	ip, [fp, #-56]
	ldr	r2, [fp, #-40]
	ldr	r3, [fp, #-56]
	rsb	r4, r3, r2
	mvn	r1, #155648
	sub	r1, r1, #396
	sub	r1, r1, #3
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	mov	r3, r3, asl #3
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r1
	str	r4, [r3, #0]
	ldr	r0, [fp, #-60]
	ldr	ip, [fp, #-56]
	ldr	r2, [fp, #-36]
	ldr	r3, [fp, #-60]
	rsb	r4, r3, r2
	mvn	r1, #155648
	sub	r1, r1, #396
	sub	r1, r1, #3
	mov	r3, r0
	mov	r3, r3, asl #2
	mov	r2, r3, asl #2
	add	r3, r3, r2
	add	r3, r3, ip
	mov	r3, r3, asl #1
	add	r3, r3, #1
	mov	r3, r3, asl #2
	sub	r2, fp, #12
	add	r3, r2, r3
	add	r3, r3, r1
	str	r4, [r3, #0]
	ldr	r3, [fp, #-60]
	add	r3, r3, #1
	str	r3, [fp, #-60]
.L27:
	ldr	r3, [fp, #-60]
	cmp	r3, #14
	ble	.L33
	ldr	r3, [fp, #-56]
	add	r3, r3, #1
	str	r3, [fp, #-56]
.L26:
	ldr	r3, [fp, #-56]
	cmp	r3, #19
	ble	.L34
	mov	r3, #0
	mov	r0, r3
	sub	sp, fp, #8
	ldmfd	sp!, {r4, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	.LC1
	.word	.LC2
	.size	main, .-main
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits

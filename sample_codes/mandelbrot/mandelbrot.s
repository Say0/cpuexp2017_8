	.data
	.align 2
l.102:	 # 0.000000
	.long	0
	.align 2
l.101:	 # 1.000000
	.long	1065353216
	.align 2
l.100:	 # 1.500000
	.long	1069547520
	.align 2
l.99:	 # 400.000000
	.long	1137180672
	.align 2
l.98:	 # 4.000000
	.long	1082130432
	.text
	.globl _min_caml_start
	.align 2
	j	_min_caml_start
dbl.38:
	fadd	f1, f1, f1
	jr	r31
iloop.54:
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.122
	addi	r2, r2, 1
	j	min_caml_print_int
beq_else.122:
	fsub	f3, f3, f4
	fadd	f3, f3, f5
	sw	r3, 0(r29)
	fsw	f5, 4(r29)
	sw	r2, 8(r29)
	fsw	f3, 12(r29)
	fsw	f6, 16(r29)
	fsw	f2, 20(r29)
	add	r27, r31, r0
	sw	r27, 24(r29)
	addi	r29, r29, 28
	jal	dbl.38
	addi	r29, r29, -28
	lw	r27, 24(r29)
	add	r31, r27, r0
	flw	f2, 20(r29)
	fmul	f1, f1, f2
	flw	f6, 16(r29)
	fadd	f2, f1, f6
	flw	f1, 12(r29)
	fmul	f3, f1, f1
	fmul	f4, f2, f2
	fadd	f5, f3, f4
	lui	r27, ha16(l.98)
	ori	r27, r27, lo16(l.98)
	flw	f7, 0(r27)
	fle	f5, f7
	fbc1t	fle_else.123
	lw	r2, 0(r29)
	j	min_caml_print_int
fle_else.123:
	lw	r2, 8(r29)
	addi	r2, r2, -1
	flw	f5, 4(r29)
	j	iloop.54
xloop.44:
	lw	r4, 4(r28)
	sub	r27, r4, r2
	bgtz	r27, ble_else.124
	jr	r31
ble_else.124:
	sw	r28, 0(r29)
	sw	r2, 4(r29)
	sw	r3, 8(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_float_of_int
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	dbl.38
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.99)
	ori	r27, r27, lo16(l.99)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
	lui	r27, ha16(l.100)
	ori	r27, r27, lo16(l.100)
	flw	f2, 0(r27)
	fsub	f1, f1, f2
	lw	r2, 8(r29)
	fsw	f1, 12(r29)
	add	r27, r31, r0
	sw	r27, 16(r29)
	addi	r29, r29, 20
	jal	min_caml_float_of_int
	addi	r29, r29, -20
	lw	r27, 16(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 16(r29)
	addi	r29, r29, 20
	jal	dbl.38
	addi	r29, r29, -20
	lw	r27, 16(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.99)
	ori	r27, r27, lo16(l.99)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
	lui	r27, ha16(l.101)
	ori	r27, r27, lo16(l.101)
	flw	f2, 0(r27)
	fsub	f6, f1, f2
	addi	r2, r2, 1000
	lui	r27, ha16(l.102)
	ori	r27, r27, lo16(l.102)
	flw	f1, 0(r27)
	flw	f5, 12(r29)
	add	r27, r31, r0
	fmov	f4, f1
	fmov	f3, f1
	fmov	f2, f1
	sw	r27, 16(r29)
	addi	r29, r29, 20
	jal	iloop.54
	addi	r29, r29, -20
	lw	r27, 16(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r2, r2, 1
	lw	r3, 8(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
yloop.40:
	addi	r3, r3, 400
	addi	r27, r0, 400
	sub	r27, r27, r2
	bgtz	r27, bge_else.126
	jr	r31
bge_else.126:
	add	r28, r30, r0
	addi	r30, r30, 8
	lui	r4, ha16(xloop.44)
	ori	r4, r4, lo16(xloop.44)
	sw	r4, 0(r28)
	sw	r3, 4(r28)
	addi	r3, r3, 0
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	addi	r2, r2, 1
	j	yloop.40
_min_caml_start: # main entry point
	add	r27, r31, r0
	sw	r28, -8(r29)
	sw	r27, 8(r29)
	sw	r29, -96(r29)
#	main program starts
	addi	r2, r2, 0
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	yloop.40
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
#	main program ends
	lw	r29, 0(r29)
	lw	r27, 8(r29)
	add	r31, r27, r0
	lw	r28, -8(r29)
	jr	r31

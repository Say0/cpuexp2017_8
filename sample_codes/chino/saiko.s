	.data
	.literal8
	.align 3
l.11:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
_min_caml_start: # main entry point
	add	r27, r31, r0
	sw	r28, -8(r29)
	sw	r27, 8(r29)
	sw	r29, -96(r29)
#	main program starts
	addi	r2, r2, 4
	addi	r3, r3, 0
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r2, r2, 4
	lui	r27, ha16(l.11)
	ori	r27, r27, lo16(l.11)
	flw	f1, 0(r27)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
#	main program ends
	lw	r29, 0(r29)
	lw	r27, 8(r29)
	add	r31, r27, r0
	lw	r28, -8(r29)
	jr	r31

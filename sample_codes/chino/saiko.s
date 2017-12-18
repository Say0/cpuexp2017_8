	.globl _min_caml_start
#	Jump to the start point
	j	_min_caml_start
#	AsmLibrary Inclusion
y:
#	Function Definitions
_min_caml_start: # main entry point
#	main program starts
	addi	r2, r0, 4 #4
	addi	r3, r0, 0 #0
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	min_caml_create_array
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	addi	r3, r0, 4 #4
	lui	r27, 0 #0.000000
	ori	r27, r27, 0
	fmtc	r27, f1
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r3, r0, 1 #1
	in	r4
	addi	r5, r0, 6 #6
	addi	r6, r0, 9 #9
	add	r7, r30, r0
	addi	r30, r30, 12
	sw	r6, 8(r7)
	sw	r5, 4(r7)
	sw	r3, 0(r7)
	add	r5, r7, r0
	sw	r2, 4(r29)
	sw	r4, 8(r29)
	sw	r3, 12(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	sw	r27, 16(r29)
	addi	r29, r29, 20
	jal	min_caml_lm
	addi	r29, r29, -20
	lw	r27, 16(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lui	r27, 16384 #2.000000
	ori	r27, r27, 0
	fmtc	r27, f1
	fmfc	r27, f1
	outw	r27
	lw	r2, 12(r29)
	outb	r2
	lw	r2, 8(r29)
	outw	r2
	lw	r2, 0(r29)
	lw	r3, 4(r2)
	lw	r2, 8(r2)
	add	r2, r3, r2
	outw	r2
	lw	r2, 4(r29)
	flw	f1, 4(r2)
	flw	f2, 8(r2)
	fadd	f1, f1, f2
	fmfc	r27, f1
	outw	r27
#	main program ends
_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).
	j	_min_caml_end_loop

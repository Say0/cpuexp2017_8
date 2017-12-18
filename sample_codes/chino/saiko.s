	.globl _min_caml_start
#	Jump to the start point
	j	_min_caml_start
#	AsmLibrary Inclusion
y:
#	Function Definitions
_min_caml_start: # main entry point
#	main program starts
	addi	r2, r2, 4 #4
	addi	r3, r3, 0 #0
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	min_caml_create_array
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	addi	r2, r2, 4 #4
	lui	r27, 0 #0.000000
	ori	r27, r27, 0
	fmtc	r27, f1
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	min_caml_create_float_array
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	addi	r2, r2, 1 #1
	outb	r2
#	main program ends
_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).
	j	_min_caml_end_loop

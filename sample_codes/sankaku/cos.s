	.globl _min_caml_start
	lui	r27, 16457 #3.1415920000000002
	ori	r27, r27, 4056
	fmtc	r27, f29
	lui	r27, 16128 #0.5000000000000000
	ori	r27, r27, 0
	fmtc	r27, f30
#	Jump to the start point
	j	_min_caml_start
#	AsmLibrary Inclusion
#	Function Definitions
cos.43:
	lui	r27, 16256 #1.0000000000000000
	ori	r27, r27, 0
	fmtc	r27, f2
	lui	r27, 16128 #0.5000000000000000
	ori	r27, r27, 0
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 15658 #0.0416666666666667
	ori	r27, r27, 43691
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 15030 #0.0013888888888889
	ori	r27, r27, 2913
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 14288 #0.0000248015873016
	ori	r27, r27, 3329
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 13459 #0.0000002755731922
	ori	r27, r27, 62078
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f1, f3, f1
	fsub	f1, f2, f1
	jr	r31
_min_caml_start: # main entry point
#	main program starts
	lui	r27, 16128 #0.5000000000000000
	ori	r27, r27, 0
	fmtc	r27, f1
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	cos.43
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	fmfc	r27, f1
	outw	r27
#	main program ends
_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).
	j	_min_caml_end_loop

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
sin.34:
	lui	r27, 15914 #0.1666666666666667
	ori	r27, r27, 43691
	fmtc	r27, f2
	fmul	f2, f2, f1
	fmul	f2, f2, f1
	fmul	f2, f2, f1
	fsub	f2, f1, f2
	lui	r27, 15368 #0.0083333333333333
	ori	r27, r27, 34953
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 14672 #0.0001984126984127
	ori	r27, r27, 3329
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 13880 #0.0000027557319224
	ori	r27, r27, 61213
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f1, f3, f1
	fadd	f1, f2, f1
	jr	r31
_min_caml_start: # main entry point
#	main program starts
	lui	r27, 16128 #0.5000000000000000
	ori	r27, r27, 0
	fmtc	r27, f1
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	sin.34
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	fmfc	r27, f1
	outw	r27
#	main program ends
_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).
	j	_min_caml_end_loop

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
atan.34:
	lui	r27, 16042 #0.3333333333333333
	ori	r27, r27, 43691
	fmtc	r27, f2
	fmul	f2, f2, f1
	fmul	f2, f2, f1
	fmul	f2, f2, f1
	fsub	f2, f1, f2
	lui	r27, 15948 #0.2000000000000000
	ori	r27, r27, 52429
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 15890 #0.1428571428571428
	ori	r27, r27, 18725
	fmtc	r27, f3
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 15843 #0.1111111111111111
	ori	r27, r27, 36409
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
	jal	atan.34
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	fmfc	r27, f1
	outw	r27
#	main program ends
_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).
	j	_min_caml_end_loop

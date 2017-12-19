#	create_array
min_caml_create_array:
	add	r4, r2, r0
	addi	r27, r0, 2
	sll	r2, r2, r27
	sub r30, r30, r2
	add r2, r30, r0
min_caml_create_array_loop.1:
	bgtz	r4, min_caml_create_array_main.1
	add	r2, r30, r0
	jr	r31
min_caml_create_array_main.1:
	sw	r3, 0(r2)
	addi	r27, r0, 4
	add	r2, r2, r27
	addi	r27, r0, 1
	sub	r4, r4, r27
	j	min_caml_create_array_loop.1
#	create_float_array
min_caml_create_float_array:
	add	r4, r2, r0
	addi	r27, r0, 2
	sll	r2, r2, r27
	sub r30, r30, r2
	add r2, r30, r0
min_caml_create_float_array_loop.1:
	bgtz	r4, min_caml_create_float_array_main.1
	add	r2, r30, r0
	jr	r31
min_caml_create_float_array_main.1:
	fsw	f1, 0(r2)
	addi	r27, r0, 4
	add	r2, r2, r27
	addi	r27, r0, 1
	sub	r4, r4, r27
	j	min_caml_create_float_array_loop.1
#	sqrt
min_caml_sqrt:
	fsqrt	f1, f1
	jr	r31
#	floor
min_caml_floor:
	fsub	f1, f1, f30
	ftoi	r27, f1
	itof	f1, r27
	jr	r31
#	int to float
min_caml_int_of_float:
	ftoi	r2, f1
	jr	r31
#	float to int
min_caml_float_of_int:
	itof	f1, r2
	jr	r31
#	cos
min_caml_cos:
	lui	r27, 16256 #1.0000000000000000
	ori	r27, r27, 0
	fmtc	r27, f2
	lui	r27, 16128 #0.5000000000000000
	ori	r27, r27, 0
	fmtc	r27, f3
	fmul	f1, f1, f1
	fmov	f10, f1	#x^2
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 15658 #0.0416666666666667
	ori	r27, r27, 43691
	fmtc	r27, f3
	fmul	f1, f1, f1	#x^4
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 15030 #0.0013888888888889
	ori	r27, r27, 2913
	fmtc	r27, f3
	fmul	f3, f3, f10	#*x^2
	fmul	f3, f3, f1	#*x^4
	fsub	f2, f2, f3
	lui	r27, 14288 #0.0000248015873016
	ori	r27, r27, 3329
	fmtc	r27, f3
	fmul	f1, f1, f1	#x^8
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 13459 #0.0000002755731922
	ori	r27, r27, 62078
	fmtc	r27, f3
	fmul	f3, f3, f10
	fmul	f3, f3, f1
	fsub	f1, f2, f3
	jr	r31
#	sin
min_caml_sin:
	lui	r27, 15914 #0.1666666666666667
	ori	r27, r27, 43691
	fmtc	r27, f2
	fmul	f10, f1, f1
	fmul	f2, f2, f10
	fmul	f2, f2, f1
	fsub	f2, f1, f2
	lui	r27, 15368 #0.0083333333333333
	ori	r27, r27, 34953
	fmtc	r27, f3
	fmul	f10, f10, f10
	fmul	f3, f3, f10
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 14672 #0.0001984126984127
	ori	r27, r27, 3329
	fmtc	r27, f3
	fmul	f3, f3, f10
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 13880 #0.0000027557319224
	ori	r27, r27, 61213
	fmtc	r27, f3
	fmul	f10, f10, f1
	fmul	f3, f3, f10
	fmul	f3, f3, f1
	fadd	f1, f2, f3
	jr	r31
#	atan
min_caml_atan:
	lui	r27, 16042 #0.3333333333333333
	ori	r27, r27, 43691
	fmtc	r27, f2
	fmul	f10, f1, f1
	fmov	f11, f1
	fmul	f1, f1, f10
	fmul	f2, f2, f1
	fsub	f2, f11, f2
	lui	r27, 15948 #0.2000000000000000
	ori	r27, r27, 52429
	fmtc	r27, f3
	fmul	f1, f1, f10
	fmul	f3, f3, f1
	fadd	f2, f2, f3
	lui	r27, 15890 #0.1428571428571428
	ori	r27, r27, 18725
	fmtc	r27, f3
	fmul	f1, f1, f10
	fmul	f3, f3, f1
	fsub	f2, f2, f3
	lui	r27, 15843 #0.1111111111111111
	ori	r27, r27, 36409
	fmtc	r27, f3
	fmul	f1, f1, f10
	fmul	f3, f3, f1
	fadd	f1, f2, f3
	jr	r31

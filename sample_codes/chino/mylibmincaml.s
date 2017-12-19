#	create_array
_min_caml_create_array:
	add	r4, r2, r0
	addi	r27, r0, 2
	sll	r2, r2, r27
	sub r30, r30, r2
	add r2, r30, r0
_min_caml_create_array_loop.1:
	bgtz	r4, _min_caml_create_array_main.1
	add	r2, r30, r0
	jr	r31
_min_caml_create_array_main.1:
	sw	r3, 0(r2)
	addi	r27, r0, 4
	add	r2, r2, r27
	addi	r27, r0, 1
	sub	r4, r4, r27
	j	min_caml_create_array_loop.1
#	create_float_array
_min_caml_create_float_array:
	add	r4, r2, r0
	addi	r27, r0, 2
	sll	r2, r2, r27
	sub r30, r30, r2
	add r2, r30, r0
_min_caml_create_float_array_loop.1:
	bgtz	r4, _min_caml_create_float_array_main.1
	add	r2, r30, r0
	jr	r31
_min_caml_create_float_array_main.1:
	fsw	f1, 0(r2)
	addi	r27, r0, 4
	add	r2, r2, r27
	addi	r27, r0, 1
	sub	r4, r4, r27
	j	min_caml_create_float_array_loop.1
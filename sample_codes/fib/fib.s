	.globl _min_caml_start
#	Jump to the start point
	j	_min_caml_start
#	AsmLibrary Inclusion
#	Function Definitions
fib.10:
	addi	r27, r0, 1
	sub	r27, r2, r27
	bgtz	r27, ble_else.24
	jr	r31
ble_else.24:
	addi	r3, r2, -1
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	fib.10
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	addi	r3, r3, -2
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 8(r29)
	addi	r29, r29, 12
	jal	fib.10
	addi	r29, r29, -12
	lw	r27, 8(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	add	r2, r3, r2
	jr	r31
_min_caml_start: # main entry point
#	main program starts
	addi	r2, r0, 30 #30
	add	r27, r31, r0
	sw	r27, 0(r29)
	addi	r29, r29, 4
	jal	fib.10
	addi	r29, r29, -4
	lw	r27, 0(r29)
	add	r31, r27, r0
	outw	r2
#	main program ends
_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).
	j	_min_caml_end_loop

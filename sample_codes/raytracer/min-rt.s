	.data
	.literal8
	.align 3
l.6584:	 # 128.000000
	.long	0
	.long	1080033280
	.align 3
l.6551:	 # 0.900000
	.long	-858993459
	.long	1072483532
	.align 3
l.6550:	 # 0.200000
	.long	-1717986918
	.long	1070176665
	.align 3
l.6456:	 # 150.000000
	.long	0
	.long	1080213504
	.align 3
l.6454:	 # -150.000000
	.long	0
	.long	-1067270144
	.align 3
l.6438:	 # 0.100000
	.long	-1717986918
	.long	1069128089
	.align 3
l.6435:	 # -2.000000
	.long	0
	.long	-1073741824
	.align 3
l.6433:	 # 0.003906
	.long	0
	.long	1064304640
	.align 3
l.6411:	 # 20.000000
	.long	0
	.long	1077149696
	.align 3
l.6410:	 # 0.050000
	.long	-1717986918
	.long	1068079513
	.align 3
l.6406:	 # 0.250000
	.long	0
	.long	1070596096
	.align 3
l.6402:	 # 10.000000
	.long	0
	.long	1076101120
	.align 3
l.6398:	 # 0.300000
	.long	858993459
	.long	1070805811
	.align 3
l.6397:	 # 255.000000
	.long	0
	.long	1081073664
	.align 3
l.6396:	 # 0.500000
	.long	0
	.long	1071644672
	.align 3
l.6395:	 # 0.150000
	.long	858993459
	.long	1069757235
	.align 3
l.6393:	 # 3.141593
	.long	1518260631
	.long	1074340347
	.align 3
l.6392:	 # 30.000000
	.long	0
	.long	1077805056
	.align 3
l.6391:	 # 15.000000
	.long	0
	.long	1076756480
	.align 3
l.6390:	 # 0.000100
	.long	-350469331
	.long	1058682594
	.align 3
l.6347:	 # 100000000.000000
	.long	0
	.long	1100470148
	.align 3
l.6343:	 # 1000000000.000000
	.long	0
	.long	1104006501
	.align 3
l.6323:	 # -0.100000
	.long	-1717986918
	.long	-1078355559
	.align 3
l.6310:	 # 0.010000
	.long	1202590843
	.long	1065646817
	.align 3
l.6309:	 # -0.200000
	.long	-1717986918
	.long	-1077306983
	.align 3
l.6118:	 # 2.000000
	.long	0
	.long	1073741824
	.align 3
l.6084:	 # -200.000000
	.long	0
	.long	-1066860544
	.align 3
l.6082:	 # 200.000000
	.long	0
	.long	1080623104
	.align 3
l.6078:	 # 0.017453
	.long	-1433277178
	.long	1066524486
	.align 3
l.5995:	 # -1.000000
	.long	0
	.long	-1074790400
	.align 3
l.5994:	 # 1.000000
	.long	0
	.long	1072693248
	.align 3
l.5993:	 # 0.000000
	.long	0
	.long	0
	.text
	.globl _min_caml_start
	.align 2
xor.2461:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8649
	add	r2, r3, r0
	jr	r31
beq_else.8649:
	addi	r27, r0, 0
	bne	r3, r27, beq_else.8650
	addi	r2, r2, 1
	jr	r31
beq_else.8650:
	addi	r2, r2, 0
	jr	r31
sgn.2464:
	fsw	f1, 0(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fiszero
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8651
	flw	f1, 0(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fispos
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8652
	lui	r27, ha16(l.5995)
	ori	r27, r27, lo16(l.5995)
	flw	f1, 0(r27)
	jr	r31
beq_else.8652:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	jr	r31
beq_else.8651:
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	jr	r31
fneg_cond.2466:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8653
	j	min_caml_fneg
beq_else.8653:
	jr	r31
add_mod5.2469:
	add	r2, r2, r3
	addi	r27, r0, 5
	sub	r27, r27, r2
	bgtz	r27, bge_else.8654
	addi	r2, r2, -5
	jr	r31
bge_else.8654:
	jr	r31
vecset.2472:
	fsw	f1, 0(r2)
	fsw	f2, 8(r2)
	fsw	f3, 16(r2)
	jr	r31
vecfill.2477:
	fsw	f1, 0(r2)
	fsw	f1, 8(r2)
	fsw	f1, 16(r2)
	jr	r31
vecbzero.2480:
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	j	vecfill.2477
veccpy.2482:
	flw	f1, 0(r3)
	fsw	f1, 0(r2)
	flw	f1, 8(r3)
	fsw	f1, 8(r2)
	flw	f1, 16(r3)
	fsw	f1, 16(r2)
	jr	r31
vecunit_sgn.2490:
	flw	f1, 0(r2)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fsqr
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 8(r2)
	fsw	f1, 8(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fsqr
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	flw	f2, 8(r29)
	fadd	f1, f2, f1
	lw	r2, 4(r29)
	flw	f2, 16(r2)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_fsqr
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f2, 16(r29)
	fadd	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_sqrt
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fiszero
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8658
	lw	r2, 0(r29)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8660
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 24(r29)
	fdiv	f1, f1, f2
	j	beq_cont.8661
beq_else.8660:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 24(r29)
	fdiv	f1, f1, f2
beq_cont.8661:
	j	beq_cont.8659
beq_else.8658:
	lw	r2, 0(r29)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8662
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 24(r29)
	fdiv	f1, f1, f2
	j	beq_cont.8663
beq_else.8662:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 24(r29)
	fdiv	f1, f1, f2
beq_cont.8663:
beq_cont.8659:
	lw	r2, 4(r29)
	flw	f2, 0(r2)
	fmul	f2, f2, f1
	fsw	f2, 0(r2)
	flw	f2, 8(r2)
	fmul	f2, f2, f1
	fsw	f2, 8(r2)
	flw	f2, 16(r2)
	fmul	f1, f2, f1
	fsw	f1, 16(r2)
	jr	r31
veciprod.2493:
	flw	f1, 0(r2)
	flw	f2, 0(r3)
	fmul	f1, f1, f2
	flw	f2, 8(r2)
	flw	f3, 8(r3)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	flw	f2, 16(r2)
	flw	f3, 16(r3)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	jr	r31
veciprod2.2496:
	flw	f4, 0(r2)
	fmul	f1, f4, f1
	flw	f4, 8(r2)
	fmul	f2, f4, f2
	fadd	f1, f1, f2
	flw	f2, 16(r2)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	jr	r31
vecaccum.2501:
	flw	f2, 0(r2)
	flw	f3, 0(r3)
	fmul	f3, f1, f3
	fadd	f2, f2, f3
	fsw	f2, 0(r2)
	flw	f2, 8(r2)
	flw	f3, 8(r3)
	fmul	f3, f1, f3
	fadd	f2, f2, f3
	fsw	f2, 8(r2)
	flw	f2, 16(r2)
	flw	f3, 16(r3)
	fmul	f1, f1, f3
	fadd	f1, f2, f1
	fsw	f1, 16(r2)
	jr	r31
vecadd.2505:
	flw	f1, 0(r2)
	flw	f2, 0(r3)
	fadd	f1, f1, f2
	fsw	f1, 0(r2)
	flw	f1, 8(r2)
	flw	f2, 8(r3)
	fadd	f1, f1, f2
	fsw	f1, 8(r2)
	flw	f1, 16(r2)
	flw	f2, 16(r3)
	fadd	f1, f1, f2
	fsw	f1, 16(r2)
	jr	r31
vecscale.2511:
	flw	f2, 0(r2)
	fmul	f2, f2, f1
	fsw	f2, 0(r2)
	flw	f2, 8(r2)
	fmul	f2, f2, f1
	fsw	f2, 8(r2)
	flw	f2, 16(r2)
	fmul	f1, f2, f1
	fsw	f1, 16(r2)
	jr	r31
vecaccumv.2514:
	flw	f1, 0(r2)
	flw	f2, 0(r3)
	flw	f3, 0(r4)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	fsw	f1, 0(r2)
	flw	f1, 8(r2)
	flw	f2, 8(r3)
	flw	f3, 8(r4)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	fsw	f1, 8(r2)
	flw	f1, 16(r2)
	flw	f2, 16(r3)
	flw	f3, 16(r4)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	fsw	f1, 16(r2)
	jr	r31
o_texturetype.2518:
	lw	r2, 0(r2)
	jr	r31
o_form.2520:
	lw	r2, 4(r2)
	jr	r31
o_reflectiontype.2522:
	lw	r2, 8(r2)
	jr	r31
o_isinvert.2524:
	lw	r2, 24(r2)
	jr	r31
o_isrot.2526:
	lw	r2, 12(r2)
	jr	r31
o_param_a.2528:
	lw	r2, 16(r2)
	flw	f1, 0(r2)
	jr	r31
o_param_b.2530:
	lw	r2, 16(r2)
	flw	f1, 8(r2)
	jr	r31
o_param_c.2532:
	lw	r2, 16(r2)
	flw	f1, 16(r2)
	jr	r31
o_param_abc.2534:
	lw	r2, 16(r2)
	jr	r31
o_param_x.2536:
	lw	r2, 20(r2)
	flw	f1, 0(r2)
	jr	r31
o_param_y.2538:
	lw	r2, 20(r2)
	flw	f1, 8(r2)
	jr	r31
o_param_z.2540:
	lw	r2, 20(r2)
	flw	f1, 16(r2)
	jr	r31
o_diffuse.2542:
	lw	r2, 28(r2)
	flw	f1, 0(r2)
	jr	r31
o_hilight.2544:
	lw	r2, 28(r2)
	flw	f1, 8(r2)
	jr	r31
o_color_red.2546:
	lw	r2, 32(r2)
	flw	f1, 0(r2)
	jr	r31
o_color_green.2548:
	lw	r2, 32(r2)
	flw	f1, 8(r2)
	jr	r31
o_color_blue.2550:
	lw	r2, 32(r2)
	flw	f1, 16(r2)
	jr	r31
o_param_r1.2552:
	lw	r2, 36(r2)
	flw	f1, 0(r2)
	jr	r31
o_param_r2.2554:
	lw	r2, 36(r2)
	flw	f1, 8(r2)
	jr	r31
o_param_r3.2556:
	lw	r2, 36(r2)
	flw	f1, 16(r2)
	jr	r31
o_param_ctbl.2558:
	lw	r2, 40(r2)
	jr	r31
p_rgb.2560:
	lw	r2, 0(r2)
	jr	r31
p_intersection_points.2562:
	lw	r2, 4(r2)
	jr	r31
p_surface_ids.2564:
	lw	r2, 8(r2)
	jr	r31
p_calc_diffuse.2566:
	lw	r2, 12(r2)
	jr	r31
p_energy.2568:
	lw	r2, 16(r2)
	jr	r31
p_received_ray_20percent.2570:
	lw	r2, 20(r2)
	jr	r31
p_group_id.2572:
	lw	r2, 24(r2)
	lw	r2, 0(r2)
	jr	r31
p_set_group_id.2574:
	lw	r2, 24(r2)
	sw	r3, 0(r2)
	jr	r31
p_nvectors.2577:
	lw	r2, 28(r2)
	jr	r31
d_vec.2579:
	lw	r2, 0(r2)
	jr	r31
d_const.2581:
	lw	r2, 4(r2)
	jr	r31
r_surface_id.2583:
	lw	r2, 0(r2)
	jr	r31
r_dvec.2585:
	lw	r2, 4(r2)
	jr	r31
r_bright.2587:
	flw	f1, 8(r2)
	jr	r31
rad.2589:
	lui	r27, ha16(l.6078)
	ori	r27, r27, lo16(l.6078)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	jr	r31
read_screen_settings.2591:
	lw	r2, 20(r28)
	lw	r3, 16(r28)
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	sw	r2, 0(r29)
	sw	r4, 4(r29)
	sw	r5, 8(r29)
	sw	r3, 12(r29)
	sw	r6, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_float
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 0(r2)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_float
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 8(r2)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_float
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 16(r2)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_float
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	rad.2589
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_cos
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_sin
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	fsw	f1, 40(r29)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_read_float
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	rad.2589
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	fsw	f1, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_cos
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_sin
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fmul	f3, f2, f1
	lui	r27, ha16(l.6082)
	ori	r27, r27, lo16(l.6082)
	flw	f4, 0(r27)
	fmul	f3, f3, f4
	lw	r2, 12(r29)
	fsw	f3, 0(r2)
	lui	r27, ha16(l.6084)
	ori	r27, r27, lo16(l.6084)
	flw	f3, 0(r27)
	flw	f4, 40(r29)
	fmul	f3, f4, f3
	fsw	f3, 8(r2)
	flw	f3, 56(r29)
	fmul	f5, f2, f3
	lui	r27, ha16(l.6082)
	ori	r27, r27, lo16(l.6082)
	flw	f6, 0(r27)
	fmul	f5, f5, f6
	fsw	f5, 16(r2)
	lw	r3, 8(r29)
	fsw	f3, 0(r3)
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f5, 0(r27)
	fsw	f5, 8(r3)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fneg
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 16(r2)
	flw	f1, 40(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fneg
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fmul	f1, f1, f2
	lw	r2, 4(r29)
	fsw	f1, 0(r2)
	flw	f1, 32(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fneg
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 8(r2)
	flw	f1, 40(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fneg
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fmul	f1, f1, f2
	lw	r2, 4(r29)
	fsw	f1, 16(r2)
	lw	r2, 16(r29)
	flw	f1, 0(r2)
	lw	r3, 12(r29)
	flw	f2, 0(r3)
	fsub	f1, f1, f2
	lw	r4, 0(r29)
	fsw	f1, 0(r4)
	flw	f1, 8(r2)
	flw	f2, 8(r3)
	fsub	f1, f1, f2
	fsw	f1, 8(r4)
	flw	f1, 16(r2)
	flw	f2, 16(r3)
	fsub	f1, f1, f2
	fsw	f1, 16(r4)
	jr	r31
read_light.2593:
	lw	r2, 8(r28)
	lw	r3, 4(r28)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_read_int
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_read_float
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	rad.2589
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	fsw	f1, 8(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_sin
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fneg
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 8(r2)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_float
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	rad.2589
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	flw	f2, 8(r29)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_cos
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f2, 16(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_sin
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	fsw	f1, 0(r2)
	flw	f1, 16(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_cos
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	fsw	f1, 16(r2)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_read_float
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	jr	r31
rotate_quadratic_matrix.2595:
	flw	f1, 0(r3)
	sw	r2, 0(r29)
	sw	r3, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_cos
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 0(r2)
	fsw	f1, 8(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_sin
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 8(r2)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_cos
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 8(r2)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_sin
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 16(r2)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_cos
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 16(r2)
	fsw	f1, 40(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_sin
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	flw	f3, 24(r29)
	fmul	f4, f3, f2
	flw	f5, 32(r29)
	flw	f6, 16(r29)
	fmul	f7, f6, f5
	fmul	f7, f7, f2
	flw	f8, 8(r29)
	fmul	f9, f8, f1
	fsub	f7, f7, f9
	fmul	f9, f8, f5
	fmul	f9, f9, f2
	fmul	f10, f6, f1
	fadd	f9, f9, f10
	fmul	f10, f3, f1
	fmul	f11, f6, f5
	fmul	f11, f11, f1
	fmul	f12, f8, f2
	fadd	f11, f11, f12
	fmul	f12, f8, f5
	fmul	f1, f12, f1
	fmul	f2, f6, f2
	fsub	f1, f1, f2
	fsw	f1, 48(r29)
	fsw	f9, 56(r29)
	fsw	f11, 64(r29)
	fsw	f7, 72(r29)
	fsw	f10, 80(r29)
	fsw	f4, 88(r29)
	add	r27, r31, r0
	fmov	f1, f5
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_fneg
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	flw	f3, 16(r29)
	fmul	f3, f3, f2
	flw	f4, 8(r29)
	fmul	f2, f4, f2
	lw	r2, 0(r29)
	flw	f4, 0(r2)
	flw	f5, 8(r2)
	flw	f6, 16(r2)
	flw	f7, 88(r29)
	fsw	f2, 96(r29)
	fsw	f3, 104(r29)
	fsw	f6, 112(r29)
	fsw	f1, 120(r29)
	fsw	f5, 128(r29)
	fsw	f4, 136(r29)
	add	r27, r31, r0
	fmov	f1, f7
	sw	r27, 148(r29)
	addi	r29, r29, 152
	jal	min_caml_fsqr
	addi	r29, r29, -152
	lw	r27, 148(r29)
	add	r31, r27, r0
	flw	f2, 136(r29)
	fmul	f1, f2, f1
	flw	f3, 80(r29)
	fsw	f1, 144(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 156(r29)
	addi	r29, r29, 160
	jal	min_caml_fsqr
	addi	r29, r29, -160
	lw	r27, 156(r29)
	add	r31, r27, r0
	flw	f2, 128(r29)
	fmul	f1, f2, f1
	flw	f3, 144(r29)
	fadd	f1, f3, f1
	flw	f3, 120(r29)
	fsw	f1, 152(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	min_caml_fsqr
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	flw	f2, 112(r29)
	fmul	f1, f2, f1
	flw	f3, 152(r29)
	fadd	f1, f3, f1
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	min_caml_fsqr
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	flw	f2, 136(r29)
	fmul	f1, f2, f1
	flw	f3, 64(r29)
	fsw	f1, 160(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_fsqr
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	flw	f2, 128(r29)
	fmul	f1, f2, f1
	flw	f3, 160(r29)
	fadd	f1, f3, f1
	flw	f3, 104(r29)
	fsw	f1, 168(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	min_caml_fsqr
	addi	r29, r29, -184
	lw	r27, 180(r29)
	add	r31, r27, r0
	flw	f2, 112(r29)
	fmul	f1, f2, f1
	flw	f3, 168(r29)
	fadd	f1, f3, f1
	lw	r2, 0(r29)
	fsw	f1, 8(r2)
	flw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	min_caml_fsqr
	addi	r29, r29, -184
	lw	r27, 180(r29)
	add	r31, r27, r0
	flw	f2, 136(r29)
	fmul	f1, f2, f1
	flw	f3, 48(r29)
	fsw	f1, 176(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 188(r29)
	addi	r29, r29, 192
	jal	min_caml_fsqr
	addi	r29, r29, -192
	lw	r27, 188(r29)
	add	r31, r27, r0
	flw	f2, 128(r29)
	fmul	f1, f2, f1
	flw	f3, 176(r29)
	fadd	f1, f3, f1
	flw	f3, 96(r29)
	fsw	f1, 184(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	min_caml_fsqr
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	flw	f2, 112(r29)
	fmul	f1, f2, f1
	flw	f3, 184(r29)
	fadd	f1, f3, f1
	lw	r2, 0(r29)
	fsw	f1, 16(r2)
	lui	r27, ha16(l.6118)
	ori	r27, r27, lo16(l.6118)
	flw	f1, 0(r27)
	flw	f3, 72(r29)
	flw	f4, 136(r29)
	fmul	f5, f4, f3
	flw	f6, 56(r29)
	fmul	f5, f5, f6
	flw	f7, 64(r29)
	flw	f8, 128(r29)
	fmul	f9, f8, f7
	flw	f10, 48(r29)
	fmul	f9, f9, f10
	fadd	f5, f5, f9
	flw	f9, 104(r29)
	fmul	f11, f2, f9
	flw	f12, 96(r29)
	fmul	f11, f11, f12
	fadd	f5, f5, f11
	fmul	f1, f1, f5
	lw	r2, 4(r29)
	fsw	f1, 0(r2)
	lui	r27, ha16(l.6118)
	ori	r27, r27, lo16(l.6118)
	flw	f1, 0(r27)
	flw	f5, 88(r29)
	fmul	f11, f4, f5
	fmul	f6, f11, f6
	flw	f11, 80(r29)
	fmul	f13, f8, f11
	fmul	f10, f13, f10
	fadd	f6, f6, f10
	flw	f10, 120(r29)
	fmul	f13, f2, f10
	fmul	f12, f13, f12
	fadd	f6, f6, f12
	fmul	f1, f1, f6
	fsw	f1, 8(r2)
	lui	r27, ha16(l.6118)
	ori	r27, r27, lo16(l.6118)
	flw	f1, 0(r27)
	fmul	f4, f4, f5
	fmul	f3, f4, f3
	fmul	f4, f8, f11
	fmul	f4, f4, f7
	fadd	f3, f3, f4
	fmul	f2, f2, f10
	fmul	f2, f2, f9
	fadd	f2, f3, f2
	fmul	f1, f1, f2
	fsw	f1, 16(r2)
	jr	r31
read_nth_object.2598:
	lw	r3, 4(r28)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_read_int
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, -1
	bne	r2, r27, beq_else.8674
	addi	r2, r2, 0
	jr	r31
beq_else.8674:
	sw	r2, 8(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_read_int
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	sw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_int
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	sw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_read_int
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_create_float_array
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	sw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_read_float
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	fsw	f1, 0(r2)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_read_float
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	fsw	f1, 8(r2)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_read_float
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	fsw	f1, 16(r2)
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_create_float_array
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	sw	r2, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_read_float
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 28(r29)
	fsw	f1, 0(r2)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_read_float
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 28(r29)
	fsw	f1, 8(r2)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_read_float
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 28(r29)
	fsw	f1, 16(r2)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_read_float
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fisneg
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r3, r3, 2
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_create_float_array
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	sw	r2, 36(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_read_float
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 36(r29)
	fsw	f1, 0(r2)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_read_float
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 36(r29)
	fsw	f1, 8(r2)
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_create_float_array
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	sw	r2, 40(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_read_float
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 40(r29)
	fsw	f1, 0(r2)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_read_float
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 40(r29)
	fsw	f1, 8(r2)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_read_float
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 40(r29)
	fsw	f1, 16(r2)
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_create_float_array
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	addi	r27, r0, 0
	bne	r3, r27, beq_else.8675
	j	beq_cont.8676
beq_else.8675:
beq_cont.8676:
	lw	r3, 12(r29)
	addi	r27, r0, 2
	bne	r3, r27, beq_else.8677
	addi	r4, r4, 1
	j	beq_cont.8678
beq_else.8677:
	addi	r4, r4, 1
beq_cont.8678:
	addi	r5, r5, 4
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r4, 44(r29)
	sw	r2, 48(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_create_float_array
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	add	r3, r30, r0
	addi	r30, r30, 48
	sw	r2, 40(r3)
	lw	r2, 48(r29)
	sw	r2, 36(r3)
	lw	r4, 40(r29)
	sw	r4, 32(r3)
	lw	r4, 36(r29)
	sw	r4, 28(r3)
	lw	r4, 44(r29)
	sw	r4, 24(r3)
	lw	r4, 28(r29)
	sw	r4, 20(r3)
	lw	r4, 24(r29)
	sw	r4, 16(r3)
	lw	r5, 20(r29)
	sw	r5, 12(r3)
	lw	r6, 16(r29)
	sw	r6, 8(r3)
	lw	r6, 12(r29)
	sw	r6, 4(r3)
	lw	r7, 8(r29)
	sw	r7, 0(r3)
	lw	r7, 4(r29)
	slti	r7, r7, 2
	lw	r8, 0(r29)
	sw	r3, r8, 0(r7)
	addi	r27, r0, 3
	bne	r6, r27, beq_else.8679
	flw	f1, 0(r4)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fiszero
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8682
	flw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	sgn.2464
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fsqr
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fdiv	f1, f2, f1
	j	beq_cont.8683
beq_else.8682:
	flw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	sgn.2464
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fsqr
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fdiv	f1, f2, f1
beq_cont.8683:
	lw	r2, 24(r29)
	fsw	f1, 0(r2)
	flw	f1, 8(r2)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fiszero
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8684
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	sgn.2464
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fsqr
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fdiv	f1, f2, f1
	j	beq_cont.8685
beq_else.8684:
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	sgn.2464
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fsqr
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fdiv	f1, f2, f1
beq_cont.8685:
	lw	r2, 24(r29)
	fsw	f1, 8(r2)
	flw	f1, 16(r2)
	fsw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_fiszero
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8686
	flw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	sgn.2464
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	flw	f2, 88(r29)
	fsw	f1, 96(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fdiv	f1, f2, f1
	j	beq_cont.8687
beq_else.8686:
	flw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 88(r29)
	fsw	f1, 96(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fdiv	f1, f2, f1
beq_cont.8687:
	lw	r2, 24(r29)
	fsw	f1, 16(r2)
	j	beq_cont.8680
beq_else.8679:
	flw	f1, 0(r4)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fiszero
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8688
	flw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fdiv	f1, f2, f1
	j	beq_cont.8689
beq_else.8688:
	flw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fdiv	f1, f2, f1
beq_cont.8689:
	lw	r2, 24(r29)
	fsw	f1, 0(r2)
	flw	f1, 8(r2)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fiszero
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8690
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fdiv	f1, f2, f1
	j	beq_cont.8691
beq_else.8690:
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fdiv	f1, f2, f1
beq_cont.8691:
	lw	r2, 24(r29)
	fsw	f1, 8(r2)
	flw	f1, 16(r2)
	fsw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fiszero
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8692
	flw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 88(r29)
	fsw	f1, 96(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fdiv	f1, f2, f1
	j	beq_cont.8693
beq_else.8692:
	flw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	sgn.2464
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 88(r29)
	fsw	f1, 96(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fdiv	f1, f2, f1
beq_cont.8693:
	lw	r2, 24(r29)
	fsw	f1, 16(r2)
beq_cont.8680:
	lw	r2, 20(r29)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8694
	j	beq_cont.8695
beq_else.8694:
beq_cont.8695:
	addi	r2, r2, 1
	jr	r31
read_object.2600:
	lw	r3, 8(r28)
	lw	r4, 4(r28)
	addi	r27, r0, 60
	sub	r27, r27, r2
	bgtz	r27, bge_else.8696
	jr	r31
bge_else.8696:
	sw	r28, 0(r29)
	sw	r4, 4(r29)
	sw	r2, 8(r29)
	add	r27, r31, r0
	add	r28, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8698
	lw	r2, 4(r29)
	lw	r3, 8(r29)
	sw	r3, 0(r2)
	jr	r31
beq_else.8698:
	lw	r2, 8(r29)
	addi	r2, r2, 1
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
read_all_object.2602:
	lw	r28, 4(r28)
	addi	r2, r2, 0
	lw	r1, 0(r28)
	jr	r1
read_net_item.2604:
	sw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_read_int
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r27, r0, -1
	bne	r2, r27, beq_else.8700
	lw	r2, 0(r29)
	addi	r2, r2, 1
	addi	r3, r3, -1
	j	min_caml_create_array
beq_else.8700:
	lw	r3, 0(r29)
	addi	r4, r3, 1
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	read_net_item.2604
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	slti	r3, r3, 2
	lw	r4, 4(r29)
	sw	r4, r2, 0(r3)
	jr	r31
read_or_network.2606:
	addi	r3, r3, 0
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	read_net_item.2604
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r3)
	addi	r27, r0, -1
	bne	r2, r27, beq_else.8701
	lw	r2, 0(r29)
	addi	r2, r2, 1
	j	min_caml_create_array
beq_else.8701:
	lw	r2, 0(r29)
	addi	r4, r2, 1
	sw	r3, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	read_or_network.2606
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	slti	r3, r3, 2
	lw	r4, 4(r29)
	sw	r4, r2, 0(r3)
	jr	r31
read_and_network.2608:
	lw	r3, 4(r28)
	addi	r4, r4, 0
	sw	r28, 0(r29)
	sw	r3, 4(r29)
	sw	r2, 8(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	read_net_item.2604
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 0(r2)
	addi	r27, r0, -1
	bne	r3, r27, beq_else.8702
	jr	r31
beq_else.8702:
	lw	r3, 8(r29)
	slti	r4, r3, 2
	lw	r5, 4(r29)
	sw	r2, r5, 0(r4)
	addi	r2, r3, 1
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
read_parameter.2610:
	lw	r2, 20(r28)
	lw	r3, 16(r28)
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	sw	r6, 0(r29)
	sw	r4, 4(r29)
	sw	r5, 8(r29)
	sw	r3, 12(r29)
	add	r27, r31, r0
	add	r28, r2, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r28, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r28, 8(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 0
	lw	r28, 4(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 0
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	read_or_network.2606
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 0(r3)
	jr	r31
solver_rect_surface.2612:
	lw	r7, 4(r28)
	slti	r8, r4, 3
	flw	f4, r3, 0(r8)
	sw	r7, 0(r29)
	fsw	f3, 8(r29)
	sw	r6, 16(r29)
	fsw	f2, 24(r29)
	sw	r5, 32(r29)
	fsw	f1, 40(r29)
	sw	r3, 48(r29)
	sw	r4, 52(r29)
	sw	r2, 56(r29)
	add	r27, r31, r0
	fmov	f1, f4
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_fiszero
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8708
	lw	r2, 56(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_param_abc.2534
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r3, 56(r29)
	sw	r2, 60(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_isinvert.2524
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r3, 52(r29)
	slti	r4, r3, 3
	lw	r5, 48(r29)
	flw	f1, r5, 0(r4)
	sw	r2, 64(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fisneg
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 64(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	xor.2461
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r3, 52(r29)
	slti	r4, r3, 3
	lw	r5, 60(r29)
	flw	f1, r5, 0(r4)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	fneg_cond.2466
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fsub	f1, f1, f2
	lw	r2, 52(r29)
	slti	r2, r2, 3
	lw	r3, 48(r29)
	flw	f2, r3, 0(r2)
	fdiv	f1, f1, f2
	lw	r2, 32(r29)
	slti	r4, r2, 3
	flw	f2, r3, 0(r4)
	fmul	f2, f1, f2
	flw	f3, 24(r29)
	fadd	f2, f2, f3
	fsw	f1, 72(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fabs
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	lw	r2, 32(r29)
	slti	r2, r2, 3
	lw	r3, 60(r29)
	flw	f2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fless
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8710
	addi	r2, r2, 0
	jr	r31
beq_else.8710:
	lw	r2, 16(r29)
	slti	r3, r2, 3
	lw	r4, 48(r29)
	flw	f1, r4, 0(r3)
	flw	f2, 72(r29)
	fmul	f1, f2, f1
	flw	f3, 8(r29)
	fadd	f1, f1, f3
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fabs
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	slti	r2, r2, 3
	lw	r3, 60(r29)
	flw	f2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fless
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8711
	addi	r2, r2, 0
	jr	r31
beq_else.8711:
	lw	r2, 0(r29)
	flw	f1, 72(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 1
	jr	r31
beq_else.8708:
	addi	r2, r2, 0
	jr	r31
solver_rect.2621:
	lw	r28, 4(r28)
	addi	r4, r4, 0
	addi	r5, r5, 1
	addi	r6, r6, 2
	fsw	f1, 0(r29)
	fsw	f3, 8(r29)
	fsw	f2, 16(r29)
	sw	r3, 24(r29)
	sw	r2, 28(r29)
	sw	r28, 32(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r6, r6, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8712
	addi	r4, r4, 1
	addi	r5, r5, 2
	flw	f1, 16(r29)
	flw	f2, 8(r29)
	flw	f3, 0(r29)
	lw	r2, 28(r29)
	lw	r3, 24(r29)
	lw	r28, 32(r29)
	sw	r6, 36(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8713
	addi	r4, r4, 2
	addi	r6, r6, 1
	flw	f1, 8(r29)
	flw	f2, 0(r29)
	flw	f3, 16(r29)
	lw	r2, 28(r29)
	lw	r3, 24(r29)
	lw	r5, 36(r29)
	lw	r28, 32(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8714
	addi	r2, r2, 0
	jr	r31
beq_else.8714:
	addi	r2, r2, 3
	jr	r31
beq_else.8713:
	addi	r2, r2, 2
	jr	r31
beq_else.8712:
	addi	r2, r2, 1
	jr	r31
solver_surface.2627:
	lw	r4, 4(r28)
	sw	r4, 0(r29)
	fsw	f3, 8(r29)
	fsw	f2, 16(r29)
	fsw	f1, 24(r29)
	sw	r3, 32(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_abc.2534
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 32(r29)
	sw	r3, 36(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	veciprod.2493
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	fsw	f1, 40(r29)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fispos
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8716
	addi	r2, r2, 0
	jr	r31
beq_else.8716:
	flw	f1, 24(r29)
	flw	f2, 16(r29)
	flw	f3, 8(r29)
	lw	r2, 36(r29)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	veciprod2.2496
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fneg
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fdiv	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 1
	jr	r31
quadratic.2633:
	fsw	f1, 0(r29)
	fsw	f3, 8(r29)
	fsw	f2, 16(r29)
	sw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_fsqr
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_a.2528
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fmul	f1, f2, f1
	flw	f2, 16(r29)
	fsw	f1, 40(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fsqr
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	fsw	f1, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_param_b.2530
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fmul	f1, f2, f1
	flw	f2, 40(r29)
	fadd	f1, f2, f1
	flw	f2, 8(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fsqr
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_param_c.2532
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fmul	f1, f2, f1
	flw	f2, 56(r29)
	fadd	f1, f2, f1
	lw	r2, 24(r29)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_isrot.2526
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8718
	flw	f1, 72(r29)
	jr	r31
beq_else.8718:
	flw	f1, 8(r29)
	flw	f2, 16(r29)
	fmul	f3, f2, f1
	lw	r2, 24(r29)
	fsw	f3, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	o_param_r1.2552
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fmul	f1, f2, f1
	flw	f2, 72(r29)
	fadd	f1, f2, f1
	flw	f2, 0(r29)
	flw	f3, 8(r29)
	fmul	f3, f3, f2
	lw	r2, 24(r29)
	fsw	f1, 88(r29)
	fsw	f3, 96(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	o_param_r2.2554
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fmul	f1, f2, f1
	flw	f2, 88(r29)
	fadd	f1, f2, f1
	flw	f2, 16(r29)
	flw	f3, 0(r29)
	fmul	f2, f3, f2
	lw	r2, 24(r29)
	fsw	f1, 104(r29)
	fsw	f2, 112(r29)
	add	r27, r31, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	o_param_r3.2556
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	flw	f2, 112(r29)
	fmul	f1, f2, f1
	flw	f2, 104(r29)
	fadd	f1, f2, f1
	jr	r31
bilinear.2638:
	fmul	f7, f1, f4
	fsw	f4, 0(r29)
	fsw	f1, 8(r29)
	fsw	f6, 16(r29)
	fsw	f3, 24(r29)
	sw	r2, 32(r29)
	fsw	f5, 40(r29)
	fsw	f2, 48(r29)
	fsw	f7, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_param_a.2528
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fmul	f1, f2, f1
	flw	f2, 40(r29)
	flw	f3, 48(r29)
	fmul	f4, f3, f2
	lw	r2, 32(r29)
	fsw	f1, 64(r29)
	fsw	f4, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_param_b.2530
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fmul	f1, f2, f1
	flw	f2, 64(r29)
	fadd	f1, f2, f1
	flw	f2, 16(r29)
	flw	f3, 24(r29)
	fmul	f4, f3, f2
	lw	r2, 32(r29)
	fsw	f1, 80(r29)
	fsw	f4, 88(r29)
	add	r27, r31, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	o_param_c.2532
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	flw	f2, 88(r29)
	fmul	f1, f2, f1
	flw	f2, 80(r29)
	fadd	f1, f2, f1
	lw	r2, 32(r29)
	fsw	f1, 96(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	o_isrot.2526
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8720
	flw	f1, 96(r29)
	jr	r31
beq_else.8720:
	flw	f1, 40(r29)
	flw	f2, 24(r29)
	fmul	f3, f2, f1
	flw	f4, 16(r29)
	flw	f5, 48(r29)
	fmul	f6, f5, f4
	fadd	f3, f3, f6
	lw	r2, 32(r29)
	fsw	f3, 104(r29)
	add	r27, r31, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	o_param_r1.2552
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r31, r27, r0
	flw	f2, 104(r29)
	fmul	f1, f2, f1
	flw	f2, 16(r29)
	flw	f3, 8(r29)
	fmul	f2, f3, f2
	flw	f4, 0(r29)
	flw	f5, 24(r29)
	fmul	f5, f5, f4
	fadd	f2, f2, f5
	lw	r2, 32(r29)
	fsw	f1, 112(r29)
	fsw	f2, 120(r29)
	add	r27, r31, r0
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	o_param_r2.2554
	addi	r29, r29, -136
	lw	r27, 132(r29)
	add	r31, r27, r0
	flw	f2, 120(r29)
	fmul	f1, f2, f1
	flw	f2, 112(r29)
	fadd	f1, f2, f1
	flw	f2, 40(r29)
	flw	f3, 8(r29)
	fmul	f2, f3, f2
	flw	f3, 0(r29)
	flw	f4, 48(r29)
	fmul	f3, f4, f3
	fadd	f2, f2, f3
	lw	r2, 32(r29)
	fsw	f1, 128(r29)
	fsw	f2, 136(r29)
	add	r27, r31, r0
	sw	r27, 148(r29)
	addi	r29, r29, 152
	jal	o_param_r3.2556
	addi	r29, r29, -152
	lw	r27, 148(r29)
	add	r31, r27, r0
	flw	f2, 136(r29)
	fmul	f1, f2, f1
	flw	f2, 128(r29)
	fadd	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 148(r29)
	addi	r29, r29, 152
	jal	min_caml_fhalf
	addi	r29, r29, -152
	lw	r27, 148(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fadd	f1, f2, f1
	jr	r31
solver_second.2646:
	lw	r4, 4(r28)
	flw	f4, 0(r3)
	flw	f5, 8(r3)
	flw	f6, 16(r3)
	sw	r4, 0(r29)
	fsw	f3, 8(r29)
	fsw	f2, 16(r29)
	fsw	f1, 24(r29)
	sw	r2, 32(r29)
	sw	r3, 36(r29)
	add	r27, r31, r0
	fmov	f3, f6
	fmov	f2, f5
	fmov	f1, f4
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	quadratic.2633
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	fsw	f1, 40(r29)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fiszero
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8722
	lw	r2, 36(r29)
	flw	f1, 0(r2)
	flw	f2, 8(r2)
	flw	f3, 16(r2)
	flw	f4, 24(r29)
	flw	f5, 16(r29)
	flw	f6, 8(r29)
	lw	r2, 32(r29)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	bilinear.2638
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	flw	f3, 16(r29)
	flw	f4, 8(r29)
	lw	r2, 32(r29)
	fsw	f1, 48(r29)
	add	r27, r31, r0
	fmov	f1, f2
	fmov	f2, f3
	fmov	f3, f4
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	quadratic.2633
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r2, 32(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_form.2520
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r27, r0, 3
	bne	r2, r27, beq_else.8723
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	j	beq_cont.8724
beq_else.8723:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 56(r29)
	fsub	f1, f2, f1
beq_cont.8724:
	flw	f2, 48(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fsqr
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	flw	f3, 40(r29)
	fmul	f2, f3, f2
	fsub	f1, f1, f2
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fispos
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8725
	addi	r2, r2, 0
	jr	r31
beq_else.8725:
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_sqrt
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	lw	r2, 32(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	o_isinvert.2524
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8726
	flw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fneg
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	j	beq_cont.8727
beq_else.8726:
	flw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fneg
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
beq_cont.8727:
	flw	f2, 48(r29)
	fsub	f1, f1, f2
	flw	f2, 40(r29)
	fdiv	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 1
	jr	r31
beq_else.8722:
	addi	r2, r2, 0
	jr	r31
solver.2652:
	lw	r5, 16(r28)
	lw	r6, 12(r28)
	lw	r7, 8(r28)
	lw	r8, 4(r28)
	slti	r2, r2, 2
	lw	r2, r8, 0(r2)
	flw	f1, 0(r4)
	sw	r6, 0(r29)
	sw	r5, 4(r29)
	sw	r3, 8(r29)
	sw	r7, 12(r29)
	sw	r2, 16(r29)
	sw	r4, 20(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_x.2536
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsub	f1, f2, f1
	lw	r2, 20(r29)
	flw	f2, 8(r2)
	lw	r3, 16(r29)
	fsw	f1, 32(r29)
	fsw	f2, 40(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_y.2538
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fsub	f1, f2, f1
	lw	r2, 20(r29)
	flw	f2, 16(r2)
	lw	r2, 16(r29)
	fsw	f1, 48(r29)
	fsw	f2, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_param_z.2540
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_form.2520
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8728
	flw	f1, 32(r29)
	flw	f2, 48(r29)
	flw	f3, 64(r29)
	lw	r2, 16(r29)
	lw	r3, 8(r29)
	lw	r28, 12(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8728:
	addi	r27, r0, 2
	bne	r2, r27, beq_else.8729
	flw	f1, 32(r29)
	flw	f2, 48(r29)
	flw	f3, 64(r29)
	lw	r2, 16(r29)
	lw	r3, 8(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8729:
	flw	f1, 32(r29)
	flw	f2, 48(r29)
	flw	f3, 64(r29)
	lw	r2, 16(r29)
	lw	r3, 8(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
solver_rect_fast.2656:
	lw	r5, 4(r28)
	flw	f4, 0(r4)
	fsub	f4, f4, f1
	flw	f5, 8(r4)
	fmul	f4, f4, f5
	flw	f5, 8(r3)
	fmul	f5, f4, f5
	fadd	f5, f5, f2
	sw	r5, 0(r29)
	fsw	f1, 8(r29)
	fsw	f2, 16(r29)
	sw	r4, 24(r29)
	fsw	f3, 32(r29)
	fsw	f4, 40(r29)
	sw	r3, 48(r29)
	sw	r2, 52(r29)
	add	r27, r31, r0
	fmov	f1, f5
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_fabs
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r2, 52(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_param_b.2530
	addi	r29, r29, -72
	lw	r27, 68(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fless
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8732
	addi	r2, r2, 0
	j	beq_cont.8733
beq_else.8732:
	addi	r2, r2, 0
beq_cont.8733:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8734
	lw	r2, 24(r29)
	flw	f1, 16(r2)
	flw	f2, 16(r29)
	fsub	f1, f1, f2
	flw	f3, 24(r2)
	fmul	f1, f1, f3
	lw	r3, 48(r29)
	flw	f3, 0(r3)
	fmul	f3, f1, f3
	flw	f4, 8(r29)
	fadd	f3, f3, f4
	fsw	f1, 64(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fabs
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	lw	r2, 52(r29)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_param_a.2528
	addi	r29, r29, -88
	lw	r27, 84(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fless
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8735
	addi	r2, r2, 0
	j	beq_cont.8736
beq_else.8735:
	addi	r2, r2, 0
beq_cont.8736:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8737
	lw	r2, 24(r29)
	flw	f1, 32(r2)
	flw	f2, 32(r29)
	fsub	f1, f1, f2
	flw	f2, 40(r2)
	fmul	f1, f1, f2
	lw	r3, 48(r29)
	flw	f2, 0(r3)
	fmul	f2, f1, f2
	flw	f3, 8(r29)
	fadd	f2, f2, f3
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fabs
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	lw	r2, 52(r29)
	fsw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	o_param_a.2528
	addi	r29, r29, -104
	lw	r27, 100(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 88(r29)
	add	r27, r31, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_fless
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8738
	addi	r2, r2, 0
	j	beq_cont.8739
beq_else.8738:
	addi	r2, r2, 0
beq_cont.8739:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8740
	addi	r2, r2, 0
	jr	r31
beq_else.8740:
	lw	r2, 0(r29)
	flw	f1, 80(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 3
	jr	r31
beq_else.8737:
	lw	r2, 0(r29)
	flw	f1, 64(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 2
	jr	r31
beq_else.8734:
	lw	r2, 0(r29)
	flw	f1, 40(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 1
	jr	r31
solver_surface_fast.2663:
	lw	r2, 4(r28)
	flw	f4, 0(r3)
	sw	r2, 0(r29)
	fsw	f3, 8(r29)
	fsw	f2, 16(r29)
	fsw	f1, 24(r29)
	sw	r3, 32(r29)
	add	r27, r31, r0
	fmov	f1, f4
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fisneg
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8742
	addi	r2, r2, 0
	jr	r31
beq_else.8742:
	lw	r2, 32(r29)
	flw	f1, 8(r2)
	flw	f2, 24(r29)
	fmul	f1, f1, f2
	flw	f2, 16(r2)
	flw	f3, 16(r29)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	flw	f2, 24(r2)
	flw	f3, 8(r29)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 1
	jr	r31
solver_second_fast.2669:
	lw	r4, 4(r28)
	flw	f4, 0(r3)
	sw	r4, 0(r29)
	fsw	f4, 8(r29)
	sw	r2, 16(r29)
	fsw	f3, 24(r29)
	fsw	f2, 32(r29)
	fsw	f1, 40(r29)
	sw	r3, 48(r29)
	add	r27, r31, r0
	fmov	f1, f4
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fiszero
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8745
	lw	r2, 48(r29)
	flw	f1, 8(r2)
	flw	f2, 40(r29)
	fmul	f1, f1, f2
	flw	f3, 16(r2)
	flw	f4, 32(r29)
	fmul	f3, f3, f4
	fadd	f1, f1, f3
	flw	f3, 24(r2)
	flw	f5, 24(r29)
	fmul	f3, f3, f5
	fadd	f1, f1, f3
	lw	r3, 16(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	fmov	f3, f5
	fmov	f1, f2
	fmov	f2, f4
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	quadratic.2633
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_form.2520
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r27, r0, 3
	bne	r2, r27, beq_else.8747
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 64(r29)
	fsub	f1, f2, f1
	j	beq_cont.8748
beq_else.8747:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 64(r29)
	fsub	f1, f2, f1
beq_cont.8748:
	flw	f2, 56(r29)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fsqr
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	flw	f3, 8(r29)
	fmul	f2, f3, f2
	fsub	f1, f1, f2
	fsw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fispos
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8749
	addi	r2, r2, 0
	jr	r31
beq_else.8749:
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	o_isinvert.2524
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8750
	flw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_sqrt
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	lw	r2, 48(r29)
	flw	f2, 32(r2)
	fmul	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	j	beq_cont.8751
beq_else.8750:
	flw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_sqrt
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	lw	r2, 48(r29)
	flw	f2, 32(r2)
	fmul	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
beq_cont.8751:
	addi	r2, r2, 1
	jr	r31
beq_else.8745:
	addi	r2, r2, 0
	jr	r31
solver_fast.2675:
	lw	r5, 16(r28)
	lw	r6, 12(r28)
	lw	r7, 8(r28)
	lw	r8, 4(r28)
	slti	r9, r2, 2
	lw	r8, r8, 0(r9)
	flw	f1, 0(r4)
	sw	r6, 0(r29)
	sw	r5, 4(r29)
	sw	r7, 8(r29)
	sw	r2, 12(r29)
	sw	r3, 16(r29)
	sw	r8, 20(r29)
	sw	r4, 24(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	add	r2, r8, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_x.2536
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fsub	f1, f2, f1
	lw	r2, 24(r29)
	flw	f2, 8(r2)
	lw	r3, 20(r29)
	fsw	f1, 40(r29)
	fsw	f2, 48(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_param_y.2538
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fsub	f1, f2, f1
	lw	r2, 24(r29)
	flw	f2, 16(r2)
	lw	r2, 20(r29)
	fsw	f1, 56(r29)
	fsw	f2, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_param_z.2540
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	d_const.2581
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	slti	r3, r3, 2
	lw	r2, r2, 0(r3)
	lw	r3, 20(r29)
	sw	r2, 80(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_form.2520
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8753
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	d_vec.2579
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	flw	f1, 40(r29)
	flw	f2, 56(r29)
	flw	f3, 72(r29)
	lw	r2, 20(r29)
	lw	r4, 80(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8753:
	addi	r27, r0, 2
	bne	r2, r27, beq_else.8754
	flw	f1, 40(r29)
	flw	f2, 56(r29)
	flw	f3, 72(r29)
	lw	r2, 20(r29)
	lw	r3, 80(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8754:
	flw	f1, 40(r29)
	flw	f2, 56(r29)
	flw	f3, 72(r29)
	lw	r2, 20(r29)
	lw	r3, 80(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
solver_surface_fast2.2679:
	lw	r2, 4(r28)
	flw	f1, 0(r3)
	sw	r2, 0(r29)
	sw	r4, 4(r29)
	sw	r3, 8(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fisneg
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8755
	addi	r2, r2, 0
	jr	r31
beq_else.8755:
	lw	r2, 8(r29)
	flw	f1, 0(r2)
	lw	r2, 4(r29)
	flw	f2, 24(r2)
	fmul	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	addi	r2, r2, 1
	jr	r31
solver_second_fast2.2686:
	lw	r5, 4(r28)
	flw	f4, 0(r3)
	sw	r5, 0(r29)
	sw	r2, 4(r29)
	fsw	f4, 8(r29)
	sw	r4, 16(r29)
	fsw	f3, 24(r29)
	fsw	f2, 32(r29)
	fsw	f1, 40(r29)
	sw	r3, 48(r29)
	add	r27, r31, r0
	fmov	f1, f4
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fiszero
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8757
	lw	r2, 48(r29)
	flw	f1, 8(r2)
	flw	f2, 40(r29)
	fmul	f1, f1, f2
	flw	f2, 16(r2)
	flw	f3, 32(r29)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	flw	f2, 24(r2)
	flw	f3, 24(r29)
	fmul	f2, f2, f3
	fadd	f1, f1, f2
	lw	r3, 16(r29)
	flw	f2, 24(r3)
	fsw	f1, 56(r29)
	fsw	f2, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fsqr
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	flw	f3, 8(r29)
	fmul	f2, f3, f2
	fsub	f1, f1, f2
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fispos
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8759
	addi	r2, r2, 0
	jr	r31
beq_else.8759:
	lw	r2, 4(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_isinvert.2524
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8760
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_sqrt
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	lw	r2, 48(r29)
	flw	f2, 32(r2)
	fmul	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
	j	beq_cont.8761
beq_else.8760:
	flw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_sqrt
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	lw	r2, 48(r29)
	flw	f2, 32(r2)
	fmul	f1, f1, f2
	lw	r2, 0(r29)
	fsw	f1, 0(r2)
beq_cont.8761:
	addi	r2, r2, 1
	jr	r31
beq_else.8757:
	addi	r2, r2, 0
	jr	r31
solver_fast2.2693:
	lw	r4, 16(r28)
	lw	r5, 12(r28)
	lw	r6, 8(r28)
	lw	r7, 4(r28)
	slti	r8, r2, 2
	lw	r7, r7, 0(r8)
	sw	r5, 0(r29)
	sw	r4, 4(r29)
	sw	r6, 8(r29)
	sw	r7, 12(r29)
	sw	r2, 16(r29)
	sw	r3, 20(r29)
	add	r27, r31, r0
	add	r2, r7, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_param_ctbl.2558
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f1, 0(r2)
	flw	f2, 8(r2)
	flw	f3, 16(r2)
	lw	r3, 20(r29)
	sw	r2, 24(r29)
	fsw	f3, 32(r29)
	fsw	f2, 40(r29)
	fsw	f1, 48(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	d_const.2581
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	slti	r3, r3, 2
	lw	r2, r2, 0(r3)
	lw	r3, 12(r29)
	sw	r2, 56(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_form.2520
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8763
	lw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	d_vec.2579
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	flw	f1, 48(r29)
	flw	f2, 40(r29)
	flw	f3, 32(r29)
	lw	r2, 12(r29)
	lw	r4, 56(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8763:
	addi	r27, r0, 2
	bne	r2, r27, beq_else.8764
	flw	f1, 48(r29)
	flw	f2, 40(r29)
	flw	f3, 32(r29)
	lw	r2, 12(r29)
	lw	r3, 56(r29)
	lw	r4, 24(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8764:
	flw	f1, 48(r29)
	flw	f2, 40(r29)
	flw	f3, 32(r29)
	lw	r2, 12(r29)
	lw	r3, 56(r29)
	lw	r4, 24(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
setup_rect_table.2696:
	addi	r4, r4, 6
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_float_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 0(r3)
	sw	r2, 8(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fiszero
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8765
	lw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	o_isinvert.2524
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 0(r3)
	sw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fisneg
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	xor.2461
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_param_a.2528
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	fneg_cond.2466
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 0(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 4(r29)
	flw	f2, 0(r3)
	fdiv	f1, f1, f2
	fsw	f1, 8(r2)
	j	beq_cont.8766
beq_else.8765:
	lw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_isinvert.2524
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 0(r3)
	sw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fisneg
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	xor.2461
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_param_a.2528
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	fneg_cond.2466
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 0(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 4(r29)
	flw	f2, 0(r3)
	fdiv	f1, f1, f2
	fsw	f1, 8(r2)
beq_cont.8766:
	lw	r3, 4(r29)
	flw	f1, 8(r3)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fiszero
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8767
	lw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_isinvert.2524
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 8(r3)
	sw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_fisneg
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	xor.2461
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_param_b.2530
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	fneg_cond.2466
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 16(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 4(r29)
	flw	f2, 8(r3)
	fdiv	f1, f1, f2
	fsw	f1, 24(r2)
	j	beq_cont.8768
beq_else.8767:
	lw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_isinvert.2524
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 8(r3)
	sw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_fisneg
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	xor.2461
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_param_b.2530
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	fneg_cond.2466
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 16(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 4(r29)
	flw	f2, 8(r3)
	fdiv	f1, f1, f2
	fsw	f1, 24(r2)
beq_cont.8768:
	lw	r3, 4(r29)
	flw	f1, 16(r3)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_fiszero
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8769
	lw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_isinvert.2524
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 16(r3)
	sw	r2, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fisneg
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	xor.2461
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_c.2532
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 32(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	fneg_cond.2466
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 32(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 4(r29)
	flw	f2, 16(r3)
	fdiv	f1, f1, f2
	fsw	f1, 40(r2)
	j	beq_cont.8770
beq_else.8769:
	lw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_isinvert.2524
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 16(r3)
	sw	r2, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fisneg
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	xor.2461
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_c.2532
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 32(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	fneg_cond.2466
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	fsw	f1, 32(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 4(r29)
	flw	f2, 16(r3)
	fdiv	f1, f1, f2
	fsw	f1, 40(r2)
beq_cont.8770:
	jr	r31
setup_surface_table.2699:
	addi	r4, r4, 4
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_float_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 0(r3)
	lw	r4, 0(r29)
	sw	r2, 8(r29)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_param_a.2528
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f2, 16(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	flw	f2, 8(r2)
	lw	r3, 0(r29)
	fsw	f1, 24(r29)
	fsw	f2, 32(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_b.2530
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fmul	f1, f2, f1
	flw	f2, 24(r29)
	fadd	f1, f2, f1
	lw	r2, 4(r29)
	flw	f2, 16(r2)
	lw	r2, 0(r29)
	fsw	f1, 40(r29)
	fsw	f2, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_param_c.2532
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fmul	f1, f2, f1
	flw	f2, 40(r29)
	fadd	f1, f2, f1
	fsw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fispos
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8772
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	lw	r2, 8(r29)
	fsw	f1, 0(r2)
	j	beq_cont.8773
beq_else.8772:
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	lw	r2, 8(r29)
	fsw	f1, 0(r2)
beq_cont.8773:
	jr	r31
setup_second_table.2702:
	addi	r4, r4, 5
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_float_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	flw	f1, 0(r3)
	flw	f2, 8(r3)
	flw	f3, 16(r3)
	lw	r4, 0(r29)
	sw	r2, 8(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	quadratic.2633
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 0(r2)
	lw	r3, 0(r29)
	fsw	f1, 16(r29)
	fsw	f2, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_a.2528
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fmul	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fneg
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 8(r2)
	lw	r3, 0(r29)
	fsw	f1, 32(r29)
	fsw	f2, 40(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_b.2530
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fmul	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fneg
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	flw	f2, 16(r2)
	lw	r3, 0(r29)
	fsw	f1, 48(r29)
	fsw	f2, 56(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_param_c.2532
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fmul	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fneg
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r2, 8(r29)
	flw	f2, 16(r29)
	fsw	f2, 0(r2)
	lw	r3, 0(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_isrot.2526
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8775
	lw	r2, 8(r29)
	flw	f1, 32(r29)
	fsw	f1, 8(r2)
	flw	f1, 48(r29)
	fsw	f1, 16(r2)
	flw	f1, 64(r29)
	fsw	f1, 24(r2)
	j	beq_cont.8776
beq_else.8775:
	lw	r2, 8(r29)
	flw	f1, 32(r29)
	fsw	f1, 8(r2)
	flw	f1, 48(r29)
	fsw	f1, 16(r2)
	flw	f1, 64(r29)
	fsw	f1, 24(r2)
beq_cont.8776:
	flw	f1, 16(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fiszero
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8777
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 16(r29)
	fdiv	f1, f1, f2
	lw	r2, 8(r29)
	fsw	f1, 32(r2)
	j	beq_cont.8778
beq_else.8777:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 16(r29)
	fdiv	f1, f1, f2
	lw	r2, 8(r29)
	fsw	f1, 32(r2)
beq_cont.8778:
	lw	r2, 8(r29)
	jr	r31
iter_setup_dirvec_constants.2705:
	lw	r4, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r3
	bgtz	r27, bge_else.8779
	slti	r5, r3, 2
	lw	r4, r4, 0(r5)
	sw	r28, 0(r29)
	sw	r3, 4(r29)
	sw	r4, 8(r29)
	sw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	d_const.2581
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	d_vec.2579
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 8(r29)
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_form.2520
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8780
	lw	r2, 20(r29)
	lw	r3, 8(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	setup_rect_table.2696
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	slti	r4, r3, 2
	lw	r5, 16(r29)
	sw	r2, r5, 0(r4)
	j	beq_cont.8781
beq_else.8780:
	lw	r2, 20(r29)
	lw	r3, 8(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	setup_rect_table.2696
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	slti	r4, r3, 2
	lw	r5, 16(r29)
	sw	r2, r5, 0(r4)
beq_cont.8781:
	addi	r3, r3, -1
	lw	r2, 12(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8779:
	jr	r31
setup_dirvec_constants.2708:
	lw	r3, 8(r28)
	lw	r28, 4(r28)
	lw	r3, 0(r3)
	addi	r3, r3, -1
	lw	r1, 0(r28)
	jr	r1
setup_startp_constants.2710:
	lw	r4, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r3
	bgtz	r27, bge_else.8783
	slti	r5, r3, 2
	lw	r4, r4, 0(r5)
	sw	r28, 0(r29)
	sw	r3, 4(r29)
	sw	r2, 8(r29)
	sw	r4, 12(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_param_ctbl.2558
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_form.2520
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 8(r29)
	flw	f1, 0(r3)
	lw	r4, 12(r29)
	sw	r2, 20(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_x.2536
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 0(r2)
	lw	r3, 8(r29)
	flw	f1, 8(r3)
	lw	r4, 12(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_y.2538
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 8(r2)
	lw	r3, 8(r29)
	flw	f1, 16(r3)
	lw	r4, 12(r29)
	fsw	f1, 40(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_z.2540
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 16(r2)
	lw	r3, 20(r29)
	addi	r27, r0, 2
	bne	r3, r27, beq_else.8784
	lw	r3, 12(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_abc.2534
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	flw	f1, 0(r3)
	flw	f2, 8(r3)
	flw	f3, 16(r3)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	veciprod2.2496
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 24(r2)
	j	beq_cont.8785
beq_else.8784:
	lw	r3, 12(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_abc.2534
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	flw	f1, 0(r3)
	flw	f2, 8(r3)
	flw	f3, 16(r3)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	veciprod2.2496
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 24(r2)
beq_cont.8785:
	lw	r2, 4(r29)
	addi	r3, r2, -1
	lw	r2, 8(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8783:
	jr	r31
setup_startp.2713:
	lw	r3, 12(r28)
	lw	r4, 8(r28)
	lw	r5, 4(r28)
	sw	r2, 0(r29)
	sw	r4, 4(r29)
	sw	r5, 8(r29)
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	veccpy.2482
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	lw	r2, 0(r2)
	addi	r3, r2, -1
	lw	r2, 0(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
is_rect_outside.2715:
	fsw	f3, 0(r29)
	fsw	f2, 8(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fabs
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_a.2528
	addi	r29, r29, -40
	lw	r27, 36(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fless
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8788
	addi	r2, r2, 0
	j	beq_cont.8789
beq_else.8788:
	addi	r2, r2, 0
beq_cont.8789:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8790
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_isinvert.2524
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8791
	addi	r2, r2, 1
	jr	r31
beq_else.8791:
	addi	r2, r2, 0
	jr	r31
beq_else.8790:
	lw	r2, 16(r29)
	j	o_isinvert.2524
is_plane_outside.2720:
	sw	r2, 0(r29)
	fsw	f3, 8(r29)
	fsw	f2, 16(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_abc.2534
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f1, 24(r29)
	flw	f2, 16(r29)
	flw	f3, 8(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	veciprod2.2496
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r2, 0(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_isinvert.2524
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f1, 32(r29)
	sw	r2, 40(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_fisneg
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 40(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	xor.2461
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8793
	addi	r2, r2, 1
	jr	r31
beq_else.8793:
	addi	r2, r2, 0
	jr	r31
is_second_outside.2725:
	sw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	quadratic.2633
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r2, 0(r29)
	fsw	f1, 8(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_form.2520
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 3
	bne	r2, r27, beq_else.8795
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 8(r29)
	fsub	f1, f2, f1
	j	beq_cont.8796
beq_else.8795:
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	flw	f2, 8(r29)
	fsub	f1, f2, f1
beq_cont.8796:
	lw	r2, 0(r29)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_isinvert.2524
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f1, 16(r29)
	sw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_fisneg
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	xor.2461
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8797
	addi	r2, r2, 1
	jr	r31
beq_else.8797:
	addi	r2, r2, 0
	jr	r31
is_outside.2730:
	fsw	f3, 0(r29)
	fsw	f2, 8(r29)
	sw	r2, 16(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_param_x.2536
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_y.2538
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 8(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 40(r29)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_z.2540
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 0(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	fsw	f1, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_form.2520
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8799
	flw	f1, 32(r29)
	flw	f2, 40(r29)
	flw	f3, 48(r29)
	lw	r2, 16(r29)
	j	is_rect_outside.2715
beq_else.8799:
	addi	r27, r0, 2
	bne	r2, r27, beq_else.8800
	flw	f1, 32(r29)
	flw	f2, 40(r29)
	flw	f3, 48(r29)
	lw	r2, 16(r29)
	j	is_plane_outside.2720
beq_else.8800:
	flw	f1, 32(r29)
	flw	f2, 40(r29)
	flw	f3, 48(r29)
	lw	r2, 16(r29)
	j	is_second_outside.2725
check_all_inside.2735:
	lw	r4, 4(r28)
	slti	r5, r2, 2
	lw	r5, r3, 0(r5)
	addi	r27, r0, -1
	bne	r5, r27, beq_else.8801
	addi	r2, r2, 1
	jr	r31
beq_else.8801:
	slti	r5, r5, 2
	lw	r4, r4, 0(r5)
	fsw	f3, 0(r29)
	fsw	f2, 8(r29)
	fsw	f1, 16(r29)
	sw	r3, 24(r29)
	sw	r28, 28(r29)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	is_outside.2730
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8802
	lw	r2, 32(r29)
	addi	r2, r2, 1
	flw	f1, 16(r29)
	flw	f2, 8(r29)
	flw	f3, 0(r29)
	lw	r3, 24(r29)
	lw	r28, 28(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8802:
	addi	r2, r2, 0
	jr	r31
shadow_check_and_group.2741:
	lw	r4, 28(r28)
	lw	r5, 24(r28)
	lw	r6, 20(r28)
	lw	r7, 16(r28)
	lw	r8, 12(r28)
	lw	r9, 8(r28)
	lw	r10, 4(r28)
	slti	r11, r2, 2
	lw	r11, r3, 0(r11)
	addi	r27, r0, -1
	bne	r11, r27, beq_else.8803
	addi	r2, r2, 0
	jr	r31
beq_else.8803:
	slti	r11, r2, 2
	lw	r11, r3, 0(r11)
	sw	r10, 0(r29)
	sw	r9, 4(r29)
	sw	r8, 8(r29)
	sw	r3, 12(r29)
	sw	r28, 16(r29)
	sw	r2, 20(r29)
	sw	r6, 24(r29)
	sw	r11, 28(r29)
	sw	r5, 32(r29)
	add	r27, r31, r0
	add	r3, r7, r0
	add	r2, r11, r0
	add	r28, r4, r0
	add	r4, r9, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 32(r29)
	flw	f1, 0(r3)
	fsw	f1, 40(r29)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8805
	addi	r2, r2, 0
	j	beq_cont.8806
beq_else.8805:
	addi	r2, r2, 0
beq_cont.8806:
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8807
	lw	r2, 28(r29)
	slti	r2, r2, 2
	lw	r3, 24(r29)
	lw	r2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_isinvert.2524
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8808
	addi	r2, r2, 0
	jr	r31
beq_else.8808:
	lw	r2, 20(r29)
	addi	r2, r2, 1
	lw	r3, 12(r29)
	lw	r28, 16(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8807:
	lui	r27, ha16(l.6310)
	ori	r27, r27, lo16(l.6310)
	flw	f1, 0(r27)
	flw	f2, 40(r29)
	fadd	f1, f2, f1
	lw	r2, 8(r29)
	flw	f2, 0(r2)
	fmul	f2, f2, f1
	lw	r4, 4(r29)
	flw	f3, 0(r4)
	fadd	f2, f2, f3
	flw	f3, 8(r2)
	fmul	f3, f3, f1
	flw	f4, 8(r4)
	fadd	f3, f3, f4
	flw	f4, 16(r2)
	fmul	f1, f4, f1
	flw	f4, 16(r4)
	fadd	f1, f1, f4
	lw	r2, 12(r29)
	lw	r28, 0(r29)
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	fmov	f0, f3
	fmov	f3, f1
	fmov	f1, f2
	fmov	f2, f0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8809
	lw	r2, 20(r29)
	addi	r2, r2, 1
	lw	r3, 12(r29)
	lw	r28, 16(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8809:
	addi	r2, r2, 1
	jr	r31
shadow_check_one_or_group.2744:
	lw	r4, 8(r28)
	lw	r5, 4(r28)
	slti	r6, r2, 2
	lw	r6, r3, 0(r6)
	addi	r27, r0, -1
	bne	r6, r27, beq_else.8810
	addi	r2, r2, 0
	jr	r31
beq_else.8810:
	slti	r6, r6, 2
	lw	r5, r5, 0(r6)
	addi	r6, r6, 0
	sw	r3, 0(r29)
	sw	r28, 4(r29)
	sw	r2, 8(r29)
	add	r27, r31, r0
	add	r3, r5, r0
	add	r2, r6, r0
	add	r28, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8811
	lw	r2, 8(r29)
	addi	r2, r2, 1
	lw	r3, 0(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8811:
	addi	r2, r2, 1
	jr	r31
shadow_check_one_or_matrix.2747:
	lw	r4, 20(r28)
	lw	r5, 16(r28)
	lw	r6, 12(r28)
	lw	r7, 8(r28)
	lw	r8, 4(r28)
	slti	r9, r2, 2
	lw	r9, r3, 0(r9)
	lw	r10, 0(r9)
	addi	r27, r0, -1
	bne	r10, r27, beq_else.8812
	addi	r2, r2, 0
	jr	r31
beq_else.8812:
	sw	r9, 0(r29)
	sw	r6, 4(r29)
	sw	r3, 8(r29)
	sw	r28, 12(r29)
	sw	r2, 16(r29)
	addi	r27, r0, 99
	bne	r10, r27, beq_else.8813
	addi	r2, r2, 1
	j	beq_cont.8814
beq_else.8813:
	addi	r2, r2, 1
beq_cont.8814:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8815
	lw	r2, 16(r29)
	addi	r2, r2, 1
	lw	r3, 8(r29)
	lw	r28, 12(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8815:
	addi	r2, r2, 1
	lw	r3, 0(r29)
	lw	r28, 4(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8816
	lw	r2, 16(r29)
	addi	r2, r2, 1
	lw	r3, 8(r29)
	lw	r28, 12(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8816:
	addi	r2, r2, 1
	jr	r31
solve_each_element.2750:
	lw	r5, 36(r28)
	lw	r6, 32(r28)
	lw	r7, 28(r28)
	lw	r8, 24(r28)
	lw	r9, 20(r28)
	lw	r10, 16(r28)
	lw	r11, 12(r28)
	lw	r12, 8(r28)
	lw	r13, 4(r28)
	slti	r14, r2, 2
	lw	r14, r3, 0(r14)
	addi	r27, r0, -1
	bne	r14, r27, beq_else.8817
	jr	r31
beq_else.8817:
	sw	r10, 0(r29)
	sw	r12, 4(r29)
	sw	r11, 8(r29)
	sw	r13, 12(r29)
	sw	r6, 16(r29)
	sw	r5, 20(r29)
	sw	r7, 24(r29)
	sw	r4, 28(r29)
	sw	r3, 32(r29)
	sw	r28, 36(r29)
	sw	r2, 40(r29)
	sw	r9, 44(r29)
	sw	r14, 48(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	add	r2, r14, r0
	add	r28, r8, r0
	add	r4, r6, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8819
	lw	r2, 48(r29)
	slti	r2, r2, 2
	lw	r3, 44(r29)
	lw	r2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_isinvert.2524
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8820
	jr	r31
beq_else.8820:
	lw	r2, 40(r29)
	addi	r2, r2, 1
	lw	r3, 32(r29)
	lw	r4, 28(r29)
	lw	r28, 36(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8819:
	lw	r4, 24(r29)
	flw	f2, 0(r4)
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 52(r29)
	sw	r3, 56(r29)
	fsw	f2, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fless
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8823
	j	beq_cont.8824
beq_else.8823:
beq_cont.8824:
	lw	r2, 40(r29)
	addi	r2, r2, 1
	lw	r3, 32(r29)
	lw	r4, 28(r29)
	lw	r28, 36(r29)
	lw	r1, 0(r28)
	jr	r1
solve_one_or_network.2754:
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	slti	r7, r2, 2
	lw	r7, r3, 0(r7)
	addi	r27, r0, -1
	bne	r7, r27, beq_else.8825
	jr	r31
beq_else.8825:
	slti	r7, r7, 2
	lw	r6, r6, 0(r7)
	addi	r7, r7, 0
	sw	r4, 0(r29)
	sw	r3, 4(r29)
	sw	r28, 8(r29)
	sw	r2, 12(r29)
	add	r27, r31, r0
	add	r3, r6, r0
	add	r2, r7, r0
	add	r28, r5, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	addi	r2, r2, 1
	lw	r3, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
trace_or_matrix.2758:
	lw	r5, 20(r28)
	lw	r6, 16(r28)
	lw	r7, 12(r28)
	lw	r8, 8(r28)
	lw	r9, 4(r28)
	slti	r10, r2, 2
	lw	r10, r3, 0(r10)
	lw	r11, 0(r10)
	addi	r27, r0, -1
	bne	r11, r27, beq_else.8827
	jr	r31
beq_else.8827:
	sw	r4, 0(r29)
	sw	r3, 4(r29)
	sw	r28, 8(r29)
	sw	r2, 12(r29)
	addi	r27, r0, 99
	bne	r11, r27, beq_else.8829
	addi	r5, r5, 1
	add	r27, r31, r0
	add	r3, r10, r0
	add	r2, r5, r0
	add	r28, r9, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	j	beq_cont.8830
beq_else.8829:
	addi	r5, r5, 1
	add	r27, r31, r0
	add	r3, r10, r0
	add	r2, r5, r0
	add	r28, r9, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
beq_cont.8830:
	lw	r2, 12(r29)
	addi	r2, r2, 1
	lw	r3, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
judge_intersection.2762:
	lw	r3, 12(r28)
	lw	r4, 8(r28)
	lw	r5, 4(r28)
	lui	r27, ha16(l.6343)
	ori	r27, r27, lo16(l.6343)
	flw	f1, 0(r27)
	fsw	f1, 0(r4)
	addi	r6, r6, 0
	lw	r5, 0(r5)
	sw	r4, 0(r29)
	add	r27, r31, r0
	add	r4, r2, r0
	add	r28, r3, r0
	add	r3, r5, r0
	add	r2, r6, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	flw	f2, 0(r2)
	lui	r27, ha16(l.6323)
	ori	r27, r27, lo16(l.6323)
	flw	f1, 0(r27)
	fsw	f2, 8(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fless
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8832
	addi	r2, r2, 0
	jr	r31
beq_else.8832:
	lui	r27, ha16(l.6347)
	ori	r27, r27, lo16(l.6347)
	flw	f2, 0(r27)
	flw	f1, 8(r29)
	j	min_caml_fless
solve_each_element_fast.2764:
	lw	r5, 36(r28)
	lw	r6, 32(r28)
	lw	r7, 28(r28)
	lw	r8, 24(r28)
	lw	r9, 20(r28)
	lw	r10, 16(r28)
	lw	r11, 12(r28)
	lw	r12, 8(r28)
	lw	r13, 4(r28)
	sw	r10, 0(r29)
	sw	r12, 4(r29)
	sw	r11, 8(r29)
	sw	r13, 12(r29)
	sw	r6, 16(r29)
	sw	r5, 20(r29)
	sw	r8, 24(r29)
	sw	r28, 28(r29)
	sw	r9, 32(r29)
	sw	r4, 36(r29)
	sw	r7, 40(r29)
	sw	r3, 44(r29)
	sw	r2, 48(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	d_vec.2579
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r3, 48(r29)
	slti	r4, r3, 2
	lw	r5, 44(r29)
	lw	r4, r5, 0(r4)
	addi	r27, r0, -1
	bne	r4, r27, beq_else.8833
	jr	r31
beq_else.8833:
	lw	r6, 36(r29)
	lw	r28, 40(r29)
	sw	r2, 52(r29)
	sw	r4, 56(r29)
	add	r27, r31, r0
	add	r3, r6, r0
	add	r2, r4, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8835
	lw	r2, 56(r29)
	slti	r2, r2, 2
	lw	r3, 32(r29)
	lw	r2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_isinvert.2524
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8836
	jr	r31
beq_else.8836:
	lw	r2, 48(r29)
	addi	r2, r2, 1
	lw	r3, 44(r29)
	lw	r4, 36(r29)
	lw	r28, 28(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8835:
	lw	r4, 24(r29)
	flw	f2, 0(r4)
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 60(r29)
	sw	r3, 64(r29)
	fsw	f2, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fless
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8839
	j	beq_cont.8840
beq_else.8839:
beq_cont.8840:
	lw	r2, 48(r29)
	addi	r2, r2, 1
	lw	r3, 44(r29)
	lw	r4, 36(r29)
	lw	r28, 28(r29)
	lw	r1, 0(r28)
	jr	r1
solve_one_or_network_fast.2768:
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	slti	r7, r2, 2
	lw	r7, r3, 0(r7)
	addi	r27, r0, -1
	bne	r7, r27, beq_else.8841
	jr	r31
beq_else.8841:
	slti	r7, r7, 2
	lw	r6, r6, 0(r7)
	addi	r7, r7, 0
	sw	r4, 0(r29)
	sw	r3, 4(r29)
	sw	r28, 8(r29)
	sw	r2, 12(r29)
	add	r27, r31, r0
	add	r3, r6, r0
	add	r2, r7, r0
	add	r28, r5, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	addi	r2, r2, 1
	lw	r3, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
trace_or_matrix_fast.2772:
	lw	r5, 16(r28)
	lw	r6, 12(r28)
	lw	r7, 8(r28)
	lw	r8, 4(r28)
	slti	r9, r2, 2
	lw	r9, r3, 0(r9)
	lw	r10, 0(r9)
	addi	r27, r0, -1
	bne	r10, r27, beq_else.8843
	jr	r31
beq_else.8843:
	sw	r4, 0(r29)
	sw	r3, 4(r29)
	sw	r28, 8(r29)
	sw	r2, 12(r29)
	addi	r27, r0, 99
	bne	r10, r27, beq_else.8845
	addi	r5, r5, 1
	add	r27, r31, r0
	add	r3, r9, r0
	add	r2, r5, r0
	add	r28, r8, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	j	beq_cont.8846
beq_else.8845:
	addi	r5, r5, 1
	add	r27, r31, r0
	add	r3, r9, r0
	add	r2, r5, r0
	add	r28, r8, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
beq_cont.8846:
	lw	r2, 12(r29)
	addi	r2, r2, 1
	lw	r3, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
judge_intersection_fast.2776:
	lw	r3, 12(r28)
	lw	r4, 8(r28)
	lw	r5, 4(r28)
	lui	r27, ha16(l.6343)
	ori	r27, r27, lo16(l.6343)
	flw	f1, 0(r27)
	fsw	f1, 0(r4)
	addi	r6, r6, 0
	lw	r5, 0(r5)
	sw	r4, 0(r29)
	add	r27, r31, r0
	add	r4, r2, r0
	add	r28, r3, r0
	add	r3, r5, r0
	add	r2, r6, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	flw	f2, 0(r2)
	lui	r27, ha16(l.6323)
	ori	r27, r27, lo16(l.6323)
	flw	f1, 0(r27)
	fsw	f2, 8(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fless
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8848
	addi	r2, r2, 0
	jr	r31
beq_else.8848:
	lui	r27, ha16(l.6347)
	ori	r27, r27, lo16(l.6347)
	flw	f2, 0(r27)
	flw	f1, 8(r29)
	j	min_caml_fless
get_nvector_rect.2778:
	lw	r3, 8(r28)
	lw	r4, 4(r28)
	lw	r4, 0(r4)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	sw	r4, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	vecbzero.2480
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	addi	r3, r2, -1
	addi	r2, r2, -1
	slti	r2, r2, 3
	lw	r4, 4(r29)
	flw	f1, r4, 0(r2)
	sw	r3, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	sgn.2464
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fneg
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 12(r29)
	slti	r2, r2, 3
	lw	r3, 0(r29)
	fsw	f1, r3, 0(r2)
	jr	r31
get_nvector_plane.2780:
	lw	r3, 4(r28)
	sw	r2, 0(r29)
	sw	r3, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	o_param_a.2528
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fneg
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 0(r2)
	lw	r3, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	o_param_b.2530
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fneg
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 8(r2)
	lw	r3, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	o_param_c.2532
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_fneg
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 16(r2)
	jr	r31
get_nvector_second.2782:
	lw	r3, 8(r28)
	lw	r4, 4(r28)
	flw	f1, 0(r4)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	sw	r4, 8(r29)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_param_x.2536
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f2, 16(r29)
	fsub	f1, f2, f1
	lw	r2, 8(r29)
	flw	f2, 8(r2)
	lw	r3, 4(r29)
	fsw	f1, 24(r29)
	fsw	f2, 32(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_y.2538
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fsub	f1, f2, f1
	lw	r2, 8(r29)
	flw	f2, 16(r2)
	lw	r2, 4(r29)
	fsw	f1, 40(r29)
	fsw	f2, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_param_z.2540
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fsub	f1, f2, f1
	lw	r2, 4(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_param_a.2528
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	fsw	f1, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_param_b.2530
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_param_c.2532
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	o_isrot.2526
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8852
	lw	r2, 0(r29)
	flw	f1, 64(r29)
	fsw	f1, 0(r2)
	flw	f1, 72(r29)
	fsw	f1, 8(r2)
	flw	f1, 80(r29)
	fsw	f1, 16(r2)
	j	beq_cont.8853
beq_else.8852:
	lw	r2, 0(r29)
	flw	f1, 64(r29)
	fsw	f1, 0(r2)
	flw	f1, 72(r29)
	fsw	f1, 8(r2)
	flw	f1, 80(r29)
	fsw	f1, 16(r2)
beq_cont.8853:
	lw	r3, 4(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	o_isinvert.2524
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	j	vecunit_sgn.2490
get_nvector.2784:
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	sw	r4, 0(r29)
	sw	r2, 4(r29)
	sw	r6, 8(r29)
	sw	r3, 12(r29)
	sw	r5, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_form.2520
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8854
	lw	r2, 12(r29)
	lw	r28, 16(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8854:
	addi	r27, r0, 2
	bne	r2, r27, beq_else.8855
	lw	r2, 4(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8855:
	lw	r2, 4(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
utexture.2787:
	lw	r4, 4(r28)
	sw	r3, 0(r29)
	sw	r4, 4(r29)
	sw	r2, 8(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	o_texturetype.2518
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 8(r29)
	sw	r2, 12(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_color_red.2546
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 0(r2)
	lw	r3, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_color_green.2548
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 8(r2)
	lw	r3, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_color_blue.2550
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r2, 4(r29)
	fsw	f1, 16(r2)
	lw	r3, 12(r29)
	addi	r27, r0, 1
	bne	r3, r27, beq_else.8856
	lw	r3, 0(r29)
	flw	f1, 0(r3)
	lw	r4, 8(r29)
	fsw	f1, 16(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	o_param_x.2536
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	flw	f2, 16(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6410)
	ori	r27, r27, lo16(l.6410)
	flw	f2, 0(r27)
	fmul	f2, f1, f2
	fsw	f1, 24(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_floor
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6411)
	ori	r27, r27, lo16(l.6411)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	flw	f2, 24(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6402)
	ori	r27, r27, lo16(l.6402)
	flw	f2, 0(r27)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fless
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	flw	f1, 16(r3)
	lw	r3, 8(r29)
	sw	r2, 32(r29)
	fsw	f1, 40(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	o_param_z.2540
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	flw	f2, 40(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6410)
	ori	r27, r27, lo16(l.6410)
	flw	f2, 0(r27)
	fmul	f2, f1, f2
	fsw	f1, 48(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_floor
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6411)
	ori	r27, r27, lo16(l.6411)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	flw	f2, 48(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6402)
	ori	r27, r27, lo16(l.6402)
	flw	f2, 0(r27)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_fless
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r3, 32(r29)
	addi	r27, r0, 0
	bne	r3, r27, beq_else.8858
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8860
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f1, 0(r27)
	j	beq_cont.8861
beq_else.8860:
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f1, 0(r27)
beq_cont.8861:
	j	beq_cont.8859
beq_else.8858:
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8862
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f1, 0(r27)
	j	beq_cont.8863
beq_else.8862:
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f1, 0(r27)
beq_cont.8863:
beq_cont.8859:
	lw	r2, 4(r29)
	fsw	f1, 8(r2)
	jr	r31
beq_else.8856:
	addi	r27, r0, 2
	bne	r3, r27, beq_else.8865
	lw	r3, 0(r29)
	flw	f1, 8(r3)
	lui	r27, ha16(l.6406)
	ori	r27, r27, lo16(l.6406)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_sin
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_fsqr
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f2, 0(r27)
	fmul	f2, f2, f1
	lw	r2, 4(r29)
	fsw	f2, 0(r2)
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f2, 0(r27)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f3, 0(r27)
	fsub	f1, f3, f1
	fmul	f1, f2, f1
	fsw	f1, 8(r2)
	jr	r31
beq_else.8865:
	addi	r27, r0, 3
	bne	r3, r27, beq_else.8867
	lw	r3, 0(r29)
	flw	f1, 0(r3)
	lw	r4, 8(r29)
	fsw	f1, 56(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	o_param_x.2536
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsub	f1, f2, f1
	lw	r2, 0(r29)
	flw	f2, 16(r2)
	lw	r2, 8(r29)
	fsw	f1, 64(r29)
	fsw	f2, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_param_z.2540
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fsub	f1, f2, f1
	flw	f2, 64(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fsqr
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fsw	f1, 88(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_fsqr
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	flw	f2, 88(r29)
	fadd	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_sqrt
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6402)
	ori	r27, r27, lo16(l.6402)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
	fsw	f1, 96(r29)
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_floor
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6393)
	ori	r27, r27, lo16(l.6393)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_cos
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fsqr
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f2, 0(r27)
	fmul	f2, f1, f2
	lw	r2, 4(r29)
	fsw	f2, 8(r2)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f2, 0(r27)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	fsw	f1, 16(r2)
	jr	r31
beq_else.8867:
	addi	r27, r0, 4
	bne	r3, r27, beq_else.8869
	lw	r3, 0(r29)
	flw	f1, 0(r3)
	lw	r4, 8(r29)
	fsw	f1, 104(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	o_param_x.2536
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r31, r27, r0
	flw	f2, 104(r29)
	fsub	f1, f2, f1
	lw	r2, 8(r29)
	fsw	f1, 112(r29)
	add	r27, r31, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	o_param_a.2528
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	min_caml_sqrt
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	flw	f2, 112(r29)
	fmul	f1, f2, f1
	lw	r2, 0(r29)
	flw	f2, 16(r2)
	lw	r3, 8(r29)
	fsw	f1, 120(r29)
	fsw	f2, 128(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	jal	o_param_z.2540
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r31, r27, r0
	flw	f2, 128(r29)
	fsub	f1, f2, f1
	lw	r2, 8(r29)
	fsw	f1, 136(r29)
	add	r27, r31, r0
	sw	r27, 148(r29)
	addi	r29, r29, 152
	jal	o_param_c.2532
	addi	r29, r29, -152
	lw	r27, 148(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 148(r29)
	addi	r29, r29, 152
	jal	min_caml_sqrt
	addi	r29, r29, -152
	lw	r27, 148(r29)
	add	r31, r27, r0
	flw	f2, 136(r29)
	fmul	f1, f2, f1
	flw	f2, 120(r29)
	fsw	f1, 144(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 156(r29)
	addi	r29, r29, 160
	jal	min_caml_fsqr
	addi	r29, r29, -160
	lw	r27, 156(r29)
	add	r31, r27, r0
	flw	f2, 144(r29)
	fsw	f1, 152(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	min_caml_fsqr
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	flw	f2, 152(r29)
	fadd	f1, f2, f1
	flw	f2, 120(r29)
	fsw	f1, 160(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_fabs
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6390)
	ori	r27, r27, lo16(l.6390)
	flw	f2, 0(r27)
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_fless
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8870
	flw	f1, 120(r29)
	flw	f2, 144(r29)
	fdiv	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_fabs
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_atan
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6392)
	ori	r27, r27, lo16(l.6392)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6393)
	ori	r27, r27, lo16(l.6393)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
	j	beq_cont.8871
beq_else.8870:
	flw	f1, 120(r29)
	flw	f2, 144(r29)
	fdiv	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_fabs
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	min_caml_atan
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6392)
	ori	r27, r27, lo16(l.6392)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6393)
	ori	r27, r27, lo16(l.6393)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
beq_cont.8871:
	fsw	f1, 168(r29)
	add	r27, r31, r0
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	min_caml_floor
	addi	r29, r29, -184
	lw	r27, 180(r29)
	add	r31, r27, r0
	flw	f2, 168(r29)
	fsub	f1, f2, f1
	lw	r2, 0(r29)
	flw	f2, 8(r2)
	lw	r2, 8(r29)
	fsw	f1, 176(r29)
	fsw	f2, 184(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	o_param_y.2538
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	flw	f2, 184(r29)
	fsub	f1, f2, f1
	lw	r2, 8(r29)
	fsw	f1, 192(r29)
	add	r27, r31, r0
	sw	r27, 204(r29)
	addi	r29, r29, 208
	jal	o_param_b.2530
	addi	r29, r29, -208
	lw	r27, 204(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 204(r29)
	addi	r29, r29, 208
	jal	min_caml_sqrt
	addi	r29, r29, -208
	lw	r27, 204(r29)
	add	r31, r27, r0
	flw	f2, 192(r29)
	fmul	f1, f2, f1
	flw	f2, 160(r29)
	fsw	f1, 200(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 212(r29)
	addi	r29, r29, 216
	jal	min_caml_fabs
	addi	r29, r29, -216
	lw	r27, 212(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6390)
	ori	r27, r27, lo16(l.6390)
	flw	f2, 0(r27)
	add	r27, r31, r0
	sw	r27, 212(r29)
	addi	r29, r29, 216
	jal	min_caml_fless
	addi	r29, r29, -216
	lw	r27, 212(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8872
	flw	f1, 160(r29)
	flw	f2, 200(r29)
	fdiv	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 212(r29)
	addi	r29, r29, 216
	jal	min_caml_fabs
	addi	r29, r29, -216
	lw	r27, 212(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 212(r29)
	addi	r29, r29, 216
	jal	min_caml_atan
	addi	r29, r29, -216
	lw	r27, 212(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6392)
	ori	r27, r27, lo16(l.6392)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6393)
	ori	r27, r27, lo16(l.6393)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
	j	beq_cont.8873
beq_else.8872:
	flw	f1, 160(r29)
	flw	f2, 200(r29)
	fdiv	f1, f2, f1
	add	r27, r31, r0
	sw	r27, 212(r29)
	addi	r29, r29, 216
	jal	min_caml_fabs
	addi	r29, r29, -216
	lw	r27, 212(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 212(r29)
	addi	r29, r29, 216
	jal	min_caml_atan
	addi	r29, r29, -216
	lw	r27, 212(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6392)
	ori	r27, r27, lo16(l.6392)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6393)
	ori	r27, r27, lo16(l.6393)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
beq_cont.8873:
	fsw	f1, 208(r29)
	add	r27, r31, r0
	sw	r27, 220(r29)
	addi	r29, r29, 224
	jal	min_caml_floor
	addi	r29, r29, -224
	lw	r27, 220(r29)
	add	r31, r27, r0
	flw	f2, 208(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6395)
	ori	r27, r27, lo16(l.6395)
	flw	f2, 0(r27)
	lui	r27, ha16(l.6396)
	ori	r27, r27, lo16(l.6396)
	flw	f3, 0(r27)
	flw	f4, 176(r29)
	fsub	f3, f3, f4
	fsw	f1, 216(r29)
	fsw	f2, 224(r29)
	add	r27, r31, r0
	fmov	f1, f3
	sw	r27, 236(r29)
	addi	r29, r29, 240
	jal	min_caml_fsqr
	addi	r29, r29, -240
	lw	r27, 236(r29)
	add	r31, r27, r0
	flw	f2, 224(r29)
	fsub	f1, f2, f1
	lui	r27, ha16(l.6396)
	ori	r27, r27, lo16(l.6396)
	flw	f2, 0(r27)
	flw	f3, 216(r29)
	fsub	f2, f2, f3
	fsw	f1, 232(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 244(r29)
	addi	r29, r29, 248
	jal	min_caml_fsqr
	addi	r29, r29, -248
	lw	r27, 244(r29)
	add	r31, r27, r0
	flw	f2, 232(r29)
	fsub	f1, f2, f1
	fsw	f1, 240(r29)
	add	r27, r31, r0
	sw	r27, 252(r29)
	addi	r29, r29, 256
	jal	min_caml_fisneg
	addi	r29, r29, -256
	lw	r27, 252(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8874
	flw	f1, 240(r29)
	j	beq_cont.8875
beq_else.8874:
	flw	f1, 240(r29)
beq_cont.8875:
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f2, 0(r27)
	fmul	f1, f2, f1
	lui	r27, ha16(l.6398)
	ori	r27, r27, lo16(l.6398)
	flw	f2, 0(r27)
	fdiv	f1, f1, f2
	lw	r2, 4(r29)
	fsw	f1, 16(r2)
	jr	r31
beq_else.8869:
	jr	r31
add_light.2790:
	lw	r2, 8(r28)
	lw	r3, 4(r28)
	fsw	f3, 0(r29)
	fsw	f2, 8(r29)
	fsw	f1, 16(r29)
	sw	r2, 24(r29)
	sw	r3, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fispos
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8878
	j	beq_cont.8879
beq_else.8878:
beq_cont.8879:
	flw	f1, 8(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fispos
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8880
	jr	r31
beq_else.8880:
	flw	f1, 8(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fsqr
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fsqr
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 0(r29)
	fmul	f1, f1, f2
	lw	r2, 28(r29)
	flw	f2, 0(r2)
	fadd	f2, f2, f1
	fsw	f2, 0(r2)
	flw	f2, 8(r2)
	fadd	f2, f2, f1
	fsw	f2, 8(r2)
	flw	f2, 16(r2)
	fadd	f1, f2, f1
	fsw	f1, 16(r2)
	jr	r31
trace_reflections.2794:
	lw	r4, 32(r28)
	lw	r5, 28(r28)
	lw	r6, 24(r28)
	lw	r7, 20(r28)
	lw	r8, 16(r28)
	lw	r9, 12(r28)
	lw	r10, 8(r28)
	lw	r11, 4(r28)
	addi	r12, r12, 0
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8883
	slti	r13, r2, 2
	lw	r5, r5, 0(r13)
	sw	r28, 0(r29)
	sw	r2, 4(r29)
	fsw	f2, 8(r29)
	sw	r11, 16(r29)
	sw	r3, 20(r29)
	fsw	f1, 24(r29)
	sw	r7, 32(r29)
	sw	r12, 36(r29)
	sw	r4, 40(r29)
	sw	r6, 44(r29)
	sw	r5, 48(r29)
	sw	r9, 52(r29)
	sw	r10, 56(r29)
	sw	r8, 60(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	r_dvec.2585
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r28, 60(r29)
	sw	r2, 64(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8884
	j	beq_cont.8885
beq_else.8884:
beq_cont.8885:
	lw	r2, 4(r29)
	addi	r2, r2, -1
	flw	f1, 24(r29)
	flw	f2, 8(r29)
	lw	r3, 20(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8883:
	jr	r31
trace_ray.2799:
	lw	r5, 80(r28)
	lw	r6, 76(r28)
	lw	r7, 72(r28)
	lw	r8, 68(r28)
	lw	r9, 64(r28)
	lw	r10, 60(r28)
	lw	r11, 56(r28)
	lw	r12, 52(r28)
	lw	r13, 48(r28)
	lw	r14, 44(r28)
	lw	r15, 40(r28)
	lw	r16, 36(r28)
	lw	r17, 32(r28)
	lw	r18, 28(r28)
	lw	r19, 24(r28)
	lw	r20, 20(r28)
	lw	r21, 16(r28)
	lw	r22, 12(r28)
	lw	r23, 8(r28)
	lw	r24, 4(r28)
	addi	r27, r0, 4
	sub	r27, r2, r27
	bgtz	r27, ble_else.8887
	sw	r28, 0(r29)
	fsw	f2, 8(r29)
	sw	r7, 16(r29)
	sw	r6, 20(r29)
	sw	r16, 24(r29)
	sw	r11, 28(r29)
	sw	r24, 32(r29)
	sw	r10, 36(r29)
	sw	r13, 40(r29)
	sw	r15, 44(r29)
	sw	r8, 48(r29)
	sw	r4, 52(r29)
	sw	r19, 56(r29)
	sw	r5, 60(r29)
	sw	r20, 64(r29)
	sw	r9, 68(r29)
	sw	r22, 72(r29)
	sw	r14, 76(r29)
	sw	r21, 80(r29)
	sw	r12, 84(r29)
	sw	r23, 88(r29)
	fsw	f1, 96(r29)
	sw	r17, 104(r29)
	sw	r2, 108(r29)
	sw	r3, 112(r29)
	sw	r18, 116(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	p_surface_ids.2564
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	lw	r3, 112(r29)
	lw	r28, 116(r29)
	sw	r2, 120(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8890
	addi	r2, r2, -1
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r5, 120(r29)
	sw	r2, r5, 0(r4)
	addi	r27, r0, 0
	bne	r3, r27, beq_else.8891
	jr	r31
beq_else.8891:
	lw	r2, 112(r29)
	lw	r3, 104(r29)
	add	r27, r31, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	veciprod.2493
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	min_caml_fneg
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	fsw	f1, 128(r29)
	add	r27, r31, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	jal	min_caml_fispos
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8894
	jr	r31
beq_else.8894:
	flw	f1, 128(r29)
	add	r27, r31, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	jal	min_caml_fsqr
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r31, r27, r0
	flw	f2, 128(r29)
	fmul	f1, f1, f2
	flw	f2, 96(r29)
	fmul	f1, f1, f2
	lw	r2, 88(r29)
	flw	f2, 0(r2)
	fmul	f1, f1, f2
	lw	r2, 84(r29)
	flw	f2, 0(r2)
	fadd	f2, f2, f1
	fsw	f2, 0(r2)
	flw	f2, 8(r2)
	fadd	f2, f2, f1
	fsw	f2, 8(r2)
	flw	f2, 16(r2)
	fadd	f1, f2, f1
	fsw	f1, 16(r2)
	jr	r31
beq_else.8890:
	lw	r2, 80(r29)
	lw	r2, 0(r2)
	slti	r4, r2, 2
	lw	r5, 76(r29)
	lw	r4, r5, 0(r4)
	sw	r3, 136(r29)
	sw	r2, 140(r29)
	sw	r4, 144(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 148(r29)
	addi	r29, r29, 152
	jal	o_reflectiontype.2522
	addi	r29, r29, -152
	lw	r27, 148(r29)
	add	r31, r27, r0
	lw	r3, 144(r29)
	sw	r2, 148(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 156(r29)
	addi	r29, r29, 160
	jal	o_diffuse.2542
	addi	r29, r29, -160
	lw	r27, 156(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fmul	f1, f1, f2
	lw	r2, 144(r29)
	lw	r3, 112(r29)
	lw	r28, 72(r29)
	fsw	f1, 152(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 68(r29)
	lw	r3, 64(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	veccpy.2482
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 144(r29)
	lw	r3, 64(r29)
	lw	r28, 60(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 140(r29)
#nop
	lw	r3, 56(r29)
	lw	r3, 0(r3)
	add	r2, r2, r3
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r5, 120(r29)
	sw	r2, r5, 0(r4)
	lw	r2, 52(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	p_intersection_points.2562
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r2, r2, 0(r4)
	lw	r4, 64(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	veccpy.2482
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 52(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	p_calc_diffuse.2566
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	lw	r3, 144(r29)
	sw	r2, 160(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	o_diffuse.2542
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6396)
	ori	r27, r27, lo16(l.6396)
	flw	f2, 0(r27)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	min_caml_fless
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8897
	addi	r2, r2, 1
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r5, 160(r29)
	sw	r2, r5, 0(r4)
	lw	r2, 52(r29)
	add	r27, r31, r0
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	p_energy.2568
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r4, r2, 0(r4)
	lw	r5, 48(r29)
	sw	r2, 164(r29)
	add	r27, r31, r0
	add	r3, r5, r0
	add	r2, r4, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	veccpy.2482
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 108(r29)
	slti	r3, r2, 2
	lw	r4, 164(r29)
	lw	r3, r4, 0(r3)
	lui	r27, ha16(l.6433)
	ori	r27, r27, lo16(l.6433)
	flw	f1, 0(r27)
	flw	f2, 152(r29)
	fmul	f1, f1, f2
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	vecscale.2511
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 52(r29)
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	p_nvectors.2577
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r2, r2, 0(r4)
	lw	r4, 44(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	veccpy.2482
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	j	beq_cont.8898
beq_else.8897:
	addi	r2, r2, 1
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r5, 160(r29)
	sw	r2, r5, 0(r4)
	lw	r2, 52(r29)
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	p_energy.2568
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r4, r2, 0(r4)
	lw	r5, 48(r29)
	sw	r2, 164(r29)
	add	r27, r31, r0
	add	r3, r5, r0
	add	r2, r4, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	veccpy.2482
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 108(r29)
	slti	r3, r2, 2
	lw	r4, 164(r29)
	lw	r3, r4, 0(r3)
	lui	r27, ha16(l.6433)
	ori	r27, r27, lo16(l.6433)
	flw	f1, 0(r27)
	flw	f2, 152(r29)
	fmul	f1, f1, f2
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	vecscale.2511
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 52(r29)
	add	r27, r31, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	p_nvectors.2577
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r31, r27, r0
	lw	r3, 108(r29)
	slti	r4, r3, 2
	lw	r2, r2, 0(r4)
	lw	r4, 44(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	sw	r27, 172(r29)
	addi	r29, r29, 176
	jal	veccpy.2482
	addi	r29, r29, -176
	lw	r27, 172(r29)
	add	r0, r2, r0
	add	r31, r27, r0
beq_cont.8898:
	lui	r27, ha16(l.6435)
	ori	r27, r27, lo16(l.6435)
	flw	f1, 0(r27)
	lw	r2, 112(r29)
	lw	r3, 44(r29)
	fsw	f1, 168(r29)
	add	r27, r31, r0
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	veciprod.2493
	addi	r29, r29, -184
	lw	r27, 180(r29)
	add	r31, r27, r0
	flw	f2, 168(r29)
	fmul	f1, f2, f1
	lw	r2, 112(r29)
	lw	r3, 44(r29)
	add	r27, r31, r0
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	vecaccum.2501
	addi	r29, r29, -184
	lw	r27, 180(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 144(r29)
	add	r27, r31, r0
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	o_hilight.2544
	addi	r29, r29, -184
	lw	r27, 180(r29)
	add	r31, r27, r0
	flw	f2, 96(r29)
	fmul	f1, f2, f1
	lw	r2, 40(r29)
	lw	r3, 0(r2)
	lw	r2, 136(r29)
	lw	r28, 36(r29)
	fsw	f1, 176(r29)
	add	r27, r31, r0
	sw	r27, 188(r29)
	addi	r29, r29, 192
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -192
	lw	r27, 188(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8899
	lw	r2, 44(r29)
	lw	r3, 104(r29)
	add	r27, r31, r0
	sw	r27, 188(r29)
	addi	r29, r29, 192
	jal	veciprod.2493
	addi	r29, r29, -192
	lw	r27, 188(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 188(r29)
	addi	r29, r29, 192
	jal	min_caml_fneg
	addi	r29, r29, -192
	lw	r27, 188(r29)
	add	r31, r27, r0
	flw	f2, 152(r29)
	fmul	f1, f1, f2
	lw	r2, 112(r29)
	lw	r3, 104(r29)
	fsw	f1, 184(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	veciprod.2493
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	min_caml_fneg
	addi	r29, r29, -200
	lw	r27, 196(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 184(r29)
	flw	f3, 176(r29)
	lw	r28, 32(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	j	beq_cont.8900
beq_else.8899:
	lw	r2, 44(r29)
	lw	r3, 104(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	veciprod.2493
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	min_caml_fneg
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	flw	f2, 152(r29)
	fmul	f1, f1, f2
	lw	r2, 112(r29)
	lw	r3, 104(r29)
	fsw	f1, 184(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	veciprod.2493
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	min_caml_fneg
	addi	r29, r29, -200
	lw	r27, 196(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 184(r29)
	flw	f3, 176(r29)
	lw	r28, 32(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r0, r2, r0
	add	r31, r27, r0
beq_cont.8900:
	lw	r2, 64(r29)
	lw	r28, 28(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 24(r29)
	lw	r2, 0(r2)
	addi	r2, r2, -1
	flw	f1, 152(r29)
	flw	f2, 176(r29)
	lw	r3, 112(r29)
	lw	r28, 20(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lui	r27, ha16(l.6438)
	ori	r27, r27, lo16(l.6438)
	flw	f1, 0(r27)
	flw	f2, 96(r29)
	add	r27, r31, r0
	sw	r27, 196(r29)
	addi	r29, r29, 200
	jal	min_caml_fless
	addi	r29, r29, -200
	lw	r27, 196(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8901
	jr	r31
beq_else.8901:
	lw	r2, 108(r29)
	addi	r27, r0, 4
	sub	r27, r27, r2
	bgtz	r27, bge_else.8903
	j	bge_cont.8904
bge_else.8903:
bge_cont.8904:
	lw	r3, 148(r29)
	addi	r27, r0, 2
	bne	r3, r27, beq_else.8905
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r3, 144(r29)
	fsw	f1, 192(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 204(r29)
	addi	r29, r29, 208
	jal	o_diffuse.2542
	addi	r29, r29, -208
	lw	r27, 204(r29)
	add	r31, r27, r0
	flw	f2, 192(r29)
	fsub	f1, f2, f1
	flw	f2, 96(r29)
	fmul	f1, f2, f1
	lw	r2, 108(r29)
	addi	r2, r2, 1
	lw	r3, 16(r29)
	flw	f2, 0(r3)
	flw	f3, 8(r29)
	fadd	f2, f3, f2
	lw	r3, 112(r29)
	lw	r4, 52(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8905:
	jr	r31
ble_else.8887:
	jr	r31
trace_diffuse_ray.2805:
	lw	r3, 48(r28)
	lw	r4, 44(r28)
	lw	r5, 40(r28)
	lw	r6, 36(r28)
	lw	r7, 32(r28)
	lw	r8, 28(r28)
	lw	r9, 24(r28)
	lw	r10, 20(r28)
	lw	r11, 16(r28)
	lw	r12, 12(r28)
	lw	r13, 8(r28)
	lw	r14, 4(r28)
	sw	r4, 0(r29)
	sw	r14, 4(r29)
	fsw	f1, 8(r29)
	sw	r9, 16(r29)
	sw	r8, 20(r29)
	sw	r5, 24(r29)
	sw	r6, 28(r29)
	sw	r11, 32(r29)
	sw	r3, 36(r29)
	sw	r13, 40(r29)
	sw	r2, 44(r29)
	sw	r7, 48(r29)
	sw	r12, 52(r29)
	add	r27, r31, r0
	add	r28, r10, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8908
	jr	r31
beq_else.8908:
	lw	r2, 52(r29)
	lw	r2, 0(r2)
	slti	r2, r2, 2
	lw	r4, 48(r29)
	lw	r2, r4, 0(r2)
	lw	r4, 44(r29)
	sw	r3, 56(r29)
	sw	r2, 60(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	d_vec.2579
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 60(r29)
	lw	r28, 40(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 60(r29)
	lw	r3, 32(r29)
	lw	r28, 36(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 28(r29)
	lw	r3, 0(r2)
	lw	r2, 56(r29)
	lw	r28, 24(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8910
	lw	r2, 20(r29)
	lw	r3, 16(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	veciprod.2493
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_fneg
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	fsw	f1, 64(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fispos
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8911
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	j	beq_cont.8912
beq_else.8911:
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
beq_cont.8912:
	flw	f2, 8(r29)
	fmul	f1, f2, f1
	lw	r2, 60(r29)
	fsw	f1, 72(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	o_diffuse.2542
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 72(r29)
	fmul	f1, f2, f1
	lw	r2, 4(r29)
	lw	r3, 0(r29)
	j	vecaccum.2501
beq_else.8910:
	jr	r31
iter_trace_diffuse_rays.2808:
	lw	r6, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r5
	bgtz	r27, bge_else.8914
	slti	r7, r5, 2
	lw	r7, r2, 0(r7)
	sw	r4, 0(r29)
	sw	r28, 4(r29)
	sw	r6, 8(r29)
	sw	r2, 12(r29)
	sw	r5, 16(r29)
	sw	r3, 20(r29)
	add	r27, r31, r0
	add	r2, r7, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	d_vec.2579
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	veciprod.2493
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	fsw	f1, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fisneg
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8915
	lw	r2, 16(r29)
	slti	r3, r2, 2
	lw	r4, 12(r29)
	lw	r3, r4, 0(r3)
	lui	r27, ha16(l.6456)
	ori	r27, r27, lo16(l.6456)
	flw	f1, 0(r27)
	flw	f2, 24(r29)
	fdiv	f1, f2, f1
	lw	r28, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	j	beq_cont.8916
beq_else.8915:
	lw	r2, 16(r29)
	slti	r3, r2, 2
	lw	r4, 12(r29)
	lw	r3, r4, 0(r3)
	lui	r27, ha16(l.6456)
	ori	r27, r27, lo16(l.6456)
	flw	f1, 0(r27)
	flw	f2, 24(r29)
	fdiv	f1, f2, f1
	lw	r28, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r0, r2, r0
	add	r31, r27, r0
beq_cont.8916:
	lw	r2, 16(r29)
	addi	r5, r2, -2
	lw	r2, 12(r29)
	lw	r3, 20(r29)
	lw	r4, 0(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8914:
	jr	r31
trace_diffuse_rays.2813:
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	sw	r4, 0(r29)
	sw	r3, 4(r29)
	sw	r2, 8(r29)
	sw	r6, 12(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	add	r28, r5, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r5, r5, 118
	lw	r2, 8(r29)
	lw	r3, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 12(r29)
	lw	r1, 0(r28)
	jr	r1
trace_diffuse_ray_80percent.2817:
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	sw	r4, 0(r29)
	sw	r3, 4(r29)
	sw	r5, 8(r29)
	sw	r6, 12(r29)
	sw	r2, 16(r29)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8918
	j	beq_cont.8919
beq_else.8918:
beq_cont.8919:
	lw	r2, 16(r29)
	addi	r27, r0, 1
	bne	r2, r27, beq_else.8920
	j	beq_cont.8921
beq_else.8920:
beq_cont.8921:
	lw	r2, 16(r29)
	addi	r27, r0, 2
	bne	r2, r27, beq_else.8922
	j	beq_cont.8923
beq_else.8922:
beq_cont.8923:
	lw	r2, 16(r29)
	addi	r27, r0, 3
	bne	r2, r27, beq_else.8924
	j	beq_cont.8925
beq_else.8924:
beq_cont.8925:
	lw	r2, 16(r29)
	addi	r27, r0, 4
	bne	r2, r27, beq_else.8926
	jr	r31
beq_else.8926:
	lw	r2, 12(r29)
	lw	r2, 16(r2)
	lw	r3, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
calc_diffuse_using_1point.2821:
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	sw	r5, 0(r29)
	sw	r4, 4(r29)
	sw	r6, 8(r29)
	sw	r3, 12(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	p_received_ray_20percent.2570
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	p_nvectors.2577
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	sw	r2, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	p_intersection_points.2562
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	sw	r2, 28(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	p_energy.2568
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	slti	r4, r3, 2
	lw	r5, 20(r29)
	lw	r4, r5, 0(r4)
	lw	r5, 8(r29)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	add	r2, r5, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	veccpy.2482
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	p_group_id.2572
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	slti	r4, r3, 2
	lw	r5, 24(r29)
	lw	r4, r5, 0(r4)
	slti	r5, r3, 2
	lw	r6, 28(r29)
	lw	r5, r6, 0(r5)
	lw	r28, 4(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	add	r4, r5, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	slti	r2, r2, 2
	lw	r3, 32(r29)
	lw	r3, r3, 0(r2)
	lw	r2, 0(r29)
	lw	r4, 8(r29)
	j	vecaccumv.2514
calc_diffuse_using_5points.2824:
	lw	r7, 8(r28)
	lw	r8, 4(r28)
	slti	r9, r2, 2
	lw	r3, r3, 0(r9)
	sw	r7, 0(r29)
	sw	r8, 4(r29)
	sw	r6, 8(r29)
	sw	r5, 12(r29)
	sw	r4, 16(r29)
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	p_received_ray_20percent.2570
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	addi	r4, r3, -1
	slti	r4, r4, 2
	lw	r5, 16(r29)
	lw	r4, r5, 0(r4)
	sw	r2, 24(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	p_received_ray_20percent.2570
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	slti	r4, r3, 2
	lw	r5, 16(r29)
	lw	r4, r5, 0(r4)
	sw	r2, 28(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	p_received_ray_20percent.2570
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	addi	r4, r3, 1
	slti	r4, r4, 2
	lw	r5, 16(r29)
	lw	r4, r5, 0(r4)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	p_received_ray_20percent.2570
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	slti	r4, r3, 2
	lw	r5, 12(r29)
	lw	r4, r5, 0(r4)
	sw	r2, 36(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	p_received_ray_20percent.2570
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r3, 8(r29)
	slti	r4, r3, 2
	lw	r5, 24(r29)
	lw	r4, r5, 0(r4)
	lw	r5, 4(r29)
	sw	r2, 40(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	add	r2, r5, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	veccpy.2482
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	slti	r3, r2, 2
	lw	r4, 28(r29)
	lw	r3, r4, 0(r3)
	lw	r4, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	vecadd.2505
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	slti	r3, r2, 2
	lw	r4, 32(r29)
	lw	r3, r4, 0(r3)
	lw	r4, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	vecadd.2505
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	slti	r3, r2, 2
	lw	r4, 36(r29)
	lw	r3, r4, 0(r3)
	lw	r4, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	vecadd.2505
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	slti	r3, r2, 2
	lw	r4, 40(r29)
	lw	r3, r4, 0(r3)
	lw	r4, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	vecadd.2505
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	slti	r2, r2, 2
	lw	r3, 16(r29)
	lw	r2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	p_energy.2568
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r3, 8(r29)
	slti	r3, r3, 2
	lw	r3, r2, 0(r3)
	lw	r2, 0(r29)
	lw	r4, 4(r29)
	j	vecaccumv.2514
do_without_neighbors.2830:
	lw	r4, 4(r28)
	addi	r27, r0, 4
	sub	r27, r3, r27
	bgtz	r27, ble_else.8928
	sw	r28, 0(r29)
	sw	r4, 4(r29)
	sw	r2, 8(r29)
	sw	r3, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	p_surface_ids.2564
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	slti	r4, r3, 2
	lw	r2, r2, 0(r4)
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8929
	lw	r2, 8(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	p_calc_diffuse.2566
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	slti	r4, r3, 2
	lw	r2, r2, 0(r4)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8930
	j	beq_cont.8931
beq_else.8930:
beq_cont.8931:
	lw	r2, 12(r29)
	addi	r3, r2, 1
	lw	r2, 8(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8929:
	jr	r31
ble_else.8928:
	jr	r31
neighbors_exist.2833:
	lw	r4, 4(r28)
	lw	r5, 4(r4)
	addi	r6, r3, 1
	sub	r27, r5, r6
	bgtz	r27, ble_else.8934
	addi	r2, r2, 0
	jr	r31
ble_else.8934:
	addi	r27, r0, 0
	sub	r27, r3, r27
	bgtz	r27, ble_else.8935
	addi	r2, r2, 0
	jr	r31
ble_else.8935:
	lw	r3, 0(r4)
	addi	r4, r2, 1
	sub	r27, r3, r4
	bgtz	r27, ble_else.8936
	addi	r2, r2, 0
	jr	r31
ble_else.8936:
	addi	r27, r0, 0
	sub	r27, r2, r27
	bgtz	r27, ble_else.8937
	addi	r2, r2, 0
	jr	r31
ble_else.8937:
	addi	r2, r2, 1
	jr	r31
get_surface_id.2837:
	sw	r3, 0(r29)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	p_surface_ids.2564
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	slti	r3, r3, 2
	lw	r2, r2, 0(r3)
	jr	r31
neighbors_are_available.2840:
	slti	r7, r2, 2
	lw	r7, r4, 0(r7)
	sw	r4, 0(r29)
	sw	r5, 4(r29)
	sw	r6, 8(r29)
	sw	r3, 12(r29)
	sw	r2, 16(r29)
	add	r27, r31, r0
	add	r3, r6, r0
	add	r2, r7, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	get_surface_id.2837
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	slti	r4, r3, 2
	lw	r5, 12(r29)
	lw	r4, r5, 0(r4)
	lw	r5, 8(r29)
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r3, r5, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	get_surface_id.2837
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	bne	r2, r3, beq_else.8938
	lw	r2, 16(r29)
	slti	r4, r2, 2
	lw	r5, 4(r29)
	lw	r4, r5, 0(r4)
	lw	r5, 8(r29)
	add	r27, r31, r0
	add	r3, r5, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	get_surface_id.2837
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	bne	r2, r3, beq_else.8939
	lw	r2, 16(r29)
	addi	r4, r2, -1
	slti	r4, r4, 2
	lw	r5, 0(r29)
	lw	r4, r5, 0(r4)
	lw	r6, 8(r29)
	add	r27, r31, r0
	add	r3, r6, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	get_surface_id.2837
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	bne	r2, r3, beq_else.8940
	lw	r2, 16(r29)
	addi	r2, r2, 1
	slti	r2, r2, 2
	lw	r4, 0(r29)
	lw	r2, r4, 0(r2)
	lw	r4, 8(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	get_surface_id.2837
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	bne	r2, r3, beq_else.8941
	addi	r2, r2, 1
	jr	r31
beq_else.8941:
	addi	r2, r2, 0
	jr	r31
beq_else.8940:
	addi	r2, r2, 0
	jr	r31
beq_else.8939:
	addi	r2, r2, 0
	jr	r31
beq_else.8938:
	addi	r2, r2, 0
	jr	r31
try_exploit_neighbors.2846:
	lw	r8, 8(r28)
	lw	r9, 4(r28)
	slti	r10, r2, 2
	lw	r10, r5, 0(r10)
	addi	r27, r0, 4
	sub	r27, r7, r27
	bgtz	r27, ble_else.8942
	sw	r3, 0(r29)
	sw	r28, 4(r29)
	sw	r9, 8(r29)
	sw	r10, 12(r29)
	sw	r8, 16(r29)
	sw	r7, 20(r29)
	sw	r6, 24(r29)
	sw	r5, 28(r29)
	sw	r4, 32(r29)
	sw	r2, 36(r29)
	add	r27, r31, r0
	add	r3, r7, r0
	add	r2, r10, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	get_surface_id.2837
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8943
	lw	r2, 36(r29)
	lw	r3, 32(r29)
	lw	r4, 28(r29)
	lw	r5, 24(r29)
	lw	r6, 20(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	neighbors_are_available.2840
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8944
	lw	r2, 36(r29)
	slti	r2, r2, 2
	lw	r3, 28(r29)
	lw	r2, r3, 0(r2)
	lw	r3, 20(r29)
	lw	r28, 16(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.8944:
	lw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	p_calc_diffuse.2566
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r6, 20(r29)
	slti	r3, r6, 2
	lw	r2, r2, 0(r3)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8945
	j	beq_cont.8946
beq_else.8945:
beq_cont.8946:
	lw	r2, 20(r29)
	addi	r7, r2, 1
	lw	r2, 36(r29)
	lw	r3, 0(r29)
	lw	r4, 32(r29)
	lw	r5, 28(r29)
	lw	r6, 24(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8943:
	jr	r31
ble_else.8942:
	jr	r31
write_ppm_header.2853:
	lw	r2, 4(r28)
	addi	r3, r3, 80
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 51
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 10
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	lw	r3, 0(r2)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_int
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 32
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	lw	r2, 4(r2)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_int
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 32
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 255
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_int
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 10
	j	min_caml_print_char
write_rgb_element.2855:
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_int_of_float
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r27, r0, 255
	sub	r27, r2, r27
	bgtz	r27, ble_else.8949
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8951
	j	bge_cont.8952
bge_else.8951:
bge_cont.8952:
	j	ble_cont.8950
ble_else.8949:
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8953
	j	bge_cont.8954
bge_else.8953:
bge_cont.8954:
ble_cont.8950:
	j	min_caml_print_int
write_rgb.2857:
	lw	r2, 4(r28)
	flw	f1, 0(r2)
	sw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	write_rgb_element.2855
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 32
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	flw	f1, 8(r2)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	write_rgb_element.2855
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 32
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_print_char
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	flw	f1, 16(r2)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	write_rgb_element.2855
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 10
	j	min_caml_print_char
pretrace_diffuse_rays.2859:
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
	addi	r27, r0, 4
	sub	r27, r3, r27
	bgtz	r27, ble_else.8955
	sw	r28, 0(r29)
	sw	r4, 4(r29)
	sw	r5, 8(r29)
	sw	r6, 12(r29)
	sw	r3, 16(r29)
	sw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	get_surface_id.2837
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8956
	lw	r2, 20(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	p_calc_diffuse.2566
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	lw	r3, 16(r29)
	slti	r4, r3, 2
	lw	r2, r2, 0(r4)
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8957
	j	beq_cont.8958
beq_else.8957:
beq_cont.8958:
	lw	r2, 16(r29)
	addi	r3, r2, 1
	lw	r2, 20(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8956:
	jr	r31
ble_else.8955:
	jr	r31
pretrace_pixels.2862:
	lw	r5, 36(r28)
	lw	r6, 32(r28)
	lw	r7, 28(r28)
	lw	r8, 24(r28)
	lw	r9, 20(r28)
	lw	r10, 16(r28)
	lw	r11, 12(r28)
	lw	r12, 8(r28)
	lw	r13, 4(r28)
	addi	r14, r14, 0
	addi	r27, r0, 0
	sub	r27, r27, r3
	bgtz	r27, bge_else.8961
	flw	f4, 0(r9)
	lw	r9, 0(r13)
	sub	r9, r3, r9
	sw	r28, 0(r29)
	sw	r12, 4(r29)
	sw	r4, 8(r29)
	sw	r6, 12(r29)
	sw	r2, 16(r29)
	sw	r3, 20(r29)
	sw	r5, 24(r29)
	sw	r7, 28(r29)
	sw	r10, 32(r29)
	sw	r14, 36(r29)
	fsw	f3, 40(r29)
	fsw	f2, 48(r29)
	sw	r11, 56(r29)
	fsw	f1, 64(r29)
	sw	r8, 72(r29)
	fsw	f4, 80(r29)
	add	r27, r31, r0
	add	r2, r9, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_float_of_int
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fmul	f1, f2, f1
	lw	r2, 72(r29)
	flw	f2, 0(r2)
	fmul	f2, f1, f2
	flw	f3, 64(r29)
	fadd	f2, f2, f3
	lw	r3, 56(r29)
	fsw	f2, 0(r3)
	flw	f2, 8(r2)
	fmul	f2, f1, f2
	flw	f4, 48(r29)
	fadd	f2, f2, f4
	fsw	f2, 8(r3)
	flw	f2, 16(r2)
	fmul	f1, f1, f2
	flw	f2, 40(r29)
	fadd	f1, f1, f2
	fsw	f1, 16(r3)
	lw	r2, 36(r29)
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	vecunit_sgn.2490
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 32(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	vecbzero.2480
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 28(r29)
	lw	r3, 24(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	veccpy.2482
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	lw	r2, 20(r29)
	slti	r3, r2, 2
	lw	r4, 16(r29)
	lw	r3, r4, 0(r3)
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f2, 0(r27)
	lw	r5, 36(r29)
	lw	r6, 56(r29)
	lw	r28, 12(r29)
	add	r27, r31, r0
	add	r4, r3, r0
	add	r2, r5, r0
	add	r3, r6, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	slti	r3, r2, 2
	lw	r4, 16(r29)
	lw	r3, r4, 0(r3)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	p_rgb.2560
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	lw	r3, 32(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	veccpy.2482
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	slti	r3, r2, 2
	lw	r4, 16(r29)
	lw	r3, r4, 0(r3)
	lw	r5, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r5, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	p_set_group_id.2574
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	slti	r3, r2, 2
	lw	r4, 16(r29)
	lw	r3, r4, 0(r3)
	lw	r5, 36(r29)
	lw	r28, 4(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r5, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	addi	r2, r2, -1
	addi	r3, r3, 1
	lw	r4, 8(r29)
	sw	r2, 88(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	add_mod5.2469
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r4, r2, r0
	add	r31, r27, r0
	flw	f1, 64(r29)
	flw	f2, 48(r29)
	flw	f3, 40(r29)
	lw	r2, 16(r29)
	lw	r3, 88(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8961:
	jr	r31
pretrace_line.2869:
	lw	r5, 24(r28)
	lw	r6, 20(r28)
	lw	r7, 16(r28)
	lw	r8, 12(r28)
	lw	r9, 8(r28)
	lw	r10, 4(r28)
	flw	f1, 0(r7)
	lw	r7, 4(r10)
	sub	r3, r3, r7
	sw	r4, 0(r29)
	sw	r2, 4(r29)
	sw	r8, 8(r29)
	sw	r9, 12(r29)
	sw	r5, 16(r29)
	sw	r6, 20(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_float_of_int
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fmul	f1, f2, f1
	lw	r2, 20(r29)
	flw	f2, 0(r2)
	fmul	f2, f1, f2
	lw	r3, 16(r29)
	flw	f3, 0(r3)
	fadd	f2, f2, f3
	flw	f3, 8(r2)
	fmul	f3, f1, f3
	flw	f4, 8(r3)
	fadd	f3, f3, f4
	flw	f4, 16(r2)
	fmul	f1, f1, f4
	flw	f4, 16(r3)
	fadd	f1, f1, f4
	lw	r2, 12(r29)
	lw	r2, 0(r2)
	addi	r3, r2, -1
	lw	r2, 4(r29)
	lw	r4, 0(r29)
	lw	r28, 8(r29)
	fmov	f0, f3
	fmov	f3, f1
	fmov	f1, f2
	fmov	f2, f0
	lw	r1, 0(r28)
	jr	r1
scan_pixel.2873:
	lw	r7, 24(r28)
	lw	r8, 20(r28)
	lw	r9, 16(r28)
	lw	r10, 12(r28)
	lw	r11, 8(r28)
	lw	r12, 4(r28)
	lw	r11, 0(r11)
	sub	r27, r11, r2
	bgtz	r27, ble_else.8965
	jr	r31
ble_else.8965:
	slti	r11, r2, 2
	lw	r11, r5, 0(r11)
	sw	r28, 0(r29)
	sw	r7, 4(r29)
	sw	r4, 8(r29)
	sw	r8, 12(r29)
	sw	r12, 16(r29)
	sw	r5, 20(r29)
	sw	r6, 24(r29)
	sw	r3, 28(r29)
	sw	r2, 32(r29)
	sw	r10, 36(r29)
	sw	r9, 40(r29)
	add	r27, r31, r0
	add	r2, r11, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	p_rgb.2560
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 40(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	veccpy.2482
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 32(r29)
	lw	r3, 28(r29)
	lw	r4, 24(r29)
	lw	r28, 36(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.8967
	lw	r2, 32(r29)
	slti	r4, r2, 2
	lw	r5, 20(r29)
	lw	r4, r5, 0(r4)
	lw	r28, 16(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	j	beq_cont.8968
beq_else.8967:
	lw	r2, 32(r29)
	slti	r4, r2, 2
	lw	r5, 20(r29)
	lw	r4, r5, 0(r4)
	lw	r28, 16(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
beq_cont.8968:
	lw	r28, 4(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 32(r29)
	addi	r2, r2, 1
	lw	r3, 28(r29)
	lw	r4, 8(r29)
	lw	r5, 20(r29)
	lw	r6, 24(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
scan_line.2879:
	lw	r7, 12(r28)
	lw	r8, 8(r28)
	lw	r9, 4(r28)
	lw	r10, 4(r9)
	sub	r27, r10, r2
	bgtz	r27, ble_else.8969
	jr	r31
ble_else.8969:
	lw	r9, 4(r9)
	addi	r9, r9, -1
	sw	r28, 0(r29)
	sw	r6, 4(r29)
	sw	r5, 8(r29)
	sw	r4, 12(r29)
	sw	r3, 16(r29)
	sw	r2, 20(r29)
	sw	r7, 24(r29)
	sub	r27, r9, r2
	bgtz	r27, ble_else.8971
	j	ble_cont.8972
ble_else.8971:
ble_cont.8972:
	addi	r2, r2, 0
	lw	r3, 20(r29)
	lw	r4, 16(r29)
	lw	r5, 12(r29)
	lw	r6, 8(r29)
	lw	r28, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 20(r29)
	addi	r2, r2, 1
	addi	r3, r3, 2
	lw	r4, 4(r29)
	sw	r2, 28(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	add_mod5.2469
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r6, r2, r0
	add	r31, r27, r0
	lw	r2, 28(r29)
	lw	r3, 12(r29)
	lw	r4, 8(r29)
	lw	r5, 16(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
create_float5x3array.2885:
	addi	r2, r2, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 5
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 4(r3)
	addi	r2, r2, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 8(r3)
	addi	r2, r2, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 12(r3)
	addi	r2, r2, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	sw	r2, 16(r3)
	add	r2, r3, r0
	jr	r31
create_pixel.2887:
	addi	r2, r2, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	sw	r2, 0(r29)
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	create_float5x3array.2885
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r3, r3, 5
	addi	r4, r4, 0
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r3, r3, 5
	addi	r4, r4, 0
	sw	r2, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	sw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	create_float5x3array.2885
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	sw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	create_float5x3array.2885
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	addi	r4, r4, 0
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_create_array
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	sw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	create_float5x3array.2885
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	add	r3, r30, r0
	addi	r30, r30, 32
	sw	r2, 28(r3)
	lw	r2, 24(r29)
	sw	r2, 24(r3)
	lw	r2, 20(r29)
	sw	r2, 20(r3)
	lw	r2, 16(r29)
	sw	r2, 16(r3)
	lw	r2, 12(r29)
	sw	r2, 12(r3)
	lw	r2, 8(r29)
	sw	r2, 8(r3)
	lw	r2, 4(r29)
	sw	r2, 4(r3)
	lw	r2, 0(r29)
	sw	r2, 0(r3)
	add	r2, r3, r0
	jr	r31
init_line_elements.2889:
	addi	r27, r0, 0
	sub	r27, r27, r3
	bgtz	r27, bge_else.8973
	sw	r2, 0(r29)
	sw	r3, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	create_pixel.2887
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 4(r29)
	slti	r4, r3, 2
	lw	r5, 0(r29)
	sw	r2, r5, 0(r4)
	addi	r3, r3, -1
	add	r2, r5, r0
	j	init_line_elements.2889
bge_else.8973:
	jr	r31
create_pixelline.2892:
	lw	r2, 4(r28)
	lw	r3, 0(r2)
	sw	r2, 0(r29)
	sw	r3, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	create_pixel.2887
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 0(r29)
	lw	r3, 0(r3)
	addi	r3, r3, -2
	j	init_line_elements.2889
tan.2894:
	fsw	f1, 0(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_sin
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	flw	f2, 0(r29)
	fsw	f1, 8(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_cos
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	flw	f2, 8(r29)
	fdiv	f1, f2, f1
	jr	r31
adjust_position.2896:
	fmul	f1, f1, f1
	lui	r27, ha16(l.6438)
	ori	r27, r27, lo16(l.6438)
	flw	f3, 0(r27)
	fadd	f1, f1, f3
	fsw	f2, 0(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_sqrt
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f2, 0(r27)
	fdiv	f2, f2, f1
	fsw	f1, 8(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_atan
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	flw	f2, 0(r29)
	fmul	f1, f1, f2
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	tan.2894
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	flw	f2, 8(r29)
	fmul	f1, f1, f2
	jr	r31
calc_dirvec.2899:
	lw	r5, 4(r28)
	addi	r27, r0, 5
	sub	r27, r27, r2
	bgtz	r27, bge_else.8974
	sw	r4, 0(r29)
	sw	r5, 4(r29)
	sw	r3, 8(r29)
	fsw	f1, 16(r29)
	fsw	f2, 24(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_fsqr
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_fsqr
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 32(r29)
	fadd	f1, f2, f1
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f2, 0(r27)
	fadd	f1, f1, f2
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_sqrt
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	flw	f2, 16(r29)
	fdiv	f2, f2, f1
	flw	f3, 24(r29)
	fdiv	f3, f3, f1
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f4, 0(r27)
	fdiv	f1, f4, f1
	lw	r2, 8(r29)
	slti	r2, r2, 2
	lw	r3, 4(r29)
	lw	r2, r3, 0(r2)
	lw	r3, 0(r29)
	slti	r4, r3, 2
	lw	r4, r2, 0(r4)
	sw	r2, 40(r29)
	fsw	f1, 48(r29)
	fsw	f3, 56(r29)
	fsw	f2, 64(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	d_vec.2579
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f1, 64(r29)
	flw	f2, 56(r29)
	flw	f3, 48(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	vecset.2472
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	addi	r3, r2, 40
	slti	r3, r3, 2
	lw	r4, 40(r29)
	lw	r3, r4, 0(r3)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	d_vec.2579
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f1, 56(r29)
	sw	r2, 72(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_fneg
	addi	r29, r29, -80
	lw	r27, 76(r29)
	fmov	f3, f1
	add	r31, r27, r0
	flw	f1, 64(r29)
	flw	f2, 48(r29)
	lw	r2, 72(r29)
	add	r27, r31, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	vecset.2472
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	addi	r3, r2, 80
	slti	r3, r3, 2
	lw	r4, 40(r29)
	lw	r3, r4, 0(r3)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	d_vec.2579
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f1, 64(r29)
	sw	r2, 76(r29)
	add	r27, r31, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_fneg
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsw	f1, 80(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fneg
	addi	r29, r29, -96
	lw	r27, 92(r29)
	fmov	f3, f1
	add	r31, r27, r0
	flw	f1, 48(r29)
	flw	f2, 80(r29)
	lw	r2, 76(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	vecset.2472
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	addi	r3, r2, 1
	slti	r3, r3, 2
	lw	r4, 40(r29)
	lw	r3, r4, 0(r3)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	d_vec.2579
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f1, 64(r29)
	sw	r2, 88(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_fneg
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 56(r29)
	fsw	f1, 96(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_fneg
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fsw	f1, 104(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	min_caml_fneg
	addi	r29, r29, -120
	lw	r27, 116(r29)
	fmov	f3, f1
	add	r31, r27, r0
	flw	f1, 96(r29)
	flw	f2, 104(r29)
	lw	r2, 88(r29)
	add	r27, r31, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	vecset.2472
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	addi	r3, r2, 41
	slti	r3, r3, 2
	lw	r4, 40(r29)
	lw	r3, r4, 0(r3)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	d_vec.2579
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r31, r27, r0
	flw	f1, 64(r29)
	sw	r2, 112(r29)
	add	r27, r31, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	min_caml_fneg
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fsw	f1, 120(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	min_caml_fneg
	addi	r29, r29, -136
	lw	r27, 132(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 120(r29)
	flw	f3, 56(r29)
	lw	r2, 112(r29)
	add	r27, r31, r0
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	vecset.2472
	addi	r29, r29, -136
	lw	r27, 132(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	addi	r2, r2, 81
	slti	r2, r2, 2
	lw	r3, 40(r29)
	lw	r2, r3, 0(r2)
	add	r27, r31, r0
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	d_vec.2579
	addi	r29, r29, -136
	lw	r27, 132(r29)
	add	r31, r27, r0
	flw	f1, 48(r29)
	sw	r2, 128(r29)
	add	r27, r31, r0
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	min_caml_fneg
	addi	r29, r29, -136
	lw	r27, 132(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	flw	f3, 56(r29)
	lw	r2, 128(r29)
	j	vecset.2472
bge_else.8974:
	fsw	f3, 136(r29)
	sw	r4, 0(r29)
	sw	r3, 8(r29)
	sw	r28, 144(r29)
	fsw	f4, 152(r29)
	sw	r2, 160(r29)
	add	r27, r31, r0
	fmov	f1, f2
	fmov	f2, f3
	sw	r27, 164(r29)
	addi	r29, r29, 168
	jal	adjust_position.2896
	addi	r29, r29, -168
	lw	r27, 164(r29)
	add	r31, r27, r0
	lw	r2, 160(r29)
	addi	r2, r2, 1
	flw	f2, 152(r29)
	fsw	f1, 168(r29)
	sw	r2, 176(r29)
	add	r27, r31, r0
	sw	r27, 180(r29)
	addi	r29, r29, 184
	jal	adjust_position.2896
	addi	r29, r29, -184
	lw	r27, 180(r29)
	fmov	f2, f1
	add	r31, r27, r0
	flw	f1, 168(r29)
	flw	f3, 136(r29)
	flw	f4, 152(r29)
	lw	r2, 176(r29)
	lw	r3, 8(r29)
	lw	r4, 0(r29)
	lw	r28, 144(r29)
	lw	r1, 0(r28)
	jr	r1
calc_dirvecs.2907:
	lw	r5, 4(r28)
	addi	r6, r6, 0
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8982
	sw	r28, 0(r29)
	sw	r2, 4(r29)
	fsw	f1, 8(r29)
	sw	r4, 16(r29)
	sw	r3, 20(r29)
	sw	r6, 24(r29)
	sw	r5, 28(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_float_of_int
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6550)
	ori	r27, r27, lo16(l.6550)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6551)
	ori	r27, r27, lo16(l.6551)
	flw	f2, 0(r27)
	fsub	f3, f1, f2
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	flw	f4, 8(r29)
	lw	r2, 24(r29)
	lw	r3, 20(r29)
	lw	r4, 16(r29)
	lw	r28, 28(r29)
	add	r27, r31, r0
	fmov	f2, f1
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_float_of_int
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6550)
	ori	r27, r27, lo16(l.6550)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6438)
	ori	r27, r27, lo16(l.6438)
	flw	f2, 0(r27)
	fadd	f3, f1, f2
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	lw	r2, 16(r29)
	addi	r4, r2, 2
	flw	f4, 8(r29)
	lw	r3, 24(r29)
	lw	r5, 20(r29)
	lw	r28, 28(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r5, r0
	fmov	f2, f1
	sw	r27, 36(r29)
	addi	r29, r29, 40
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r2, r2, -1
	addi	r3, r3, 1
	lw	r4, 20(r29)
	sw	r2, 32(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	add_mod5.2469
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	flw	f1, 8(r29)
	lw	r2, 32(r29)
	lw	r4, 16(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8982:
	jr	r31
calc_dirvec_rows.2912:
	lw	r5, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8984
	sw	r28, 0(r29)
	sw	r2, 4(r29)
	sw	r4, 8(r29)
	sw	r3, 12(r29)
	sw	r5, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_float_of_int
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6550)
	ori	r27, r27, lo16(l.6550)
	flw	f2, 0(r27)
	fmul	f1, f1, f2
	lui	r27, ha16(l.6551)
	ori	r27, r27, lo16(l.6551)
	flw	f2, 0(r27)
	fsub	f1, f1, f2
	addi	r2, r2, 4
	lw	r3, 12(r29)
	lw	r4, 8(r29)
	lw	r28, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r2, r2, -1
	addi	r3, r3, 2
	lw	r4, 12(r29)
	sw	r2, 20(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	add_mod5.2469
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	addi	r4, r2, 4
	lw	r2, 20(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8984:
	jr	r31
create_dirvec.2916:
	lw	r2, 4(r28)
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 0(r29)
	lw	r2, 0(r2)
	sw	r3, 4(r29)
	add	r27, r31, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	add	r3, r30, r0
	addi	r30, r30, 8
	sw	r2, 4(r3)
	lw	r2, 4(r29)
	sw	r2, 0(r3)
	add	r2, r3, r0
	jr	r31
create_dirvec_elements.2918:
	lw	r4, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r3
	bgtz	r27, bge_else.8986
	sw	r28, 0(r29)
	sw	r2, 4(r29)
	sw	r3, 8(r29)
	add	r27, r31, r0
	add	r28, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	lw	r3, 8(r29)
	slti	r4, r3, 2
	lw	r5, 4(r29)
	sw	r2, r5, 0(r4)
	addi	r3, r3, -1
	lw	r28, 0(r29)
	add	r2, r5, r0
	lw	r1, 0(r28)
	jr	r1
bge_else.8986:
	jr	r31
create_dirvecs.2921:
	lw	r3, 12(r28)
	lw	r4, 8(r28)
	lw	r5, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8988
	addi	r6, r6, 120
	sw	r28, 0(r29)
	sw	r4, 4(r29)
	sw	r3, 8(r29)
	sw	r2, 12(r29)
	sw	r6, 16(r29)
	add	r27, r31, r0
	add	r28, r5, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_create_array
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lw	r3, 12(r29)
	slti	r4, r3, 2
	lw	r5, 8(r29)
	sw	r2, r5, 0(r4)
	slti	r2, r3, 2
	lw	r2, r5, 0(r2)
	addi	r4, r4, 118
	lw	r28, 4(r29)
	add	r27, r31, r0
	add	r3, r4, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	addi	r2, r2, -1
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8988:
	jr	r31
init_dirvec_constants.2923:
	lw	r4, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r3
	bgtz	r27, bge_else.8990
	slti	r5, r3, 2
	lw	r5, r2, 0(r5)
	sw	r2, 0(r29)
	sw	r28, 4(r29)
	sw	r3, 8(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	add	r28, r4, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	addi	r3, r2, -1
	lw	r2, 0(r29)
	lw	r28, 4(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8990:
	jr	r31
init_vecset_constants.2926:
	lw	r3, 8(r28)
	lw	r4, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.8992
	slti	r5, r2, 2
	lw	r4, r4, 0(r5)
	addi	r5, r5, 119
	sw	r28, 0(r29)
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r4, r0
	add	r28, r3, r0
	add	r3, r5, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r2, r2, -1
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
bge_else.8992:
	jr	r31
init_dirvecs.2928:
	lw	r2, 12(r28)
	lw	r3, 8(r28)
	lw	r4, 4(r28)
	addi	r5, r5, 4
	sw	r2, 0(r29)
	sw	r4, 4(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	add	r28, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 9
	addi	r3, r3, 0
	lw	r28, 4(r29)
	add	r27, r31, r0
	add	r4, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 4
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
add_reflection.2930:
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r28, 4(r28)
	sw	r5, 0(r29)
	sw	r2, 4(r29)
	sw	r3, 8(r29)
	fsw	f1, 16(r29)
	sw	r4, 24(r29)
	fsw	f4, 32(r29)
	fsw	f3, 40(r29)
	fsw	f2, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	sw	r2, 56(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	d_vec.2579
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f1, 48(r29)
	flw	f2, 40(r29)
	flw	f3, 32(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	vecset.2472
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 56(r29)
	lw	r28, 24(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	add	r2, r30, r0
	addi	r30, r30, 16
	flw	f1, 16(r29)
	fsw	f1, 8(r2)
	lw	r3, 56(r29)
	sw	r3, 4(r2)
	lw	r3, 8(r29)
	sw	r3, 0(r2)
	lw	r3, 4(r29)
	slti	r3, r3, 2
	lw	r4, 0(r29)
	sw	r2, r4, 0(r3)
	jr	r31
setup_rect_reflection.2937:
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
#nop
	lw	r7, 0(r4)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	sw	r4, 0(r29)
	sw	r7, 4(r29)
	sw	r6, 8(r29)
	sw	r2, 12(r29)
	sw	r5, 16(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_diffuse.2542
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsub	f1, f2, f1
	lw	r2, 16(r29)
	flw	f2, 0(r2)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_fneg
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	flw	f2, 8(r2)
	fsw	f1, 40(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_fneg
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	lw	r2, 16(r29)
	flw	f2, 16(r2)
	fsw	f1, 48(r29)
	add	r27, r31, r0
	fmov	f1, f2
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_fneg
	addi	r29, r29, -64
	lw	r27, 60(r29)
	fmov	f4, f1
	add	r31, r27, r0
	lw	r2, 12(r29)
	addi	r3, r2, 1
	lw	r4, 16(r29)
	flw	f2, 0(r4)
	flw	f1, 32(r29)
	flw	f3, 48(r29)
	lw	r5, 4(r29)
	lw	r28, 8(r29)
	fsw	f4, 56(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r3, r2, 1
	lw	r4, 12(r29)
	addi	r5, r4, 2
	lw	r6, 16(r29)
	flw	f3, 8(r6)
	flw	f1, 32(r29)
	flw	f2, 40(r29)
	flw	f4, 56(r29)
	lw	r28, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r5, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r3, r2, 2
	lw	r4, 12(r29)
	addi	r4, r4, 3
	lw	r5, 16(r29)
	flw	f4, 16(r5)
	flw	f1, 32(r29)
	flw	f2, 40(r29)
	flw	f3, 48(r29)
	lw	r28, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 4(r29)
	addi	r2, r2, 3
	lw	r3, 0(r29)
	sw	r2, 0(r3)
	jr	r31
setup_surface_reflection.2940:
	lw	r4, 12(r28)
	lw	r5, 8(r28)
	lw	r6, 4(r28)
#nop
	addi	r2, r2, 1
	lw	r7, 0(r4)
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f1, 0(r27)
	sw	r4, 0(r29)
	sw	r2, 4(r29)
	sw	r7, 8(r29)
	sw	r6, 12(r29)
	sw	r5, 16(r29)
	sw	r3, 20(r29)
	fsw	f1, 24(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	o_diffuse.2542
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	flw	f2, 24(r29)
	fsub	f1, f2, f1
	lw	r2, 20(r29)
	fsw	f1, 32(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	o_param_abc.2534
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 16(r29)
	add	r27, r31, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	veciprod.2493
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.6118)
	ori	r27, r27, lo16(l.6118)
	flw	f2, 0(r27)
	lw	r2, 20(r29)
	fsw	f1, 40(r29)
	fsw	f2, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	o_param_a.2528
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fmul	f1, f2, f1
	flw	f2, 40(r29)
	fmul	f1, f1, f2
	lw	r2, 16(r29)
	flw	f3, 0(r2)
	fsub	f1, f1, f3
	lui	r27, ha16(l.6118)
	ori	r27, r27, lo16(l.6118)
	flw	f3, 0(r27)
	lw	r3, 20(r29)
	fsw	f1, 56(r29)
	fsw	f3, 64(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	o_param_b.2530
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	flw	f2, 64(r29)
	fmul	f1, f2, f1
	flw	f2, 40(r29)
	fmul	f1, f1, f2
	lw	r2, 16(r29)
	flw	f3, 8(r2)
	fsub	f1, f1, f3
	lui	r27, ha16(l.6118)
	ori	r27, r27, lo16(l.6118)
	flw	f3, 0(r27)
	lw	r3, 20(r29)
	fsw	f1, 72(r29)
	fsw	f3, 80(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	o_param_c.2532
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	flw	f2, 80(r29)
	fmul	f1, f2, f1
	flw	f2, 40(r29)
	fmul	f1, f1, f2
	lw	r2, 16(r29)
	flw	f2, 16(r2)
	fsub	f4, f1, f2
	flw	f1, 32(r29)
	flw	f2, 56(r29)
	flw	f3, 72(r29)
	lw	r2, 8(r29)
	lw	r3, 4(r29)
	lw	r28, 12(r29)
	add	r27, r31, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 8(r29)
	addi	r2, r2, 1
	lw	r3, 0(r29)
	sw	r2, 0(r3)
	jr	r31
setup_reflections.2943:
	lw	r3, 12(r28)
	lw	r4, 8(r28)
	lw	r5, 4(r28)
	addi	r27, r0, 0
	sub	r27, r27, r2
	bgtz	r27, bge_else.9000
	slti	r6, r2, 2
	lw	r5, r5, 0(r6)
	sw	r3, 0(r29)
	sw	r2, 4(r29)
	sw	r4, 8(r29)
	sw	r5, 12(r29)
	add	r27, r31, r0
	add	r2, r5, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_reflectiontype.2522
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 2
	bne	r2, r27, beq_else.9001
	lw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_diffuse.2542
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	lui	r27, ha16(l.5994)
	ori	r27, r27, lo16(l.5994)
	flw	f2, 0(r27)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_fless
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 0
	bne	r2, r27, beq_else.9002
	jr	r31
beq_else.9002:
	lw	r2, 12(r29)
	add	r27, r31, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	o_form.2520
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r27, r0, 1
	bne	r2, r27, beq_else.9004
	lw	r2, 4(r29)
	lw	r3, 12(r29)
	lw	r28, 8(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.9004:
	addi	r27, r0, 2
	bne	r2, r27, beq_else.9005
	lw	r2, 4(r29)
	lw	r3, 12(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
beq_else.9005:
	jr	r31
beq_else.9001:
	jr	r31
bge_else.9000:
	jr	r31
rt.2945:
	lw	r4, 56(r28)
	lw	r5, 52(r28)
	lw	r6, 48(r28)
	lw	r7, 44(r28)
	lw	r8, 40(r28)
	lw	r9, 36(r28)
	lw	r10, 32(r28)
	lw	r11, 28(r28)
	lw	r12, 24(r28)
	lw	r13, 20(r28)
	lw	r14, 16(r28)
	lw	r15, 12(r28)
	lw	r16, 8(r28)
	lw	r17, 4(r28)
	sw	r2, 0(r15)
	sw	r3, 4(r15)
#nop
	sw	r15, 0(r16)
#nop
	sw	r3, 4(r16)
	lui	r27, ha16(l.6584)
	ori	r27, r27, lo16(l.6584)
	flw	f1, 0(r27)
	sw	r8, 0(r29)
	sw	r10, 4(r29)
	sw	r5, 8(r29)
	sw	r11, 12(r29)
	sw	r6, 16(r29)
	sw	r13, 20(r29)
	sw	r12, 24(r29)
	sw	r14, 28(r29)
	sw	r4, 32(r29)
	sw	r9, 36(r29)
	sw	r17, 40(r29)
	sw	r7, 44(r29)
	fsw	f1, 48(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_float_of_int
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	flw	f2, 48(r29)
	fdiv	f1, f2, f1
	lw	r2, 44(r29)
	fsw	f1, 0(r2)
	lw	r28, 40(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r28, 40(r29)
	sw	r2, 56(r29)
	add	r27, r31, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	lw	r28, 40(r29)
	sw	r2, 60(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r28, 36(r29)
	sw	r2, 64(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r28, 32(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r28, 28(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	d_vec.2579
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	lw	r3, 20(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	veccpy.2482
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 24(r29)
	lw	r28, 16(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	lw	r2, 12(r29)
	lw	r2, 0(r2)
	addi	r2, r2, -1
	lw	r28, 8(r29)
	add	r27, r31, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r3, r3, 0
	lw	r2, 60(r29)
	lw	r28, 4(r29)
	add	r27, r31, r0
	add	r4, r3, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r0, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 0
	addi	r6, r6, 2
	lw	r3, 56(r29)
	lw	r4, 60(r29)
	lw	r5, 64(r29)
	lw	r28, 0(r29)
	lw	r1, 0(r28)
	jr	r1
_min_caml_start: # main entry point
	add	r27, r31, r0
	sw	r28, -8(r29)
	sw	r27, 8(r29)
	sw	r29, -96(r29)
#	main program starts
	addi	r2, r2, 1
	addi	r3, r3, 0
	add	r27, r31, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 0(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_float_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r3, r3, 60
	addi	r4, r4, 0
	add	r5, r30, r0
	addi	r30, r30, 48
	sw	r2, 40(r5)
	sw	r2, 36(r5)
	sw	r2, 32(r5)
	sw	r2, 28(r5)
	sw	r4, 24(r5)
	sw	r2, 20(r5)
	sw	r2, 16(r5)
	sw	r4, 12(r5)
	sw	r4, 8(r5)
	sw	r4, 4(r5)
	sw	r4, 0(r5)
	add	r2, r5, r0
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	sw	r27, 4(r29)
	addi	r29, r29, 8
	jal	min_caml_create_array
	addi	r29, r29, -8
	lw	r27, 4(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 4(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_float_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 8(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 12(r29)
	addi	r29, r29, 16
	jal	min_caml_create_float_array
	addi	r29, r29, -16
	lw	r27, 12(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 12(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_create_float_array
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	lui	r27, ha16(l.6397)
	ori	r27, r27, lo16(l.6397)
	flw	f1, 0(r27)
	sw	r2, 16(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 20(r29)
	addi	r29, r29, 24
	jal	min_caml_create_float_array
	addi	r29, r29, -24
	lw	r27, 20(r29)
	add	r31, r27, r0
	addi	r3, r3, 50
	addi	r4, r4, 1
	addi	r5, r5, -1
	sw	r2, 20(r29)
	sw	r3, 24(r29)
	add	r27, r31, r0
	add	r3, r5, r0
	add	r2, r4, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_create_array
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 24(r29)
	add	r27, r31, r0
	sw	r27, 28(r29)
	addi	r29, r29, 32
	jal	min_caml_create_array
	addi	r29, r29, -32
	lw	r27, 28(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	lw	r4, 0(r2)
	sw	r2, 28(r29)
	sw	r3, 32(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_create_array
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	lw	r2, 32(r29)
	add	r27, r31, r0
	sw	r27, 36(r29)
	addi	r29, r29, 40
	jal	min_caml_create_array
	addi	r29, r29, -40
	lw	r27, 36(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 36(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_create_float_array
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	addi	r4, r4, 0
	sw	r2, 40(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 44(r29)
	addi	r29, r29, 48
	jal	min_caml_create_array
	addi	r29, r29, -48
	lw	r27, 44(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	lui	r27, ha16(l.6343)
	ori	r27, r27, lo16(l.6343)
	flw	f1, 0(r27)
	sw	r2, 44(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_create_float_array
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 48(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 52(r29)
	addi	r29, r29, 56
	jal	min_caml_create_float_array
	addi	r29, r29, -56
	lw	r27, 52(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	addi	r4, r4, 0
	sw	r2, 52(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_create_array
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 56(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 60(r29)
	addi	r29, r29, 64
	jal	min_caml_create_float_array
	addi	r29, r29, -64
	lw	r27, 60(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 60(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_create_float_array
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 64(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 68(r29)
	addi	r29, r29, 72
	jal	min_caml_create_float_array
	addi	r29, r29, -72
	lw	r27, 68(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 68(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_create_float_array
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r3, r3, 2
	addi	r4, r4, 0
	sw	r2, 72(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 76(r29)
	addi	r29, r29, 80
	jal	min_caml_create_array
	addi	r29, r29, -80
	lw	r27, 76(r29)
	add	r31, r27, r0
	addi	r3, r3, 2
	addi	r4, r4, 0
	sw	r2, 76(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_create_array
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 80(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 84(r29)
	addi	r29, r29, 88
	jal	min_caml_create_float_array
	addi	r29, r29, -88
	lw	r27, 84(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 84(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_create_float_array
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 88(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 92(r29)
	addi	r29, r29, 96
	jal	min_caml_create_float_array
	addi	r29, r29, -96
	lw	r27, 92(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 92(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_create_float_array
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 96(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 100(r29)
	addi	r29, r29, 104
	jal	min_caml_create_float_array
	addi	r29, r29, -104
	lw	r27, 100(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 100(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_create_float_array
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 104(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 108(r29)
	addi	r29, r29, 112
	jal	min_caml_create_float_array
	addi	r29, r29, -112
	lw	r27, 108(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 108(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	min_caml_create_float_array
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 0
	sw	r3, 112(r29)
	add	r27, r31, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	min_caml_create_array
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	add	r4, r30, r0
	addi	r30, r30, 8
	sw	r2, 4(r4)
	lw	r2, 112(r29)
	sw	r2, 0(r4)
	add	r2, r4, r0
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	min_caml_create_array
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 5
	add	r27, r31, r0
	sw	r27, 116(r29)
	addi	r29, r29, 120
	jal	min_caml_create_array
	addi	r29, r29, -120
	lw	r27, 116(r29)
	add	r31, r27, r0
	addi	r3, r3, 0
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 116(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	min_caml_create_float_array
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	addi	r3, r3, 3
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 120(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 124(r29)
	addi	r29, r29, 128
	jal	min_caml_create_float_array
	addi	r29, r29, -128
	lw	r27, 124(r29)
	add	r31, r27, r0
	addi	r3, r3, 60
	lw	r4, 120(r29)
	sw	r2, 124(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	min_caml_create_array
	addi	r29, r29, -136
	lw	r27, 132(r29)
	add	r31, r27, r0
	add	r3, r30, r0
	addi	r30, r30, 8
	sw	r2, 4(r3)
	lw	r2, 124(r29)
	sw	r2, 0(r3)
	add	r2, r3, r0
	addi	r3, r3, 0
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	sw	r2, 128(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	sw	r27, 132(r29)
	addi	r29, r29, 136
	jal	min_caml_create_float_array
	addi	r29, r29, -136
	lw	r27, 132(r29)
	add	r3, r2, r0
	add	r31, r27, r0
	addi	r2, r2, 0
	sw	r3, 132(r29)
	add	r27, r31, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	jal	min_caml_create_array
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r31, r27, r0
	add	r3, r30, r0
	addi	r30, r30, 8
	sw	r2, 4(r3)
	lw	r2, 132(r29)
	sw	r2, 0(r3)
	add	r2, r3, r0
	addi	r3, r3, 180
	addi	r4, r4, 0
	lui	r27, ha16(l.5993)
	ori	r27, r27, lo16(l.5993)
	flw	f1, 0(r27)
	add	r5, r30, r0
	addi	r30, r30, 16
	fsw	f1, 8(r5)
	sw	r2, 4(r5)
	sw	r4, 0(r5)
	add	r2, r5, r0
	add	r27, r31, r0
	add	r1, r3, r0
	add	r3, r2, r0
	add	r2, r1, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	jal	min_caml_create_array
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r31, r27, r0
	addi	r3, r3, 1
	addi	r4, r4, 0
	sw	r2, 136(r29)
	add	r27, r31, r0
	add	r2, r3, r0
	add	r3, r4, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	jal	min_caml_create_array
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r31, r27, r0
	add	r3, r30, r0
	addi	r30, r30, 24
	lui	r4, ha16(read_screen_settings.2591)
	ori	r4, r4, lo16(read_screen_settings.2591)
	sw	r4, 0(r3)
	lw	r4, 12(r29)
	sw	r4, 20(r3)
	lw	r5, 104(r29)
	sw	r5, 16(r3)
	lw	r6, 100(r29)
	sw	r6, 12(r3)
	lw	r7, 96(r29)
	sw	r7, 8(r3)
	lw	r8, 8(r29)
	sw	r8, 4(r3)
	add	r8, r30, r0
	addi	r30, r30, 16
	lui	r9, ha16(read_light.2593)
	ori	r9, r9, lo16(read_light.2593)
	sw	r9, 0(r8)
	lw	r9, 16(r29)
	sw	r9, 8(r8)
	lw	r10, 20(r29)
	sw	r10, 4(r8)
	add	r11, r30, r0
	addi	r30, r30, 8
	lui	r12, ha16(read_nth_object.2598)
	ori	r12, r12, lo16(read_nth_object.2598)
	sw	r12, 0(r11)
	lw	r12, 4(r29)
	sw	r12, 4(r11)
	add	r13, r30, r0
	addi	r30, r30, 16
	lui	r14, ha16(read_object.2600)
	ori	r14, r14, lo16(read_object.2600)
	sw	r14, 0(r13)
	sw	r11, 8(r13)
	lw	r11, 0(r29)
	sw	r11, 4(r13)
	add	r14, r30, r0
	addi	r30, r30, 8
	lui	r15, ha16(read_all_object.2602)
	ori	r15, r15, lo16(read_all_object.2602)
	sw	r15, 0(r14)
	sw	r13, 4(r14)
	add	r13, r30, r0
	addi	r30, r30, 8
	lui	r15, ha16(read_and_network.2608)
	ori	r15, r15, lo16(read_and_network.2608)
	sw	r15, 0(r13)
	lw	r15, 28(r29)
	sw	r15, 4(r13)
	add	r16, r30, r0
	addi	r30, r30, 24
	lui	r17, ha16(read_parameter.2610)
	ori	r17, r17, lo16(read_parameter.2610)
	sw	r17, 0(r16)
	sw	r3, 20(r16)
	sw	r8, 16(r16)
	sw	r13, 12(r16)
	sw	r14, 8(r16)
	lw	r3, 36(r29)
	sw	r3, 4(r16)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r13, ha16(solver_rect_surface.2612)
	ori	r13, r13, lo16(solver_rect_surface.2612)
	sw	r13, 0(r8)
	lw	r13, 40(r29)
	sw	r13, 4(r8)
	add	r14, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(solver_rect.2621)
	ori	r17, r17, lo16(solver_rect.2621)
	sw	r17, 0(r14)
	sw	r8, 4(r14)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(solver_surface.2627)
	ori	r17, r17, lo16(solver_surface.2627)
	sw	r17, 0(r8)
	sw	r13, 4(r8)
	add	r17, r30, r0
	addi	r30, r30, 8
	lui	r18, ha16(solver_second.2646)
	ori	r18, r18, lo16(solver_second.2646)
	sw	r18, 0(r17)
	sw	r13, 4(r17)
	add	r18, r30, r0
	addi	r30, r30, 24
	lui	r19, ha16(solver.2652)
	ori	r19, r19, lo16(solver.2652)
	sw	r19, 0(r18)
	sw	r8, 16(r18)
	sw	r17, 12(r18)
	sw	r14, 8(r18)
	sw	r12, 4(r18)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r14, ha16(solver_rect_fast.2656)
	ori	r14, r14, lo16(solver_rect_fast.2656)
	sw	r14, 0(r8)
	sw	r13, 4(r8)
	add	r14, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(solver_surface_fast.2663)
	ori	r17, r17, lo16(solver_surface_fast.2663)
	sw	r17, 0(r14)
	sw	r13, 4(r14)
	add	r17, r30, r0
	addi	r30, r30, 8
	lui	r19, ha16(solver_second_fast.2669)
	ori	r19, r19, lo16(solver_second_fast.2669)
	sw	r19, 0(r17)
	sw	r13, 4(r17)
	add	r19, r30, r0
	addi	r30, r30, 24
	lui	r20, ha16(solver_fast.2675)
	ori	r20, r20, lo16(solver_fast.2675)
	sw	r20, 0(r19)
	sw	r14, 16(r19)
	sw	r17, 12(r19)
	sw	r8, 8(r19)
	sw	r12, 4(r19)
	add	r14, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(solver_surface_fast2.2679)
	ori	r17, r17, lo16(solver_surface_fast2.2679)
	sw	r17, 0(r14)
	sw	r13, 4(r14)
	add	r17, r30, r0
	addi	r30, r30, 8
	lui	r20, ha16(solver_second_fast2.2686)
	ori	r20, r20, lo16(solver_second_fast2.2686)
	sw	r20, 0(r17)
	sw	r13, 4(r17)
	add	r20, r30, r0
	addi	r30, r30, 24
	lui	r21, ha16(solver_fast2.2693)
	ori	r21, r21, lo16(solver_fast2.2693)
	sw	r21, 0(r20)
	sw	r14, 16(r20)
	sw	r17, 12(r20)
	sw	r8, 8(r20)
	sw	r12, 4(r20)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r14, ha16(iter_setup_dirvec_constants.2705)
	ori	r14, r14, lo16(iter_setup_dirvec_constants.2705)
	sw	r14, 0(r8)
	sw	r12, 4(r8)
	add	r14, r30, r0
	addi	r30, r30, 16
	lui	r17, ha16(setup_dirvec_constants.2708)
	ori	r17, r17, lo16(setup_dirvec_constants.2708)
	sw	r17, 0(r14)
	sw	r11, 8(r14)
	sw	r8, 4(r14)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(setup_startp_constants.2710)
	ori	r17, r17, lo16(setup_startp_constants.2710)
	sw	r17, 0(r8)
	sw	r12, 4(r8)
	add	r17, r30, r0
	addi	r30, r30, 16
	lui	r21, ha16(setup_startp.2713)
	ori	r21, r21, lo16(setup_startp.2713)
	sw	r21, 0(r17)
	lw	r21, 92(r29)
	sw	r21, 12(r17)
	sw	r8, 8(r17)
	sw	r11, 4(r17)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r22, ha16(check_all_inside.2735)
	ori	r22, r22, lo16(check_all_inside.2735)
	sw	r22, 0(r8)
	sw	r12, 4(r8)
	add	r22, r30, r0
	addi	r30, r30, 32
	lui	r23, ha16(shadow_check_and_group.2741)
	ori	r23, r23, lo16(shadow_check_and_group.2741)
	sw	r23, 0(r22)
	sw	r19, 28(r22)
	sw	r13, 24(r22)
	sw	r12, 20(r22)
	lw	r23, 128(r29)
	sw	r23, 16(r22)
	sw	r9, 12(r22)
	lw	r24, 52(r29)
	sw	r24, 8(r22)
	sw	r8, 4(r22)
	add	r25, r30, r0
	addi	r30, r30, 16
	lui	r26, ha16(shadow_check_one_or_group.2744)
	ori	r26, r26, lo16(shadow_check_one_or_group.2744)
	sw	r26, 0(r25)
	sw	r22, 8(r25)
	sw	r15, 4(r25)
	add	r22, r30, r0
	addi	r30, r30, 24
	lui	r26, ha16(shadow_check_one_or_matrix.2747)
	ori	r26, r26, lo16(shadow_check_one_or_matrix.2747)
	sw	r26, 0(r22)
	sw	r19, 20(r22)
	sw	r13, 16(r22)
	sw	r25, 12(r22)
	sw	r23, 8(r22)
	sw	r24, 4(r22)
	add	r19, r30, r0
	addi	r30, r30, 40
	lui	r25, ha16(solve_each_element.2750)
	ori	r25, r25, lo16(solve_each_element.2750)
	sw	r25, 0(r19)
	lw	r25, 48(r29)
	sw	r25, 36(r19)
	lw	r26, 88(r29)
	sw	r26, 32(r19)
	sw	r13, 28(r19)
	sw	r18, 24(r19)
	sw	r12, 20(r19)
	lw	r0, 44(r29)
	sw	r0, 16(r19)
	sw	r24, 12(r19)
	lw	r1, 56(r29)
	sw	r1, 8(r19)
	sw	r8, 4(r19)
	add	r27, r30, r0
	addi	r30, r30, 16
	lui	r28, ha16(solve_one_or_network.2754)
	ori	r28, r28, lo16(solve_one_or_network.2754)
	sw	r28, 0(r27)
	sw	r19, 8(r27)
	sw	r15, 4(r27)
	add	r19, r30, r0
	addi	r30, r30, 24
	lui	r28, ha16(trace_or_matrix.2758)
	ori	r28, r28, lo16(trace_or_matrix.2758)
	sw	r28, 0(r19)
	sw	r25, 20(r19)
	sw	r26, 16(r19)
	sw	r13, 12(r19)
	sw	r18, 8(r19)
	sw	r27, 4(r19)
	add	r18, r30, r0
	addi	r30, r30, 16
	lui	r27, ha16(judge_intersection.2762)
	ori	r27, r27, lo16(judge_intersection.2762)
	sw	r27, 0(r18)
	sw	r19, 12(r18)
	sw	r25, 8(r18)
	sw	r3, 4(r18)
	add	r19, r30, r0
	addi	r30, r30, 40
	lui	r27, ha16(solve_each_element_fast.2764)
	ori	r27, r27, lo16(solve_each_element_fast.2764)
	sw	r27, 0(r19)
	sw	r25, 36(r19)
	sw	r21, 32(r19)
	sw	r20, 28(r19)
	sw	r13, 24(r19)
	sw	r12, 20(r19)
	sw	r0, 16(r19)
	sw	r24, 12(r19)
	sw	r1, 8(r19)
	sw	r8, 4(r19)
	add	r8, r30, r0
	addi	r30, r30, 16
	lui	r21, ha16(solve_one_or_network_fast.2768)
	ori	r21, r21, lo16(solve_one_or_network_fast.2768)
	sw	r21, 0(r8)
	sw	r19, 8(r8)
	sw	r15, 4(r8)
	add	r15, r30, r0
	addi	r30, r30, 24
	lui	r19, ha16(trace_or_matrix_fast.2772)
	ori	r19, r19, lo16(trace_or_matrix_fast.2772)
	sw	r19, 0(r15)
	sw	r25, 16(r15)
	sw	r20, 12(r15)
	sw	r13, 8(r15)
	sw	r8, 4(r15)
	add	r8, r30, r0
	addi	r30, r30, 16
	lui	r13, ha16(judge_intersection_fast.2776)
	ori	r13, r13, lo16(judge_intersection_fast.2776)
	sw	r13, 0(r8)
	sw	r15, 12(r8)
	sw	r25, 8(r8)
	sw	r3, 4(r8)
	add	r13, r30, r0
	addi	r30, r30, 16
	lui	r15, ha16(get_nvector_rect.2778)
	ori	r15, r15, lo16(get_nvector_rect.2778)
	sw	r15, 0(r13)
	lw	r15, 60(r29)
	sw	r15, 8(r13)
	sw	r0, 4(r13)
	add	r19, r30, r0
	addi	r30, r30, 8
	lui	r20, ha16(get_nvector_plane.2780)
	ori	r20, r20, lo16(get_nvector_plane.2780)
	sw	r20, 0(r19)
	sw	r15, 4(r19)
	add	r20, r30, r0
	addi	r30, r30, 16
	lui	r21, ha16(get_nvector_second.2782)
	ori	r21, r21, lo16(get_nvector_second.2782)
	sw	r21, 0(r20)
	sw	r15, 8(r20)
	sw	r24, 4(r20)
	add	r21, r30, r0
	addi	r30, r30, 16
	lui	r27, ha16(get_nvector.2784)
	ori	r27, r27, lo16(get_nvector.2784)
	sw	r27, 0(r21)
	sw	r20, 12(r21)
	sw	r13, 8(r21)
	sw	r19, 4(r21)
	add	r13, r30, r0
	addi	r30, r30, 8
	lui	r19, ha16(utexture.2787)
	ori	r19, r19, lo16(utexture.2787)
	sw	r19, 0(r13)
	lw	r19, 64(r29)
	sw	r19, 4(r13)
	add	r20, r30, r0
	addi	r30, r30, 16
	lui	r27, ha16(add_light.2790)
	ori	r27, r27, lo16(add_light.2790)
	sw	r27, 0(r20)
	sw	r19, 8(r20)
	lw	r27, 72(r29)
	sw	r27, 4(r20)
	add	r28, r30, r0
	addi	r30, r30, 40
	lui	r29, ha16(trace_reflections.2794)
	ori	r29, r29, lo16(trace_reflections.2794)
	sw	r29, 0(r28)
	sw	r22, 32(r28)
	lw	r29, 136(r29)
	sw	r29, 28(r28)
	sw	r3, 24(r28)
	sw	r15, 20(r28)
	sw	r8, 16(r28)
	sw	r0, 12(r28)
	sw	r1, 8(r28)
	sw	r20, 4(r28)
	add	r31, r30, r0
	addi	r30, r30, 88
	lui	r23, ha16(trace_ray.2799)
	ori	r23, r23, lo16(trace_ray.2799)
	sw	r23, 0(r31)
	sw	r13, 80(r31)
	sw	r28, 76(r31)
	sw	r25, 72(r31)
	sw	r19, 68(r31)
	sw	r26, 64(r31)
	sw	r22, 60(r31)
	sw	r17, 56(r31)
	sw	r27, 52(r31)
	sw	r3, 48(r31)
	sw	r12, 44(r31)
	sw	r15, 40(r31)
	sw	r2, 36(r31)
	sw	r9, 32(r31)
	sw	r18, 28(r31)
	sw	r0, 24(r31)
	sw	r24, 20(r31)
	sw	r1, 16(r31)
	sw	r21, 12(r31)
	sw	r10, 8(r31)
	sw	r20, 4(r31)
	add	r10, r30, r0
	addi	r30, r30, 56
	lui	r18, ha16(trace_diffuse_ray.2805)
	ori	r18, r18, lo16(trace_diffuse_ray.2805)
	sw	r18, 0(r10)
	sw	r13, 48(r10)
	sw	r19, 44(r10)
	sw	r22, 40(r10)
	sw	r3, 36(r10)
	sw	r12, 32(r10)
	sw	r15, 28(r10)
	sw	r9, 24(r10)
	sw	r8, 20(r10)
	sw	r24, 16(r10)
	sw	r1, 12(r10)
	sw	r21, 8(r10)
	lw	r3, 68(r29)
	sw	r3, 4(r10)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r13, ha16(iter_trace_diffuse_rays.2808)
	ori	r13, r13, lo16(iter_trace_diffuse_rays.2808)
	sw	r13, 0(r8)
	sw	r10, 4(r8)
	add	r10, r30, r0
	addi	r30, r30, 16
	lui	r13, ha16(trace_diffuse_rays.2813)
	ori	r13, r13, lo16(trace_diffuse_rays.2813)
	sw	r13, 0(r10)
	sw	r17, 8(r10)
	sw	r8, 4(r10)
	add	r8, r30, r0
	addi	r30, r30, 16
	lui	r13, ha16(trace_diffuse_ray_80percent.2817)
	ori	r13, r13, lo16(trace_diffuse_ray_80percent.2817)
	sw	r13, 0(r8)
	sw	r10, 8(r8)
	lw	r13, 116(r29)
	sw	r13, 4(r8)
	add	r15, r30, r0
	addi	r30, r30, 16
	lui	r17, ha16(calc_diffuse_using_1point.2821)
	ori	r17, r17, lo16(calc_diffuse_using_1point.2821)
	sw	r17, 0(r15)
	sw	r8, 12(r15)
	sw	r27, 8(r15)
	sw	r3, 4(r15)
	add	r8, r30, r0
	addi	r30, r30, 16
	lui	r17, ha16(calc_diffuse_using_5points.2824)
	ori	r17, r17, lo16(calc_diffuse_using_5points.2824)
	sw	r17, 0(r8)
	sw	r27, 8(r8)
	sw	r3, 4(r8)
	add	r17, r30, r0
	addi	r30, r30, 8
	lui	r18, ha16(do_without_neighbors.2830)
	ori	r18, r18, lo16(do_without_neighbors.2830)
	sw	r18, 0(r17)
	sw	r15, 4(r17)
	add	r15, r30, r0
	addi	r30, r30, 8
	lui	r18, ha16(neighbors_exist.2833)
	ori	r18, r18, lo16(neighbors_exist.2833)
	sw	r18, 0(r15)
	lw	r18, 76(r29)
	sw	r18, 4(r15)
	add	r19, r30, r0
	addi	r30, r30, 16
	lui	r20, ha16(try_exploit_neighbors.2846)
	ori	r20, r20, lo16(try_exploit_neighbors.2846)
	sw	r20, 0(r19)
	sw	r17, 8(r19)
	sw	r8, 4(r19)
	add	r8, r30, r0
	addi	r30, r30, 8
	lui	r20, ha16(write_ppm_header.2853)
	ori	r20, r20, lo16(write_ppm_header.2853)
	sw	r20, 0(r8)
	sw	r18, 4(r8)
	add	r20, r30, r0
	addi	r30, r30, 8
	lui	r21, ha16(write_rgb.2857)
	ori	r21, r21, lo16(write_rgb.2857)
	sw	r21, 0(r20)
	sw	r27, 4(r20)
	add	r21, r30, r0
	addi	r30, r30, 16
	lui	r22, ha16(pretrace_diffuse_rays.2859)
	ori	r22, r22, lo16(pretrace_diffuse_rays.2859)
	sw	r22, 0(r21)
	sw	r10, 12(r21)
	sw	r13, 8(r21)
	sw	r3, 4(r21)
	add	r3, r30, r0
	addi	r30, r30, 40
	lui	r10, ha16(pretrace_pixels.2862)
	ori	r10, r10, lo16(pretrace_pixels.2862)
	sw	r10, 0(r3)
	sw	r4, 36(r3)
	sw	r31, 32(r3)
	sw	r26, 28(r3)
	sw	r7, 24(r3)
	lw	r4, 84(r29)
	sw	r4, 20(r3)
	sw	r27, 16(r3)
	lw	r7, 108(r29)
	sw	r7, 12(r3)
	sw	r21, 8(r3)
	lw	r7, 80(r29)
	sw	r7, 4(r3)
	add	r10, r30, r0
	addi	r30, r30, 32
	lui	r21, ha16(pretrace_line.2869)
	ori	r21, r21, lo16(pretrace_line.2869)
	sw	r21, 0(r10)
	sw	r5, 24(r10)
	sw	r6, 20(r10)
	sw	r4, 16(r10)
	sw	r3, 12(r10)
	sw	r18, 8(r10)
	sw	r7, 4(r10)
	add	r3, r30, r0
	addi	r30, r30, 32
	lui	r5, ha16(scan_pixel.2873)
	ori	r5, r5, lo16(scan_pixel.2873)
	sw	r5, 0(r3)
	sw	r20, 24(r3)
	sw	r19, 20(r3)
	sw	r27, 16(r3)
	sw	r15, 12(r3)
	sw	r18, 8(r3)
	sw	r17, 4(r3)
	add	r5, r30, r0
	addi	r30, r30, 16
	lui	r6, ha16(scan_line.2879)
	ori	r6, r6, lo16(scan_line.2879)
	sw	r6, 0(r5)
	sw	r3, 12(r5)
	sw	r10, 8(r5)
	sw	r18, 4(r5)
	add	r3, r30, r0
	addi	r30, r30, 8
	lui	r6, ha16(create_pixelline.2892)
	ori	r6, r6, lo16(create_pixelline.2892)
	sw	r6, 0(r3)
	sw	r18, 4(r3)
	add	r6, r30, r0
	addi	r30, r30, 8
	lui	r15, ha16(calc_dirvec.2899)
	ori	r15, r15, lo16(calc_dirvec.2899)
	sw	r15, 0(r6)
	sw	r13, 4(r6)
	add	r15, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(calc_dirvecs.2907)
	ori	r17, r17, lo16(calc_dirvecs.2907)
	sw	r17, 0(r15)
	sw	r6, 4(r15)
	add	r6, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(calc_dirvec_rows.2912)
	ori	r17, r17, lo16(calc_dirvec_rows.2912)
	sw	r17, 0(r6)
	sw	r15, 4(r6)
	add	r15, r30, r0
	addi	r30, r30, 8
	lui	r17, ha16(create_dirvec.2916)
	ori	r17, r17, lo16(create_dirvec.2916)
	sw	r17, 0(r15)
	sw	r11, 4(r15)
	add	r17, r30, r0
	addi	r30, r30, 8
	lui	r19, ha16(create_dirvec_elements.2918)
	ori	r19, r19, lo16(create_dirvec_elements.2918)
	sw	r19, 0(r17)
	sw	r15, 4(r17)
	add	r19, r30, r0
	addi	r30, r30, 16
	lui	r20, ha16(create_dirvecs.2921)
	ori	r20, r20, lo16(create_dirvecs.2921)
	sw	r20, 0(r19)
	sw	r13, 12(r19)
	sw	r17, 8(r19)
	sw	r15, 4(r19)
	add	r17, r30, r0
	addi	r30, r30, 8
	lui	r20, ha16(init_dirvec_constants.2923)
	ori	r20, r20, lo16(init_dirvec_constants.2923)
	sw	r20, 0(r17)
	sw	r14, 4(r17)
	add	r20, r30, r0
	addi	r30, r30, 16
	lui	r21, ha16(init_vecset_constants.2926)
	ori	r21, r21, lo16(init_vecset_constants.2926)
	sw	r21, 0(r20)
	sw	r17, 8(r20)
	sw	r13, 4(r20)
	add	r13, r30, r0
	addi	r30, r30, 16
	lui	r17, ha16(init_dirvecs.2928)
	ori	r17, r17, lo16(init_dirvecs.2928)
	sw	r17, 0(r13)
	sw	r20, 12(r13)
	sw	r19, 8(r13)
	sw	r6, 4(r13)
	add	r6, r30, r0
	addi	r30, r30, 16
	lui	r17, ha16(add_reflection.2930)
	ori	r17, r17, lo16(add_reflection.2930)
	sw	r17, 0(r6)
	sw	r14, 12(r6)
	sw	r29, 8(r6)
	sw	r15, 4(r6)
	add	r15, r30, r0
	addi	r30, r30, 16
	lui	r17, ha16(setup_rect_reflection.2937)
	ori	r17, r17, lo16(setup_rect_reflection.2937)
	sw	r17, 0(r15)
	sw	r2, 12(r15)
	sw	r9, 8(r15)
	sw	r6, 4(r15)
	add	r17, r30, r0
	addi	r30, r30, 16
	lui	r19, ha16(setup_surface_reflection.2940)
	ori	r19, r19, lo16(setup_surface_reflection.2940)
	sw	r19, 0(r17)
	sw	r2, 12(r17)
	sw	r9, 8(r17)
	sw	r6, 4(r17)
	add	r2, r30, r0
	addi	r30, r30, 16
	lui	r6, ha16(setup_reflections.2943)
	ori	r6, r6, lo16(setup_reflections.2943)
	sw	r6, 0(r2)
	sw	r17, 12(r2)
	sw	r15, 8(r2)
	sw	r12, 4(r2)
	add	r28, r30, r0
	addi	r30, r30, 64
	lui	r6, ha16(rt.2945)
	ori	r6, r6, lo16(rt.2945)
	sw	r6, 0(r28)
	sw	r8, 56(r28)
	sw	r2, 52(r28)
	sw	r14, 48(r28)
	sw	r4, 44(r28)
	sw	r5, 40(r28)
	sw	r16, 36(r28)
	sw	r10, 32(r28)
	sw	r11, 28(r28)
	lw	r2, 128(r29)
	sw	r2, 24(r28)
	sw	r9, 20(r28)
	sw	r13, 16(r28)
	sw	r18, 12(r28)
	sw	r7, 8(r28)
	sw	r3, 4(r28)
	addi	r2, r2, 128
	add	r27, r31, r0
	add	r3, r2, r0
	sw	r27, 140(r29)
	addi	r29, r29, 144
	lw	r27, 0(r28)
	jalr	r27
	addi	r29, r29, -144
	lw	r27, 140(r29)
	add	r0, r2, r0
	add	r31, r27, r0
#	main program ends
	lw	r29, 0(r29)
	lw	r27, 8(r29)
	add	r31, r27, r0
	lw	r28, -8(r29)
	jr	r31

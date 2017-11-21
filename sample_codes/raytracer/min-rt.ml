(****************************************************************)
(*                                                              *)
(* Ray Tracing Program for (Mini) Objective Caml                *)
(*                                                              *)
(* Original Program by Ryoji Kawamichi                          *)
(* Arranged for Chez Scheme by Motohico Nanano                  *)
(* Arranged for Objective Caml by Y. Oiwa and E. Sumii          *)
(* Added diffuse ray tracer by Y.Ssugawara                      *)
(*                                                              *)
(****************************************************************)

(*NOMINCAML open MiniMLRuntime;;*)
(*NOMINCAML open Globals;;*)
(*MINCAML*) (*let true = 1 in 
(*MINCAML*) let false = 0 in *)
(*MINCAML*) let rec xor x y = if x then not y else y in

(******************************************************************************
   �桼�ƥ���ƥ���
 *****************************************************************************)

(* ��� *)
let rec sgn x =
  if fiszero x then 0.0
  else if fispos x then 1.0
  else -1.0
in

(* ����դ����ȿž *)
let rec fneg_cond cond x =
  if cond then x else fneg x
in

(* (x+y) mod 5 *)
let rec add_mod5 x y =
  let sum = x + y in
  if sum >= 5 then sum - 5 else sum
in

(******************************************************************************
   �٥��ȥ����Τ���Υץ�ߥƥ���
 *****************************************************************************)

(*
let rec vecprint v =
  (o_param_abc m) inFormat.eprintf "(%f %f %f)" v.(0) v.(1) v.(2)
in
*)

(* ������ *)
let rec vecset v x y z =
  v.(0) <- x;
  v.(1) <- y;
  v.(2) <- z
in

(* Ʊ���ͤ����� *)
let rec vecfill v elem =
  v.(0) <- elem;
  v.(1) <- elem;
  v.(2) <- elem
in

(* ������ *)
let rec vecbzero v =
  vecfill v 0.0
in

(* ���ԡ� *)
let rec veccpy dest src = 
  dest.(0) <- src.(0);
  dest.(1) <- src.(1);
  dest.(2) <- src.(2)
in

(* ��Υ�μ��� *)
let rec vecdist2 p q = 
  fsqr (p.(0) -. q.(0)) +. fsqr (p.(1) -. q.(1)) +. fsqr (p.(2) -. q.(2))
in

(* ������ ����������å�̵�� *)
let rec vecunit v = 
  let il = 1.0 /. sqrt(fsqr v.(0) +. fsqr v.(1) +. fsqr v.(2)) in
  v.(0) <- v.(0) *. il;
  v.(1) <- v.(1) *. il;
  v.(2) <- v.(2) *. il
in

(* ����������� ���������å�*)
let rec vecunit_sgn v inv =
  let l = sqrt (fsqr v.(0) +. fsqr v.(1) +. fsqr v.(2)) in
  let il = if fiszero l then 1.0 else if inv then -1.0 /. l else 1.0 /. l in
  v.(0) <- v.(0) *. il;
  v.(1) <- v.(1) *. il;
  v.(2) <- v.(2) *. il
in

(* ���� *)
let rec veciprod v w =
  v.(0) *. w.(0) +. v.(1) *. w.(1) +. v.(2) *. w.(2)
in

(* ���� ����������ۤʤ��� *)
let rec veciprod2 v w0 w1 w2 =
  v.(0) *. w0 +. v.(1) *. w1 +. v.(2) *. w2
in

(* �̤ʥ٥��ȥ������ܤ�û� *)
let rec vecaccum dest scale v =
  dest.(0) <- dest.(0) +. scale *. v.(0);
  dest.(1) <- dest.(1) +. scale *. v.(1);
  dest.(2) <- dest.(2) +. scale *. v.(2)
in

(* �٥��ȥ���� *)
let rec vecadd dest v =
  dest.(0) <- dest.(0) +. v.(0);
  dest.(1) <- dest.(1) +. v.(1);
  dest.(2) <- dest.(2) +. v.(2)
in

(* �٥��ȥ�����Ʊ�Τ��� *)
let rec vecmul dest v =
  dest.(0) <- dest.(0) *. v.(0);
  dest.(1) <- dest.(1) *. v.(1);
  dest.(2) <- dest.(2) *. v.(2)
in

(* �٥��ȥ������� *)
let rec vecscale dest scale =
  dest.(0) <- dest.(0) *. scale; 
  dest.(1) <- dest.(1) *. scale; 
  dest.(2) <- dest.(2) *. scale
in

(* ¾�Σ��٥��ȥ������Ʊ�Τ��Ѥ�׻����û� *)
let rec vecaccumv dest v w =
  dest.(0) <- dest.(0) +. v.(0) *. w.(0);
  dest.(1) <- dest.(1) +. v.(1) *. w.(1);
  dest.(2) <- dest.(2) +. v.(2) *. w.(2)
in

(******************************************************************************
   ���֥������ȥǡ�����¤�ؤΥ��������ؿ�
 *****************************************************************************)

(* �ƥ�������� 0:̵�� 1:�Ծ����� 2:������ 3:Ʊ�������� 4:����*)
let rec o_texturetype m = 
  let (m_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_tex
in

(* ʪ�Τη��� 0:ľ���� 1:ʿ�� 2:�󼡶��� 3:�߿� *)
let rec o_form m = 
  let (xm_tex, m_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_shape
in

(* ȿ������ 0:�Ȼ�ȿ�ͤΤ� 1:�Ȼ�����������ȿ�� 2:�Ȼ��ܴ�������ȿ�� *)
let rec o_reflectiontype m = 
  let (xm_tex, xm_shape, m_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_surface
in

(* ���̤γ�¦�������ɤ����Υե饰 true:��¦���� false:��¦���� *)
let rec o_isinvert m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       m_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m in
  m_invert
in

(* ��ž��̵ͭ true:��ž���� false:��ž̵�� 2�����̤ȱ߿�Τ�ͭ�� *)
let rec o_isrot m = 
  let (xm_tex, xm_shape, xm_surface, m_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m in
  m_isrot
in

(* ʪ�η����� a�ѥ�᡼�� *)
let rec o_param_a m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       m_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_abc.(0)
in

(* ʪ�η����� b�ѥ�᡼�� *)
let rec o_param_b m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       m_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_abc.(1)
in

(* ʪ�η����� c�ѥ�᡼�� *)
let rec o_param_c m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       m_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_abc.(2)
in

(* ʪ�η����� abc�ѥ�᡼�� *)
let rec o_param_abc m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       m_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_abc
in

(* ʪ�Τ��濴x��ɸ *)
let rec o_param_x m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, m_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_xyz.(0)
in

(* ʪ�Τ��濴y��ɸ *)
let rec o_param_y m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, m_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_xyz.(1)
in

(* ʪ�Τ��濴z��ɸ *)
let rec o_param_z m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, m_xyz,
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_xyz.(2)
in

(* ʪ�ΤγȻ�ȿ��Ψ 0.0 -- 1.0 *)
let rec o_diffuse m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, m_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_surfparams.(0)
in

(* ʪ�Τ��Դ�������ȿ��Ψ 0.0 -- 1.0 *)
let rec o_hilight m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, m_surfparams, xm_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_surfparams.(1)
in

(* ʪ�ο��� R��ʬ *)
let rec o_color_red m = 
  let (xm_tex, xm_shape, m_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, m_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_color.(0)
in

(* ʪ�ο��� G��ʬ *)
let rec o_color_green m = 
  let (xm_tex, xm_shape, m_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, m_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_color.(1)
in

(* ʪ�ο��� B��ʬ *)
let rec o_color_blue m = 
  let (xm_tex, xm_shape, m_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, m_color,
       xm_rot123, xm_ctbl) = m 
  in
  m_color.(2)
in

(* ʪ�Τζ����������� y*z��η��� 2�����̤ȱ߿�ǡ���ž��������Τ� *)
let rec o_param_r1 m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       m_rot123, xm_ctbl) = m 
  in
  m_rot123.(0)
in

(* ʪ�Τζ����������� x*z��η��� 2�����̤ȱ߿�ǡ���ž��������Τ� *)
let rec o_param_r2 m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       m_rot123, xm_ctbl) = m 
  in
  m_rot123.(1)
in

(* ʪ�Τζ����������� x*y��η��� 2�����̤ȱ߿�ǡ���ž��������Τ� *)
let rec o_param_r3 m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       m_rot123, xm_ctbl) = m 
  in
  m_rot123.(2)
in

(* ������ȯ�����򤢤餫����׻������������ơ��֥� *)
(*
   0 -- 2 ���ܤ�����: ʪ�Τθ�ͭ��ɸ�Ϥ�ʿ�԰�ư������������
   3���ܤ�����: 
   ľ���΢�̵��
   ʿ�̢� abc�٥��ȥ�Ȥ�����
   �󼡶��̡��߿���������������
 *)
let rec o_param_ctbl m = 
  let (xm_tex, xm_shape, xm_surface, xm_isrot, 
       xm_abc, xm_xyz, 
       xm_invert, xm_surfparams, xm_color,
       xm_rot123, m_ctbl) = m 
  in
  m_ctbl
in

(******************************************************************************
   Pixel�ǡ����Υ��Х��������ؿ� 
 *****************************************************************************)

(* ľ�ܸ����פ�����줿�ԥ������RGB�� *)
let rec p_rgb pixel = 
  let (m_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_rgb
in

(* ��Ф�������ʪ�ΤȾ��ͤ����������� *)
let rec p_intersection_points pixel = 
  let (xm_rgb, m_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_isect_ps
in

(* ��Ф����������ͤ���ʪ�����ֹ������ *)
(* ʪ�����ֹ�� ���֥��������ֹ� * 4 + (solver���֤���) *)
let rec p_surface_ids pixel = 
  let (xm_rgb, xm_isect_ps, m_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_sids
in

(* ���ܼ�����׻����뤫�ݤ��Υե饰 *)
let rec p_calc_diffuse pixel = 
  let (xm_rgb, xm_isect_ps, xm_sids, m_cdif, xm_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_cdif
in

(* �������δ��ܼ������ͥ륮�����ԥ����뵱�٤�Ϳ�����Ϳ���礭�� *)
let rec p_energy pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, m_engy,
       xm_r20p, xm_gid, xm_nvectors ) = pixel in
  m_engy
in

(* �������δ��ܼ������ͥ륮��������ܿ��1/5�˴ְ������Ʒ׻������� *)
let rec p_received_ray_20percent pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       m_r20p, xm_gid, xm_nvectors ) = pixel in
  m_r20p
in

(* ���Υԥ�����Υ��롼�� ID *)
(* 
   �����꡼���ɸ (x,y)�����Υ��롼��ID�� (x+2*y) mod 5 ������
   ��̡����ޤΤ褦��ʬ�����ˤʤꡢ�����Ͼ岼����4�����̤ʥ��롼�פˤʤ�
   0 1 2 3 4 0 1 2 3 4 
   2 3 4 0 1 2 3 4 0 1
   4 0 1 2 3 4 0 1 2 3
   1 2 3 4 0 1 2 3 4 0
*)

let rec p_group_id pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, m_gid, xm_nvectors ) = pixel in
  m_gid.(0)
in
   
(* ���롼��ID�򥻥åȤ��륢�������ؿ� *)
let rec p_set_group_id pixel id =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, m_gid, xm_nvectors ) = pixel in
  m_gid.(0) <- id
in

(* �ƾ������ˤ�����ˡ���٥��ȥ� *)
let rec p_nvectors pixel =
  let (xm_rgb, xm_isect_ps, xm_sids, xm_cdif, xm_engy,
       xm_r20p, xm_gid, m_nvectors ) = pixel in
  m_nvectors
in

(******************************************************************************
   �������Ѥ������٥��ȥ�Υ��Х��������ؿ�
 *****************************************************************************)

(* �٥��ȥ� *)
let rec d_vec d =
  let (m_vec, xm_const) = d in
  m_vec
in

(* �ƥ��֥������Ȥ��Ф��ƺ�ä� solver ��®�������ơ��֥� *)
let rec d_const d =
  let (dm_vec, m_const) = d in
  m_const
in
   
(******************************************************************************
   ʿ�̶����Τ�ȿ�;���
 *****************************************************************************)

(* ���ֹ� ���֥��������ֹ�*4 + (solver���֤���) *)
let rec r_surface_id r =
  let (m_sid, xm_dvec, xm_br) = r in
  m_sid
in

(* ��������ȿ�������٥��ȥ�(���ȵո���) *)
let rec r_dvec r =
  let (xm_sid, m_dvec, xm_br) = r in
  m_dvec
in
   
(* ʪ�Τ�ȿ��Ψ *)
let rec r_bright r =
  let (xm_sid, xm_dvec, m_br) = r in
  m_br
in

(******************************************************************************
   �ǡ����ɤ߹��ߤδؿ� 
 *****************************************************************************)

(* �饸���� *)
let rec rad x = 
  x *. 0.017453293
in

(**** �Ķ��ǡ������ɤ߹��� ****)
let rec read_screen_settings _ =
  
  (* �����꡼���濴�κ�ɸ *)
  screen.(0) <- read_float ();
  screen.(1) <- read_float ();
  screen.(2) <- read_float ();
  (* ��ž�� *)
  let v1 = rad (read_float ()) in
  let cos_v1 = cos v1 in
  let sin_v1 = sin v1 in
  let v2 = rad (read_float ()) in
  let cos_v2 = cos v2 in
  let sin_v2 = sin v2 in
  (* �����꡼���̤α��Ԥ������Υ٥��ȥ� ���������ε�Υ200�򤫤��� *)
  screenz_dir.(0) <- cos_v1 *. sin_v2 *. 200.0;
  screenz_dir.(1) <- sin_v1 *. -200.0;
  screenz_dir.(2) <- cos_v1 *. cos_v2 *. 200.0;
  (* �����꡼����X�����Υ٥��ȥ� *)
  screenx_dir.(0) <- cos_v2;
  screenx_dir.(1) <- 0.0;
  screenx_dir.(2) <- fneg sin_v2;
  (* �����꡼����Y�����Υ٥��ȥ� *)
  screeny_dir.(0) <- fneg sin_v1 *. sin_v2;
  screeny_dir.(1) <- fneg cos_v1;
  screeny_dir.(2) <- fneg sin_v1 *. cos_v2;
  (* �������֥٥��ȥ�(���к�ɸ) *)
  viewpoint.(0) <- screen.(0) -. screenz_dir.(0);
  viewpoint.(1) <- screen.(1) -. screenz_dir.(1);
  viewpoint.(2) <- screen.(2) -. screenz_dir.(2)

in

(* ����������ɤ߹��� *)
let rec read_light _ =
   
  let nl = read_int () in

  (* �����ط� *)
  let l1 = rad (read_float ()) in
  let sl1 = sin l1 in
  light.(1) <- fneg sl1;
  let l2 = rad (read_float ()) in
  let cl1 = cos l1 in
  let sl2 = sin l2 in
  light.(0) <- cl1 *. sl2;
  let cl2 = cos l2 in
  light.(2) <- cl1 *. cl2;
  beam.(0) <- read_float ()

in

(* ����2���������� A ��ξ¦�����ž���� R �򤫤������� R^t * A * R ���� *)
(* R �� x,y,z���˴ؤ����ž������� R(z)R(y)R(x) *)
(* �����꡼���ɸ�Τ��ᡢy����ž�Τ߳��٤���椬�� *)

let rec rotate_quadratic_matrix abc rot =
  (* ��ž������� R(z)R(y)R(x) ��׻����� *)
  let cos_x = cos rot.(0) in
  let sin_x = sin rot.(0) in
  let cos_y = cos rot.(1) in
  let sin_y = sin rot.(1) in
  let cos_z = cos rot.(2) in
  let sin_z = sin rot.(2) in

  let m00 = cos_y *. cos_z in
  let m01 = sin_x *. sin_y *. cos_z -. cos_x *. sin_z in
  let m02 = cos_x *. sin_y *. cos_z +. sin_x *. sin_z in

  let m10 = cos_y *. sin_z in
  let m11 = sin_x *. sin_y *. sin_z +. cos_x *. cos_z in
  let m12 = cos_x *. sin_y *. sin_z -. sin_x *. cos_z in

  let m20 = fneg sin_y in
  let m21 = sin_x *. cos_y in
  let m22 = cos_x *. cos_y in

  (* a, b, c�θ����ͤ�Хå����å� *)
  let ao = abc.(0) in
  let bo = abc.(1) in
  let co = abc.(2) in
	 
  (* R^t * A * R ��׻� *)
	 
  (* X^2, Y^2, Z^2��ʬ *)
  abc.(0) <- ao *. fsqr m00 +. bo *. fsqr m10 +. co *. fsqr m20;
  abc.(1) <- ao *. fsqr m01 +. bo *. fsqr m11 +. co *. fsqr m21;
  abc.(2) <- ao *. fsqr m02 +. bo *. fsqr m12 +. co *. fsqr m22;

  (* ��ž�ˤ�ä������� XY, YZ, ZX��ʬ *)
  rot.(0) <- 2.0 *. (ao *. m01 *. m02 +. bo *. m11 *. m12 +. co *. m21 *. m22);
  rot.(1) <- 2.0 *. (ao *. m00 *. m02 +. bo *. m10 *. m12 +. co *. m20 *. m22);
  rot.(2) <- 2.0 *. (ao *. m00 *. m01 +. bo *. m10 *. m11 +. co *. m20 *. m21)

in

(**** ���֥�������1�ĤΥǡ������ɤ߹��� ****)
let rec read_nth_object n =

  let texture = read_int () in                      
  if texture <> -1 then
    ( 
      let form = read_int () in                     
      let refltype = read_int () in
      let isrot_p = read_int () in

      let abc = create_array 3 0.0 in
      abc.(0) <- read_float ();
      abc.(1) <- read_float (); (* 5 *)
      abc.(2) <- read_float ();

      let xyz = create_array 3 0.0 in
      xyz.(0) <- read_float ();
      xyz.(1) <- read_float ();
      xyz.(2) <- read_float ();

      let m_invert = fisneg (read_float ()) in (* 10 *)

      let reflparam = create_array 2 0.0 in      
      reflparam.(0) <- read_float (); (* diffuse *)
      reflparam.(1) <- read_float (); (* hilight *)
       
      let color = create_array 3 0.0 in
      color.(0) <- read_float ();
      color.(1) <- read_float ();
      color.(2) <- read_float (); (* 15 *)
     
      let rotation = create_array 3 0.0 in
      if isrot_p <> 0 then
	(
	 rotation.(0) <- rad (read_float ());
	 rotation.(1) <- rad (read_float ());
	 rotation.(2) <- rad (read_float ())
	) 
      else ();

      (* �ѥ�᡼���������� *)

      (* ��: ���������� (form = 2) ���� *)
      let m_invert2 = if form = 2 then true else m_invert in
      let ctbl = create_array 4 0.0 in
      (* �������餢�Ȥ� abc �� rotation �������ʤ���*)
      let obj = 
	(texture, form, refltype, isrot_p,
	 abc, xyz, (* x-z *)
	 m_invert2,
	 reflparam, (* reflection paramater *)
	 color, (* color *)
	 rotation, (* rotation *)
         ctbl (* constant table *)
	) in
      objects.(n) <- obj;

      if form = 3 then
	(
	  (* 2������: X,Y,Z ����������2������������г���ʬ�� *)
	 let a = abc.(0) in
	 abc.(0) <- if fiszero a then 0.0 else sgn a /. fsqr a; (* X^2 ��ʬ *)
	 let b = abc.(1) in
	 abc.(1) <- if fiszero b then 0.0 else sgn b /. fsqr b; (* Y^2 ��ʬ *)
	 let c = abc.(2) in
	 abc.(2) <- if fiszero c then 0.0 else sgn c /. fsqr c  (* Z^2 ��ʬ *)
	)
      else if form = 2 then
	(* ʿ��: ˡ���٥��ȥ��������, ������������� *)
	vecunit_sgn abc (not m_invert)
      else ();

      (* 2����������˲�ž�Ѵ���ܤ� *)
      if isrot_p <> 0 then
	rotate_quadratic_matrix abc rotation
      else ();
      
      true
     )
  else
    false (* �ǡ����ν�λ *)
in

(**** ʪ�Υǡ������Τ��ɤ߹��� ****)
let rec read_object n =
  if n < 60 then
    if read_nth_object n then 
      read_object (n + 1) 
    else
      n_objects.(0) <- n
  else () (* failwith "too many objects" *)
in

let rec read_all_object _ =
  read_object 0
in

(**** AND, OR �ͥåȥ�����ɤ߹��� ****)

(* �ͥåȥ��1�Ĥ��ɤ߹��ߥ٥��ȥ�ˤ����֤� *)
let rec read_net_item length =
  let item = read_int () in
  if item = -1 then create_array (length + 1) (-1)
  else
    let v = read_net_item (length + 1) in
    (v.(length) <- item; v)
in

let rec read_or_network length =
  let net = read_net_item 0 in
  if net.(0) = -1 then 
    create_array (length + 1) net
  else
    let v = read_or_network (length + 1) in
    (v.(length) <- net; v)
in

let rec read_and_network n =
  let net = read_net_item 0 in
  if net.(0) = -1 then ()
  else (
    and_net.(n) <- net;
    read_and_network (n + 1)
  )
in

let rec read_parameter _ =
  (
   read_screen_settings();
   read_light();
   read_all_object ();
   read_and_network 0;
   or_net.(0) <- read_or_network 0
  )
in

(******************************************************************************
   ľ���ȥ��֥������Ȥθ��������ؿ� 
 *****************************************************************************)

(* solver : 
   ���֥������� (�� index) �ȡ��٥��ȥ� L, P ������Ȥꡢ
   ľ�� Lt + P �ȡ����֥������ȤȤθ�������롣
   �������ʤ����� 0 �򡢸�����������Ϥ���ʳ����֤���
   �����֤��ͤ� nvector �Ǹ�����ˡ���٥��ȥ�����ݤ�ɬ�ס�
   (ľ���Τξ��)

   �����κ�ɸ�� t ���ͤȤ��� solver_dist �˳�Ǽ����롣
*)

(* ľ���Τλ��ꤵ�줿�̤˾��ͤ��뤫�ɤ���Ƚ�ꤹ�� *)
(* i0 : �̤˿�ľ�ʼ���index X:0, Y:1, Z:2         i2,i3��¾��2����index *)
let rec solver_rect_surface m dirvec b0 b1 b2 i0 i1 i2  =
  if fiszero dirvec.(i0) then false else
  let abc = o_param_abc m in
  let d = fneg_cond (xor (o_isinvert m) (fisneg dirvec.(i0))) abc.(i0) in
  
  let d2 = (d -. b0) /. dirvec.(i0) in
  if fless (fabs (d2 *. dirvec.(i1) +. b1)) abc.(i1) then
    if fless (fabs (d2 *. dirvec.(i2) +. b2)) abc.(i2) then
      (solver_dist.(0) <- d2; true)
    else false
  else false
in


(***** ľ���Υ��֥������Ȥξ�� ****)
let rec solver_rect m dirvec b0 b1 b2 =
  if      solver_rect_surface m dirvec b0 b1 b2 0 1 2 then 1   (* YZ ʿ�� *)
  else if solver_rect_surface m dirvec b1 b2 b0 1 2 0 then 2   (* ZX ʿ�� *)
  else if solver_rect_surface m dirvec b2 b0 b1 2 0 1 then 3   (* XY ʿ�� *)
  else                                                     0
in


(* ʿ�̥��֥������Ȥξ�� *)
let rec solver_surface m dirvec b0 b1 b2 =
  (* ����ʿ�̤����Ĥ���Υ *)
  (* ʿ�̤϶�����������줵��Ƥ��� *)
  let abc = o_param_abc m in
  let d = veciprod dirvec abc in
  if fispos d then (
    solver_dist.(0) <- fneg (veciprod2 abc b0 b1 b2) /. d;
    1
   ) else 0
in


(* 3�ѿ�2������ v^t A v ��׻� *)
(* ��ž��̵�������г���ʬ�Τ߷׻�������ɤ� *)
let rec quadratic m v0 v1 v2 =
  let diag_part = 
    fsqr v0 *. o_param_a m +. fsqr v1 *. o_param_b m +. fsqr v2 *. o_param_c m
  in
  if o_isrot m = 0 then 
    diag_part
  else
    diag_part
      +. v1 *. v2 *. o_param_r1 m
      +. v2 *. v0 *. o_param_r2 m
      +. v0 *. v1 *. o_param_r3 m
in

(* 3�ѿ���1������ v^t A w ��׻� *)
(* ��ž��̵������ A ���г���ʬ�Τ߷׻�������ɤ� *)
let rec bilinear m v0 v1 v2 w0 w1 w2 =
  let diag_part = 
    v0 *. w0 *. o_param_a m 
      +. v1 *. w1 *. o_param_b m
      +. v2 *. w2 *. o_param_c m
  in
  if o_isrot m = 0 then
    diag_part
  else
    diag_part +. fhalf 
      ((v2 *. w1 +. v1 *. w2) *. o_param_r1 m
	 +. (v0 *. w2 +. v2 *. w0) *. o_param_r2 m
	 +. (v0 *. w1 +. v1 *. w0) *. o_param_r3 m)
in


(* 2�����̤ޤ��ϱ߿�ξ�� *)
(* 2��������ɽ�����줿���� x^t A x - (0 �� 1) = 0 �� ľ�� base + dirvec*t ��
   ��������롣�������������� x = base + dirvec*t ����������t����롣
   �Ĥޤ� (base + dirvec*t)^t A (base + dirvec*t) - (0 �� 1) = 0��
   Ÿ������� (dirvec^t A dirvec)*t^2 + 2*(dirvec^t A base)*t  + 
   (base^t A base) - (0��1) = 0 ����ä�t�˴ؤ���2����������򤱤��ɤ���*)

let rec solver_second m dirvec b0 b1 b2 =

  (* ��θ��� (-b' �� sqrt(b'^2 - a*c)) / a  �����(b' = b/2) *)
  (* a = dirvec^t A dirvec *)
  let aa = quadratic m dirvec.(0) dirvec.(1) dirvec.(2) in

  if fiszero aa then 
    0 (* ���ΤˤϤ��ξ���1���������β򤬤��뤬��̵�뤷�Ƥ��̾������� *)
  else (
    
    (* b' = b/2 = dirvec^t A base   *)
    let bb = bilinear m dirvec.(0) dirvec.(1) dirvec.(2) b0 b1 b2 in
    (* c = base^t A base  - (0��1)  *)
    let cc0 = quadratic m b0 b1 b2 in
    let cc = if o_form m = 3 then cc0 -. 1.0 else cc0 in
    (* Ƚ�̼� *)
    let d = fsqr bb -. aa *. cc in 

    if fispos d then (
      let sd = sqrt d in
      let t1 = if o_isinvert m then sd else fneg sd in
      (solver_dist.(0) <- (t1 -. bb) /.  aa; 1)
     ) 
    else 
      0
   )
in

(**** solver �Υᥤ��롼���� ****)
let rec solver index dirvec org =
  let m = objects.(index) in
  (* ľ���λ�����ʪ�Τδ����֤˹�碌��ʿ�԰�ư *)
  let b0 =  org.(0) -. o_param_x m in
  let b1 =  org.(1) -. o_param_y m in
  let b2 =  org.(2) -. o_param_z m in
  let m_shape = o_form m in
  (* ʪ�Τμ���˱���������ؿ��Ƥ� *)
  if m_shape = 1 then       solver_rect m dirvec b0 b1 b2    (* ľ���� *)
  else if m_shape = 2 then  solver_surface m dirvec b0 b1 b2 (* ʿ�� *)
  else                      solver_second m dirvec b0 b1 b2  (* 2������/�߿� *)
in

(******************************************************************************
   solver�Υơ��֥���ѹ�®��
 *****************************************************************************)
(*
   �̾���solver ��Ʊ�͡�ľ�� start + t * dirvec ��ʪ�Τθ����� t ���ͤȤ����֤�
   t ���ͤ� solver_dist�˳�Ǽ
   
   solver_fast �ϡ�ľ���������٥��ȥ� dirvec �ˤĤ��ƺ�ä��ơ��֥�����
   ����Ū�� solver_rect_fast, solver_surface_fast, solver_second_fast��Ƥ�
   
   solver_fast2 �ϡ�dirvec��ľ���λ��� start ���줾��˺�ä��ơ��֥�����
   ľ���ΤˤĤ��Ƥ�start�Υơ��֥�ˤ���®���ϤǤ��ʤ��Τǡ�solver_fast��
   Ʊ���� solver_rect_fast������Ū�˸Ƥ֡�����ʳ���ʪ�ΤˤĤ��Ƥ�
   solver_surface_fast2�ޤ���solver_second_fast2������Ū�˸Ƥ�

   �ѿ�dconst�������٥��ȥ롢sconst�ϻ����˴ؤ���ơ��֥�
*)

(***** solver_rect��dirvec�ơ��֥���ѹ�®�� ******)
let rec solver_rect_fast m v dconst b0 b1 b2 =
  let d0 = (dconst.(0) -. b0) *. dconst.(1) in
  if  (* YZʿ�̤Ȥξ���Ƚ�� *)
    if fless (fabs (d0 *. v.(1) +. b1)) (o_param_b m) then
      if fless (fabs (d0 *. v.(2) +. b2)) (o_param_c m) then
	not (fiszero dconst.(1))
      else false
    else false
  then
    (solver_dist.(0) <- d0; 1)
  else let d1 = (dconst.(2) -. b1) *. dconst.(3) in 
  if  (* ZXʿ�̤Ȥξ���Ƚ�� *)
    if fless (fabs (d1 *. v.(0) +. b0)) (o_param_a m) then
      if fless (fabs (d1 *. v.(2) +. b2)) (o_param_c m) then
	not (fiszero dconst.(3))
      else false
    else false
  then
    (solver_dist.(0) <- d1; 2)
  else let d2 = (dconst.(4) -. b2) *. dconst.(5) in 
  if  (* XYʿ�̤Ȥξ���Ƚ�� *)
    if fless (fabs (d2 *. v.(0) +. b0)) (o_param_a m) then
      if fless (fabs (d2 *. v.(1) +. b1)) (o_param_b m) then
	not (fiszero dconst.(5))
      else false
    else false
  then
    (solver_dist.(0) <- d2; 3)
  else
    0
in

(**** solver_surface��dirvec�ơ��֥���ѹ�®�� ******)
let rec solver_surface_fast m dconst b0 b1 b2 =
  if fisneg dconst.(0) then (
    solver_dist.(0) <- 
      dconst.(1) *. b0 +. dconst.(2) *. b1 +. dconst.(3) *. b2;
    1 
   ) else 0
in

(**** solver_second ��dirvec�ơ��֥���ѹ�®�� ******)
let rec solver_second_fast m dconst b0 b1 b2 =
  
  let aa = dconst.(0) in
  if fiszero aa then
    0
  else 
    let neg_bb = dconst.(1) *. b0 +. dconst.(2) *. b1 +. dconst.(3) *. b2 in
    let cc0 = quadratic m b0 b1 b2 in
    let cc = if o_form m = 3 then cc0 -. 1.0 else cc0 in
    let d = (fsqr neg_bb) -. aa *. cc in
    if fispos d then (
      if o_isinvert m then
	solver_dist.(0) <- (neg_bb +. sqrt d) *. dconst.(4)
      else
	solver_dist.(0) <- (neg_bb -. sqrt d) *. dconst.(4);
      1)
    else 0
in

(**** solver ��dirvec�ơ��֥���ѹ�®�� *******)
let rec solver_fast index dirvec org =
  let m = objects.(index) in
  let b0 = org.(0) -. o_param_x m in
  let b1 = org.(1) -. o_param_y m in 
  let b2 = org.(2) -. o_param_z m in
  let dconsts = d_const dirvec in
  let dconst = dconsts.(index) in
  let m_shape = o_form m in
  if m_shape = 1 then       
    solver_rect_fast m (d_vec dirvec) dconst b0 b1 b2
  else if m_shape = 2 then  
    solver_surface_fast m dconst b0 b1 b2
  else                      
    solver_second_fast m dconst b0 b1 b2
in




(* solver_surface��dirvec+start�ơ��֥���ѹ�®�� *)
let rec solver_surface_fast2 m dconst sconst b0 b1 b2 =
  if fisneg dconst.(0) then (
    solver_dist.(0) <- dconst.(0) *. sconst.(3);
    1 
   ) else 0
in

(* solver_second��dirvec+start�ơ��֥���ѹ�®�� *)
let rec solver_second_fast2 m dconst sconst b0 b1 b2 =
  
  let aa = dconst.(0) in
  if fiszero aa then
    0
  else 
    let neg_bb = dconst.(1) *. b0 +. dconst.(2) *. b1 +. dconst.(3) *. b2 in
    let cc = sconst.(3) in
    let d = (fsqr neg_bb) -. aa *. cc in
    if fispos d then (
      if o_isinvert m then
	solver_dist.(0) <- (neg_bb +. sqrt d) *. dconst.(4)
      else
	solver_dist.(0) <- (neg_bb -. sqrt d) *. dconst.(4);
      1)
    else 0
in

(* solver�Ρ�dirvec+start�ơ��֥���ѹ�®�� *)
let rec solver_fast2 index dirvec =
  let m = objects.(index) in
  let sconst = o_param_ctbl m in
  let b0 = sconst.(0) in
  let b1 = sconst.(1) in
  let b2 = sconst.(2) in
  let dconsts = d_const dirvec in
  let dconst = dconsts.(index) in
  let m_shape = o_form m in
  if m_shape = 1 then       
    solver_rect_fast m (d_vec dirvec) dconst b0 b1 b2
  else if m_shape = 2 then  
    solver_surface_fast2 m dconst sconst b0 b1 b2
  else                      
    solver_second_fast2 m dconst sconst b0 b1 b2
in

(******************************************************************************
   �����٥��ȥ�����ơ��֥��׻�����ؿ�
 *****************************************************************************)

(* ľ���Υ��֥������Ȥ��Ф��������� *)
let rec setup_rect_table vec m = 
  let const = create_array 6 0.0 in

  if fiszero vec.(0) then (* YZʿ�� *)
    const.(1) <- 0.0
  else (
    (* �̤� X ��ɸ *)
    const.(0) <- fneg_cond (xor (o_isinvert m) (fisneg vec.(0))) (o_param_a m);
    (* �����٥��ȥ���ܤ����X������1�ʤफ *)
    const.(1) <- 1.0 /. vec.(0)
  );
  if fiszero vec.(1) then (* ZXʿ�� : YZʿ�̤�Ʊ��*)
    const.(3) <- 0.0
  else (
    const.(2) <- fneg_cond (xor (o_isinvert m) (fisneg vec.(1))) (o_param_b m);
    const.(3) <- 1.0 /. vec.(1)
  );
  if fiszero vec.(2) then (* XYʿ�� : YZʿ�̤�Ʊ��*)
    const.(5) <- 0.0
  else (
    const.(4) <- fneg_cond (xor (o_isinvert m) (fisneg vec.(2))) (o_param_c m);
    const.(5) <- 1.0 /. vec.(2)
  );
  const
in

(* ʿ�̥��֥������Ȥ��Ф��������� *)
let rec setup_surface_table vec m = 
  let const = create_array 4 0.0 in
  let d = 
    vec.(0) *. o_param_a m +. vec.(1) *. o_param_b m +. vec.(2) *. o_param_c m
  in
  if fispos d then (
    (* �����٥��ȥ���ܤ����ʿ�̤ο�ľ������ 1 �ʤफ *)
    const.(0) <- -1.0 /. d;
    (* ��������ʿ�̤���ε�Υ�������٥��ȥ벿��ʬ����Ƴ��3��������η��� *)
    const.(1) <- fneg (o_param_a m /. d);
    const.(2) <- fneg (o_param_b m /. d);
    const.(3) <- fneg (o_param_c m /. d)
   ) else
    const.(0) <- 0.0;
  const
 
in

(* 2�����̤��Ф��������� *)
let rec setup_second_table v m = 
  let const = create_array 5 0.0 in
  
  let aa = quadratic m v.(0) v.(1) v.(2) in
  let c1 = fneg (v.(0) *. o_param_a m) in
  let c2 = fneg (v.(1) *. o_param_b m) in
  let c3 = fneg (v.(2) *. o_param_c m) in

  const.(0) <- aa;  (* 2���������� a ���� *)

  (* b' = dirvec^t A start ������(dirvec^t A)����ʬ��׻���const.(1:3)�˳�Ǽ��
     b' �����ˤϤ��Υ٥��ȥ��start�����Ѥ�����ɤ������ϵդˤ��� *)
  if o_isrot m <> 0 then (
    const.(1) <- c1 -. fhalf (v.(2) *. o_param_r2 m +. v.(1) *. o_param_r3 m);
    const.(2) <- c2 -. fhalf (v.(2) *. o_param_r1 m +. v.(0) *. o_param_r3 m);
    const.(3) <- c3 -. fhalf (v.(1) *. o_param_r1 m +. v.(0) *. o_param_r2 m)
   ) else (
    const.(1) <- c1;
    const.(2) <- c2;
    const.(3) <- c3
   );
  if not (fiszero aa) then
    const.(4) <- 1.0 /. aa (* a����εտ���ᡢ��θ����Ǥγ�껻��õ� *)
  else ();
  const

in

(* �ƥ��֥������ȤˤĤ�������ؿ��Ƥ�ǥơ��֥���� *)  
let rec iter_setup_dirvec_constants dirvec index =
  if index >= 0 then (
    let m = objects.(index) in
    let dconst = (d_const dirvec) in
    let v = d_vec dirvec in
    let m_shape = o_form m in
    if m_shape = 1 then  (* rect *)
      dconst.(index) <- setup_rect_table v m
    else if m_shape = 2 then  (* surface *)
      dconst.(index) <- setup_surface_table v m
    else                      (* second *)
      dconst.(index) <- setup_second_table v m;
    
    iter_setup_dirvec_constants dirvec (index - 1)
  ) else ()
in

let rec setup_dirvec_constants dirvec =
  iter_setup_dirvec_constants dirvec (n_objects.(0) - 1)
in

(******************************************************************************
   ľ���λ����˴ؤ���ơ��֥��ƥ��֥������Ȥ��Ф��Ʒ׻�����ؿ�
 *****************************************************************************)

let rec setup_startp_constants p index =
  if index >= 0 then (
    let obj = objects.(index) in
    let sconst = o_param_ctbl obj in
    let m_shape = o_form obj in
    sconst.(0) <- p.(0) -. o_param_x obj;
    sconst.(1) <- p.(1) -. o_param_y obj;
    sconst.(2) <- p.(2) -. o_param_z obj;
    if m_shape = 2 then (* surface *)
      sconst.(3) <- 
	veciprod2 (o_param_abc obj) sconst.(0) sconst.(1) sconst.(2)
    else if m_shape > 2 then (* second *)
      let cc0 = quadratic obj sconst.(0) sconst.(1) sconst.(2) in
      sconst.(3) <- if m_shape = 3 then cc0 -. 1.0 else cc0
    else ();
    setup_startp_constants p (index - 1)
   ) else ()
in

let rec setup_startp p =
  veccpy startp_fast p;
  setup_startp_constants p (n_objects.(0) - 1)
in

(******************************************************************************
   Ϳ����줿�������֥������Ȥ˴ޤޤ�뤫�ɤ�����Ƚ�ꤹ��ؿ� 
 *****************************************************************************)

(**** �� q �����֥������� m �γ���ɤ�����Ƚ�ꤹ�� ****)

(* ľ���� *)
let rec is_rect_outside m p0 p1 p2 =
  if 
    if (fless (fabs p0) (o_param_a m)) then
      if (fless (fabs p1) (o_param_b m)) then
	fless (fabs p2) (o_param_c m)
      else false
    else false
  then o_isinvert m else not (o_isinvert m)
in

(* ʿ�� *)
let rec is_plane_outside m p0 p1 p2 =
  let w = veciprod2 (o_param_abc m) p0 p1 p2 in
  not (xor (o_isinvert m) (fisneg w))
in

(* 2������ *)
let rec is_second_outside m p0 p1 p2 = 
  let w = quadratic m p0 p1 p2 in
  let w2 = if o_form m = 3 then w -. 1.0 else w in
  not (xor (o_isinvert m) (fisneg w2))
in

(* ʪ�Τ��濴��ɸ��ʿ�԰�ư������ǡ�Ŭ�ڤ�����ؿ��Ƥ� *)
let rec is_outside m q0 q1 q2 =
  let p0 = q0 -. o_param_x m in
  let p1 = q1 -. o_param_y m in
  let p2 = q2 -. o_param_z m in
  let m_shape = o_form m in
  if m_shape = 1 then
    is_rect_outside m p0 p1 p2
  else if m_shape = 2 then
    is_plane_outside m p0 p1 p2
  else 
    is_second_outside m p0 p1 p2
in

(**** �� q �� AND �ͥåȥ�� iand ������ˤ��뤫�ɤ�����Ƚ�� ****)
let rec check_all_inside ofs iand q0 q1 q2 =
  let head = iand.(ofs) in
  if head = -1 then 
    true 
  else (
    if is_outside objects.(head) q0 q1 q2 then 
      false
    else 
      check_all_inside (ofs + 1) iand q0 q1 q2
   )
in

(******************************************************************************
   ��������¾��ʪ�ΤαƤ����äƤ��뤫�ݤ���Ƚ�ꤹ��ؿ� 
 *****************************************************************************)

(* �� intersection_point ���顢�����٥��ȥ��������é�ꡢ   *)
(* ʪ�Τˤ֤Ĥ��� (=�ƤˤϤ��äƤ���) ���ݤ���Ƚ�ꤹ�롣*)

(**** AND �ͥåȥ�� iand �α��⤫�ɤ�����Ƚ�� ****)
let rec shadow_check_and_group iand_ofs and_group =
  if and_group.(iand_ofs) = -1 then
    false
  else
    let obj = and_group.(iand_ofs) in
    let t0 = solver_fast obj light_dirvec intersection_point in
    let t0p = solver_dist.(0) in
    if (if t0 <> 0 then fless t0p (-0.2) else false) then 
      (* Q: �����θ��䡣�ºݤˤ��٤ƤΥ��֥������Ȥ� *)
      (* ���äƤ��뤫�ɤ�����Ĵ�٤롣*)
      let t = t0p +. 0.01 in
      let q0 = light.(0) *. t +. intersection_point.(0) in
      let q1 = light.(1) *. t +. intersection_point.(1) in
      let q2 = light.(2) *. t +. intersection_point.(2) in
      if check_all_inside 0 and_group q0 q1 q2 then
	true 
      else 
	shadow_check_and_group (iand_ofs + 1) and_group 
	  (* ���Υ��֥������Ȥ����������õ�� *)
    else
      (* �������ʤ����: ��������(��¦����)�ξ�硢    *)
      (* AND �ͥåȤζ�����ʬ�Ϥ�������˴ޤޤ�뤿�ᡢ*)
      (* �����Ϥʤ����Ȥϼ�����õ�����Ǥ��ڤ롣        *)
      if o_isinvert (objects.(obj)) then 
	shadow_check_and_group (iand_ofs + 1) and_group
      else 
	false
in

(**** OR ���롼�� or_group �αƤ��ɤ�����Ƚ�� ****)
let rec shadow_check_one_or_group ofs or_group =
  let head = or_group.(ofs) in
  if head = -1 then
    false
  else (
    let and_group = and_net.(head) in
    let shadow_p = shadow_check_and_group 0 and_group in
    if shadow_p then
      true
    else 
      shadow_check_one_or_group (ofs + 1) or_group
   )
in

(**** OR ���롼�פ���Τɤ줫�αƤ����äƤ��뤫�ɤ�����Ƚ�� ****)
let rec shadow_check_one_or_matrix ofs or_matrix =
  let head = or_matrix.(ofs) in
  let range_primitive = head.(0) in
  if range_primitive = -1 then (* OR����ν�λ�ޡ��� *)
    false 
  else
    if (* range primitive ��̵�������ޤ���range_primitive�ȸ�������ǧ *)
      if range_primitive = 99 then      (* range primitive ��̵�� *)
	true
      else              (* range_primitive������ *)
	let t = solver_fast range_primitive light_dirvec intersection_point in
        (* range primitive �Ȥ֤Ĥ���ʤ���� *)
        (* or group �Ȥθ����Ϥʤ�            *)
	if t <> 0 then
          if fless solver_dist.(0) (-0.1) then
            if shadow_check_one_or_group 1 head then
              true
	    else false
	  else false
	else false
    then
      if (shadow_check_one_or_group 1 head) then 
	true (* ����������Τǡ��Ƥ��������Ƚ����õ����λ *)
      else 
	shadow_check_one_or_matrix (ofs + 1) or_matrix (* �������Ǥ� *)
    else 
      shadow_check_one_or_matrix (ofs + 1) or_matrix (* �������Ǥ� *)
	
in

(******************************************************************************
   ������ʪ�Τθ�Ƚ��
 *****************************************************************************)

(**** ����AND�ͥåȥ�������쥤�ȥ졼�����������Ф���****)
(**** ���������뤫�ɤ�����Ĵ�٤롣                     ****)
let rec solve_each_element iand_ofs and_group dirvec =
  let iobj = and_group.(iand_ofs) in
  if iobj = -1 then ()
  else (
    let t0 = solver iobj dirvec startp in
    if t0 <> 0 then
      (
       (* ������������ϡ����θ�����¾�����Ǥ���˴ޤޤ�뤫�ɤ���Ĵ�٤롣*)
       (* ���ޤǤ���ǺǾ��� t ���ͤ���٤롣*)
       let t0p = solver_dist.(0) in

       if (fless 0.0 t0p) then
	 if (fless t0p tmin.(0)) then
	   (
	    let t = t0p +. 0.01 in
	    let q0 = dirvec.(0) *. t +. startp.(0) in
	    let q1 = dirvec.(1) *. t +. startp.(1) in
	    let q2 = dirvec.(2) *. t +. startp.(2) in
	    if check_all_inside 0 and_group q0 q1 q2 then 
	      ( 
		tmin.(0) <- t;
		vecset intersection_point q0 q1 q2;
		intersected_object_id.(0) <- iobj;
		intsec_rectside.(0) <- t0
	       )
	    else ()
	   )
	 else ()
       else ();
       solve_each_element (iand_ofs + 1) and_group dirvec 
      )
    else
      (* �������ʤ��������⤽��ʪ�Τ���¦�����ʤ餳��ʾ�����Ϥʤ� *)
      if o_isinvert (objects.(iobj)) then 
	solve_each_element (iand_ofs + 1) and_group dirvec
      else ()
	  
   )
in

(**** 1�Ĥ� OR-group �ˤĤ��Ƹ�����Ĵ�٤� ****)
let rec solve_one_or_network ofs or_group dirvec =
  let head = or_group.(ofs) in
  if head <> -1 then (
    let and_group = and_net.(head) in
    solve_each_element 0 and_group dirvec;
    solve_one_or_network (ofs + 1) or_group dirvec
   ) else ()
in

(**** OR�ޥȥꥯ�����ΤˤĤ��Ƹ�����Ĵ�٤롣****)
let rec trace_or_matrix ofs or_network dirvec =
  let head = or_network.(ofs) in
  let range_primitive = head.(0) in
  if range_primitive = -1 then (* �����֥������Ƚ�λ *)
    ()
  else ( 
    if range_primitive = 99 (* range primitive �ʤ� *)
    then (solve_one_or_network 1 head dirvec)
    else 
      (
	(* range primitive �ξ��ͤ��ʤ���и����Ϥʤ� *)
       let t = solver range_primitive dirvec startp in
       if t <> 0 then
	 let tp = solver_dist.(0) in
	 if fless tp tmin.(0)
	 then (solve_one_or_network 1 head dirvec)
	 else ()
       else ()
      );
    trace_or_matrix (ofs + 1) or_network dirvec
  )
in

(**** �ȥ졼������ ****)
(* �ȥ졼�������� ViewPoint �ȡ�����������Υ�����������٥��ȥ� *)
(* Vscan ���顢���� crashed_point �Ⱦ��ͤ������֥�������         *)
(* crashed_object ���֤����ؿ��Τ��֤��ͤϸ�����̵ͭ�ο����͡� *)
let rec judge_intersection dirvec = (
  tmin.(0) <- (1000000000.0);
  trace_or_matrix 0 (or_net.(0)) dirvec;
  let t = tmin.(0) in

  if (fless (-0.1) t) then
    (fless t 100000000.0)
  else false
 )
in

(******************************************************************************
   ������ʪ�Τθ�Ƚ�� ��®��
 *****************************************************************************)

let rec solve_each_element_fast iand_ofs and_group dirvec =
  let vec = (d_vec dirvec) in
  let iobj = and_group.(iand_ofs) in
  if iobj = -1 then ()
  else (
    let t0 = solver_fast2 iobj dirvec in
    if t0 <> 0 then
      (
        (* ������������ϡ����θ�����¾�����Ǥ���˴ޤޤ�뤫�ɤ���Ĵ�٤롣*)
        (* ���ޤǤ���ǺǾ��� t ���ͤ���٤롣*)
       let t0p = solver_dist.(0) in

       if (fless 0.0 t0p) then
	 if (fless t0p tmin.(0)) then
	   (
	    let t = t0p +. 0.01 in
	    let q0 = vec.(0) *. t +. startp_fast.(0) in
	    let q1 = vec.(1) *. t +. startp_fast.(1) in
	    let q2 = vec.(2) *. t +. startp_fast.(2) in
	    if check_all_inside 0 and_group q0 q1 q2 then 
	      ( 
		tmin.(0) <- t;
		vecset intersection_point q0 q1 q2;
		intersected_object_id.(0) <- iobj;
		intsec_rectside.(0) <- t0
	       )
	    else ()
	   )
	 else ()
       else ();
       solve_each_element_fast (iand_ofs + 1) and_group dirvec
      )
    else 
       (* �������ʤ��������⤽��ʪ�Τ���¦�����ʤ餳��ʾ�����Ϥʤ� *)
       if o_isinvert (objects.(iobj)) then 
	 solve_each_element_fast (iand_ofs + 1) and_group dirvec
       else ()
   )   
in

(**** 1�Ĥ� OR-group �ˤĤ��Ƹ�����Ĵ�٤� ****)
let rec solve_one_or_network_fast ofs or_group dirvec =
  let head = or_group.(ofs) in
  if head <> -1 then (
    let and_group = and_net.(head) in
    solve_each_element_fast 0 and_group dirvec;
    solve_one_or_network_fast (ofs + 1) or_group dirvec
   ) else ()
in

(**** OR�ޥȥꥯ�����ΤˤĤ��Ƹ�����Ĵ�٤롣****)
let rec trace_or_matrix_fast ofs or_network dirvec =
  let head = or_network.(ofs) in
  let range_primitive = head.(0) in
  if range_primitive = -1 then (* �����֥������Ƚ�λ *)
    ()
  else ( 
    if range_primitive = 99 (* range primitive �ʤ� *)
    then solve_one_or_network_fast 1 head dirvec
    else 
      (
	(* range primitive �ξ��ͤ��ʤ���и����Ϥʤ� *)
       let t = solver_fast2 range_primitive dirvec in
       if t <> 0 then
	 let tp = solver_dist.(0) in
	 if fless tp tmin.(0)
	 then (solve_one_or_network_fast 1 head dirvec)
	 else ()
       else ()
      );
    trace_or_matrix_fast (ofs + 1) or_network dirvec
   )
in

(**** �ȥ졼������ ****)
let rec judge_intersection_fast dirvec =
( 
  tmin.(0) <- (1000000000.0);
  trace_or_matrix_fast 0 (or_net.(0)) dirvec;
  let t = tmin.(0) in

  if (fless (-0.1) t) then
    (fless t 100000000.0)
  else false
)
in

(******************************************************************************
   ʪ�Τȸ��θ�����ˡ���٥��ȥ�����ؿ�
 *****************************************************************************)

(**** ��������ˡ���٥��ȥ��׻����� ****)
(* ���ͤ������֥������Ȥ��᤿�ݤ� solver ���֤��ͤ� *)
(* �ѿ� intsec_rectside ��ͳ���Ϥ��Ƥ��ɬ�פ����롣  *)
(* nvector �⥰���Х롣 *)

let rec get_nvector_rect dirvec =
  let rectside = intsec_rectside.(0) in
  (* solver ���֤��ͤϤ֤Ĥ��ä��̤������򼨤� *)
  vecbzero nvector;
  nvector.(rectside-1) <- fneg (sgn (dirvec.(rectside-1)))
in

(* ʿ�� *)
let rec get_nvector_plane m = 
  (* m_invert �Ͼ�� true �ΤϤ� *)
  nvector.(0) <- fneg (o_param_a m); (* if m_invert then fneg m_a else m_a *)
  nvector.(1) <- fneg (o_param_b m);
  nvector.(2) <- fneg (o_param_c m)
in

(* 2������ :  grad x^t A x = 2 A x ������������ *)
let rec get_nvector_second m =
  let p0 = intersection_point.(0) -. o_param_x m in
  let p1 = intersection_point.(1) -. o_param_y m in
  let p2 = intersection_point.(2) -. o_param_z m in

  let d0 = p0 *. o_param_a m in
  let d1 = p1 *. o_param_b m in
  let d2 = p2 *. o_param_c m in

  if o_isrot m = 0 then (
    nvector.(0) <- d0;
    nvector.(1) <- d1;
    nvector.(2) <- d2
   ) else (
    nvector.(0) <- d0 +. fhalf (p1 *. o_param_r3 m +. p2 *. o_param_r2 m);
    nvector.(1) <- d1 +. fhalf (p0 *. o_param_r3 m +. p2 *. o_param_r1 m);
    nvector.(2) <- d2 +. fhalf (p0 *. o_param_r2 m +. p1 *. o_param_r1 m)
   );
  vecunit_sgn nvector (o_isinvert m)

in

let rec get_nvector m dirvec =
  let m_shape = o_form m in
  if m_shape = 1 then
    get_nvector_rect dirvec
  else if m_shape = 2 then
    get_nvector_plane m
  else (* 2������ or ���� *)
    get_nvector_second m
  (* retval = nvector *)
in

(******************************************************************************
   ʪ��ɽ�̤ο�(���դ��Ȼ�ȿ��Ψ)�����
 *****************************************************************************)

(**** ������Υƥ�������ο���׻����� ****)
let rec utexture m p =
  let m_tex = o_texturetype m in
  (* ���ܤϥ��֥������Ȥο� *)
  texture_color.(0) <- o_color_red m;
  texture_color.(1) <- o_color_green m;
  texture_color.(2) <- o_color_blue m;
  if m_tex = 1 then
    (
     (* zx�����Υ����å������� (G) *)
     let w1 = p.(0) -. o_param_x m in
     let flag1 =
       let d1 = (floor (w1 *. 0.05)) *. 20.0 in
      fless (w1 -. d1) 10.0
     in
     let w3 = p.(2) -. o_param_z m in
     let flag2 =
       let d2 = (floor (w3 *. 0.05)) *. 20.0 in
       fless (w3 -. d2) 10.0 
     in
     texture_color.(1) <-
       if flag1 
       then (if flag2 then 255.0 else 0.0)
       else (if flag2 then 0.0 else 255.0)
    )
  else if m_tex = 2 then
    (* y�������Υ��ȥ饤�� (R-G) *)
    (
      let w2 = fsqr (sin (p.(1) *. 0.25)) in
      texture_color.(0) <- 255.0 *. w2;
      texture_color.(1) <- 255.0 *. (1.0 -. w2)
    )
  else if m_tex = 3 then 
    (* ZX��������Ʊ���� (G-B) *)
    ( 
      let w1 = p.(0) -. o_param_x m in
      let w3 = p.(2) -. o_param_z m in
      let w2 = sqrt (fsqr w1 +. fsqr w3) /. 10.0 in
      let w4 =  (w2 -. floor w2) *. 3.1415927 in
      let cws = fsqr (cos w4) in
      texture_color.(1) <- cws *. 255.0;
      texture_color.(2) <- (1.0 -. cws) *. 255.0
    )
  else if m_tex = 4 then (
    (* ���̾������ (B) *)
    let w1 = (p.(0) -. o_param_x m) *. (sqrt (o_param_a m)) in
    let w3 = (p.(2) -. o_param_z m) *. (sqrt (o_param_c m)) in
    let w4 = (fsqr w1) +. (fsqr w3) in
    let w7 = 
      if fless (fabs w1) 1.0e-4 then
	15.0 (* atan +infty = pi/2 *)
      else
	let w5 = fabs (w3 /. w1)
	in
	((atan w5) *. 30.0) /. 3.1415927 
    in
    let w9 = w7 -. (floor w7) in

    let w2 = (p.(1) -. o_param_y m) *. (sqrt (o_param_b m)) in
    let w8 =
      if fless (fabs w4) 1.0e-4 then
	15.0
      else 
	let w6 = fabs (w2 /. w4)
	in ((atan w6) *. 30.0) /. 3.1415927 
    in
    let w10 = w8 -. (floor w8) in
    let w11 = 0.15 -. (fsqr (0.5 -. w9)) -. (fsqr (0.5 -. w10)) in
    let w12 = if fisneg w11 then 0.0 else w11 in
    texture_color.(2) <- (255.0 *. w12) /. 0.3
   )
  else ()
in

(******************************************************************************
   �������������������ľ�ܸ���ȿ�͸���׻�����ؿ� 
 *****************************************************************************)

(* �����ä����ˤ��Ȼ������Դ�������ȿ�͸��ˤ���Ϳ��RGB�ͤ˲û� *)
let rec add_light bright hilight hilight_scale =

  (* �Ȼ��� *)
  if fispos bright then
    vecaccum rgb bright texture_color
  else ();

  (* �Դ�������ȿ�� cos ^4 ��ǥ� *)
  if fispos hilight then (
    let ihl = fsqr (fsqr hilight) *. hilight_scale in
    rgb.(0) <- rgb.(0) +. ihl;
    rgb.(1) <- rgb.(1) +. ihl;
    rgb.(2) <- rgb.(2) +. ihl
  ) else ()
in

(* ��ʪ�Τˤ�������ȿ�͸���׻�����ؿ�(ľ���Τ�ʿ�̤Τ�) *)
let rec trace_reflections index diffuse hilight_scale dirvec =

  if index >= 0 then (
    let rinfo = reflections.(index) in (* ��ʿ�̤�ȿ�;��� *)
    let dvec = r_dvec rinfo in    (* ȿ�͸��������٥��ȥ�(���ȵո��� *)

    (*ȿ�͸���դˤ��ɤꡢ�ºݤˤ��ζ��̤�������С�ȿ�͸����Ϥ���ǽ��ͭ�� *)
    if judge_intersection_fast dvec then
      let surface_id = intersected_object_id.(0) * 4 + intsec_rectside.(0) in
      if surface_id = r_surface_id rinfo then
	(* ���̤Ȥξ������������αƤˤʤäƤ��ʤ����ȿ�͸����Ϥ� *)
        if not (shadow_check_one_or_matrix 0 or_net.(0)) then
	  (* �Ϥ���ȿ�͸��ˤ�� RGB��ʬ�ؤδ�Ϳ��û� *)
          let p = veciprod nvector (d_vec dvec) in
          let scale = r_bright rinfo in
          let bright = scale *. diffuse *. p in
          let hilight = scale *. veciprod dirvec (d_vec dvec) in
          add_light bright hilight hilight_scale
        else ()
      else ()
    else ();
    trace_reflections (index - 1) diffuse hilight_scale dirvec
  ) else ()

in

(******************************************************************************
   ľ�ܸ������פ���
 *****************************************************************************)
let rec trace_ray nref energy dirvec pixel dist =
  if nref <= 4 then (
    let surface_ids = p_surface_ids pixel in
    if judge_intersection dirvec then (
    (* ���֥������Ȥˤ֤Ĥ��ä���� *)
      let obj_id = intersected_object_id.(0) in
      let obj = objects.(obj_id) in
      let m_surface = o_reflectiontype obj in
      let diffuse = o_diffuse obj *. energy in

      get_nvector obj dirvec; (* ˡ���٥��ȥ�� get *)
      veccpy startp intersection_point;  (* �����򿷤��ʸ���ȯ�����Ȥ��� *)
      utexture obj intersection_point; (*�ƥ��������׻� *)
      
      (* pixel tuple�˾�����Ǽ���� *)
      surface_ids.(nref) <- obj_id * 4 + intsec_rectside.(0);
      let intersection_points = p_intersection_points pixel in
      veccpy intersection_points.(nref) intersection_point;
      
      (* �Ȼ�ȿ��Ψ��0.5�ʾ�ξ��Τߴ��ܸ��Υ���ץ�󥰤�Ԥ� *)
      let calc_diffuse = p_calc_diffuse pixel in
      if fless (o_diffuse obj) 0.5 then 
	calc_diffuse.(nref) <- false
      else (
	calc_diffuse.(nref) <- true;
	let energya = p_energy pixel in
	veccpy energya.(nref) texture_color;
	vecscale energya.(nref) ((1.0 /. 256.0) *. diffuse);
	let nvectors = p_nvectors pixel in
	veccpy nvectors.(nref) nvector
       );

      let w = (-2.0) *. veciprod dirvec nvector in
      (* ȿ�͸��������˥ȥ졼���������ѹ� *)
      vecaccum dirvec w nvector;

      let hilight_scale = energy *. o_hilight obj in

      (* ��������ľ���Ϥ���硢RGB��ʬ�ˤ�����̣���� *)
      if not (shadow_check_one_or_matrix 0 or_net.(0)) then
        let bright = fneg (veciprod nvector light) *. diffuse in
        let hilight = fneg (veciprod dirvec light) in
        add_light bright hilight hilight_scale
      else ();

      (* ��������ȿ�͸���̵����õ�� *)
      setup_startp intersection_point;
      trace_reflections (n_reflections.(0)-1) diffuse hilight_scale dirvec;

      (* �Ťߤ� 0.1���¿���ĤäƤ����顢����ȿ�͸������פ��� *)
      if fless 0.1 energy then ( 
	
	if(nref < 4) then
	  surface_ids.(nref+1) <- -1
	else ();
	
	if m_surface = 2 then (   (* ��������ȿ�� *)
	  let energy2 = energy *. (1.0 -. o_diffuse obj) in
	  trace_ray (nref+1) energy2 dirvec pixel (dist +. tmin.(0))
	 ) else ()
	
       ) else ()
      
     ) else ( 
      (* �ɤ�ʪ�Τˤ�������ʤ��ä���硣��������θ����̣ *)

      surface_ids.(nref) <- -1;

      if nref <> 0 then (
	let hl = fneg (veciprod dirvec light) in
        (* 90���Ķ�������0 (���ʤ�) *)
	if fispos hl then
	  (
	   (* �ϥ��饤�ȶ��٤ϳ��٤� cos^3 ������ *)
	   let ihl = fsqr hl *. hl *. energy *. beam.(0) in
	   rgb.(0) <- rgb.(0) +. ihl;
	   rgb.(1) <- rgb.(1) +. ihl;
	   rgb.(2) <- rgb.(2) +. ihl
          )
	else ()
       ) else ()
     )
   ) else ()
in


(******************************************************************************
   ���ܸ������פ���
 *****************************************************************************)

(* ����������������������������ܸ��ζ�����׻����� *)
(* ���ܸ��������٥��ȥ� dirvec�˴ؤ��Ƥ����ơ��֥뤬����Ƥ��ꡢ����Ƚ��
   ����®�˹Ԥ��롣ʪ�Τ������ä��顢���θ��ȿ�ͤ����פ��ʤ� *)
let rec trace_diffuse_ray dirvec energy =
 
  (* �ɤ줫��ʪ�Τ������뤫Ĵ�٤� *)
  if judge_intersection_fast dirvec then
    let obj = objects.(intersected_object_id.(0)) in
    get_nvector obj (d_vec dirvec); 
    utexture obj intersection_point;      

    (* ����ʪ�Τ����ͤ�����ζ�������롣ľ�ܸ������Τߤ�׻� *)
    if not (shadow_check_one_or_matrix 0 or_net.(0)) then 
      let br =  fneg (veciprod nvector light) in
      let bright = (if fispos br then br else 0.0) in
      vecaccum diffuse_ray (energy *. bright *. o_diffuse obj) texture_color
    else ()
  else ()
in

(* ���餫�������줿�����٥��ȥ��������Ф����ƥ٥��ȥ�����Ѥ������
   ���ܸ��ζ����򥵥�ץ�󥰤��Ʋû����� *)
let rec iter_trace_diffuse_rays dirvec_group nvector org index = 
  if index >= 0 then (
    let p = veciprod (d_vec dirvec_group.(index)) nvector in

    (* ����� 2n ���ܤ� 2n+1 ���ܤˤϸߤ��˵ո��������٥��ȥ뤬���äƤ���
       ˡ���٥��ȥ��Ʊ��������ʪ������ǻȤ� *)
    if fisneg p then
      trace_diffuse_ray dirvec_group.(index + 1) (p /. -150.0)
    else 
      trace_diffuse_ray dirvec_group.(index) (p /. 150.0);
	
    iter_trace_diffuse_rays dirvec_group nvector org (index - 2)
   ) else ()
in

(* Ϳ����줿�����٥��ȥ�ν�����Ф������������δ��ܸ��򥵥�ץ�󥰤��� *)
let rec trace_diffuse_rays dirvec_group nvector org =
  setup_startp org;
  (* ����� 2n ���ܤ� 2n+1 ���ܤˤϸߤ��˵ո��������٥��ȥ뤬���äƤ��ơ�
     ˡ���٥��ȥ��Ʊ��������ʪ�Τߥ���ץ�󥰤˻Ȥ��� *)
  (* ����� 120 / 2 = 60�ܤΥ٥��ȥ������ *)
  iter_trace_diffuse_rays dirvec_group nvector org 118
in

(* Ⱦ�������������300�ܤΥ٥��ȥ�Τ������ޤ����פ��Ƥ��ʤ��Ĥ��240�ܤ�
   �٥��ȥ�ˤĤ��ƴ��ܸ����פ��롣60�ܤΥ٥��ȥ����פ�4���åȹԤ� *)
let rec trace_diffuse_ray_80percent group_id nvector org = 

  if group_id <> 0 then 
    trace_diffuse_rays dirvecs.(0) nvector org
  else ();

  if group_id <> 1 then
    trace_diffuse_rays dirvecs.(1) nvector org
  else ();
  
  if group_id <> 2 then
    trace_diffuse_rays dirvecs.(2) nvector org
  else ();
  
  if group_id <> 3 then
    trace_diffuse_rays dirvecs.(3) nvector org
  else ();
  
  if group_id <> 4 then
    trace_diffuse_rays dirvecs.(4) nvector org
  else ()
  
in

(* �岼����4���δ��ܸ����׷�̤�Ȥ鷺��300������Υ٥��ȥ�����פ��ƴ��ܸ���
   �׻����롣20%(60��)�����׺ѤʤΤǡ��Ĥ�80%(240��)�����פ��� *)
let rec calc_diffuse_using_1point pixel nref = 
  
  let ray20p = p_received_ray_20percent pixel in
  let nvectors = p_nvectors pixel in
  let intersection_points = p_intersection_points pixel in
  let energya = p_energy pixel in

  veccpy diffuse_ray ray20p.(nref);
  trace_diffuse_ray_80percent 
    (p_group_id pixel)
    nvectors.(nref)
    intersection_points.(nref);
  vecaccumv rgb energya.(nref) diffuse_ray
    
in

(* ��ʬ�Ⱦ岼����4�������׷�̤�û����ƴ��ܸ�����롣����� 300 �ܤθ���
   ���פ���ɬ�פ����뤬��5���û�����Τ�1��������60��(20%)���פ�������ǺѤ� *)
   
let rec calc_diffuse_using_5points x prev cur next nref =

  let r_up = p_received_ray_20percent prev.(x) in
  let r_left = p_received_ray_20percent cur.(x-1) in
  let r_center = p_received_ray_20percent cur.(x) in
  let r_right = p_received_ray_20percent cur.(x+1) in
  let r_down = p_received_ray_20percent next.(x) in
  
  veccpy diffuse_ray r_up.(nref);
  vecadd diffuse_ray r_left.(nref);
  vecadd diffuse_ray r_center.(nref);
  vecadd diffuse_ray r_right.(nref);
  vecadd diffuse_ray r_down.(nref);
  
  let energya = p_energy cur.(x) in
  vecaccumv rgb energya.(nref) diffuse_ray
  
in

(* �岼����4����Ȥ鷺��ľ�ܸ��γƾ������ˤ�������ܼ�����׻����� *)
let rec do_without_neighbors pixel nref = 
  if nref <= 4 then
    (* �������ֹ椬ͭ��(����)�������å� *)
    let surface_ids = p_surface_ids pixel in
    if surface_ids.(nref) >= 0 then (
      let calc_diffuse = p_calc_diffuse pixel in
      if calc_diffuse.(nref) then
	calc_diffuse_using_1point pixel nref
      else ();
      do_without_neighbors pixel (nref + 1)
     ) else ()
  else ()
in

(* ������Ǿ岼�������������뤫(�פ���ˡ�������ü��̵����)���ǧ *)
let rec neighbors_exist x y next =
  if (y + 1) < image_size.(1) then 
    if y > 0 then
      if (x + 1) < image_size.(0) then
	if x > 0 then
	  true
	else false
      else false
    else false
  else false
in

let rec get_surface_id pixel index =
  let surface_ids = p_surface_ids pixel in
  surface_ids.(index)
in

(* �岼����4����ľ�ܸ����פη�̡���ʬ��Ʊ���̤˾��ͤ��Ƥ��뤫������å�
   �⤷Ʊ���̤˾��ͤ��Ƥ���С������4���η�̤�Ȥ����ȤǷ׻����ά����� *)
let rec neighbors_are_available x prev cur next nref =
  let sid_center = get_surface_id cur.(x) nref in

  if get_surface_id prev.(x) nref = sid_center then
    if get_surface_id next.(x) nref = sid_center then
      if get_surface_id cur.(x-1) nref = sid_center then
	if get_surface_id cur.(x+1) nref = sid_center then
	  true
	else false
      else false
    else false
  else false
in

(* ľ�ܸ��γƾ������ˤ�������ܼ����ζ����򡢾岼����4���η�̤���Ѥ��Ʒ׻�
   ���롣�⤷�岼����4���η׻���̤�Ȥ��ʤ����ϡ����λ�����
   do_without_neighbors���ڤ��ؤ��� *)

let rec try_exploit_neighbors x y prev cur next nref =
  let pixel = cur.(x) in
  if nref <= 4 then

    (* �������ֹ椬ͭ��(����)�� *)
    if get_surface_id pixel nref >= 0 then
      (* ����4�����䴰�˻Ȥ��뤫 *)
      if neighbors_are_available x prev cur next nref then (

	(* ���ܼ�����׻�����ե饰��Ω�äƤ���мºݤ˷׻����� *)
	let calc_diffuse = p_calc_diffuse pixel in
        if calc_diffuse.(nref) then
	  calc_diffuse_using_5points x prev cur next nref
	else ();

	(* ����ȿ�;������� *)
	try_exploit_neighbors x y prev cur next (nref + 1)
      ) else
	(* ����4�����䴰�˻Ȥ��ʤ��Τǡ�������Ȥ�ʤ���ˡ���ڤ��ؤ��� *)
	do_without_neighbors cur.(x) nref
    else ()
  else ()
in

(******************************************************************************
   PPM�ե�����ν񤭹��ߴؿ�
 *****************************************************************************)
let rec write_ppm_header _ =
  ( 
    print_char 80; (* 'P' *)
    print_char (48 + 3); (* +6 if binary *) (* 48 = '0' *)
    print_char 10;
    print_int image_size.(0);
    print_char 32;
    print_int image_size.(1);
    print_char 32;
    print_int 255;
    print_char 10
  )
in

let rec write_rgb_element x =
  let ix = int_of_float x in
  let elem = if ix > 255 then 255 else if ix < 0 then 0 else ix in
  print_int elem
in

let rec write_rgb _ =
   write_rgb_element rgb.(0); (* Red   *)
   print_char 32;
   write_rgb_element rgb.(1); (* Green *)
   print_char 32;
   write_rgb_element rgb.(2); (* Blue  *)
   print_char 10
in

(******************************************************************************
   ����饤��η׻���ɬ�פʾ���򽸤�뤿�ἡ�Υ饤������פ�ԤäƤ����ؿ�
 *****************************************************************************)

(* ���ܸ��Υ���ץ�󥰤ǤϾ岼����4���η�̤�Ȥ��Τǡ����Υ饤��η׻���
   �Ԥ�ʤ��Ⱥǽ�Ū�ʥԥ�������ͤ�׻��Ǥ��ʤ� *)

(* ���ܸ��� 60��(20%)�����׻����Ƥ����ؿ� *)
let rec pretrace_diffuse_rays pixel nref =
  if nref <= 4 then

    (* ���ֹ椬ͭ���� *)
    let sid = get_surface_id pixel nref in
    if sid >= 0 then (
      (* ���ܸ���׻�����ե饰��Ω�äƤ��뤫 *)
      let calc_diffuse = p_calc_diffuse pixel in
      if calc_diffuse.(nref) then (
	let group_id = p_group_id pixel in
	vecbzero diffuse_ray;

	(* 5�Ĥ������٥��ȥ뽸��(��60��)���鼫ʬ�Υ��롼��ID���б�����ʪ��
	   ������������ *)
	let nvectors = p_nvectors pixel in
	let intersection_points = p_intersection_points pixel in
	trace_diffuse_rays 
	  dirvecs.(group_id) 
	  nvectors.(nref)
	  intersection_points.(nref);
	let ray20p = p_received_ray_20percent pixel in
	veccpy ray20p.(nref) diffuse_ray
       ) else ();
      pretrace_diffuse_rays pixel (nref + 1)
     ) else ()
  else ()
in

(* �ƥԥ�������Ф���ľ�ܸ����פȴ��ܼ�����20%ʬ�η׻���Ԥ� *)

let rec pretrace_pixels line x group_id lc0 lc1 lc2 = 
  if x >= 0 then (

    let xdisp = scan_pitch.(0) *. float_of_int (x - image_center.(0)) in
    ptrace_dirvec.(0) <- xdisp *. screenx_dir.(0) +. lc0;
    ptrace_dirvec.(1) <- xdisp *. screenx_dir.(1) +. lc1;
    ptrace_dirvec.(2) <- xdisp *. screenx_dir.(2) +. lc2;
    vecunit_sgn ptrace_dirvec false;
    vecbzero rgb;
    veccpy startp viewpoint;

    (* ľ�ܸ����� *)
    trace_ray 0 1.0 ptrace_dirvec line.(x) 0.0;
    veccpy (p_rgb line.(x)) rgb;
    p_set_group_id line.(x) group_id;
    
    (* ���ܸ���20%������ *)
    pretrace_diffuse_rays line.(x) 0;
    
    pretrace_pixels line (x-1) (add_mod5 group_id 1) lc0 lc1 lc2
    
   ) else ()
in

(* ����饤��γƥԥ�������Ф�ľ�ܸ����פȴ��ܼ���20%ʬ�η׻��򤹤� *)
let rec pretrace_line line y group_id = 
  let ydisp = scan_pitch.(0) *. float_of_int (y - image_center.(1)) in
 
  (* �饤����濴�˸������٥��ȥ��׻� *)
  let lc0 = ydisp *. screeny_dir.(0) +. screenz_dir.(0) in
  let lc1 = ydisp *. screeny_dir.(1) +. screenz_dir.(1) in
  let lc2 = ydisp *. screeny_dir.(2) +. screenz_dir.(2) in
  pretrace_pixels line (image_size.(0) - 1) group_id lc0 lc1 lc2
in


(******************************************************************************
   ľ�ܸ����פȴ��ܸ�20%���פη�̤���ǽ�Ū�ʥԥ������ͤ�׻�����ؿ�
 *****************************************************************************)

(* �ƥԥ�����κǽ�Ū�ʥԥ������ͤ�׻� *)
let rec scan_pixel x y prev cur next = 
  if x < image_size.(0) then (

    (* �ޤ���ľ�ܸ����פ�����줿RGB�ͤ����� *)
    veccpy rgb (p_rgb cur.(x));

    (* ���ˡ�ľ�ܸ��γƾ������ˤĤ��ơ����ܼ����ˤ���Ϳ���̣���� *)
    if neighbors_exist x y next then
      try_exploit_neighbors x y prev cur next 0
    else
      do_without_neighbors cur.(x) 0;

    (* ����줿�ͤ�PPM�ե�����˽��� *)
    write_rgb ();

    scan_pixel (x + 1) y prev cur next
   ) else ()
in

(* ��饤��ʬ�Υԥ������ͤ�׻� *)
let rec scan_line y prev cur next group_id = (

  if y < image_size.(1) then (

    if y < image_size.(1) - 1 then
      pretrace_line next (y + 1) group_id
    else ();
    scan_pixel 0 y prev cur next;
    scan_line (y + 1) cur next prev (add_mod5 group_id 2)
   ) else ()      
)
in

(******************************************************************************
   �ԥ�����ξ�����Ǽ����ǡ�����¤�γ�����ƴؿ�
 *****************************************************************************)

(* 3�����٥��ȥ��5��������������� *)
let rec create_float5x3array _ = (
  let vec = create_array 3 0.0 in
  let array = create_array 5 vec in
  array.(1) <- create_array 3 0.0;
  array.(2) <- create_array 3 0.0;
  array.(3) <- create_array 3 0.0;
  array.(4) <- create_array 3 0.0;
  array
)
in

(* �ԥ������ɽ��tuple�������� *)
let rec create_pixel _ =
  let m_rgb = create_array 3 0.0 in
  let m_isect_ps = create_float5x3array() in
  let m_sids = create_array 5 0 in
  let m_cdif = create_array 5 false in
  let m_engy = create_float5x3array() in
  let m_r20p = create_float5x3array() in
  let m_gid = create_array 1 0 in
  let m_nvectors = create_float5x3array() in
  (m_rgb, m_isect_ps, m_sids, m_cdif, m_engy, m_r20p, m_gid, m_nvectors)
in

(* ������1�饤����γƥԥ��������Ǥ������Ƥ� *)
let rec init_line_elements line n =
  if n >= 0 then (
    line.(n) <- create_pixel();
    init_line_elements line (n-1)
   ) else
    line
in

(* ������1�饤��ʬ�Υԥ������������ *)
let rec create_pixelline _ = 
  let line = create_array image_size.(0) (create_pixel()) in
  init_line_elements line (image_size.(0)-2)
in

(******************************************************************************
   ���ܸ��Υ���ץ�󥰤ˤĤ��������٥��ȥ뷲��׻�����ؿ�
 *****************************************************************************)

(* �٥��ȥ�ã�������������ͤ�ʬ�ۤ���褦��600�ܤ������٥��ȥ�θ���������
   Ω���ξ�γ��̤�100�ܤ���ʬ�ۤ���������ˡ�100�ܤ�Ω���ξ���̾��10 x 10 ��
   �ʻҾ����¤֤褦�������Ȥ�����������Ǥ����Ѥˤ��٥��ȥ��̩�٤κ���
   �礭���Τǡ������������ä�����Τ�ǽ�Ū���Ѥ��� *)

let rec tan x =
  sin(x) /. cos(x)
in

(* �٥��ȥ�ã�������������̾��˰��ͤ�ʬ�ۤ���褦��ɸ���������� *)
let rec adjust_position h ratio =
  let l = sqrt(h*.h +. 0.1) in
  let tan_h = 1.0 /. l in
  let theta_h = atan tan_h in
   let tan_m = tan (theta_h *. ratio) in
  tan_m *. l
in

(* �٥��ȥ�ã�������������̾��˰��ͤ�ʬ�ۤ���褦�ʸ�����׻����� *)
let rec calc_dirvec icount x y rx ry group_id index =
  if icount >= 5 then (
    let l = sqrt(fsqr x +. fsqr y +. 1.0) in
    let vx = x /. l in
    let vy = y /. l in
    let vz = 1.0 /. l in

    (* Ω����Ū���оΤ�ʬ�ۤ����� *)
    let dgroup = dirvecs.(group_id) in
    vecset (d_vec dgroup.(index))    vx vy vz;
    vecset (d_vec dgroup.(index+40)) vx vz (fneg vy);
    vecset (d_vec dgroup.(index+80)) vz (fneg vx) (fneg vy);
    vecset (d_vec dgroup.(index+1)) (fneg vx) (fneg vy) (fneg vz);
    vecset (d_vec dgroup.(index+41)) (fneg vx) (fneg vz) vy;
    vecset (d_vec dgroup.(index+81)) (fneg vz) vx vy
   ) else 
    let x2 = adjust_position y rx in
    calc_dirvec (icount + 1) x2 (adjust_position x2 ry) rx ry group_id index
in

(* Ω���ξ�� 10x10�ʻҤι���γƥ٥��ȥ��׻����� *)
let rec calc_dirvecs col ry group_id index =
  if col >= 0 then (
    (* ��Ⱦʬ *)
    let rx = (float_of_int col) *. 0.2 -. 0.9 in (* ��κ�ɸ *)
    calc_dirvec 0 0.0 0.0 rx ry group_id index;
    (* ��Ⱦʬ *)
    let rx2 = (float_of_int col) *. 0.2 +. 0.1 in (* ��κ�ɸ *)
    calc_dirvec 0 0.0 0.0 rx2 ry group_id (index + 2);

    calc_dirvecs (col - 1) ry (add_mod5 group_id 1) index
   ) else ()
in

(* Ω���ξ��10x10�ʻҤγƹԤ��Ф��٥��ȥ�θ�����׻����� *)
let rec calc_dirvec_rows row group_id index =
  if row >= 0 then (
    let ry = (float_of_int row) *. 0.2 -. 0.9 in (* �Ԥκ�ɸ *)
    calc_dirvecs 4 ry group_id index; (* ���ʬ�׻� *)
    calc_dirvec_rows (row - 1) (add_mod5 group_id 2) (index + 4) 
   ) else ()
in

(******************************************************************************
   dirvec �Υ��������Ƥ�Ԥ�
 *****************************************************************************)


let rec create_dirvec _ =
  let v3 = create_array 3 0.0 in
  let consts = create_array n_objects.(0) v3 in
  (v3, consts)
in

let rec create_dirvec_elements d index =
  if index >= 0 then (
    d.(index) <- create_dirvec();
    create_dirvec_elements d (index - 1)
   ) else ()
in

let rec create_dirvecs index =
  if index >= 0 then (
    dirvecs.(index) <- create_array 120 (create_dirvec());
    create_dirvec_elements dirvecs.(index) 118;
    create_dirvecs (index-1)
   ) else ()
in

(******************************************************************************
   ����ؿ�ã��ƤӽФ���dirvec�ν������Ԥ� 
 *****************************************************************************)

let rec init_dirvec_constants vecset index =
  if index >= 0 then (
    setup_dirvec_constants vecset.(index);
    init_dirvec_constants vecset (index - 1)
   ) else ()
in

let rec init_vecset_constants index =
  if index >= 0 then (
    init_dirvec_constants dirvecs.(index) 119;
    init_vecset_constants (index - 1)
   ) else ()
in

let rec init_dirvecs _ =
  create_dirvecs 4;
  calc_dirvec_rows 9 0 0;
  init_vecset_constants 4
in

(******************************************************************************
   ��������ȿ����ʬ�����ʪ�Τ�ȿ�;������������
 *****************************************************************************)

(* ȿ��ʿ�̤��ɲä��� *)
let rec add_reflection index surface_id bright v0 v1 v2 =
  let dvec = create_dirvec() in
  vecset (d_vec dvec) v0 v1 v2; (* ȿ�͸��θ��� *)
  setup_dirvec_constants dvec;

  reflections.(index) <- (surface_id, dvec, bright)
in

(* ľ���Τγ��̤ˤĤ��ƾ�����ɲä��� *)
let rec setup_rect_reflection obj_id obj =
  let sid = obj_id * 4 in
  let nr = n_reflections.(0) in
  let br = 1.0 -. o_diffuse obj in
  let n0 = fneg light.(0) in
  let n1 = fneg light.(1) in
  let n2 = fneg light.(2) in
  add_reflection nr (sid+1) br light.(0) n1 n2;
  add_reflection (nr+1) (sid+2) br n0 light.(1) n2;
  add_reflection (nr+2) (sid+3) br n0 n1 light.(2);
  n_reflections.(0) <- nr + 3
in

(* ʿ�̤ˤĤ��ƾ�����ɲä��� *)
let rec setup_surface_reflection obj_id obj =
  let sid = obj_id * 4 + 1 in
  let nr = n_reflections.(0) in
  let br = 1.0 -. o_diffuse obj in
  let p = veciprod light (o_param_abc obj) in

  add_reflection nr sid br
    (2.0 *. o_param_a obj *. p -. light.(0))
    (2.0 *. o_param_b obj *. p -. light.(1))
    (2.0 *. o_param_c obj *. p -. light.(2));
  n_reflections.(0) <- nr + 1
in


(* �ƥ��֥������Ȥ��Ф���ȿ�ͤ���ʿ�̤�����Ф��ξ�����ɲä��� *)
let rec setup_reflections obj_id = 
  if obj_id >= 0 then
    let obj = objects.(obj_id) in
    if o_reflectiontype obj = 2 then
      if fless (o_diffuse obj) 1.0 then
	let m_shape = o_form obj in
	(* ľ���Τ�ʿ�̤Τߥ��ݡ��� *)
	if m_shape = 1 then 
	  setup_rect_reflection obj_id obj
	else if m_shape = 2 then
	  setup_surface_reflection obj_id obj
	else ()
      else ()
    else ()
  else ()
in

(*****************************************************************************
   ���Τ�����
 *****************************************************************************)

(* �쥤�ȥ�γƥ��ƥåפ�Ԥ��ؿ��缡�ƤӽФ� *)
let rec rt size_x size_y =
(
 image_size.(0) <- size_x;
 image_size.(1) <- size_y;
 image_center.(0) <- size_x / 2;
 image_center.(1) <- size_y / 2;
 scan_pitch.(0) <- 128.0 /. float_of_int size_x;
 let prev = create_pixelline () in
 let cur  = create_pixelline () in
 let next = create_pixelline () in
 read_parameter();
 write_ppm_header ();
 init_dirvecs();
 veccpy (d_vec light_dirvec) light;
 setup_dirvec_constants light_dirvec;
 setup_reflections (n_objects.(0) - 1);
 pretrace_line cur 0 0;
 scan_line 0 prev cur next 2 
)
in

let _ = rt 128 128

in ()

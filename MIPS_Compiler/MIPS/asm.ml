(* MIPS assembly *)

type id_or_imm = V of Id.t | C of int
type t = (* ̿����� (caml2html: sparcasm_t) *)
  | Ans of exp
  | Let of (Id.t * Type.t) * exp * t
and exp = (* ��İ�Ĥ�̿����б����뼰 (caml2html: sparcasm_exp) *)
  | Nop
  | Li of int
  | FLi of float (*Id.l*)
  | SetL of Id.l
  | Mr of Id.t
  | Neg of Id.t
  | Add of Id.t * id_or_imm
  | Sub of Id.t * id_or_imm
  | Mul of Id.t * id_or_imm
  | Div of Id.t * id_or_imm
  | Slw of Id.t * id_or_imm
  | Lwz of Id.t * id_or_imm
  | Stw of Id.t * Id.t * id_or_imm
  | FMr of Id.t
  | FNeg of Id.t
  | FAdd of Id.t * Id.t
  | FSub of Id.t * Id.t
  | FMul of Id.t * Id.t
  | FDiv of Id.t * Id.t
  | Lfd of Id.t * id_or_imm
  | Stfd of Id.t * Id.t * id_or_imm
  | Comment of string
  (* virtual instructions *)
  | IfEq of Id.t * id_or_imm * t * t
  | IfLE of Id.t * id_or_imm * t * t
  | IfGE of Id.t * id_or_imm * t * t (* �����оΤǤϤʤ��Τ�ɬ�� *)
  | IfFEq of Id.t * Id.t * t * t
  | IfFLE of Id.t * Id.t * t * t
  | Print_int of Id.t
  | Print_char of Id.t
  | Print_float of Id.t
  | Read_int
  | Read_float
  (* closure address, integer arguments, and float arguments *)
  | CallCls of Id.t * Id.t list * Id.t list
  | CallDir of Id.l * Id.t list * Id.t list
  | Save of Id.t * Id.t (* �쥸�����ѿ���ͤ򥹥��å��ѿ����¸ (caml2html: sparcasm_save) *)
  | Restore of Id.t (* �����å��ѿ���ͤ����� (caml2html: sparcasm_restore) *)
type fundef = { name : Id.l; args : Id.t list; fargs : Id.t list; body : t; ret : Type.t }
(* �ץ�������� = ��ư��������ơ��֥� + �ȥåץ�٥�ؿ� + �ᥤ��μ� (caml2html: sparcasm_prog) *)
type prog = Prog of (Id.l * float) list * fundef list * t

let fletd(x, e1, e2) = Let((x, Type.Float), e1, e2)
let seq(e1, e2) = Let((Id.gentmp Type.Unit, Type.Unit), e1, e2)

let regs = (* Array.init 27 (fun i -> Printf.sprintf "_R_%d" i) *)
  [| "%r2"; "%r3"; "%r4"; "%r5"; "%r6"; "%r7"; "%r8"; "%r9"; "%r10";
     "%r11"; "%r12"; "%r13"; "%r14"; "%r15"; "%r16"; "%r17"; "%r18";
     "%r19"; "%r20"; "%r21"; "%r22"; "%r23"; "%r24"; "%r25"; "%r26"; |]
let fregs = Array.init 28 (fun i -> Printf.sprintf "%%f%d" (i + 1)) (*f31はcondition register*)
let allregs = (Array.to_list regs) @ ["%r0"; "%r1"; "%r27"; "%r28"; "%r29"; "%r30"; "%r31"]
let allfregs = Array.to_list fregs @ ["%f0"; "%f29"; "%f30"; "%f31"]
let reg_cl = "%r28"(*regs.(Array.length regs - 1)*) (* closure address (caml2html: sparcasm_regcl) *)
let reg_sw = "%r1"(*regs.(Array.length regs - 2)*) (* temporary for swap *)
let reg_fsw = "%f0"(*fregs.(Array.length fregs - 1)*) (* temporary for swap *)
let reg_sp = "%r29" (* stack pointer *)
let reg_hp = "%r30" (* heap pointer (caml2html: sparcasm_reghp) *)
let reg_tmp = "%r27" (* [XX] ad hoc *)
let reg_link = "%r31" (* link register *)
let reg_pi = "%f29" (* 円周率が格納されている神のみぞ知るレジスタ *)
let reg_onehalf = "%f30" (* 0.5が入っているだけの虚無レジスタ *)
let is_reg x = (x.[0] = '%')

(* super-tenuki *)
let rec remove_and_uniq xs = function
  | [] -> []
  | x :: ys when S.mem x xs -> remove_and_uniq xs ys
  | x :: ys -> x :: remove_and_uniq (S.add x xs) ys

(* free variables in the order of use (for spilling) (caml2html: sparcasm_fv) *)
let fv_id_or_imm = function V(x) -> [x] | _ -> []
let rec fv_exp = function
  | Nop | Li(_) | FLi(_) | SetL(_) | Comment(_) | Restore(_) | Read_int | Read_float -> []
  | Mr(x) | Neg(x) | FMr(x) | FNeg(x) | Save(x, _) -> [x]
  | Add(x, y') | Sub(x, y') | Mul(x, y') | Div(x, y') |Slw(x, y') | Lfd(x, y') | Lwz(x, y') -> x :: fv_id_or_imm y'
  | Stw(x, y, z') | Stfd(x, y, z') -> x :: y :: fv_id_or_imm z'
  | FAdd(x, y) | FSub(x, y) | FMul(x, y) | FDiv(x, y) -> [x; y]
  | IfEq(x, y', e1, e2) | IfLE(x, y', e1, e2) | IfGE(x, y', e1, e2) ->  x :: fv_id_or_imm y' @ remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | IfFEq(x, y, e1, e2) | IfFLE(x, y, e1, e2) -> x :: y :: remove_and_uniq S.empty (fv e1 @ fv e2) (* uniq here just for efficiency *)
  | Print_int(x) | Print_float(x) | Print_char(x) -> [x]
  | CallCls(x, ys, zs) -> x :: ys @ zs
  | CallDir(_, ys, zs) -> ys @ zs
and fv = function
  | Ans(exp) -> fv_exp exp
  | Let((x, t), exp, e) ->
      fv_exp exp @ remove_and_uniq (S.singleton x) (fv e)
let fv e = remove_and_uniq S.empty (fv e)

let rec concat e1 xt e2 =
  match e1 with
  | Ans(exp) -> Let(xt, exp, e2)
  | Let(yt, exp, e1') -> Let(yt, exp, concat e1' xt e2)

let align i = i(*(if i mod 8 = 0 then i else i + 4)*)

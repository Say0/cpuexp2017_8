open Asm

type ya =
  | Z of Id.t * Asm.id_or_imm
  | F of Id.t * Id.t

(*external gethi : float -> int32 = "gethi"
external getlo : float -> int32 = "getlo"*)

let stackset = ref S.empty (* すでにSaveされた変数の集合 (caml2html: emit_stackset) *)
let stackmap = ref [] (* Saveされた変数の、スタックにおける位置 (caml2html: emit_stackmap) *)
let save x =
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    stackmap := !stackmap @ [x]
let savef x =
  stackset := S.add x !stackset;
  if not (List.mem x !stackmap) then
    (let pad =
      if List.length !stackmap mod 2 = 0 then [] else [Id.gentmp Type.Int] in
      stackmap := !stackmap @ pad @ [x; x])
    (*stackmap := !stackmap @ pad @ [x; x])*)
let locate x =
  let rec loc = function
    | [] -> []
    | y :: zs when x = y -> 0 :: List.map succ (loc zs)
    | y :: zs -> List.map succ (loc zs) in
  loc !stackmap
let offset x = 4 * List.hd (locate x)
let stacksize () = align ((List.length !stackmap + 1) * 4)

let reg r =
  if is_reg r
  then String.sub r 1 (String.length r - 1)
  else r

let load_label r label =
  let r' = reg r in
  Printf.sprintf
    "\tlui\t%s, ha16(%s)\n\tori\t%s, %s, lo16(%s)\n"
    r' label r' r' label

(* 関数呼び出しのために引数を並べ替える(register shuffling) (caml2html: emit_shuffle) *)
let rec shuffle sw xys =
  (* remove identical moves *)
  let _, xys = List.partition (fun (x, y) -> x = y) xys in
  (* find acyclic moves *)
  match List.partition (fun (_, y) -> List.mem_assoc y xys) xys with
  | [], [] -> []
  | (x, y) :: xys, [] -> (* no acyclic moves; resolve a cyclic move *)
      (y, sw) :: (x, y) :: shuffle sw (List.map
                                         (function
                                           | (y', z) when y = y' -> (sw, z)
                                           | yz -> yz)
                                         xys)
  | xys, acyc -> acyc @ shuffle sw xys

type dest = Tail | NonTail of Id.t (* 末尾かどうかを表すデータ型 (caml2html: emit_dest) *)
let rec g oc = function (* 命令列のアセンブリ生成 (caml2html: emit_g) *)
  | dest, Ans(exp) -> g' oc (dest, exp)
  | dest, Let((x, t), exp, e) ->
      g' oc (NonTail(x), exp);
      g oc (dest, e)
and g' oc = function (* 各命令のアセンブリ生成 (caml2html: emit_gprime) *)
  (* 末尾でなかったら計算結果をdestにセット (caml2html: emit_nontail) *)
  | NonTail(_), Nop -> ()
  | NonTail(x), Li(i) when -32768 <= i && i < 32768 -> Printf.fprintf oc "\taddi\t%s, r0, %d #%d\n" (reg x) i i
  | NonTail(x), Li(i) ->
      let n = i lsr 16 in
      let m = i lxor (n lsl 16) in
      let r = reg x in
      Printf.fprintf oc "\tlui\t%s, %d #%d\n" r n i;
      Printf.fprintf oc "\tori\t%s, %s, %d\n" r r m
  | NonTail(x), FLi(d) ->
      let intd = Int32.bits_of_float d in
      let inth16 = Int32.shift_right_logical intd 16 in
      let intl16 = Int32.shift_right_logical (Int32.shift_left intd 16) 16 in
      Printf.fprintf oc "\tlui\t%s, %ld #%f\n" (reg reg_tmp) inth16 d;
      Printf.fprintf oc "\tori\t%s, %s, %ld\n" (reg reg_tmp) (reg reg_tmp) intl16;
      Printf.fprintf oc "\tfmtc\t%s, %s\n" (reg reg_tmp) (reg x)
  (*| NonTail(x), FLi(Id.L(l)) ->
      (*結局ここを変更すればいいだけだった*)
      let s = load_label (reg reg_tmp) l in
      Printf.fprintf oc "%s\tflw\t%s, 0(%s)\n" s (reg x) (reg reg_tmp)*)
  | NonTail(x), SetL(Id.L(y)) ->
      let s = load_label x y in
      Printf.fprintf oc "%s" s
  | NonTail(x), Mr(y) when x = y -> ()
  | NonTail(x), Mr(y) -> Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg x) (reg y)
  | NonTail(x), Neg(y) -> Printf.fprintf oc "\tneg\t%s, %s\n" (reg x) (reg y)
  | NonTail(x), Add(y, V(z)) -> Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), Add(y, C(z)) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg x) (reg y) z
  | NonTail(x), Mul(y, z) -> g'_mul oc x y z
  | NonTail(x), Div(y, z) -> g'_div oc x y z
  | NonTail(x), Sub(y, V(z)) -> Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), Sub(y, C(z)) -> Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg x) (reg y) (-z)
  | NonTail(x), Slw(y, V(z)) -> Printf.fprintf oc "\tsll\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), Slw(y, C(z)) ->
      Printf.fprintf oc "\tadd\t%s, r0, %d\n" (reg reg_tmp) z ;
      Printf.fprintf oc "\tsll\t%s, %s, %s\n" (reg x) (reg y) (reg reg_tmp)
  | NonTail(x), Lwz(y, V(z)) -> 
      Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg z);
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" (reg x) (reg reg_tmp)
  | NonTail(x), Lwz(y, C(z)) -> Printf.fprintf oc "\tlw\t%s, %d(%s)\n" (reg x) z (reg y)
  | NonTail(_), Stw(x, y, V(z)) -> 
      Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg z);
      Printf.fprintf oc "\tsw\t%s, 0(%s)\n" (reg x) (reg reg_tmp)
  | NonTail(_), Stw(x, y, C(z)) -> Printf.fprintf oc "\tsw\t%s, %d(%s)\n" (reg x) z (reg y)
  | NonTail(x), FMr(y) when x = y -> ()
  | NonTail(x), FMr(y) -> Printf.fprintf oc "\tfmov\t%s, %s\n" (reg x) (reg y)
  | NonTail(x), FNeg(y) -> Printf.fprintf oc "\tfneg\t%s, %s\n" (reg x) (reg y)
  | NonTail(x), FAdd(y, z) -> Printf.fprintf oc "\tfadd\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), FSub(y, z) -> Printf.fprintf oc "\tfsub\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), FMul(y, z) -> Printf.fprintf oc "\tfmul\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), FDiv(y, z) -> Printf.fprintf oc "\tfdiv\t%s, %s, %s\n" (reg x) (reg y) (reg z)
  | NonTail(x), Lfd(y, V(z)) ->
      Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg z);
      Printf.fprintf oc "\tflw\t%s, 0(%s)\n" (reg x) (reg reg_tmp)
  | NonTail(x), Lfd(y, C(z)) -> Printf.fprintf oc "\tflw\t%s, %d(%s)\n" (reg x) z (reg y)
  | NonTail(_), Stfd(x, y, V(z)) ->
      Printf.fprintf oc "\tadd\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg z);
      Printf.fprintf oc "\tfsw\t%s, 0(%s)\n" (reg x) (reg reg_tmp)
  | NonTail(_), Stfd(x, y, C(z)) -> Printf.fprintf oc "\tfsw\t%s, %d(%s)\n" (reg x) z (reg y)
  | NonTail(_), Comment(s) -> Printf.fprintf oc "#\t%s\n" s
  (* print_intとかprint_floatとか *)
  | NonTail(_), Print_int(x) -> Printf.fprintf oc "\toutw\t%s\n" (reg x)
  | NonTail(_), Print_char(x) -> Printf.fprintf oc "\toutb\t%s\n" (reg x)
  | NonTail(_), Print_float(x) ->
      Printf.fprintf oc "\tfmfc\t%s, %s\n" (reg reg_tmp) (reg x);
      Printf.fprintf oc "\toutw\t%s\n" (reg reg_tmp)
  | Tail, Print_int(x) -> Printf.fprintf oc "\toutw\t%s\n" (reg x)
  | Tail, Print_char(x) -> Printf.fprintf oc "\toutb\t%s\n" (reg x)
  | Tail, Print_float(x) ->
      Printf.fprintf oc "\tfmfc\t%s, %s\n" (reg reg_tmp) (reg x);
      Printf.fprintf oc "\toutw\t%s\n" (reg reg_tmp)
  (* read hoge 系 *)
  | NonTail(x), Read_int ->
      Printf.fprintf oc "\tin\t%s\n" (reg x);
  | NonTail(x), Read_float ->
      Printf.fprintf oc "\tin\t%s\n" (reg reg_tmp);
      Printf.fprintf oc "\tfmtc\t%s, %s" (reg reg_tmp) (reg x)
  | Tail, (Read_int as exp)->
      g' oc (NonTail(regs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_link);
  | Tail, (Read_float as exp)->
      g' oc (NonTail(fregs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_link);
  (* 退避の仮想命令の実装 (caml2html: emit_save) *)
  | NonTail(_), Save(x, y) when List.mem x allregs && not (S.mem y !stackset) ->
      save y;
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
  | NonTail(_), Save(x, y) when List.mem x allfregs && not (S.mem y !stackset) ->
      save y;(*savef y;*)
      Printf.fprintf oc "\tfsw\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
  | NonTail(_), Save(x, y) -> assert (S.mem y !stackset); ()
  (* 復帰の仮想命令の実装 (caml2html: emit_restore) *)
  | NonTail(x), Restore(y) when List.mem x allregs ->
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
  | NonTail(x), Restore(y) ->
      assert (List.mem x allfregs);
      Printf.fprintf oc "\tflw\t%s, %d(%s)\n" (reg x) (offset y) (reg reg_sp)
  (* 末尾だったら計算結果を第一レジスタにセットしてリターン (caml2html: emit_tailret) *)
  | Tail, (Nop | Stw _ | Stfd _ | Comment _ | Save _ as exp) ->
      g' oc (NonTail(Id.gentmp Type.Unit), exp);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_link);
  | Tail, (Li _ | SetL _ | Mr _ | Neg _ | Add _ | Sub _ | Mul _ | Div _ | Slw _ | Lwz _ as exp) ->
      g' oc (NonTail(regs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_link);
  | Tail, (FLi _ | FMr _ | FNeg _ | FAdd _ | FSub _ | FMul _ | FDiv _ | Lfd _ as exp) ->
      g' oc (NonTail(fregs.(0)), exp);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_link);
  | Tail, (Restore(x) as exp) ->
      (match locate x with
      | [i] -> g' oc (NonTail(regs.(0)), exp)
      | [i; j] when i + 1 = j -> g' oc (NonTail(fregs.(0)), exp)
      | _ -> assert false);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_link);
  | Tail, IfEq(x, V(y), e1, e2) ->
      g'_tail_if oc (Z (x, V(y))) e1 e2 "beq" "bne"
  | Tail, IfEq(x, C(y), e1, e2) ->
      g'_tail_if oc (Z (x, C(y))) e1 e2 "beq" "bne"
  | Tail, IfLE(x, V(y), e1, e2) ->
      g'_tail_if oc (Z (x, V(y))) e1 e2 "ble" "bgt"
  | Tail, IfLE(x, C(y), e1, e2) ->
      g'_tail_if oc (Z (x, C(y))) e1 e2 "ble" "bgt"
  | Tail, IfGE(x, V(y), e1, e2) ->
      g'_tail_if oc (Z (x, V(y))) e1 e2 "bge" "blt"
  | Tail, IfGE(x, C(y), e1, e2) ->
      g'_tail_if oc (Z (x, C(y))) e1 e2 "bge" "blt"
  | Tail, IfFEq(x, y, e1, e2) ->
      g'_tail_if oc (F (x, y)) e1 e2 "feq" "fne"
  | Tail, IfFLE(x, y, e1, e2) ->
      g'_tail_if oc (F (x, y)) e1 e2 "fle" "fgt"
  | NonTail(z), IfEq(x, V(y), e1, e2) ->
      g'_non_tail_if oc (Z (x, V(y))) (NonTail(z)) e1 e2 "beq" "bne"
  | NonTail(z), IfEq(x, C(y), e1, e2) ->
      g'_non_tail_if oc (Z (x, C(y))) (NonTail(z)) e1 e2 "beq" "bne"
  | NonTail(z), IfLE(x, V(y), e1, e2) ->
      g'_non_tail_if oc (Z (x, V(y))) (NonTail(z)) e1 e2 "ble" "bgt"
  | NonTail(z), IfLE(x, C(y), e1, e2) ->
      g'_non_tail_if oc (Z (x, C(y))) (NonTail(z)) e1 e2 "ble" "bgt"
  | NonTail(z), IfGE(x, V(y), e1, e2) ->
      g'_non_tail_if oc (Z (x, V(y))) (NonTail(z)) e1 e2 "bge" "blt"
  | NonTail(z), IfGE(x, C(y), e1, e2) ->
      g'_non_tail_if oc (Z (x, C(y))) (NonTail(z)) e1 e2 "bge" "blt"
  | NonTail(z), IfFEq(x, y, e1, e2) ->(* fcomp rs, rt *)
      (*Printf.fprintf oc "\tfcomp\t%s, %s\n" (reg x) (reg y);*)
      g'_non_tail_if oc (F (x, y)) (NonTail(z)) e1 e2 "feq" "fne"
  | NonTail(z), IfFLE(x, y, e1, e2) ->
      (*Printf.fprintf oc "\tfcomp\t%s, %s\n" (reg x) (reg y);*)
      g'_non_tail_if oc (F (x, y)) (NonTail(z)) e1 e2 "fle" "fgt"
  (* 関数呼び出しの仮想命令の実装 (caml2html: emit_call) *)
  | Tail, CallCls(x, ys, zs) -> (* 末尾呼び出し (caml2html: emit_tailcall) *)
      g'_args oc [(x, reg_cl)] ys zs;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" (reg reg_sw) (reg reg_cl);
      Printf.fprintf oc "\tjr\t%s\n" (reg reg_sw)
      (*Printf.fprintf oc "\tmvctr\t%s\n\tbctr\n" (reg reg_sw);*)
  | Tail, CallDir(Id.L(x), ys, zs) -> (* 末尾呼び出し *)
      g'_args oc [] ys zs;
      Printf.fprintf oc "\tj\t%s\n" x
  | NonTail(a), CallCls(x, ys, zs) ->
      Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg reg_tmp) (reg reg_link);
      g'_args oc [(x, reg_cl)] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) ss;
      Printf.fprintf oc "\tlw\t%s, 0(%s)\n" (reg reg_tmp) (reg reg_cl);
      Printf.fprintf oc "\tjalr\tr31, %s\n" (reg reg_tmp);
      (*Printf.fprintf oc "\tbctrl\n";*)
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) (-ss);
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg a) (reg regs.(0))
      else if List.mem a allfregs && a <> fregs.(0) then
        Printf.fprintf oc "\tfmov\t%s, %s\n" (reg a) (reg fregs.(0));
      Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg reg_link) (reg reg_tmp)
  | (NonTail(a), CallDir(Id.L(x), ys, zs)) ->
      Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg reg_tmp) (reg reg_link);
      g'_args oc [] ys zs;
      let ss = stacksize () in
      Printf.fprintf oc "\tsw\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) ss;
      Printf.fprintf oc "\tjal\t%s\n" x;
      Printf.fprintf oc "\taddi\t%s, %s, %d\n" (reg reg_sp) (reg reg_sp) (-ss);
      Printf.fprintf oc "\tlw\t%s, %d(%s)\n" (reg reg_tmp) (ss - 4) (reg reg_sp);
      if List.mem a allregs && a <> regs.(0) then
        Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg a) (reg regs.(0))
      else if List.mem a allfregs && a <> fregs.(0) then
        Printf.fprintf oc "\tfmov\t%s, %s\n" (reg a) (reg fregs.(0));
      Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg reg_link) (reg reg_tmp)
and g'_tail_if oc condi e1 e2 b bn =
  let b_else = Id.genid (b ^ "_else") in
  (match condi with
  | Z (x, V(y)) ->
      if bn = "blt" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg x);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "ble" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg x);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bgt" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg y);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bge" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg y);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else
        Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn (reg x) (reg y) b_else;
      let stackset_back = !stackset in
      g oc (Tail, e1);
      Printf.fprintf oc "%s:\n" b_else;
      stackset := stackset_back;
      g oc (Tail, e2)
  | Z (x, C(y)) -> 
      if bn = "blt" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg reg_tmp) (reg x);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "ble" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg reg_tmp) (reg x);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bgt" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg reg_tmp);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bge" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg reg_tmp);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn (reg x) (reg reg_tmp) b_else);
      let stackset_back = !stackset in
      g oc (Tail, e1);
      Printf.fprintf oc "%s:\n" b_else;
      stackset := stackset_back;
      g oc (Tail, e2)
  | F (x, y) ->
      if bn = "fne" then
        (Printf.fprintf oc "\tfeq\t%s, %s\n" (reg x) (reg y);
        Printf.fprintf oc "\tfbc1t\t%s\n" b_else;
        let stackset_back = !stackset in
        g oc (Tail, e2);
        Printf.fprintf oc "%s:\n" b_else;
        stackset := stackset_back;
        g oc (Tail, e1))
      else
        (Printf.fprintf oc "\tfle\t%s, %s\n" (reg x) (reg y);
        Printf.fprintf oc "\tfbc1t\t%s\n" b_else;
        let stackset_back = !stackset in
        g oc (Tail, e2);
        Printf.fprintf oc "%s:\n" b_else;
        stackset := stackset_back;
        g oc (Tail, e1)))
and g'_non_tail_if oc condi dest e1 e2 b bn =
  let b_else = Id.genid (b ^ "_else") in
  let b_cont = Id.genid (b ^ "_cont") in
  (* bne cr7, belseみたいな感じだった *)
  (match condi with
  | Z (x, V(y)) ->
      if bn = "blt" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg x);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "ble" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg y) (reg x);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bgt" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg y);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bge" then
        (Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg y);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else
        Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn (reg x) (reg y) b_else
  | Z (x, C(y)) -> 
      if bn = "blt" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg reg_tmp) (reg x);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "ble" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg reg_tmp) (reg x);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bgt" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg reg_tmp);
        Printf.fprintf oc "\tbgtz\t%s, %s\n" (reg reg_tmp) b_else)
      else if bn = "bge" then
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\tsub\t%s, %s, %s\n" (reg reg_tmp) (reg x) (reg reg_tmp);
        Printf.fprintf oc "\tbgez\t%s, %s\n" (reg reg_tmp) b_else)
      else
        (Printf.fprintf oc "\taddi\t%s, r0, %d\n" (reg reg_tmp) y;
        Printf.fprintf oc "\t%s\t%s, %s, %s\n" bn (reg x) (reg reg_tmp) b_else)
  | F (x, y) ->
      if bn = "fne" then
        (Printf.fprintf oc "\tfeq\t%s, %s\n" (reg x) (reg y);
        Printf.fprintf oc "\tfbc1t\t%s\n" b_else)
      else
        (Printf.fprintf oc "\tfle\t%s, %s\n" (reg x) (reg y);
        Printf.fprintf oc "\tfbc1t\t%s\n" b_else));
  let stackset_back = !stackset in
  (match condi with
  | Z _ -> g oc (dest, e1)
  | F _ -> g oc (dest, e2));
  let stackset1 = !stackset in
  Printf.fprintf oc "\tj\t%s\n" b_cont;
  Printf.fprintf oc "%s:\n" b_else;
  stackset := stackset_back;
  (match condi with
  | Z _ -> g oc (dest, e1)
  | F _ -> g oc (dest, e2));
  Printf.fprintf oc "%s:\n" b_cont;
  let stackset2 = !stackset in
  stackset := S.inter stackset1 stackset2
and g'_args oc x_reg_cl ys zs =
  let (i, yrs) =
    List.fold_left
      (fun (i, yrs) y -> (i + 1, (y, regs.(i)) :: yrs))
      (0, x_reg_cl)
      ys in
  List.iter
    (fun (y, r) -> Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg r) (reg y))
    (shuffle reg_sw yrs);
  let (d, zfrs) =
    List.fold_left
      (fun (d, zfrs) z -> (d + 1, (z, fregs.(d)) :: zfrs))
      (0, [])
      zs in
  List.iter
    (fun (z, fr) -> Printf.fprintf oc "\tfmov\t%s, %s\n" (reg fr) (reg z))
    (shuffle reg_fsw zfrs)
and g'_mul oc x y z =
  match z with
  | C(l) -> let resnum = modder l 0 in
            if resnum = -1 then Printf.fprintf oc "#nop\n"
            else if resnum = 0 then Printf.fprintf oc "#nop\n" 
            else Printf.fprintf oc "\tsll\t%s, %s, %d\n" (reg x) (reg y) resnum
  | V(l) -> Printf.fprintf oc "#nop\n"
and g'_div oc x y z =
  match z with
  | C(l) -> let resnum = modder l 0 in
            if resnum = -1 then Printf.fprintf oc "#nop\n"
            else if resnum = 0 then Printf.fprintf oc "#nop\n"
            else Printf.fprintf oc "\tsrl\t%s, %s, %d\n" (reg x) (reg y) resnum
  | V(l) -> Printf.fprintf oc "#nop\n"
and modder z h =
  if z = 0 then h
  else if z mod 2 = 0 then modder (z / 2) (h + 1)
  else -1 


let h oc { name = Id.L(x); args = _; fargs = _; body = e; ret = _ } =
  Printf.fprintf oc "%s:\n" x;
  stackset := S.empty;
  stackmap := [];
  g oc (Tail, e)

  (*アセンブリ形式のライブラリ*)
let rec include_asmlib oc ic =
  match input_line ic with
  | exception End_of_file -> ()
  | s -> 
      (Printf.fprintf oc "%s\n" s;
       include_asmlib oc ic)

let f oc ic (Prog(data, fundefs, e)) =
  Format.eprintf "generating assembly...@.";
  (*if data <> [] then
    ((*Printf.fprintf oc "\t.data\n\t.literal8\n";*)
    Printf.fprintf oc "\t.data\n";
     List.iter
       (fun (Id.L(x), d) ->
         Printf.fprintf oc "\t.align 2\n";
         Printf.fprintf oc "%s:\t # %f\n" x d;
         (*Printf.fprintf oc "\t.long\t%ld\n" (gethi d);*)
         (*Printf.fprintf oc "\t.long\t%ld\n" (getlo d))*)
         Printf.fprintf oc "\t.long\t%ld\n" (Int32.bits_of_float d))
       data);*)
  (*Printf.fprintf oc "\t.text\n";*)
  Printf.fprintf oc "\t.globl _min_caml_start\n";
  (*Printf.fprintf oc "\t.align 2\n";*)
  (*プログラムのスタート地点にジャンプ*)
  Printf.fprintf oc "#\tJump to the start point\n";
  Printf.fprintf oc "\tj\t_min_caml_start\n";
  (*アセンブリ形式のライブラリを挿入*)
  Printf.fprintf oc "#\tAsmLibrary Inclusion\n";
  include_asmlib oc ic;
  (*関数の定義を羅列*)
  Printf.fprintf oc "#\tFunction Definitions\n";
  List.iter (fun fundef -> h oc fundef) fundefs;
  (*プログラムの開始*)
  Printf.fprintf oc "_min_caml_start: # main entry point\n";
  (*Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg reg_tmp) (reg reg_link);
  Printf.fprintf oc "\tsw\t%s, -8(%s)\n" (reg reg_cl) (reg reg_sp);
  Printf.fprintf oc "\tsw\t%s, 8(%s)\n" (reg reg_tmp) (reg reg_sp);
  Printf.fprintf oc "\tsw\t%s, -96(%s)\n" (reg reg_sp) (reg reg_sp);*)
  Printf.fprintf oc "#\tmain program starts\n";
  stackset := S.empty;
  stackmap := [];
  g oc (NonTail("_R_0"), e);
  Printf.fprintf oc "#\tmain program ends\n";
  (* Printf.fprintf oc "\tmr\tr3, %s\n" regs.(0); *)
  (*Printf.fprintf oc "\tlw\t%s, 0(%s)\n" (reg reg_sp) (reg reg_sp);
  Printf.fprintf oc "\tlw\t%s, 8(%s)\n" (reg reg_tmp) (reg reg_sp);
  Printf.fprintf oc "\tadd\t%s, %s, r0\n" (reg reg_link) (reg reg_tmp);
  Printf.fprintf oc "\tlw\t%s, -8(%s)\n" (reg reg_cl) (reg reg_sp);*)
  Printf.fprintf oc "_min_caml_end_loop: #when program finishes, processor repeatedly tries to do the same statement. (infinite jump).\n";
  Printf.fprintf oc "\tj\t_min_caml_end_loop\n"

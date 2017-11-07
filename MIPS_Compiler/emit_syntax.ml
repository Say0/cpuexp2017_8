open Syntax

let rec emit_sub oc indents = function
  | Unit -> Printf.fprintf oc "%sUNIT\n" indents
  | Bool(x) -> Printf.fprintf oc "%sBOOL %B\n" indents x
  | Int(x) -> Printf.fprintf oc "%sINT %d\n" indents x
  | Float(x) -> Printf.fprintf oc "%sFLOAT %f\n" indents x
  | Not(e) ->
      Printf.fprintf oc "%sNOT\n" indents;
      let indented = indents ^ "  " in emit_sub oc indented e
  | Neg(e) ->
    Printf.fprintf oc "%sNEG\n" indents;
    let indented = indents ^ "  " in emit_sub oc indented e
  | Add(e1, e2) ->
    Printf.fprintf oc "%sADD\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | Sub(e1, e2) ->
    Printf.fprintf oc "%sSUB\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | FNeg(e) ->
    Printf.fprintf oc "%sFNEG\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e
  | FAdd(e1, e2) ->
    Printf.fprintf oc "%sFADD\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | FSub(e1, e2) ->
    Printf.fprintf oc "%sFSUB\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | FMul(e1, e2) ->
    Printf.fprintf oc "%sFMUL\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | FDiv(e1, e2) ->
    Printf.fprintf oc "%sFDIV\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | Eq(e1, e2) ->
    Printf.fprintf oc "%sEQ\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | LE(e1, e2) ->
    Printf.fprintf oc "%sLE\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | If(e1, e2, e3) ->
    Printf.fprintf oc "%sIF\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2;
      emit_sub oc indented e3
  | Let((x, t), e1, e2) ->
    Printf.fprintf oc "%sLET %s\n" indents x;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      Printf.fprintf oc "%sIN\n" indents;
      emit_sub oc indented e2
  | Var(x) -> Printf.fprintf oc "%sVAR %s\n" indents x
  | LetRec({ name = (x, t); args = yts; body = e1 }, e2) ->
    Printf.fprintf oc "%sLET REC %s" indents x;
    List.iter (fun (id, types) -> Printf.fprintf oc " %s" id) yts;
    Printf.fprintf oc "\n";
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      Printf.fprintf oc "%sIN\n" indents;
      emit_sub oc indented e2
  | App(e, es) ->
    Printf.fprintf oc "%sAPP\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e;
      List.iter (fun ets -> emit_sub oc indented ets) es
  | Tuple(es) ->
    Printf.fprintf oc "%sTUPLE\n" indents;
    let indented = indents ^ "  " in
      List.iter (fun ets -> emit_sub oc indented ets) es
  | LetTuple(xts, e1, e2) ->
    Printf.fprintf oc "%sLET TUPLE" indents;
    List.iter (fun (id, types) -> Printf.fprintf oc " %s" id) xts;
    Printf.fprintf oc "\n";
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      Printf.fprintf oc "%sIN\n" indents;
      emit_sub oc indented e2
  | Array(e1, e2) ->
    Printf.fprintf oc "%sARRAY\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | Get(e1, e2) ->
    Printf.fprintf oc "%sGET\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | Put(e1, e2, e3) ->
    Printf.fprintf oc "%sPUT\n" indents;
    let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2;
      emit_sub oc indented e3

let  emit oc e =
  let indents = "" in
  emit_sub oc indents e

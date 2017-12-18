open KNormal

let rec emit_sub oc indents = function
  | Unit -> Printf.fprintf oc "%sUnit\n" indents
  | Int x -> Printf.fprintf oc "%sInt %d\n" indents x
  | Float x -> Printf.fprintf oc "%sFloat %f\n" indents x
  | Neg name -> Printf.fprintf oc "%s Neg %s\n" indents name
  | Add (name, name2) -> Printf.fprintf oc "%sAdd %s %s\n" indents name name2
  | Sub (name, name2) -> Printf.fprintf oc "%sSub %s %s\n" indents name name2
  | Mul (name, name2) -> Printf.fprintf oc "%sMul %s %s\n" indents name name2
  | Div (name, name2) -> Printf.fprintf oc "%sDiv %s %s\n" indents name name2
  | FNeg name -> Printf.fprintf oc "%sFNeg %s\n" indents name
  | FAdd (name, name2) -> Printf.fprintf oc "%sFAdd %s %s\n" indents name name2
  | FSub (name, name2) -> Printf.fprintf oc "%sFSub %s %s\n" indents name name2
  | FMul (name, name2) -> Printf.fprintf oc "%sFMul %s %s\n" indents name name2
  | FDiv (name, name2) -> Printf.fprintf oc "%sFDiv %s %s\n" indents name name2
  | IfEq (name, name2, e1, e2) ->
      Printf.fprintf oc "%sIfEq %s %s\n" indents name name2;
      let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | IfLE (name, name2, e1, e2) ->
      Printf.fprintf oc "%sIfLE %s %s\n" indents name name2;
      let indented = indents ^ "  " in
      emit_sub oc indented e1;
      emit_sub oc indented e2
  | Let ((name, t), e1, e2) ->
      Printf.fprintf oc "%sLet\n" indents;
      Printf.fprintf oc "%s(\n" indents;
      let indented = indents ^ "  " in
      Printf.fprintf oc "%s%s\n" indented name;
      Emit_type.emit oc t indented;
      Printf.fprintf oc "%s)\n" indents;
      Printf.fprintf oc "%s{\n" indents;
      emit_sub oc indented e1;
      Printf.fprintf oc "%s}\n" indents;
      Printf.fprintf oc "%sIN\n" indents;
      Printf.fprintf oc "%s{\n" indents;
      emit_sub oc indented e2;
      Printf.fprintf oc "%s}\n" indents
  | Var name -> Printf.fprintf oc "%s Var %s\n" indents name
  | LetRec ({ name = (x, t); args = yts; body = e1 }, e2) ->
      Printf.fprintf oc "%sLetRec\n" indents;
      Printf.fprintf oc "%s[ %s :\n" indents x;
      let indented = indents ^ "  " in
      Emit_type.emit oc t indented;
      Printf.fprintf oc "%s]\n" indents;
      Printf.fprintf oc "%s(\n" indents;
      List.iter
        (fun (x2, t2) ->
          Printf.fprintf oc "%s[ %s :\n" indented x2;
          let indented2 = indented ^ "  " in
          Emit_type.emit oc t2 indented2;
          Printf.fprintf oc "%s]\n" indented
        )
        yts;
      Printf.fprintf oc "%s)\n" indents;
      Printf.fprintf oc "%s{\n" indents;
      emit_sub oc indented e1;
      Printf.fprintf oc "%s}\n" indents;
      Printf.fprintf oc "%sIn\n" indents;
      Printf.fprintf oc "%s{\n" indents;
      emit_sub oc indented e2;
      Printf.fprintf oc "%s}\n" indents
  | App (name, namelist) ->
      Printf.fprintf oc "%sApp %s\n" indents name;
      let indented = indents ^ "  " in
      List.iter (fun name2 -> Printf.fprintf oc "%s%s\n" indented name2) namelist
  | Tuple namelist ->
      Printf.fprintf oc "%sTuple\n" indents;
      let indented = indents ^ "  " in
      List.iter (fun name2 -> Printf.fprintf oc "%s%s\n" indented name2) namelist
  | LetTuple (ntlist, name, e1) ->
      Printf.fprintf oc "%sLetTuple\n" indents;
      Printf.fprintf oc "%s(\n" indents;
      List.iter
        (fun (x, t) ->
          Printf.fprintf oc "%s[ %s :\n" indents x;
          let indented = indents ^ "  " in
          Emit_type.emit oc t indented;
          Printf.fprintf oc "%s]\n" indents
        )
        ntlist;
      Printf.fprintf oc "%s)\n" indents;
      let indented = indents ^ "  " in
      Printf.fprintf oc "%s%s\n" indented name;
      Printf.fprintf oc "%s{\n" indents;
      emit_sub oc indented e1;
      Printf.fprintf oc "%s}\n" indents;
  | Get (name, name2) -> Printf.fprintf oc "%sGet %s %s\n" indents name name2
  | Put (name, name2, name3) -> Printf.fprintf oc "%sPut %s %s <- %s\n" indents name name2 name3
  | ExtArray name -> Printf.fprintf oc "%sExtArray %s\n" indents name
  | ExtFunApp (name, namelist) ->
      Printf.fprintf oc "%sExtFunApp %s\n" indents name;
      let indented = indents ^ "  " in
      List.iter (fun name2 -> Printf.fprintf oc "%s%s\n" indented name2) namelist
  | Print_int(e1) ->
      Printf.fprintf oc "%sPrint_Int %s\n" indents e1
      (*let indented = indents ^ "  " in
      emit_sub oc indented e1*)
  | Print_char(e1) ->
      Printf.fprintf oc "%sPrint_Char %s\n" indents e1
  | Print_float(e1) ->
      Printf.fprintf oc "%sPrint_Float %s\n" indents e1
      (*let indented = indents ^ "  " in
      emit_sub oc indented e1*)
  | Read_int(_) ->
      Printf.fprintf oc "%sRead_Int\n" indents
  | Read_float(_) ->
      Printf.fprintf oc "%sRead_Float\n" indents
let emit oc e =
  let indents = "" in
  emit_sub oc indents e

open Type

let rec emit_sub oc indents = function
  | Unit -> Printf.fprintf oc "%sUNIT\n" indents
  | Bool -> Printf.fprintf oc "%sBOOL\n" indents
  | Int -> Printf.fprintf oc "%sINT\n" indents
  | Float -> Printf.fprintf oc "%sFLOAT\n" indents
  | Fun (tlist, t) ->
      Printf.fprintf oc "%sFUN\n" indents;
      Printf.fprintf oc "%s(\n" indents;
      let indented = indents ^ "  " in
      List.iter (fun t2 -> emit_sub oc indented t2) tlist;
      Printf.fprintf oc "%s)\n" indents;
      emit_sub oc indented t
  | Tuple tlist ->
      Printf.fprintf oc "%sTUPLE\n" indents;
      Printf.fprintf oc "%s(\n" indents;
      let indented = indents ^ "  " in
      List.iter (fun t -> emit_sub oc indented t) tlist;
      Printf.fprintf oc "%s)\n" indents
  | Array t ->
      Printf.fprintf oc "%sARRAY\n" indents;
      let indented = indents ^ "  " in
      emit_sub oc indented t
  | Var t ->
    (match !t with
      | None -> Printf.fprintf oc "%sVAR NONE\n" indents;
      | Some t2 ->
          Printf.fprintf oc "%sVAR\n" indents;
          let indented = indents ^ "  " in
          emit_sub oc indented t2)

let  emit oc e indents =
  emit_sub oc indents e

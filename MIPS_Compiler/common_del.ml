open KNormal

let rec eq_isvalid e =
  match e with
  | Unit -> true
  | Int _ -> true
  | Float _ -> true
  | Neg _ -> true
  | Add _ -> true
  | Sub _ -> true
  | Mul _ -> true
  | Div _ -> true
  | FNeg _ -> true
  | FAdd _ -> true
  | FSub _ -> true
  | FMul _ -> true
  | FDiv _ -> true
  | IfEq (_, _, e1, e2) -> (eq_isvalid e1) && (eq_isvalid e2)
  | IfLE (_, _, e1, e2) -> (eq_isvalid e1) && (eq_isvalid e2)
  | Let (_, e1, e2) -> (eq_isvalid e1) && (eq_isvalid e2)
  | Var _ -> true
  | LetRec ({ name = (x, t); args = yts; body = e1}, e2) -> (eq_isvalid e1) && (eq_isvalid e2)
  | App _ -> false
  | Tuple _ -> true
  | LetTuple (_, _, e1) -> eq_isvalid e1
  | Get _ -> false
  | Put _ -> false
  | Print_int _ -> false
  | Print_char _ -> false
  | Print_float _ -> false
  | Read_int _ -> false
  | Read_float _ -> false
  | ExtArray _ -> false
  | ExtFunApp _ -> false

let rec type_equals t1 t2 =
  match t1 with
  | Type.Unit ->
    (match t2 with
    | Type.Unit -> true
    | _ -> false)
  | Type.Bool ->
    (match t2 with
    | Type.Bool -> true
    | _ -> false)
  | Type.Int ->
    (match t2 with
    | Type.Int -> true
    | _ -> false)
  | Type.Float ->
    (match t2 with
    | Type.Float -> true
    | _ -> false)
  | Type.Fun (tlist1, tt1) ->
    (match t2 with
    | Type.Fun (tlist2, tt2) -> if (tlist_equals tlist1 tlist2) && (type_equals tt1 tt2) then true else false
    | _ -> false)
  | Type.Tuple tlist1 ->
    (match t2 with
    | Type.Tuple tlist2 -> if (tlist_equals tlist1 tlist2) then true else false
    | _ -> false)
  | Type.Array tt1 ->
    (match t2 with
    | Type.Array tt2 -> if (type_equals tt1 tt2) then true else false
    | _ -> false)
  | Type.Var tt1 ->
    (match !tt1 with
      | None ->
        (match t2 with
        | Type.Var tt2 ->
          (match !tt2 with
          | None -> true
          | Some tt2t -> false)
        | _ -> false)
      | Some tt1t ->
        (match t2 with
        | Type.Var tt2 ->
          (match !tt2 with
          | None -> false
          | Some tt2t -> if (type_equals tt1t tt2t) then true else false)
        | _ -> false))
and tlist_equals tlist1 tlist2 =
  match tlist1 with
  | [] -> (match tlist2 with
    | [] -> true
    | _ -> false)
  | x :: xs ->
    (match tlist2 with
    | [] -> false
    | y :: ys -> if (type_equals x y) then tlist_equals xs ys else false)

let rec eqs_equals eqs e =
  match eqs with
  | [] -> ("", false)
  | (name, ef) :: es -> if (eq_equals ef e) then (name, true) else eqs_equals es e
and eq_equals eqf e =
  match eqf with
  | Unit ->
    (match e with
    | Unit -> true
    | _ -> false)
  | Int x ->
    (match e with
    | Int y -> if x = y then true else false
    | _ -> false)
  | Float x ->
    (match e with
    | Float y -> if x = y then true else false
    | _ -> false)
  | Neg x ->
    (match e with
    | Neg y -> if x = y then true else false
    | _ -> false)
  | FNeg x ->
    (match e with
    | FNeg y -> if x = y then true else false
    | _ -> false)
  | Add (x1, x2) ->
    (match e with
    | Add (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | Sub (x1, x2) ->
    (match e with
    | Sub (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | Mul (x1, x2) ->
    (match e with
    | Mul (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | Div (x1, x2) ->
    (match e with
    | Div (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | FAdd (x1, x2) ->
    (match e with
    | FAdd (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | FSub (x1, x2) ->
    (match e with
    | FSub (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | FMul (x1, x2) ->
    (match e with
    | FMul (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | FDiv (x1, x2) ->
    (match e with
    | FDiv (y1, y2) -> if x1 = y1 && x2 = y2 then true else false
    | _ -> false)
  | IfEq (x1, x2, xe1, xe2) ->
    (match e with
    | IfEq (y1, y2, ye1, ye2) ->
      if x1 = y1 && x2 = y2 then
        if (eq_equals xe1 ye1) && (eq_equals xe2 ye2) then true else false
      else
        false
    | _ -> false)
  | IfLE (x1, x2, xe1, xe2) ->
    (match e with
    | IfLE (y1, y2, ye1, ye2) ->
      if x1 = y1 && x2 = y2 then
        if (eq_equals xe1 ye1) && (eq_equals xe2 ye2) then true else false
      else
        false
    | _ -> false)
  | Let ((x, xt), xe1, xe2) ->
    (match e with
    | Let ((y, yt), ye1, ye2) ->
      if (x = y) && (type_equals xt yt) then
        if (eq_equals xe1 ye1) && (eq_equals xe2 ye2) then true else false
      else
        false
    | _ -> false)
  | Var x ->
    (match e with
    | Var y -> if x = y then true else false
    | _ -> false)
  | LetRec ({ name = (x, xt); args = xyts; body = xe1}, xe2) ->
    (match e with
    | LetRec ({ name = (y, yt); args = yyts; body = ye1}, ye2) ->
      if x = y && (type_equals xt yt) && (args_eq xyts yyts) then
        if (eq_equals xe1 ye1) && (eq_equals xe2 ye2) then true else false
      else
        false
    | _ -> false)
  | App (xt, xtlist) ->
    (match e with
    | App (yt, ytlist) ->
      if (xt = yt) && (idtlist_eq xtlist ytlist) then true else false
    | _ -> false)
  | Tuple xtlist ->
    (match e with
    | Tuple ytlist -> if (idtlist_eq xtlist ytlist) then true else false
    | _ -> false)
  | LetTuple (xlist, x, xt) ->
    (match e with
    | LetTuple (ylist, y, yt) ->
      if (args_eq xlist ylist) && (x = y) then
       if (eq_equals xt yt) then true else false
      else
        false
    | _ -> false)
  | Get (x1, x2) ->
    (match e with
    | Get (y1, y2) -> if (x1 = y1) && (x2 = y2) then true else false
    | _ -> false)
  | Put (x1, x2, x3) ->
    (match e with
    | Put (y1, y2, y3) -> if (x1 = y1) && (x2 = y2) && (x3 = y3) then true else false
    | _ -> false)
  | Print_int(x) ->
    (match e with
    | Print_int(y) -> if x = y then true else false
    | _ -> false)
  | Print_char(x) ->
    (match e with
    | Print_char(y) -> if x = y then true else false
    | _ -> false)
  | Print_float(x) ->
    (match e with
    | Print_float(y) -> if x = y then true else false
    | _ -> false)
  | Read_int _ ->
    (match e with
    | Read_int _ -> true
    | _ -> false)
  | Read_float _ ->
    (match e with
    | Read_float _ -> true
    | _ -> false) 
  | ExtArray x ->
    (match e with
    | ExtArray y -> if x = y then true else false
    | _ -> false)
  | ExtFunApp (x, xlist) ->
    (match e with
    | ExtFunApp (y, ylist) -> if (x = y) && (idtlist_eq xlist ylist) then true else false
    | _ -> false)
and args_eq a1 a2 =
  match a1 with
  | [] ->
      (match a2 with
      | [] -> true
      | (yid, yt) :: ys -> false)
  | (xid, xt) :: xs ->
      (match a2 with
      | [] -> false
      | (yid, yt) :: ys -> if (xid = yid) && (type_equals xt yt) then args_eq xs ys else false)
and idtlist_eq tlist1 tlist2 =
  match tlist1 with
  | [] ->
    (match tlist2 with
    | [] -> true
    | y :: ys -> false)
  | x :: xs ->
    (match tlist2 with
    | [] -> false
    | y :: ys -> if x = y then idtlist_eq xs ys else false)

let rec g eqs e =
  match e with
  | Unit -> Unit
  | Int x -> Int x
  | Float x -> Float x
  | Neg name -> Neg name
  | Add (name, name2) -> Add (name, name2)
  | Sub (name, name2) -> Sub (name, name2)
  | Mul (name, name2) -> Mul (name, name2)
  | Div (name, name2) -> Div (name, name2)
  | FNeg name -> FNeg name
  | FAdd (name, name2) -> FAdd (name, name2)
  | FSub (name, name2) -> FSub (name, name2)
  | FMul (name, name2) -> FMul (name, name2)
  | FDiv (name, name2) -> FDiv (name, name2)
  | IfEq (name, name2, e1, e2) -> IfEq (name, name2, (g eqs e1), (g eqs e2))
  | IfLE (name, name2, e1, e2) -> IfLE (name, name2, (g eqs e1), (g eqs e2))
  | Let ((name, t), e1, e2) ->
    let (nameres, checkres) = eqs_equals eqs e1 in
    if (checkres = true) then
      deal_let (Let ((name, t), e1, e2)) nameres eqs
    else
      if eq_isvalid e1 then
        let neweqs = (name, e1) :: eqs in
        Let ((name, t), (g neweqs e1), (g neweqs e2))
      else
        Let ((name, t), (g eqs e1), (g eqs e2))
  | Var name -> Var name
  | LetRec ({ name = (x, t); args = yts; body = e1 }, e2) ->
    let (nameres, checkres) = eqs_equals eqs e1 in
    if (checkres = true) then
      deal_letrec e nameres eqs
    else
      if eq_isvalid e1 then
        let neweqs = (x, e1) :: eqs in
        LetRec ({ name = (x, t); args = yts; body = (g neweqs e1) }, (g neweqs e2))
      else
        LetRec ({ name = (x, t); args = yts; body = (g eqs e1) }, (g eqs e2))
  | App (name, nlist) -> App (name, nlist)
  | Tuple nlist -> Tuple nlist
  | LetTuple (ntlist, name, e1) -> LetTuple (ntlist, name, (g eqs e1))
  | Get (name, name2) -> Get (name, name2)
  | Put (name, name2, name3) -> Put (name, name2, name3)
  | Print_int(e1) -> Print_int(e1)
  | Print_char(e1) -> Print_char(e1)
  | Print_float(e1) -> Print_float(e1)
  | Read_int(e1) -> Read_int(e1)
  | Read_float(e1) -> Read_float(e1)
  | ExtArray name -> ExtArray name
  | ExtFunApp (name, namelist) -> ExtFunApp (name, namelist)
and deal_let e name2 eqs =
  match e with
  | (Let ((name, t), e1, e2)) -> Let ((name,t), Var name2, (g eqs e2))
  | _ -> e
and deal_letrec e name2 eqs =
  match e with
  | LetRec ({ name = (x, t); args = yts; body = e1 }, e2) -> LetRec ({ name = (x, t); args = yts; body = (Var name2) }, (g eqs e2))
  | _ -> e


let delete_f e =
  g [] e

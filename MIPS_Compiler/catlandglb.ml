open Syntax

let rec cat le glbe =
  match glbe with
  | Unit -> le
  | Let (tt, e1, e2) -> Let (tt, e1, cat le e2)
  | LetRec (fd, e) -> LetRec (fd, cat le e)
  | LetTuple (idtl, e1, e2) -> LetTuple (idtl, e1, cat le e2)
  | e -> 
      let newtype = Type.gentyp () in
      let newname = Id.genid "globals_end" in
      Let ((newname, newtype), e, le)
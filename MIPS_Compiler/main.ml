let limit = ref 1000

let rec iter n e = (* 最適化処理をくりかえす (caml2html: main_iter) *)
  Format.eprintf "iteration %d@." n;
  if n = 0 then e else
  let e' = Elim.f (ConstFold.f (Inline.f (Assoc.f (Beta.f e)))) in
  if e = e' then e else
  iter (n - 1) e'

let lexbuf outchan asmchan outmiddlechan_first outmiddlechan_second outmiddlechan_third l glb = (* バッファをコンパイルしてチャンネルへ出力する (caml2html: main_lexbuf) *)
  Id.counter := 0;
  Typing.extenv := M.empty;
  Emit.f outchan asmchan
    (RegAlloc.f
       (Simm.f
          (Virtual.f
             (Closure.f
                (iter !limit
                   (let knormaled =
                     (KNormal.f
                       (let parsed = Catlandglb.cat (Parser.exp Lexer.token l) (Parser.exp Lexer.token glb) in
                          Emit_syntax.emit outmiddlechan_first parsed;
                          Typing.f parsed)) in
                      Emit_knormal.emit outmiddlechan_second knormaled;
                      let knormaledsec = Common_del.delete_f knormaled in
                      Emit_knormal.emit outmiddlechan_third knormaledsec;
                      Alpha.f knormaledsec))))))

let string s = lexbuf stdout stdin stdout stdout stdout (Lexing.from_string s) (Lexing.from_string s)(* 文字列をコンパイルして標準出力に表示する (caml2html: main_string) *)

let file f = (* ファイルをコンパイルしてファイルに出力する (caml2html: main_file) *)
  let filedir = Filename.dirname f in
  let inchan = open_in (f ^ ".ml") in
  let inchanglb = open_in (filedir ^ "/globals.ml") in
  let asmchan = open_in (filedir ^ "/mylibmincaml.s") in
  let outchan = open_out (f ^ ".s") in
  let outmiddlechan_first = open_out (f ^ ".midsyntax") in
  let outmiddlechan_second = open_out (f ^ ".midknormal") in
  let outmiddlechan_third = open_out (f ^ ".midknormals") in
  try
    lexbuf outchan asmchan outmiddlechan_first outmiddlechan_second outmiddlechan_third (Lexing.from_channel inchan) (Lexing.from_channel inchanglb);
    close_in inchan;
    close_in inchanglb;
    close_in asmchan;
    close_out outchan;
    close_out outmiddlechan_first;
    close_out outmiddlechan_second;
    close_out outmiddlechan_third
  with e -> (close_in inchan; close_in inchanglb; close_in asmchan; close_out outchan; close_out outmiddlechan_first; close_out outmiddlechan_second; close_out outmiddlechan_third; raise e)

let () = (* ここからコンパイラの実行が開始される (caml2html: main_entry) *)
  let files = ref [] in
  Arg.parse
    [("-inline", Arg.Int(fun i -> Inline.threshold := i), "maximum size of functions inlined");
     ("-iter", Arg.Int(fun i -> limit := i), "maximum number of optimizations iterated")]
    (fun s -> files := !files @ [s])
    ("Mitou Min-Caml Compiler (C) Eijiro Sumii\n" ^
     Printf.sprintf "usage: %s [-inline m] [-iter n] ...filenames without \".ml\"..." Sys.argv.(0));
  List.iter
    (fun f -> ignore (file f))
    !files

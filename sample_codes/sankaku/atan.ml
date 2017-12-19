let rec atan x =
  x
  -. 0.3333333333333333 *. x *. x *. x
  +. 0.2 *. x *. x *. x *. x *. x
  -. 0.1428571428571428 *. x *. x *. x *. x *. x *. x *. x
  +. 0.1111111111111111 *. x *. x *. x *. x *. x *. x *. x *. x *. x
in
  print_float (atan 0.5)
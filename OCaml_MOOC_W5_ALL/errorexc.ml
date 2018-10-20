(* division by zero *)
3/0;;

(* out of bound access to mutable data structures *)

let v = [|1;2;3|];;
v.(0);;
v.(3);;

(* incomplete pattern matching *)

let drop = function
  | a::rest -> rest;;
drop [1;2;3;4;5];;
drop [];;



(* hide *)
type int_list =
  | EmptyList
  | SomeElement of int * int_list;;
(* show *)
let rec length = function
  | EmptyList -> 0
  | SomeElement (x, l) -> 1 + length l;;

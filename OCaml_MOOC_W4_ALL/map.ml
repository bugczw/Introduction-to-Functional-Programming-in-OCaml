(* defined in library as List.map *)
let rec map f = function
  | [] -> []
  | h::r -> (f h)::(map f r);;

map (function x -> x*x) [1;2;3;4;5];;

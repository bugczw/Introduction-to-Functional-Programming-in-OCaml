(*
FUNCTIONS RETURNING FUNCTIONS  (25/25 points)
The following function checks the pairwise equality of the elements of two lists, on the common length of both lists:

let rec equal_on_common l1 l2 = match l1,l2 with
  | [],_ -> true
  | _,[] -> true
  | h1::r1,h2::r2 -> h1=h2 && equal_on_common r1 r2
Rewrite equal_on_common : 'a list -> 'a list -> bool by using nested function .. -> constructions. Using the match .. with construction or tuple patterns is forbidden. You can (and must) only call the operators && and =, and the function equal_on_common recursively.
*)

let rec equal_on_common = function
  | [] -> (function _ -> true)
  | x::xs -> (function
      | [] -> true
      | y::ys -> x = y && equal_on_common xs ys) 
;;

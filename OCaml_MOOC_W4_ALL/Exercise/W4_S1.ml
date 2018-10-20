(*
USING FIRST CLASS FUNCTIONS  (20/20 points)
Write a function compose : ('a -> 'a) list -> ('a -> 'a) that takes as argument a list l of functions, and that returns the function that is the composition of the functions in l. For instance, compose [f;g;h] x = f (g (h x)). Or with concrete functions, compose [(fun x -> x+1);(fun x -> 3*x);(fun x -> x-1)] 2 = 4.
Write a function fixedpoint : (float -> float) -> float -> float -> float that takes a function f of type float -> float and two floating-point arguments start and delta. The function fixedpoint applies repetitively f to the result of its previous application, starting from start, until it reaches a value y where the difference between y and (f y) is smaller than delta. In that case it returns the value of y. For instance, fixedpoint cos 0. 0.001 yields approximately 0.739 (ref).
THE GIVEN PRELUDE

type int_ff = int -> int
*)

let rec compose = function
  | f::fs -> (function x -> f (compose fs x))
  | _  -> (function x -> x);;
 
let rec fixedpoint f start delta =
  if abs_float(start -. (f start)) < delta then start
  else fixedpoint f (f start) delta;;

(** Sets of integers can be represented using a function.
    (Yet, this is a very inefficient representation.)
*)
type set = int -> bool;;

let empty : set =
  fun x -> false;;

let add (x : int) (s : set) : set =
  fun y -> (x = y) || s y;;

let mem (x : int) (s : set) : bool =
  s x;;

let s = add 1 (add 3 empty);;

let one_is_in_s     = mem 1 s;;
let two_is_not_in_s = mem 2 s;;
let three_is_in_s   = mem 3 s;;

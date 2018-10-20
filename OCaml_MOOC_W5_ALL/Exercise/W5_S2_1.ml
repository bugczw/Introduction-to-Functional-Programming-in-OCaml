(*
PRINTING LISTS  (200/200 points)
Write a function print_int_list : int list -> unit that takes a list of integers as input, and prints all the elements of the list, each on its own line.
Write a function print_every_other : int -> int list -> unit that takes a value k and a list of integers as input, and prints the elements of the list that are in positions multiple of k, each on its own line. Note: the first element of a list is at the position 0, not 1.
Write a function print_list : ('a -> unit) -> 'a list -> unit that takes a printer of values of some type 'a and a list of such values as input, and prints all the elements of the list, each on its own line.

*)

let rec print_int_list = function
  | [] -> ()
  | x::xs -> print_int x; print_newline(); print_int_list xs;;


let print_every_other k l = 
  let rec help n = function
    | [] -> ()
    | x :: xs -> if (n = k) then (print_int x ; print_newline () ; help 1 xs)
        else help (n + 1) xs
  in help k l;;


let rec print_list print = function
  | [] -> ()
  | x::xs -> (print x ; print_newline () ; print_list print xs)

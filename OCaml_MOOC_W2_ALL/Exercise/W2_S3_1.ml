(*
FINDING THE MINIMUM  (20/20 points)
Consider a non empty array of integers a.

Write a function min : int array -> int that returns the minimal element of a.
Write a function min_index : int array -> int that returns the index of the minimal element of a.
Do you think these functions work well on large arrays ?

Define a variable it_scales and set it to "yes" or "no".
*)
let rec help index curr a =
  if curr = (Array.length a) - 1
  then index
  else if a.(curr + 1) < a.(index)
  then help (curr + 1) (curr + 1) a
  else help index (curr + 1) a;;

let rec min a = 
  a.(help 0 0 a);;

let min_index a =
  help 0 0 a;;

let it_scales =
  "no" ;;


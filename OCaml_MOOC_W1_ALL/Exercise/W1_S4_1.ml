(*
SIMPLE FUNCTIONS OVER INTEGERS  (20/20 points)
Let's define two functions working with integers:

multiple_of that takes two integer parameters, n and d, and determines whether n is a multiple of d. The function must return a boolean value. This function can be written without recursion. Look at the operators defined on integers in sequence 1.
integer_square_root that calculates the integer square root of a positive integer n, that is the largest integer r such that r * r <= n. Hint: you may use floating point arithmetic, but don't forget that you have to convert explicitely between float and int.
*)

let multiple_of n d =
  (n mod d) = 0;;

let integer_square_root n =
  let r = sqrt (float_of_int n) in
  int_of_float r;;

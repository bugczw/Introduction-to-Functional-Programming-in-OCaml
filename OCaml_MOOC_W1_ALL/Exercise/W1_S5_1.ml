(*
PRIME NUMBERS  (30/30 points)
Let's define some usual arithmetical functions.

gcd that takes two non-negative integers n and m, and that returns the greatest common divisor of n and m, following Euclid's algorithm.
multiple_upto : int -> int -> bool that takes two non-negative integers n and r, and that tells whether n admits at least one divisor between 2 and r, inclusive. In other words that there exists a number d >= 2 and <= r, such that the remainder of the division of n by d is zero.
is_prime a takes a non-negative integer n and checks whether it is a prime number.
Important note: You can assume that both integer_square_root and multiple_of exist, and that they are correct answers to the Simple functions over integers exercise from the previous sequence.

Once is_prime works, you can try writing a new version of it which is self-contained (that contains all definitions of auxiliary functions as locally defined functions).
*)

let rec gcd n m =
  if (n < m)
  then (if (multiple_of m n)
        then n
        else (gcd n (m - n)))
  else gcd m n;;

let rec multiple_upto n r =
  if (r > 1)
  then (if (n mod r = 0)
        then true
        else (multiple_upto n (r - 1)))
  else false;;

let is_prime n =
  if (n = 1)
  then false
  else (let max = integer_square_root n in
        (not (multiple_upto n max)));;


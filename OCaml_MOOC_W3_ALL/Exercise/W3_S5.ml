(*
ADVANCED PATTERNS  (60/60 points)
Let's rewrite some pattern matching with advanced constructs.

Factorize the pattern matching of function simplify using or-patterns. It should boil down to three cases.
The only_small_lists function takes a list as input and returns this list only if it contains two or less elements, otherwise the empty list is returned. Rewrite this function using or-patterns and an as-pattern. It should boil down to two cases.
Turn the third case of no_consecutive_repetition into two distinct cases, dropping the if construct in favor of a when clause.
THE GIVEN PRELUDE

type e = EInt of int | EMul of e * e | EAdd of e * e
*)

let simplify = function
  | EMul (EInt 1, e) | EMul (e, EInt 1) | EAdd (EInt 0, e) | EAdd (e, EInt 0) -> e
  | EMul (EInt 0, e) | EMul (e, EInt 0) -> EInt 0
  | e -> e

let only_small_lists = function
  | x::y::z::_ -> []
  | ([] | _)as l  -> l

let rec no_consecutive_repetition = function
  | ([] | [_]) as l -> l 
  | x :: ((y :: ys) as xs) when x = y -> 
      no_consecutive_repetition xs 
  | x :: xs ->
      x :: (no_consecutive_repetition xs)

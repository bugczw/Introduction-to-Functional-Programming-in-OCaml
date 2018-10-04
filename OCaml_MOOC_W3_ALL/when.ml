let rec push_max_at_the_end = function
  | ([] | [_]) as l -> l
  | x :: ((y :: _) as l) when x <= y -> x :: push_max_at_the_end l
  | x :: y :: ys  -> y :: push_max_at_the_end (x :: ys);;
let l = push_max_at_the_end [3;2;1]

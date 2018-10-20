let apply_twice f x = f (f x);;

apply_twice (function x -> 2*x) 1;;

let rec apply_n_times f n x =
  if n <= 0
  then x
  else apply_n_times f (n-1) (f x);;

apply_n_times (function x -> 2*x) 10 1;;

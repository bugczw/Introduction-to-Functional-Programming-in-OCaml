(* defined in library as List.fold_left *)
let rec fold_left f b = function
  | [] -> b
  | h::r -> fold_left f (f b h) r;;

fold_left (+) 0 [1;2;3;4];;

let reverse = fold_left (fun x y -> y::x) [];;

reverse [1;2;3;4;5];;

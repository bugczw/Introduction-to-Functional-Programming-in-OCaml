let rec fold_right f l b = match l with
  | [] -> b
  | h::r -> f h (fold_right f r b);;

fold_right (fun x y -> x::y) [1;2;3;4] [];;

fold_right (+) [1;2;3;4] 0;;

fold_right ( * ) [1;2;3;4] 1;;

let concat = fold_right (fun x y -> x::y);;

concat [1;2;3;4] [5;6;7;8];;

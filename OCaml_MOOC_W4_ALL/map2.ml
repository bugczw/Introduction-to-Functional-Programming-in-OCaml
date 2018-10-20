(* defined in library as List.map2 *)
let rec map2 f l1 l2 = match (l1,l2) with
  | [],[] -> []
  | h1::r1,h2::r2 -> (f h1 h2)::(map2 f r1 r2)
  | _ -> raise (Invalid_argument "List.map2");;

map2 (fun x y -> x+y) [1;2;3] [10;20;30];;

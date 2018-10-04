(* The '@' is a predefined operator that appends a list to another one. *)
let rec rev = function
  | [] -> []
  | x :: xs -> rev xs @ [ x ];;
let l = rev [ 1; 2; 3 ];;

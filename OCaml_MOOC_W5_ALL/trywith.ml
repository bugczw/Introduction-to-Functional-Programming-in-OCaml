(* multiplying all values of an integer list             *)
(* think of a 1 million element list with a 0 at the end *)

let rec multl = function
   [] -> 1
  | a::rest -> if a = 0 then 0 else a * (multl rest)
;;
(* break *)

(* use exceptions to return as soon as we see a zero *)

exception Zero;;

let multlexc l = 
  let rec aux = function 
      [] -> 1
    | a::rest -> if a = 0 then raise Zero else a * (aux rest)
  in
  try aux l with Zero -> 0;;

    


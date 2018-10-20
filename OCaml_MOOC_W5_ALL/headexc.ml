exception Empty_list;;

(* define a head function that uses the exception *)
let head = function
    a::r -> a
  | []   -> raise Empty_list;;

(* let's test *)
head ['a';'b'];;
head [];;


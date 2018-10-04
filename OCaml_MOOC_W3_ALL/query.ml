(* hide *)
type contact = { name : string; phone_number : int * int * int * int };;
(* show *)
type query =
  | Insert of contact
  | Delete of contact
  | Search of string;;
(* break *)
let luke = { name = "luke"; phone_number = (1, 2, 3, 4) }
let query1 = Insert luke;;
let query2 = Search "luke";;
let query3 = Delete luke;;

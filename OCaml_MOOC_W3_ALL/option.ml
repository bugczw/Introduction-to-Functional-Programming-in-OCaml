(* The following type is predefined. *)
type 'a option =
  | None
  | Some of 'a;;

let o1 = Some 42;;
let o2 = None;;

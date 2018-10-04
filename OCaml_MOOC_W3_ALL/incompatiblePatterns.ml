type data = None | Single of int | Pair of int * int;;
let bad_arity (x : data) =
  match x with
    | None x -> x
    | Single x -> x
    | Pair (x, _) -> x;;
let bad_argument_type (x : data) =
  match x with
    | Single true -> false
    | _ -> true;;

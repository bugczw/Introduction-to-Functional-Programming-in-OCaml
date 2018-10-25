module Stack = struct
  type 'a t = 'a list
  let empty = []
  let push x s = x :: s
  let pop = function
    | [] -> None
    | x :: xs -> Some (x, xs)
end;;
(* break *)
let s = Stack.empty;;
let s = Stack.push 1 s;;
let x, s =
  match Stack.pop s with
    | None -> assert false
    | Some (x, s) -> (x, s);;
let r = Stack.pop s;;

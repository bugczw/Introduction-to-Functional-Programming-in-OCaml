(*
SIMPLE USES OF REFERENCES  (50/50 points)
Define swap : 'a ref -> 'a ref -> unit that swaps the contents of two references.
Define update : 'a ref -> ('a -> 'a) -> 'a that calls a function on the contents of a reference, updates it with the result, and returns the old value.
For instance let r = ref 6 in update r (function x -> x + 1) should return 6 and set the reference to 7.
Define move: 'a list ref -> 'a list ref -> unit, that removes the top argument from the first list and puts it on top of the second list. If the first list is empty, it should raise Empty.
A common pattern is to use a reference to perform a computation in an imperative way, but to keep it in a local definition, completely invisible from outside the function implementation.
Define reverse: 'a list -> 'a list, that has a type and an observable behaviour that look like the ones of a purely functional function, buf that use a reference internally to perform the computation. It takes a list, and returns a copy of the list whose elements are in reverse order.
The only functions you can call, except from locally defined functions, are (!), (:=), ref, and move that you just defined. And you are not allowed to use pattern matching.
THE GIVEN PRELUDE

exception Empty ;;
*)
let swap ra rb =
  let temp = !ra in
  (ra := !rb;
   rb := temp);;

let update r f =
  let v = !r in
  (r := f !r;
   v);;

let move l1 l2 =
  match !l1 with
  | [] -> raise Empty
  | h::t -> 
      (l1 := t; 
       l2 := h::!l2) ;;

let reverse l =
  let l2 = ref [] and l1 = ref l in
  let atry = 
    try while true 
      do move l1 l2 
      done 
    with _ -> ()
  in atry;
  !l2;;

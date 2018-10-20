(* count elements of l satisfying p *)
let countif p l = List.fold_left
  (fun counter element -> if p element then counter+1 else counter)
  0
  l
;;

countif (function x -> x>0) [3;-17;42;-73;-256];;

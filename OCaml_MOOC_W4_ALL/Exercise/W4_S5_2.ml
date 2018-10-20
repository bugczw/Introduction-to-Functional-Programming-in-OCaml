(*
USING FOLD TO CHECK PREDICATES  (75/75 points)
Using List.fold_left, write a function for_all : ('a -> bool) -> 'a list -> bool. It takes as argument a list l of type 'a list, and a predicate p of type 'a -> bool. It must return true if and only if all elements of l satisfy the predicate p.
Using List.fold_left, write a function exists : ('a -> bool) -> 'a list -> bool. It takes as argument a list l of type 'a list, and a predicate p of type 'a -> bool. It must returns true if at least one element of l satisfies the predicate p.
Write a function sorted : ('a -> 'a -> int) -> 'a list -> bool, using List.fold_left that checks that a list of elements l of type 'a is sorted, according to an ordering function cmp of type 'a -> 'a -> int.
The ordering function returns:
1 (or any positive number) if the first element is greater than the second,
-1 (or any negative number) if the first element is lesser than the second,
and 0 otherwise.
For the fold_left part, you can use the type 'a option as the accumulator: at each iteration of fold_left, if the list if sorted until now, the acccumulator is either Some v, where v is the previous element, or None otherwise.
Remember, the empty list is sorted, so you can use the list with at least one element to check using fold_left.
*)

let for_all p l =
  List.fold_left
    (fun acc ele -> acc && p ele)
    true
    l;;

let exists p l =
  List.fold_left
    (fun acc ele -> acc || p ele)
    false
    l;;

let sorted cmp = function
  | [] -> true
  | x::xs ->
      let r = (List.fold_left
                 (fun acc ele ->
                    match acc with
                    | Some ans when (cmp ans ele) <= 0 -> Some ele
                    | _-> None)
                 (Some x) xs)
      in
      if r=None then false else true;;

(*
FIRST IN FIRST OUT  (50/50 points)
A queue is a standard FIFO data structure. See wikipedia

In this exercise, we implement a queue with a pair of two lists (front, back) such that front @ List.rev back represents the sequence of elements in the queue.

Write a function is_empty : queue -> bool such that is_empty q is true if and only if q has no element.
Write a function enqueue : int -> queue -> queue such that enqueue x q is the queue as q except that x is at the end of the queue.
Write a function split : int list -> int list * int list such that split l = (front, back) where l = back @ List.rev front and the length of back and front is List.length l / 2 or List.length l / 2 + 1
Write a function dequeue : queue -> int * queue such that dequeue q = (x, q') where x is the front element of the queue q and q' corresponds to remaining elements. This function assumes that q is non empty.
THE GIVEN PRELUDE

type queue = int list * int list
*)
let is_empty (front, back) =
  List.length front = 0 && List.length back = 0;;

let enqueue x (front, back) =
  (front, x :: back);;

let split l =
  let mid = List.length l / 2 in
  let rec help i l' ls=
    match l' with
    | [] -> ([],[])
    | (x::xs) ->
        if i < mid
        then help (i+1) xs (ls @ [x])
        else (List.rev (x::xs), ls)
  in
  help 0 l [];;

let dequeue (front, back) =
  match front with
  | [] -> let (x::xs) =List.rev back in (x,(front,List.rev xs))
  | x::xs -> (x, (xs,back));;


(*
AN IMPLEMENTATION OF LIST WITH AN EFFICIENT CONCATENATION  (56/56 points)
Concatenating two standard OCaml lists takes a time proportional to the length of the first list. In this exercise, we implement a data structure for lists with a constant time concatenation.
The preludes gives a type 'a clist, which is either a single element of type 'a, the concatenation of two 'a clist or an empty 'a clist.
This representation of a list is not linear: it is a tree-like datastructure since the CApp constructor contains two values of type 'a clist.
The sequence of elements contained in a value of type 'a clist is obtained by a depth-first traversal of the tree. For instance, the example given in the prelude, of type int clist is a valid representation for the sequence [1;2;3;4].

Write a function to_list : 'a clist -> 'a list which computes the 'a list that contains the same elements as the input 'a clist, in the same order.
Write a function of_list : 'a list -> 'a clist which computes the 'a clist that contains the same elements as the input 'a list, in the same order.
Write a function append : 'a clist -> 'a clist -> 'a clist such that:
append CEmpty l = append l CEmpty = l
append l1 l2 = CApp (l1, l2) otherwise
Write a function hd : 'a clist -> 'a option that returns Some x where x is the first element of the input 'a clist, if it is not empty, and returns None otherwise.
Write a function tl : 'a clist -> 'a clist option that returns Some l where l is the input sequence without its first element, if this input sequence is not empty, or returns None otherwise.
THE GIVEN PRELUDE

type 'a clist =
  | CSingle of 'a
  | CApp of 'a clist * 'a clist
  | CEmpty

let example =
  CApp (CApp (CSingle 1,
              CSingle 2),
        CApp (CSingle 3,
              CApp (CSingle 4, CEmpty)))

*)

let rec to_list l =
  match l with
  | CSingle x -> [x]
  | CEmpty -> []
  | CApp (xs,ys) -> (to_list xs) @ (to_list ys);;

let rec of_list l =
  match l with
  | [] -> CEmpty
  | [x] -> CSingle x
  | (x::xs) -> CApp(CSingle x,of_list xs);;

let append l1 l2 =
  match (l1,l2) with
  | (CEmpty, l) -> l
  | (l,CEmpty) -> l
  | _ -> CApp(l1,l2);;

let hd l =
  match l with
  | CEmpty -> None
  | _ -> match (to_list l) with
    | (x::xs) -> Some x
    | [] -> None;;
	
let tl l =
  match l with
  | CEmpty -> None
  | CSingle x -> Some CEmpty
  | _ -> match (to_list l) with
    | (_::xs) -> Some (of_list xs)
    | [] -> None;;

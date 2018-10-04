(*
BALANCED BINARY TREES  (22/22 points)
A binary tree t, of the 'a bt type given in the prelude, is either an empty tree, or the root of a tree with a value and two children subtrees.

Write a function height : 'a bt -> int that computes the height of a tree.
A tree is balanced if, for all internal node n, its two subtrees have the same height. Write a function balanced : 'a bt -> bool that tells if a tree is balanced.
THE GIVEN PRELUDE

type 'a bt =
  | Empty
  | Node of 'a bt * 'a * 'a bt ;;

*)

let rec height t =
  match t with
  | Empty -> 0 
  | Node (l,_,r) -> max (1 + (height l)) (1 + (height r));;

let rec balanced t  = 
  match t with
  | Empty -> true
  | Node (Empty, _ ,Empty) -> true
  | Node (Empty, _ ,_) -> false
  | Node (_, _ ,Empty) -> false
  | Node (l,_,r) -> balanced l && balanced r && height l = height r;;

  
(* test *)   
balanced
  (Node
    (Node
      (Node (Node (Node (Empty, -5, Empty), 1, Node (Empty, 1, Empty)), -4,
        Node (Node (Empty, -3, Empty), -4, Node (Empty, -2, Empty))),
      4,
      Node (Node (Node (Empty, -1, Empty), 4, Node (Empty, 1, Empty)), -3,
       Node (Node (Empty, -4, Empty), 3, Node (Empty, 3, Empty)))),
    1,
    Node
     (Node (Node (Node (Empty, -1, Empty), 4, Node (Empty, -1, Empty)), -2,
       Node (Node (Empty, -1, Empty), 1, Node (Empty, -4, Empty))),
     -1,
     Node (Node (Empty, -2, Empty), -1, Node (Empty, -4, Empty))
      )))
(*
MULTISET  (25/25 points)
A multiset is like a set, with the difference that a value can appear more than once.

Implement a module MultiSet that implements the signature MultiSet_S.
Define a function letters: string -> char MultiSet.t (where MultiSet is the module defined in the previous question). This function produces a multiset in which all characters are associated to the times they appear in the input string.
Define a function anagram: string -> string -> bool that uses the previous function to tell if two words have the same multiset of characters.
THE GIVEN PRELUDE

module type MultiSet_S = sig

  (* A multi-set of type ['a t] is a collection of values of
     type ['a] that may occur several times. *)
  type 'a t

  (* [occurrences s x] return the number of time [x] occurs
     in [s]. *)
  val occurrences : 'a t -> 'a -> int

  (* The empty set has no element. There is only one unique
     representation of the empty set. *)
  val empty : 'a t

  (* [insert s x] returns a new multi-set that contains all
     elements of [s] and a new occurrence of [x]. Typically,
     [occurrences s x = occurrences (insert s x) x + 1]. *)
  val insert : 'a t -> 'a -> 'a t

  (* [remove s x] returns a new multi-set that contains all elements
     of [s] minus an occurrence of [x] (if [x] actually occurs in
     [s]). Typically, [occurrences s x = occurrences (remove s x) x -
     1] if [occurrences s x > 0]. *)
  val remove : 'a t -> 'a -> 'a t

end
*)
module MultiSet : MultiSet_S = struct 
  type 'a t = ('a * int) list
      
  let occurrences s x =
    try List.assoc x s 
    with _ -> 0

  let empty = [] 

  let insert s x = 
    (x, ((occurrences s x) + 1)) :: (List.filter (fun (str, _) -> str != x) s)

  let remove s x = 
    let count = occurrences s x in
    if count < 2 then List.filter (fun (str, _) -> str != x) s
    else (x, (count - 1)) :: (List.filter (fun (str, _) -> str = x) s) 
end;;

open MultiSet
    
let letters word =
  let rec help acc str =
    match str with
    | "" -> acc
    | _ ->
        (let s = String.get str 0 in
         help (insert acc s) 
           (String.sub str 1 ((String.length str) - 1)))
  in help empty word;;

let anagram word1 word2 =
  let set1 = letters word1 and set2 = letters word2 in 
  let str = word1 ^ word2 in
  let rec help acc i =
    try
      (let c = String.get str i in 
       if (occurrences set1 c) = (occurrences set2 c)
       then acc && (help acc (i + 1))
       else false) 
    with _ -> acc
  in help true 0;; 
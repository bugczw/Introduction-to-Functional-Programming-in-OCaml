(*
CHAR INDEXED HASHTABLES  (40/40 points)
Have a look at the documentation of module Hashtbl.

Implement a module CharHashedType, compatible with the HashedType signature, where type t = char.
Use the module defined in the previous question to instantiate the Hashtbl.Make functor as a module CharHashtbl.
Reimplement the data structure of trie from a previous exercise, so that a hash table is used to represent the association between characters and children. To do so, complete the definition of module Trie, so that it is compatible with the given signature GenericTrie, whose 'a table type is instanciated to char indexed hash tables.
Be careful, a hash table is not a purely functional data structure. Therefore, it must be copied when necessary!
Note: you must neither change the signature nor the types of module Trie or the tests will fail.
https://www.fun-mooc.fr/courses/course-v1:parisdiderot+56002+session03/courseware/W6/W6S3/

Trie is in W3_S2_2.ml

THE GIVEN PRELUDE

module type GenericTrie = sig
  type 'a char_table
  type 'a trie = Trie of 'a option * 'a trie char_table
  val empty : unit -> 'a trie
  val insert : 'a trie -> string -> 'a -> 'a trie
  val lookup : 'a trie -> string -> 'a option
end
*)

module CharHashedType =
struct
  type t = char

  let equal c = fun x -> x = c

  let hash = Char.code
end

module CharHashtbl = Hashtbl.Make(CharHashedType)
    
module Trie : GenericTrie
  with type 'a char_table = 'a CharHashtbl.t =
struct
  type 'a char_table = 'a CharHashtbl.t
  type 'a trie = Trie of 'a option * 'a trie char_table

  let empty () =
    Trie (None, CharHashtbl.create 0);;

  let lookup trie w =
    let rec aux t idx = 
      let Trie (v, table) = t in 
      if idx = String.length w then v
      else 
        try 
          let t' = CharHashtbl.find table (String.get w idx) in 
          aux t' (idx + 1) 
        with _ -> None 
    in 
    aux trie 0 

  let rec insert trie w v = 
    let slen = String.length w
    and Trie(v',m) = trie in
    if slen = 0 then Trie(Some v, m) 
    else 
      let c = String.get w 0 
      and s = String.sub w 1 (slen - 1) in 
      let ot = 
        try CharHashtbl.find m c 
        with _ -> empty ()
      in 
      (CharHashtbl.replace m c (insert ot s v); 
       Trie (v', m))
end


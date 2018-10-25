(*
OPENING MODULES  (45/45 points)
The code given in the template has been written using some values declared in three modules of the standard library. Can you find what are these three modules? When you have found them, just use open directives to have the code accepted by the type checker. Be aware that the iter function appears in multiple module and that the order in which you open the modules is important.
http://caml.inria.fr/pub/docs/manual-ocaml/stdlib.html
*)

open Digest
open String
open List
    
let print_hashes (hashes : Digest.t list) : unit =
  let print_hash h = h |> to_hex |> uppercase |> print_endline in
  iter print_hash hashes;;
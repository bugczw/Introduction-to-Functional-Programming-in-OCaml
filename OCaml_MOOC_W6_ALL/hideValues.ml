module Naturals : sig
  type t
  val zero : t
  (* val return_natural : int -> t *)
  val succ : t -> t
  val pred : t -> t
end = struct
  type t = int
  let zero = 0
  (* The following function is for internal purpose only. *)
  let return_natural n = assert (n >= 0 && n <= max_int); n
  let succ n = if n = max_int then 0 else return_natural (n + 1)
  let pred = function 0 -> 0 | n -> n - 1
end;;

Naturals.return_naturals 0;;

module type DictSig = sig
  type key
  type 'value t
  val empty : 'value t
  val add : 'value t -> key -> 'value -> 'value t
  exception NotFound of key
  val lookup : 'value t -> key -> 'value
end;;
(* break *)
module Dict (Key : sig
  type t
  val compare : t -> t -> int
end) : DictSig = struct
  type key = Key.t
  type 'value t = (key * 'value) list
  let empty = []
  let add d k v = (k, v) :: d
  exception NotFound of key
  let rec lookup d k =
    match d with
      | (k', v) :: d' when Key.compare k k' = 0 -> v
      | _ :: d -> lookup d k
      | [] -> raise (NotFound k)
end;;
(* break *)
module Dict1 = Dict (struct
  type t = string
  let compare k1 k2 = Pervasives.compare (String.lowercase k1) (String.lowercase k2)
end)
(* break *)
module ForceArchive (Dict : DictSig) = struct
  let force = Dict.empty
  let force = Dict.add force "luke" 10
  let force = Dict.add force "yoda" 100
  let force = Dict.add force "darth" 1000
  let force_of_luke = Dict.lookup force "luke"
  let force_of_r2d2 = Dict.lookup force "r2d2"
end;;
(* break *)
module Dict (Key : sig
  type t
  val compare : t -> t -> int
end) : DictSig with type key = Key.t = struct
  type key = Key.t
  type 'value t = (key * 'value) list
  let empty = []
  let add d k v = (k, v) :: d
  exception NotFound of key
  let rec lookup d k =
    match d with
      | (k', v) :: d' when Key.compare k k' = 0 -> v
      | _ :: d -> lookup d k
      | [] -> raise (NotFound k)
end;;
(* break *)
module ForceArchive (Dict : DictSig with type key = string) = struct
  let force = Dict.empty
  let force = Dict.add force "luke" 10
  let force = Dict.add force "yoda" 100
  let force = Dict.add force "darth" 1000
  let force_of_luke = Dict.lookup force "luke"
  let force_of_r2d2 = Dict.lookup force "r2d2"
end;;

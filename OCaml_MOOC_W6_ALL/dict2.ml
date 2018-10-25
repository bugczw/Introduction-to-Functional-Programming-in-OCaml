module type DictSig = sig
  type ('key, 'value) t
  val empty : ('key, 'value) t
  val add : ('key, 'value) t -> 'key -> 'value -> ('key, 'value) t
  exception NotFound
  val lookup : ('key, 'value) t -> 'key -> 'value
end;;
(* break *)
(* The client *)
module ForceArchive (Dict : DictSig) = struct
  let force = Dict.empty
  let force = Dict.add force "luke" 10
  let force = Dict.add force "yoda" 100
  let force = Dict.add force "darth" 1000
  let force_of_luke = Dict.lookup force "luke"
  let force_of_r2d2 = Dict.lookup force "r2d2"
end;;
(* break *)
module Dict1 : DictSig = struct
  type ('key, 'value) t = ('key * 'value) list
  let empty = []
  let add d k v = (k, v) :: d
  exception NotFound
  let rec lookup d k =
    match d with
      | (k', v) :: d' when k = k' -> v
      | _ :: d -> lookup d k
      | [] -> raise NotFound
end;;
(* break *)
module Dict2 : DictSig = struct
  type ('key, 'value) t =
    | Empty
    | Node of ('key, 'value) t * 'key * 'value * ('key, 'value) t

  let empty = Empty
	
  let rec add d k v =
    match d with
    | Empty -> Node (Empty, k, v, Empty)
    | Node (l, k', v', r) ->
      if k = k' then Node (l, k, v, r)
      else if k < k' then Node (add l k v, k', v', r)
      else Node (l, k', v', add r k v)

  exception NotFound

  let rec lookup d k =
    match d with
      | Empty ->
	raise NotFound
      | Node (l, k', v', r) ->
	if k = k' then v'
	else if k < k' then lookup l k
	else lookup r k

end;;

module Client1 = ForceArchive (Dict1)
module Client2 = ForceArchive (Dict2)

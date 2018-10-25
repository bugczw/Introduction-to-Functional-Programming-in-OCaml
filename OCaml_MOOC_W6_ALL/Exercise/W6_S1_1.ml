(*
TYPE ABSTRACTION USING A SIGNATURE  (20/20 points)
Encapsulate the type and values given in the template in a module named Exp.

To make e abstract, assign a signature to the module Exp that makes the type e abstract and publish the functions int, mul and add.

Given that interface, the only way to build a value of type e is to use the functions int, mul add and to_string. Such functions are called smart constructors because they perform some smart operations when they build values.

These smart constructors enforce the invariant that an expression represented by a value of type e is always simplified, i.e. it does not contain a subexpression of the form e * 1, 1 * e, e * 0, 0 * e, 0 + e or e + 0.

The following expression should be accepted.
Exp.mul (Exp.int 0) (Exp.add (Exp.int 1) (Exp.int 2))
The following expression should be rejected.
Exp.EMul (Exp.EInt 0) (Exp.EAdd (Exp.EInt 1) (Exp.EInt 2))
Unfortunately, turning e into an abstract data type prevents the user from pattern matching over values of type e. To allow pattern matching while forbidding the direct application of data constructors, OCaml provides a mechanism called private types. The interested student can get more information about this advanced (off-topic) feature here.
http://caml.inria.fr/pub/docs/manual-ocaml-400/manual021.html#toc76
*)

module Exp : sig 
  type e
  val int : int -> e
  val mul : e -> e -> e
  val add : e -> e -> e 
  val to_string : e -> string 
end = struct
  type e = EInt of int | EMul of e * e | EAdd of e * e

  let int x = EInt x

  let mul a b =
    match a, b with
    | EInt 0, _ | _, EInt 0 -> EInt 0
    | EInt 1, e | e, EInt 1 -> e
    | a, b -> EMul (a, b)

  let add a b =
    match a, b with
    | EInt 0, e | e, EInt 0 -> e
    | a, b -> EAdd (a, b)

  let rec to_string = function
    | EInt i -> string_of_int i
    | EMul (l, r) -> "(" ^ to_string l ^ " * " ^ to_string r ^ ")"
    | EAdd (l, r) -> "(" ^ to_string l ^ " + " ^ to_string r ^ ")"
end

(*
module Exp : sig 
  type e = private EInt of int | EMul of e * e | EAdd of e * e
  val int : int -> e
  val mul : e -> e -> e
  val add : e -> e -> e 
  val to_string : e -> string 
end = struct
  type e = EInt of int | EMul of e * e | EAdd of e * e

  let int x = EInt x

  let mul a b =
    match a, b with
    | EInt 0, _ | _, EInt 0 -> EInt 0
    | EInt 1, e | e, EInt 1 -> e
    | a, b -> EMul (a, b)

  let add a b =
    match a, b with
    | EInt 0, e | e, EInt 0 -> e
    | a, b -> EAdd (a, b)

  let rec to_string = function
    | EInt i -> string_of_int i
    | EMul (l, r) -> "(" ^ to_string l ^ " * " ^ to_string r ^ ")"
    | EAdd (l, r) -> "(" ^ to_string l ^ " + " ^ to_string r ^ ")"
end
*)
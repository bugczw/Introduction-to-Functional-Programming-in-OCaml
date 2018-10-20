(*
A SMALL ARITHMETIC INTERPRETER  (45/45 points)
In this exercise, we will write a small program that computes some operations on integers. We will use a small datatype operation that describes all the operations to perform to compute the result. For example, suppose we want to do the following computation:
mul (add 0 1) (mul 3 4)
We can describe it as: Op ("mul", Op ("add", Value 0, Value 1), Op ("mul", Value 3, Value 4))
The Op constructor takes as a first argument a string, which is the name of the function that is stored in an environment. We suppose there exists a variable initial_env that contains some predefined functions.

First of all, we need a way to find a function in an environment of type env, which is basically a list of tuples. Each of these tuples contains a string, which is the name of the function, and a value of type int -> int -> int, which is basically a function that takes two arguments of type int and returns an int as a result.
Write a function lookup_function : string -> env -> (int -> int -> int) that returns the function associated to a name in an environment. If there is no function with the name given, you can return invalid_arg "lookup_function".
Another useful feature would be to add functions to a given environment. Write the function add_function : string -> (int -> int -> int) -> env -> env that takes an environment e, a name for the function n and a function f, and returns a new environment that contains the function f that is associated to the name n.

What you can notice now is that unless you put explicit annotations, those two previous functions should be polymorphic and work on any list of couples. Actually, lookup_function could have been written as List.assoc.
Create a variable my_env: env that is the initial environment plus a function associated to the name "min" that takes two numbers and returns the lowest. You cannot use the already defined Pervasives.min function, nor any let .. in. Take advantage of lambda expressions!
Now that we have correctly defined the operations to use the environment, we can write the function that computes an operation. Write a function compute: env -> operation -> int that takes an environment and an operation description, and computes this operation. The result is either:
Directly the value.
An operation that takes two computed values and a function from the environment.
Let's be a bit more efficient and use the over-application: suppose a function id: 'a -> 'a, then id id will also have type 'a -> 'a, since the 'a is instantiated with 'a -> 'a . Using that principle, we can apply id to itself infinitely since it will always return a function. Write a function compute_eff : env -> operation -> int that takes an environment and an operation, and computes it. However, you cannot use let inside the function!
THE GIVEN PRELUDE

type operation =
    Op of string * operation * operation
  | Value of int

type env = (string * (int -> int -> int)) list
*)

let rec lookup_function str = function
  | [] -> invalid_arg "lookup_function"
  | (s, int3)::xs ->
      if str = s then int3
      else lookup_function str xs;; 

let add_function name op env =
  let rec lookup myenv =
    match myenv with
    | [] -> [(name, op)]
    | (s, int3)::xs ->
        if s = name then (s, op)::xs
        else (s, int3)::(lookup xs)
  in lookup env ;;

let my_env =
  initial_env @ [("min", fun x y -> if x>y then y else x)];;

let rec compute env = function
  | Value v -> v
  | Op (str, op1, op2) -> lookup_function str env (compute env op1) (compute env op2);;

let rec compute_eff env = function   
  | Value v -> v
  | Op (str, op1, op2) -> 
      lookup_function str env (compute_eff env op1) (compute_eff env op2);;

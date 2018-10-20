(*
LAMBDA-EXPRESSIONS AS VALUES  (20/20 points)
In this exercise, we will define functions as values, also called lambda expressions, using the keyword function to do a pattern-matching on their argument. As a result, you are not allowed to use match ... with in your code.

Define a function last_element: 'a list -> 'a that returns the last element of a list. Your function may return (invalid_arg "last_element") when the list is empty.
Write a function is_sorted: 'a list -> bool that takes a list l as argument, and that checks that the list is sorted in increasing order according to the polymorphic comparison operator <.
*)

let rec last_element = function 
  | [x] -> x
  | x::xs -> last_element xs
  | _ -> invalid_arg "last_element"
;;

let rec is_sorted = function 
  | x::y::ys -> if (x<y) then is_sorted (y::ys) else false
  | _ ->true
;;



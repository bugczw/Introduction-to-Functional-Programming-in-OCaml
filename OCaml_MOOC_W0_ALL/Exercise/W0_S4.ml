(*
GRADING ENVIRONMENT (TEST-BED)  (40/40 points)
In this test-bed exercise you are asked to (re)implement the basic integer-arithmetic functions.

Write a function plus of type int -> int -> int.
Write a function minus of type int -> int -> int.
Write a function times of type int -> int -> int.
Write a function divide of type int -> int -> int.
The preloaded template contains a minor syntax error and is only a partially valid answer. These errors were introduced in order to let you experiment with the error reporting mechanism and the grading report. 
Feel free to introduce more errors and to stress the system, the resulting grade for this exercise will not be taken into account in the global grade and you might submit as many solutions as you wish. 
If you end up writing an infinite computation, the system will detect it after a while and ask you to stop the script. It will slow your browser down until that point, since everything is done on your side, via your JavaScript engine. So don't worry, you can try and break the system as much as you want, it should not break anything on our servers.

THE GIVEN PRELUDE

(* Some code is loaded in the toplevel before your code. *)

let greetings = "Hello world!"
*)

let plus x y = x + y ;;

let minus x y = x - y ;;

let times x y = x * y ;;

let divide x y = x / y ;;
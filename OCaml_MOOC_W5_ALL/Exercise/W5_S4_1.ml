(*
ROTATING THE CONTENTS OF AN ARRAY  (22/22 points)
In this exercise, you will improve the code shown in the course (and given in the template) for rotating arrays.

There is something perfectible with the code of rotate.
Find what, and fix the function!.
Define rotate_by: 'a array -> int -> unit adding a parameter that allows to rotate by n positions.
For instance, rotate_by [|1;2;3;4|] 3 should yield [|4;1;2;3|].
*)
let rotate a =
  if a = [||] then ()
  else
    let n = Array.length a in 
    let v = a.(0) in
    for i = 0 to n-2 do
      a.(i) <- a.(i+1)
    done;
    a.(n-1) <-v ;;

let rec rotate_by a n =
  let loop = 
    if n < 0 then (Array.length a + n) else n
  in 
  for i = 1 to loop do
    rotate a
  done;;

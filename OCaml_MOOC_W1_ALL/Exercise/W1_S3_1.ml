(*
INTEGER IDENTIFIERS  (2/2 points)
Suppose that a variable x exists and is an integer.

Define a variable x_power_8 that uses three multiplications to calculate x to the power of 8. The only function you are allowed to call is the ( * ) operator.

Hint: use auxiliary variables.

THE GIVEN PRELUDE

let x = Random.int 9 + 1 (* not 0 *)
*)


let x_power_8 =
  let a = x * x in
  let b = a * a in
  b * b;;

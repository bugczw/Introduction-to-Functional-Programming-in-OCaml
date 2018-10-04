(*
STRING IDENTIFIERS  (2/2 points)
Suppose that a variable word exists and is a string.

Define a variable sentence that uses 5 string concatenations to create a string containing 9 times word, separated by commas (',').

This time, experiment with defining local let ... ins to store the partial results.
*)

let sentence = 
  let a = word ^ "," in
  let b = a ^ a in
  let c = b ^ b in
  let d =c ^ c in
  d ^ word;;

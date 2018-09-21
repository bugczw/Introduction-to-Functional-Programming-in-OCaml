let x = 1;;

(* sequential definitions *)
let x = 2 in
    let y = x + 1 in (* y = 2+1 *)
    x*y;;            (* 2*3 *)

(* simultaneous definition *)
let x = 2
  and y = x+1 in (* y = 1+1 *)
    x*y;;        (* 2*2 *)

(* 2D points *)
type point2D = { x : int; y : int };;
let origin = { x = 0; y = 0 };;

(* create a new point at offset of given one *)
let offset_h p dx = {p with x=p.x+dx};;
let offset_v p dy = {p with y=p.y+dy};;

(* no modification is made to the original point *)
let p = offset_h origin 10;;
origin;;

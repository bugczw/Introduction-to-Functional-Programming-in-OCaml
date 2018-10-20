(* RGB colors *)
type color = {r: int; g:int; b:int};;
let black = {r=255;g=255;b=255};;

(* movable colored 2D points *)
type point2D = { mutable x : int; mutable y : int ; c: color};;
let origin = { x = 0; y = 0 ; c=black};;

(* create a new point at offset of given one *)
(* thanks to "with" we keep the same code    *)
let offset_h p dx = {p with x=p.x+dx};;
let offset_v p dy = {p with y=p.y+dy};;

(* no modification is made to the original point *)
let p = offset_h origin 10;;
origin;;

(* start moving things around *)

let move p dx dy = p.x <- p.x+dx; p.y <- p.y+dy;;

(* p is modified *)

p;;
move p 2 2;;
p;;
move p (-1) (-1) ;;
p;;

let f x = x+1;; (* global definition *)
f 17;;

let g y = 2*y   (* local definition *)
in g 42;;

f f 1;;

(f f) 1;;

f (f 1);;


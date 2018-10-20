let f1 = function n -> (function x -> n+x);;

(f1 17) 73;;

f1 17 73;;

let f2 = fun n x -> n+x;;

f2 17 73;;

(f2 17) 73;;


let compose f g = (function x -> f(g x));;

compose (function x->x+1) (function x->2*x);;

(compose (function x->x+1) (function x->2*x)) 10;;

compose (function x-> x+1) (function x -> x *. 3.14);;


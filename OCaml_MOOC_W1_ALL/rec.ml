let x = 1;;
let x = x+1;;
x;;

let f x = x+1;;
let f x = f (f x);;
f 1;;

let fact n = if n <=1 then 1 else n*fact(n-1);;

let rec fact n = if n <=1 then 1 else n*fact(n-1);;

fact 10;;

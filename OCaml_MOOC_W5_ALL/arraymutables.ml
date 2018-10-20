let a = [|0;1;2;3;4|];;

a.(0);;

a.(0) <- 100;;

a.(0);;

a;;


let rotate a =
  let n = Array.length a in 
  let v = a.(0) in
  for i = 0 to n-2 do
    a.(i) <- a.(i+1)
  done;
  a.(n-1)<-v;;

let x = Array.init 10 (fun i -> i);;

x;;

rotate x;;

x;;

rotate x;;

x;;

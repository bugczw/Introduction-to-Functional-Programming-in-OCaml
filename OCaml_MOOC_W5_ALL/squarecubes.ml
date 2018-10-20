let cubes n = Array.init n (fun i -> i*i*i);;

let sqrti n =  truncate (sqrt (float n));;

let issquare n = let s = sqrti n in s*s =n;;

let squarecubes n =
  let c = cubes n in
  for i = 0 to n-1 do
    if issquare c.(i) then 
       (print_int c.(i);
        print_string " ")
  done
;;

squarecubes 100;;

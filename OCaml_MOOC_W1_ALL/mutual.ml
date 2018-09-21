let rec even x = if x=0 then true else odd (x-1);;

let rec even x = if x=0 then true else odd (x-1)
and odd x = if x=0 then false else even (x-1);; 
  
even 17;;
even 10;;

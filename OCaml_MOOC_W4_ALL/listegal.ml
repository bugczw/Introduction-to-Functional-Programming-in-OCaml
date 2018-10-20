let egal l1 l2 = List.sort compare l1 = List.sort compare l2;;

let f = egal [783; 42; 17];;

f [17;42;783];;
 
let egalp l1 =
  let l1sorted = List.sort compare l1 
  in function l2 -> l1sorted = List.sort compare l2;; 

let f = egalp [783; 42; 17];;

f [17;42;783];;


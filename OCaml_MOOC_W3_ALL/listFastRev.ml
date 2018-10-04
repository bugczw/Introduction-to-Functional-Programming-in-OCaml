let rec rev_aux accu = function
  | [] -> accu
  | x :: xs -> rev_aux (x :: accu) xs;;
let rev l = rev_aux [] l;;
let l = rev [1; 2; 3];;

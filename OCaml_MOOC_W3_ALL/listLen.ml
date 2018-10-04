let rec length = function
  | [] -> 0
  | x :: xs -> 1 + length xs;;
let three = length [1; 2; 3];;

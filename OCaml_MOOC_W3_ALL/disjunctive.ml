let remove_zero_or_one_head = function
  | 0 :: xs -> xs
  | 1 :: xs -> xs
  | l -> l;;
let remove_zero_or_one_head' = function
  | 0 :: xs | 1 :: xs -> xs
  | l -> l;;
let remove_zero_or_one_head'' = function
  | (0 | 1) :: xs -> xs
  | l -> l;;


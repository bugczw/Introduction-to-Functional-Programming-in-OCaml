let rec uniq = function
  | [] -> []
  | [x] -> [x]
  | x :: x' :: xs ->
    if x = x' then
      uniq (x' :: xs)
    else
      x :: uniq (x' :: xs);;
let l1 = uniq [1;2;2;3;4;3];;

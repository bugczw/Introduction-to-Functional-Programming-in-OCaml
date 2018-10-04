let rec duplicate_head_at_the_end = function
  | [] -> []
  | (x :: _) as l -> l @ [x];;
let l = duplicate_head_at_the_end [1;2;3];;

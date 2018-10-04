type positive = int;;
let abs (x : int) = (if x < 0 then -x else x : positive);;
let abs' (x : int) : positive = if x < 0 then -x else x;;

let product v1 v2 =
  List.fold_left (+) 0 (List.map2 ( * ) v1 v2);;

product [2;4;6] [1;3;5];;


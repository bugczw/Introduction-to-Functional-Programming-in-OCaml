let rec sublists = function
  | [] -> [ [] ]
  | h::r ->
      let rp = sublists r in 
	rp@(List.map (function l -> h::l) rp);;
      
sublists [1;2;3];;

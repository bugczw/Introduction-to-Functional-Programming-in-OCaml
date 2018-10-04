let swap a = [| a.(1); a.(0) |];;
let b = swap [| 0; 1 |];;
let c = swap [| 0; 1; 2 |];;

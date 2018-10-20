(* hide *)
let read_int () = int_of_string (read_line())
;;
(* show *)

(* read a list of integers, and stop *)
(* when a non integer is entered     *)

let read_intlist () =
  (* a reference to hold the results *)
  let l = ref [] in
  (* the reading loop *)
  let doread() =
   try
    while true do
      l := (read_int ()):: !l
    done
   with _ -> ()
  in
    doread();
    List.rev !l
;;

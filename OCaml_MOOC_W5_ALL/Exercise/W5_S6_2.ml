(*
READING LINES FROM THE STANDARD INPUT  (10/10 points)
The code given in the template is an attempt to reading a list of lines from the standard input, slightly different from the one shown in the course notes.
At first sight, it behaves well.

# read_lines ();;
Hello
mister
the
caml!
- : string list = [ "Hello" ; "mister" ; "the" ; "caml!" ]
But if you call this function several times, you get unexpected results.
Study the code, to understand what is going on, compare with the example shown in the course, and then fix this code.
Important note: it is not possible to implement reading functions that actually ask the user to input something in the current toplevel environment.
For that, the environment defines an alternative version of read_line that simulates user interaction. Some calls will return a string, some others will (less often) raise End_of_file.
*)

let read_lines () =
  let sl = ref [] in
  let rec aux () =
    try
      sl := read_line () :: !sl ;
      aux ()
    with
      End_of_file -> List.rev !sl in
  aux ();;


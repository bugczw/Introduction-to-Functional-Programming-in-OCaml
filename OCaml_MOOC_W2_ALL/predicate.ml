(** A property over integers is represented as a function
    from integers to booleans. *)
type int_property = int -> bool;;

(** Similarly, a function from strings to booleans is a
    good representation for a property over strings. *)
type string_property = string -> bool;;

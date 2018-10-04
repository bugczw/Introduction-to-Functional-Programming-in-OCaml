type color = Black | Gray | White;;
(* Black < Gray < White and forall x, not (x < x). *)
let lighter c1 c2 =
  match (c1, c2) with
    | (Black, Black) -> false
    | (White, White) -> false
    | (Gray, Gray) -> false
    | (Black, _) -> true
    | (_, White) -> true
    | (White, Gray) -> false
    | (Gray, Black) -> false;;

type ('a, 'b) either =
  | Left  of 'a
  | Right of 'b;;
type square = { dimension : int };;
type circle = { radius : int };;
type shape = (square, circle) either;;

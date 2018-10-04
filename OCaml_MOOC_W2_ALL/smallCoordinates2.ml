type point2D = { x : int; y : int };;
let origin = { x = 0; y = 0 };;
let from_tuple (x, y) = { x; y };;
let a : point2D = from_tuple (4,  2);;
let b : point2D = from_tuple (10, 5);;
type box = {
  left_upper_corner  : point2D;
  right_lower_corner : point2D;
};;
let the_box = { left_upper_corner = a; right_lower_corner = b };;
let get_min_x { left_upper_corner  = { x } } = x;;

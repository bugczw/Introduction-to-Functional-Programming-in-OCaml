(*
PRODUCING FINE ASCII ART  (175/175 points)
In this exercise, we will display black and white images as text, where a black dot is printed as a '#' and a white dot as a ' '.

Instead of using imperative constructs for storing our images, images will simply be functions that take an x and a y and return a boolean that indicates if the function is black or white at this point.
This is materialized by the image type alias given in the prelude.
We will only use imperative features to display them.

Define a higher order function display_image: int -> int -> image -> unit that takes an integer width, another one height, a function which takes an x and a y, and renders (prints) the boolean function as a series of lines, using two nested for loops.
Each line corresponds to a y, the first line printed being for y = 0, the last one for y = height.
In each line, the first character printed must be for x = 0, the last one for x = width. When the function result is true, a sharp ('#') must be displayed, and a space otherwise.
To try your function, the prelude defines sample images and image builders.
For instance, the image disk 5 5 5 would be displayed as the following ASCII art, when rendered between coordinates 0 <= x <= 10 and 0 <= y <= 10.
     #
  #######
 #########
 #########
 #########
###########
 #########
 #########
 #########
  #######
     #
Now, we want to blend images to compose complex images from simple ones. For this, we will use the blend type given the prelude.
If we take two functions f and g, we have that:
Image f
is the blended image looking exactly like f.
And (Image f, Image g)
is the blended image that is black only where both f and g are both black.
Or (Image f, Image g)
is the blended image that is black wherever either f or g or both are black.
Rem (Image f, Image g)
is the blended image that is black wherever f is black and g is not.
Write a recursive render : blend -> int -> int -> bool function, that tells, for a given x and y the boolean color of the point, considering the given blended image.
Define a function display_blend: int -> int -> blend -> unit that takes a width, another one height, a blended image, and displays it by combining the two previous functions.
As an example, the blend display_blend 10 10 (Rem (Image all_black, Image (disk 5 5 5))) would be displayed as the following ASCII art.
##### #####
##       ##
#         #
#         #
#         #

#         #
#         #
#         #
##       ##
##### #####
Bonus question: Did you see that the type of render is actually equivalent to blend -> image?

THE GIVEN PRELUDE

type image = int -> int -> bool ;;

let all_white = fun x y -> false ;;

let all_black = fun x y -> true ;;

let checkers = fun x y -> y/2 mod 2 = x/2 mod 2 ;;

let square cx cy s = fun x y ->
  let minx = cx - s / 2 in
  let maxx = cx + s / 2 in
  let miny = cy - s / 2 in
  let maxy = cy + s / 2 in
  x >= minx && x <= maxx && y >= miny && y <= maxy
;;

let disk cx cy r = fun x y ->
  let x' = x - cx in
  let y' = y - cy in
  (x' * x' + y' * y') <= r * r
;;

type blend =
  | Image of image
  | And of blend * blend
  | Or of blend * blend
  | Rem of blend * blend
;;
*)

let display_image width height f_image =
  for y = 0 to height do
    for x = 0 to width do
      if f_image x y then print_string "#"
      else print_string " "
    done;
    print_newline()
  done;;

let rec render blend x y =
  match blend with
  | Image im -> im x y
  | And (b1, b2) -> (render b1 x y) && (render b2 x y)
  | Or (b1, b2) -> (render b1 x y) || (render b2 x y)
  | Rem (b1, b2) -> (render b1 x y) && (not (render b2 x y));;

let display_blend width height blend =
  display_image width width (render blend);;
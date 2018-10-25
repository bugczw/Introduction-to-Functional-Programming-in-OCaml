module Forest = struct
  type 'a forest = 'a list
  module Tree = struct
      type 'a tree = Leaf of 'a | Node of 'a tree forest
  end
end;;
open Forest.Tree
let t = Leaf 42;;

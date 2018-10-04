let square x = x * x;;
let squares n = Array.init n square;;
let s1 = squares 5;;
let a1 = s1.(4)

type euro = Euro of float;;
type dollar = Dollar of float;;
let euro_of_dollar (Dollar d) = Euro (d /. 1.33);;
let x = Dollar 4.;;
let y = Euro 5.;;
let invalid_comparison = (x < y);;
let valid_comparison = (euro_of_dollar x < y);;

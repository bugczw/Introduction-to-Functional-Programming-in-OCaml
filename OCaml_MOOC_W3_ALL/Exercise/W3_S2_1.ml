(*
SYMBOLIC MANIPULATION OF ARITHMETIC EXPRESSIONS  (44/44 points)
Abstract syntax trees are a convenient way to represent a syntactic expression in a structured way.
Let us consider arithmetic expressions formed by the following rules:

an integer is an arithmetic expression ;
if lhs and rhs are arithmetic expressions then lhs + rhs is an arithmetic expression;
if lhs and rhs are arithmetic expressions then lhs * rhs is an arithmetic expression.
Such an expression can be represented by a value of type exp as defined in the given prelude (as well as the definition of 1 + 2 * 3 as an example).
Write the expression 2 * 2 + 3 * 3 in a variable my_example.
Write a function eval : exp -> int that computes the value of an arithmetic expression. The evaluation rules are:
If the expression is an integer x, the evaluation is x.
If the expression is lhs + rhs and lhs evaluates to x and rhs evaluates to y, then the evaluation is x + y.
If the expression is lhs * rhs and lhs evaluates to x and rhs evaluates to y, then the evaluation is x * y.
If an expression is of the form a * b + a * c then a * (b + c) is a factorized equivalent expression.
Write a function factorize : exp -> exp that implements this transformation on its input exp if it has the shape a * b + a * c or does nothing otherwise.
Write the reverse transformation of factorize, expand : exp -> exp, which turns an expression of the shape a * (b + c) into a * b + a * c.
Implement a function simplify: exp -> exp which takes an expression e and:
If e is of the shape e * 0 or 0 * e, returns the expression 0.
If e is of the shape e * 1 or 1 * e, returns the expression e.
If e is of the shape e + 0 or 0 + e, returns the expression e.
and does nothing otherwise.
Remarks:

The symbols (a, b, c and e) can match any expressions, not just integers.
these are a syntactical rewritings, so two expressions are considered equal if and only if they are exactly the same expressions (simply use the = operator to check that).
The rewritings have to be done on the first level of the expression only, not recursively and not deeper in the expression. If the toplevel expression does not match the expected pattern, simply return the expression untouched.
THE GIVEN PRELUDE

type exp =
  | EInt of int
  | EAdd of exp * exp
  | EMul of exp * exp

let example =
  EAdd (EInt 1, EMul (EInt 2, EInt 3))
*)

let my_example =
  EAdd (EMul (EInt 2, EInt 2), EMul (EInt 3, EInt 3));;

let rec eval e =
  match e with
  | EInt x -> x
  | EAdd (x, y) -> (eval x)+(eval y)
  | EMul (x, y) -> (eval x)*(eval y);;

let factorize e =
  match e with 
  | EAdd (EMul (a,b), EMul (c,d)) -> if a = c then EMul(a, EAdd(b, d)) else e
  | _ -> e;;
  
let rec factorize2 e = 
  match e with 
  | EAdd(x, y) -> 
      (match (x, y) with
       | (EMul(a,b), EMul(a',c)) ->
           if a=a' then EMul(factorize a,EAdd(factorize b,factorize c)) 
           else EAdd(EMul(factorize a,factorize b), EMul(factorize a',factorize c))
       | _ -> EAdd(factorize x,factorize y))
  | EMul (x, y) -> EMul (factorize x,factorize y) 
  | _ -> e;;

let expand e = match e with
  | EMul(a,EAdd(b,c)) -> EAdd(EMul(a,b),EMul(a,c))
  | _ -> e;;
  
let simplify e =
  match e with
  | EMul(a,EInt 1) -> a
  | EMul(EInt 1,a) -> a
  | EMul(a,EInt 0) -> EInt 0
  | EMul(EInt 0,a) -> EInt 0
  | EAdd(EInt 0,a) -> a
  | EAdd(a,EInt 0) -> a
  | _ -> e;;
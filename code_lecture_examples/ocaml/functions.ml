(* here is a function *)
let f x = x + 3

(* the syntax is 
let func_name arg1 arg2 arg3 ... argn = e

where 'e' is any valid expression
*)

let f x = 5
let f x y = if x > y then 3 else 4

(* functions have are expressions so they have types *)
let f x = x + 3
(* int -> int *)

let f x y = if x > y then 3 else 4
(* 'a -> 'a -> int *)

(* the generic 'a means OCaml has no idea
why type it should be but all 'a types 
should be the same *)

let f x y = 4 + 5
(* 'a -> 'b -> int *)

(* 'a and 'b could be the same, but could 
also be different. *)


(* here are all things that would cause errors *)
if 3 then 4 else 5
(* the guard must be true or false. 3 is an int *)

if 3 then 4 else 4.5
(* the branch expressions should have the same type
4 is an int and 4.5 is a float *)

if true then 5
(* functional OCaml must have an else branch.
Imperative OCaml will allow this but you get 
this Unit return type which is not what you want *)

let f x y = x + y;;
f 3.4 5.6;;
(* x and y should be ints, not floats *)

let f x y = x = y;;
f 3.4 "hello";;
(* x and y must be the same type *)

(* bind expressions to variables for 
later use *)
let x = 3;;
let y = 5;;
x + y;

(* we can do the same with functions *)
let f x = x + 3;;

f 4;;
f 5;;

(* we don't have to bind expressions 
to variables *)
3 + 5;;
4 + 4;;

(* and functions are expressions so we
can make functions not bount to variables *) 
fun x -> x + 3;;

(* and they can be subbed in for function 
names *)
(fun x -> x + 3) 4;;
(* same as *)
f 4
(* ultimately anonymous functions are
the make up of functions *)
let f = (fun x -> x + 3);;
f 4
(* same as *)
(fun x -> x + 3) 4;;

(* we can nest these *)
let add x y = x + y;;
let add_anon = fun x -> fun y -> x + y;;
add 4 5;;
add_anon 4 5;;
(fun x -> fun y -> x + y) 4 5;;
(* explicit parenthesis *)
(((fun x -> fun y -> x + y) 4) 5);;
((fun y -> 4 + y) 5);;
(4 + 5);;

(* higher order functions *)
let apply f x -> f x 4;;
let h x y = x + y;;
let h = fun x -> fun y -> x + y;;

apply h 4;; (*8*)
(* substitute apply with it's definition *)
(* apply = fun f -> fun x -> f x 4 *)
(((fun f -> fun x -> f x 4) h) 4);;
(* subitute inputs to anon functions *)
((fun x -> h x 4) 4);;
h 4 4;;
(* sub in h's definition *)
(* h = fun x -> fun y -> x + y *)
((fun x -> fun y -> x + y) 4) 4;;
(* sub in inputs *)
((fun y -> 4 + y) 4);;
4 + 4;;
8;;

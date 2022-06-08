(* let definitions let us bind values to variables *)
let x = 3;;
let y = 5;;
print_int x + y;;
(* this is only really useful at top-level OCaml afaik *)

(* let expressions bind local variables to values to be used in later expressions *)
let x = 3 in x + 4;;

(* let expressions are expressions *)
if (let x = 3 in x > 4) then true else false;;

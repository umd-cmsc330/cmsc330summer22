(* here is an if expression *)
if 3 > 4 then 4 else 5

(* it's return type is the 
type of it's branch expressions *)

if 3 > 4 then 4.3 else 4.2
(* this is a float expression *)

if 3 > 4 then true else false
(* this is a bool expression *)

(* the syntax is 
  (if e1:bool then e2:t else e3:t):t
*)

(* any valid bool expression can be 
substituted for e1 *)
if (if 3>4 then true else false ) then 4 else 5

(* any valid expression can be 
substituted for e2 and e3 as long 
as it's the same type *)
if (if 3>4 then true else false ) then (if false then 1 else 2) else (if true then 4 else 6)

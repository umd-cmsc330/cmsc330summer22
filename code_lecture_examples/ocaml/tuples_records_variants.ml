(* tuples are a conjunction of values *)
(2,3);;

(* they have types *)
(* are not the same type *)
(2,3) (* int * int *)
(2,3,4) (* int * int * int *)

(* can be heterogenous *)
( 2,3.4,"hello") (* int * float * string *)

(* records allowed for named values *)
type date = {month:string;day:int;year:int}
let leap = {month="Feb";year=2020;day=29;}
print_string leap.month


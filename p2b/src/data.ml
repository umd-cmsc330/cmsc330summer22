open Funs

(*************************************)
(* Part 2: Three-Way Search Tree *)
(*************************************)

type int_tree =
  | IntLeaf
  | IntNode of int * int option * int_tree * int_tree * int_tree 

let empty_int_tree = IntLeaf

let rec int_insert x t =
  failwith "unimplemented"

let rec int_mem x t =
  failwith "unimplemented"

let rec int_size t =
  failwith "unimplemented"

let rec int_max t =
  failwith "unimplemented"

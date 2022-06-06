type int_tree =
  | IntLeaf
  | IntNode of int * int option * int_tree * int_tree * int_tree 
val empty_int_tree: int_tree
val int_insert: int -> int_tree -> int_tree
val int_mem: int -> int_tree -> bool
val int_size: int_tree -> int
val int_max: int_tree -> int

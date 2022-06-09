val addtups : (int * int) list -> int -> int list
type model = Attacker | Battler | Scanner | Operator
type android = {
  modeltype : model;
  modelnumber : int;
  blackboxactivated : bool;
  location : string;
}
val name : android -> string
val getmodeltype : string -> model
val rogue : android -> bool
val check_androids : android list -> string list -> string list
val deploy : android -> string -> android

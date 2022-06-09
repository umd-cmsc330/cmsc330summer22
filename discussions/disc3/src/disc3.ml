(***********************************)
(* Warm-up *)
(***********************************)

let rec addtups lst n = failwith "unimplemented"

(***********************************)
(* Types and Records *)
(***********************************)

type model = Attacker|Battler|Scanner|Operator
  
type android = {
  modeltype: model;
  modelnumber: int;
  blackboxactivated: bool;
  location: string;
}

let name (andr:android) : string = failwith "unimplemented"

let getmodeltype (name:string) : model = failwith "unimplemented"

let rogue (andr:android) : bool = failwith "unimplemented"

let rec check_androids (andrlst:android list) acc : string list = failwith "unimplemented"

let rec deploy (andr:android) target : android = failwith "unimplemented"

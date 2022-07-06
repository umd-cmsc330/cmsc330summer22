(***********************************)
(* Warm-up *)
(***********************************)

let rec addtups lst n = match lst with
|(a,b)::t -> (a+b)*n::addtups t n
|[] -> []

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

let name (andr:android) : string = match andr.modeltype with
  |Attacker -> "A" ^ string_of_int andr.modelnumber
  |Battler -> string_of_int andr.modelnumber ^ "B"
  |Scanner -> string_of_int andr.modelnumber ^ "S"
  |Operator -> string_of_int andr.modelnumber ^ "O"
  |_ -> failwith "matches none"

let getmodeltype (name:string) : model = 
  if String.contains name 'A' then Attacker
  else if String.contains name 'B' then Battler
  else if String.contains name 'S' then Scanner
  else Operator 

let rogue (andr:android) : bool = 
  if not andr.blackboxactivated && andr.location = "Unknown" then true else false

let rec check_androids (andrlst:android list) acc : string list =  match andrlst with
  |h::t -> if rogue h then (name h)::check_androids t acc else check_androids t acc
  |[] -> acc 

let rec deploy (andr:android) target : android = match andr with 
 |{modeltype=mode;modelnumber=num;blackboxactivated=active;location=loc} ->
  if active && loc != "Unknown" then {modeltype=mode;modelnumber=num;blackboxactivated=active;location=target}
  else failwith "invalid deploy"

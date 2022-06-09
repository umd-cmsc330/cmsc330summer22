

# Discussion 3: More OCaml


Due: June 9, 2021 at 11:59 PM

Points: 100 public

## Getting the Discussion
To download the discussion, go to the cloned repo in your terminal and run `git pull`.  This will download the files for this project and update your cloned repository.

## Submitting

You will submit this the same way you submitted other projects: by running `gradescope-submit` in the `disc3` folder.  If you are unable to get this to work, you can just submit the files in the src/ directory manually to the assignment on Gradescope.

## Functions To Do (Graded)
### Warm-up

#### `addtups lst n`
- **Type:** `'(int * int) list-> int -> int list`
- **Description:** Takes in a list of int tuples of size 2 and returns an int list where the elements are the sums of each tuple multiplied by `n`.
- **Examples:**
```ocaml
addtups [(1,2);(3,4)] 2 = [6;14]
(*
first element is 2*(1+2)
second element is  2*(3+4)
*)
```

### Records and Types
```ocaml
type model = Attacker|Battler|Scanner|Operator

type android =  {
  modeltype: model;
  modelnumber: int;
  blackboxactivated: bool;
  location: string;
};;

let two_b = 
  {modeltype = Battler; modelnumber = 2; blackboxactivated = true;
   location = "City Ruins"};;
             
let nine_s =
  {modeltype = Scanner; modelnumber = 9; blackboxactivated = true;
   location = "City Ruins"};;
   
let a_two =
  {modeltype = Attacker; modelnumber = 2; blackboxactivated = false;
   location = "Unknown"};;
   
let six_O =
  {modeltype = Operator; modelnumber = 6; blackboxactivated = true;
   location = "Bunker"};;
          
let list_of_androids = [two_b;nine_s;a_two];;
let team1 = [two_b;nine_s]
```
#### `name andr`
- **Type:** `android -> string`
- **Description:** Android names are defined by the first letter in their model type capitalized and their model number. If the android is a Attack type then the number comes after the letter. Otherwise, Android names are their model number first then their model type letter capitalized.
- **Examples:**
```ocaml
name two_b = "2B"
name a_two = "A2"
```
#### `getmodeltype name` 
- **Type:** `string -> model`
- **Description:** Given an android name (as defined above) return its model type. _`contains` from the String library can be useful here._ 
- **Examples:**
```ocaml
getmodeltype "9S" = Scanner
getmodeltype "6O" = Operator
```
#### `rogue andr`
- **Type:** `android -> bool`
- **Description:** A Rogue android is defined as having their blackbox set to `false` and their location being `"Unknown"`. Return true if the android is rogue, false otherwise.
- **Examples:**
```ocaml
rogue two_b = false
rogue a_two = true
```

#### `check_androids andrlst acc` 
- **Type:** `android list -> string list ->  string list`
- **Description:** Given a list of androids return a list of all the rogue androids. _acc is used as an accumulator to add all the rogue androids to. acc should always be []_
- **Examples:**
```ocaml
check_androids list_of_androids [] = ["A2"] 
```

#### `deploy andr target`
- **Type:** `android list -> string -> android list`
- **Description:** Given an android and a target location, return the android with their locations changed to `target`.  Rogue androids can not have their locations changed, so if the android is rogue return `failwith "invalid deploy"`
- **Examples:**
```ocaml
deploy two_b "Desert" = {modeltype = Battler; modelnumber = 2; blackboxactivated = true;  location = "Desert"}

deploy a_two "Desert" = Exception: (Failure "invalid deploy")
```

## Anonymous Functions (Not Graded)
Definition: Functions that aren't tied to a name.  

Normally we define a function such as:
```ocaml
let f x = x + 1
```
where `f` is a function that takes in an int and returns that int plus 1    

With anonymous functions:
```ocaml
fun x -> x + 1
```
Here the `fun` keyword tells us that the following will be an anonymous function.  We can evaluate these type of functions like so:
```ocaml
(fun x -> x + 1) 5 = 6
```
#### Use Cases:
- higher-order programming
- Map and Fold 
- lambda expressions and lambda calculus (later in course)

### More Examples:
``` ocaml 
(fun x y -> if x > y then x else y) 1 2
```
Takes in two ints and returns the greater one
``` ocaml 
(fun lst -> match lst with
|h::t -> [h]
|[] -> []) [1;2;3;4] = [1]
```
Can use match statements inside. Takes in a list and returns the first value as a list

``` ocaml 
(fun tup -> let (a,b) = tup in
(a+b,a*b)) (3,5) = (8,15)
```
Can have a let statement inside to work with tuples

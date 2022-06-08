let length lst = match lst with 
[] -> 0 (* empty list *)
|a::[] -> 1 (* a list in the form a::[] or a list of size 1 *)
|a::b::[] -> 2 (* a list in the form a::b::[] or a list of size 2 *)
|a::b -> 1 + (length b) (* a list of at least 1 element where a is the the head and b is the tail *)
|_ -> -1;;

(* alternative way to write length *)
let length2 lst = match lst with
[]-> 0 
|_::t -> 1 + (length2 t);;

(* match expressions are expressions *)
if (match [1;2;3] with [] -> false |h::t -> true) then 4 else 5;;

(* can pattern match tuples, records, variants *)
  type color_value = Red of int |Blue of int |Green of int;;
  type color = color_value * color_value * color_value;;

  (* use pattern matching on ints to convert to A-F *)
  let hex_of_digit x = 
  match x  with 
  10 -> "A"
  |11 -> "B"
  |12 -> "C"
  |13 -> "D"
  |14 -> "E"
  |15 -> "F"
  |v -> string_of_int v;;

  (* recall our conversion of number bases from 250 *)
  let hex_of_dec x = hex_of_digit (x/16) ^ hex_of_digit (x mod 16)

  (* convert rgb to hex. any other is not a valid color format *)
  let to_hex c = match c with 
  (Red r, Green g, Blue b) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  _ -> "Wrong color format"

  to_hex (Red(255),Green(0),Blue(190));; (* FF00BE *)
  to_hex (Green(255),Red(0),Blue(190));; (* Wrong color Format*)

  (* could modify our color format acceptance *)
  let to_hex2 c = match c with 
  (* recall combinatorics: 3! *)
  (Red r, Green g, Blue b) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  (Red r, Blue b, Green g) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  (Green g, Red r, Blue b) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  (Green g, Blue b, Red r) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  (Blue b, Red r, Green g) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  (Blue b, Green g, Red r) -> (hex_of_dec r) ^ (hex_of_dec g) ^ (hex_of_dec b)
  _ -> "Wrong color format"

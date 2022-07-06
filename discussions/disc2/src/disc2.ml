let ispos n = if n > 0 then "positive" else if n < 0 then "negative" else "zero"

let fizzbuzz n = 
  if n mod 15 = 0 then "fizz buzz"
  else if n mod 3 = 0 then "fizz"
  else if n mod 5 = 0 then "buzz"
  else ""

let isdivisible n1 n2 = if n1 mod n2 = 0 then true else false

let rec size lst = match lst with
  |h::t -> 1 + size t
  |[] -> 0

let rec sum lst = failwith "unimplemented"

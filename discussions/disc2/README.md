

# Discussion 2: Intro to OCaml


Due: June 6, 2021 at 11:59 PM

Points: 100 public

## Getting the Discussion
To download the discussion, go to the cloned repo in your terminal and run `git pull`.  This will download the files for this project and update your cloned repository.

## Submitting

You will submit this the same way you submitted other projects: by running `gradescope-submit` in the `disc2` folder.  If you are unable to get this to work, you can just submit the files in the src/ directory manually to the assignment on Gradescope.

## Basic Functions (GRADED)

#### `ispos n`

- **Type**: `int -> string`
- **Description**:  Given an integer, return whether the number is positive, negative, or zero. 
- **Examples**:
```ocaml
ispos 1 = "positive"
ispos 2 = "positive"
ispos (-1) = "negative"
ispos 0 = "zero"
```
#### `fizzbuzz n`
- **Type:** `int -> string`
- **Description**: Similar to the common fizz buzz problem, return "fizz buzz" if a number is divisible by 15, "fizz" if a number is divisible by 3, and "buzz" if a number is divisible by 5. Return the empty string if a number isn't divisible by any. 
- **Examples**:
```ocaml
fizzbuzz 15 = "fizz buzz"
fizzbuzz 4 = ""
fizzbuzz 25 = "buzz"
fizzbuzz 30 = "fizz buzz"
fizzbuzz 9 = "fizz"
```

#### `isdivisible n1 n2`
- **Type:** `int -> int -> bool`
- **Description**: Returns true if n1 is divisible by n2. False otherwise.
- **Examples**:
```ocaml
isdivisible 6 3 = true
isdivisible 15 5 = true
isdivisible 4 11 = false
isdivisible 1 20 = false
```

#### `size lst`
- **Type**: `int list -> int`
- **Description**: Given a list of integers return the size of the list
- **Examples**:
```ocaml
size [1;2;3;4] = 4
size [6;41;7;3;27] = 5
size [] = 0
```

#### `sum lst`
- **Type:** `int list -> int`
- **Description**: Recursively find the sum of a list of numbers. If the list is empty return 0.
- **Examples**:
```ocaml
sum [1;2;3;4] = 10
sum [6;41;7;3;27] = 84
sum [] = 0
```


## Part 2: Quiz #1 In Discussion (Optional)
Choose one:
1. Have 20 minutes in class to do quiz then do p2a part 1
2. Do p2a part 1 and give 20 minute back to students

## Part 3: Project 2a Part 1
Implement the following functions that do not require recursion. Accordingly, these functions are defined without the `rec` keyword, but **you MAY add the `rec` keyword to any of the following functions or write a recursive helper function**. Just remember that if you write a helper function, it must be defined in the file before it is called.

#### `rev_tup tup`

- **Type**: `'a * 'b * 'c -> 'c * 'b * 'a`
- **Description**: Returns a 3-tuple in the reverse order of `tup`.
- **Examples**:
   ```ocaml
   rev_tup (1, 2, 3) = (3, 2, 1)
   rev_tup (1, 1, 1) = (1, 1, 1)
   rev_tup ("a", 1, "c") = ("c", 1, "a")
   ```

#### `is_odd x`

- **Type**: `int -> bool`
- **Description**: Returns whether or not `x` is odd.
- **Examples**:
  ```ocaml
  is_odd 1 = true
  is_odd 4 = false
  is_odd (-5) = true
  ```

#### `area p q`

- **Type**: `int * int -> int * int -> int`
- **Description**: Takes in the Cartesian coordinates (2-dimensional) of any pair of opposite corners of a rectangle and returns the area of the rectangle. The sides of the rectangle are parallel to the axes.
- **Examples**:
  ```ocaml
  area (1, 1) (2, 2) = 1
  area (2, 2) (1, 1) = 1
  area (2, 1) (1, 2) = 1
  area (0, 1) (2, 3) = 4
  area (1, 1) (1, 1) = 0
  area ((-1), (-1)) (1, 1) = 4
  ```

#### `volume x y`

- **Type**: `int * int * int -> int * int * int -> int`
- **Description**: Takes in the Cartesian coordinates (3-dimensional) of two opposite corners of a rectangular prism and returns its volume. The sides of the rectangular prism are parallel to the axes.
- **Examples**:
  ```ocaml
  volume (1, 1, 1) (2, 2, 2) = 1
  volume (2, 2, 2) (1, 1, 1) = 1
  volume (0, 1, 2) (2, 3, 5) = 12
  volume (1, 1, 1) (1, 1, 1) = 0
  volume ((-1), (-1), (-1)) (1, 1, 1) = 8
  ```

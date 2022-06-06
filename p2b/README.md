# Project 2b: OCaml Higher Order Functions and Data

Due: June 13, 2022 at 11:59 PM (late June 14, *10% penalty*)

Points: 65 public, 35 semipublic

**This is an individual assignment. You must work on this project alone.**

# Overview

The goal of this project is to increase your familiarity with programming in OCaml and give you practice using higher order functions and user-defined types. You will have to write a number of small functions, the specifications of which are given below.

## Ground Rules

In addition to writing your own code, you may use library functions found in the [`Stdlib` module](https://caml.inria.fr/pub/docs/manual-ocaml/libref/Stdlib.html) and the functions provided in `funs.ml`. You **may not** (under threat of a grading penalty) use the `List` module, any submodules of `Stdlib` (such as `Hashtbl`, `Set`, etc.), or any imperative features of OCaml (e.g., mutable references and arrays). You *are allowed* to use the `@` (list append) operator.

## Testing & Submitting

Submit by running `gradescope-submit`.  ALternatively, upload **higher.ml** and **data.ml** to the assignment on gradescope.com.

To test locally, run `dune runtest -f`. Besides the provided public tests, you will also find the file **student.ml** on `test/student/`, where you'll be able to add OUnit tests of your own. More detailed information about writing tests can be found [here](https://www.youtube.com/watch?v=C36JnAcClOQ). Here are the timestamps for the topics covered in the video:

- Installing necessary software: [00:46](https://www.youtube.com/watch?v=C36JnAcClOQ&t=46s)
- How to build and test: [01:14](https://www.youtube.com/watch?v=C36JnAcClOQ&t=74s)
- List all available tests: [04:40](https://www.youtube.com/watch?v=C36JnAcClOQ&t=280s)
- Running a specific test: [05:05](https://www.youtube.com/watch?v=C36JnAcClOQ&t=305s)
- Testing inside of utop: [09:00](https://www.youtube.com/watch?v=C36JnAcClOQ&t=540s)
- Understanding test cases: [16:00](https://www.youtube.com/watch?v=C36JnAcClOQ&t=960s)
- Writing your own test cases: [19:20](https://www.youtube.com/watch?v=C36JnAcClOQ&t=1160s)

You can interactively test your code by doing `dune utop src`, which will include your source files. (As usual, all of your commands in `utop` need to end with two semicolons (i.e. `;;`), otherwise it will appear that your terminal is hanging.)

### Property-based Tests

This project also includes [Property-based tests](https://www.youtube.com/watch?v=AfaNEebCDos) (PBT) for you to use. Property based testing enables pretty good test coverage without having to write a lot of individual tests. In particular, you specify a **property** that your code should have on many possible inputs, not just a particular one, and the property tester will generate lots of random inputs against which to test the property.

The property-based tests (PBTs) we've provided are not meant to test your code entirely, but rather to give you a little help. You should still write your own tests. You can write typical unit tests (and/or test using `utop` or the `ocaml` top level), or if you like you can write more PBTs. You can find the provided PBTs in `test/pbt`, along with comments and instructions on how to expand them. We'll cover PBTs in more detail later in the class, so don't feel obligated to play with these now.

## Notes

* In this project, we've changed the way we give you examples. Instead of giving you example cases and expected output, we've given you OCaml code that you run in `utop` ot the `ocaml` top level. Make sure to ignore any failures when running examples for code where order of the result doesn't matter.
* Some of the examples given use `OUnit2.assert_raises` to handle exceptions and failures. While the normal `assert` works fine in `utop`, `assert_raises` requires the `OUnit2` module to be opened.
* Unlike most other languages, `=` in OCaml is the operator for structural equality whereas `==` is the operator for physical equality. All functions in this project (and in this class, unless ever specified otherwise) are concerned with structural equality.
* At a few points in this project, you will need to raise an `Invalid_argument` exception. Use the `invalid_arg` function to do so:
  ```ocaml
  invalid_arg "something went wrong"
  ```
  Use the error message that the function specifies as the argument.

# Part 1: Higher Order Functions

Write the following functions in `higher.ml` using `map`, `fold`, or `fold_right` as defined in the file `funs.ml`. You **must** use `map`, `fold`, or `fold_right` to complete these functions, so no functions in `higher.ml` should be defined using the `rec` keyword. You will lose points if this rule is not followed. Use the other provided functions in `funs.ml` to make completing the functions easier.

Some of these functions will require just map or fold, but some will require a combination of the two. The map/reduce design pattern may come in handy: Map over a list to convert it to a new list which you then process a second time using fold. The idea is that you first process the list using map, and then reduce the resulting list using fold.

#### `contains_elem lst e`

- **Type**: `'a list -> 'a -> bool`
- **Description**: Returns `true` if `e` is present in the list `lst`, and `false` if it is not.
- **Examples**:
  ```ocaml
  assert(contains_elem [] 1 = false);;
  assert(contains_elem [1;2;3] 4 = false);;
  assert(contains_elem [1;2;3;3;2;4] 2 = true);;
  ```

#### `is_present lst x`

- **Type**: `'a list -> 'a -> int list`
- **Description**: Returns a list of the same length as `lst` which has a `1` at each position in which the corresponding position in `lst` is equal to `x`, and a `0` otherwise.
- **Examples**:
  ```ocaml
  assert(is_present [1;2;3] 1 = [1;0;0]);;
  assert(is_present [1;1;0] 0 = [0;0;1]);;
  assert(is_present [2;0;2] 2 = [1;0;1]);;
  ```

#### `count_occ lst target`

- **Type**: `'a list -> 'a -> int`
- **Description**: Returns how many elements in `lst` are equal to `target`.
- **Examples**:
  ```ocaml
  assert(count_occ [] 1 = 0);;
  assert(count_occ [1] 1 = 1);;
  assert(count_occ [1; 2; 2; 1; 3] 1 = 2);;
  ```

#### `uniq lst`

- **Type**: `'a list -> 'a list`
- **Description**: Given a list, returns a list with all duplicate elements removed. *Order does not matter, in the output list.*
- **Examples**:
  ```ocaml
  assert(uniq [] = []);;
  assert(uniq [1] = [1]);;
  assert(uniq [1; 2; 2; 1; 3] = [2; 1; 3]);;
  ```

#### `assoc_list lst`

- **Type**: `'a list -> ('a * int) list`
- **Description**: Given a list, returns a list of pairs where the first integer represents the element of the list and the second integer represents the number of occurrences of that element in the list. This associative list should not contain duplicates. *Order does not matter, in the output list.*
- **Examples**:
  ```ocaml
  assert(assoc_list [] = []);;
  assert(assoc_list [1] = [(1,1)]);;
  assert(assoc_list [1; 2; 2; 1; 3] = [(1, 2); (2, 2); (3, 1)]);;
  ```

#### `ap fns args`

- **Type**: `('a -> 'b) list -> 'a list -> 'b list`
- **Description**: Applies each function in `fns` to each argument in `args` in order, collecting all results in a single list.
- **Examples**:
  ```ocaml
  assert(ap [] [1;2;3;4] = []);;
  assert(ap [succ] [] = []);;
  assert(ap [(fun x -> x^"?"); (fun x -> x^"!")] ["foo";"bar"] = ["foo?";"bar?";"foo!";"bar!"]);;
  assert(ap [pred;succ] [1;2] = [0;1;2;3]);;
  assert(ap [int_of_float;fun x -> (int_of_float x)*2] [1.0;2.0;3.0] = [1; 2; 3; 2; 4; 6]);;
  ```

(Here, `succ`, `pred`, and `int_of_float` are standard library functions. The `(^)` function is string concatenation.) 

# Part 2: Three-Way Search Tree

Solutions to the problems in this section should be implemented in `data.ml`.

Here, you will write functions that will operate on a 3-Way Search Tree (3WST). Here is an example of a 3WST, and its type definition `int_tree` follows.

![hey there!](./3WST.png)

```ocaml
type int_tree =
  | IntLeaf
  | IntNode of int * int option * int_tree * int_tree * int_tree 

let empty_int_tree = IntLeaf
```
According to this definition, an ``int_tree`` is either: empty (just a leaf `IntLeaf`), or a node `IntNode` containing 2 integers and three branches. The first integer is sure to be there, but the second may not be -- it's a `int option`. When both integers are present (i.e., the second is `Some x` for some `x`), the left integer must be strictly smaller than the right integer. When only the one integer is present, all branches should be `IntLeaf`. When both integers are present, the the first branch is an `int_tree` containing integers that are strictly smaller than the first integer; the second branch consists an `int_tree` of integers in between the first and second integer, and the third is an `int_tree` with integers strictly larger than the second integer. A consequence of these invariants is that a `int_tree` may not contain duplicate integers.

Stepping back, this is similar to a binary search tree (BST), almost like two BSTs smushed together. 

#### `int_insert x t`

As is typical in OCaml, 3WSTs are immutable: Once created a `int_tree` value cannot be changed. To insert an element into a tree, create a *new* tree that has the same contents as the old, but with the new element added. 

- **Type**: `int -> int_tree -> int_tree`
- **Description**: Given an integer `x` and a 3WST `t`, this function should return the 3WST that results from inserting `x` in `t`. If `x` is already present in `t`, then `t` will be returned unchanged.
- **Hint**: When `t` is a node with only one integer, adding to that node means returning a node in which the second integer is non-`None`: If the integer you are adding is less than the current integer, the new node will put the old integer second, and the new one first.
- **Examples**:
  ```ocaml
  let t0 = int_insert 5 IntLeaf;;
  let t1 = int_insert 5 t0;;
  let t2 = int_insert 1 t1;;
  let t3 = int_insert 6 t2;;
  let t4 = int_insert 0 t3;;
  
  assert(t0 = IntNode (5, None, IntLeaf, IntLeaf, IntLeaf));;
  assert(t1 = IntNode (5, None, IntLeaf, IntLeaf, IntLeaf));;
  assert(t2 = IntNode (1, Some 5, IntLeaf, IntLeaf, IntLeaf));;
  assert(t3 = IntNode (1, Some 5, IntLeaf, IntLeaf, IntNode(6, None, IntLeaf, IntLeaf, IntLeaf)));;
  assert(t4 = IntNode (1, Some 5, IntNode(0, None, IntLeaf, IntLeaf, IntLeaf), IntLeaf, IntNode(6, None, IntLeaf, IntLeaf, IntLeaf)));;
  ```

#### `int_mem x t`

- **Type**: `int -> int_tree -> bool`
- **Description**: Given an integer `x` and an int tree `t`, this function should return true if `x` can be found as the data in any node of `t` and false otherwise.

- **Examples (Using t4 above)**:
  ```ocaml
  assert(int_mem 5 t4 = true);;
  assert(int_mem 10 t4 = false);;
  ```
#### `int_size t`

- **Type**: `int_tree -> int`
- **Description**: Returns the number of values in the nodes int tree `t`. A node with 2 integers is counted as size 2.
- **Examples**:
  ```ocaml
  assert(int_size empty_int_tree = 0);;
  assert(int_size t4 = 4);;
  ```

#### `int_max t`

- **Type**: `int_tree -> int`
- **Description**: Returns the maximum element in tree `t`. Raises exception `Invalid_argument("int_max")` on an empty tree. This function should be O(height of the tree).
- **Examples**:
  ```ocaml
  assert(int_max t4 = 6);;
  ```
[wikipedia inorder traversal]: https://en.wikipedia.org/wiki/Tree_traversal#In-order
[block scope]: https://www.geeksforgeeks.org/scope-rules-in-c/

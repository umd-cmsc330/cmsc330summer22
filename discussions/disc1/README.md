
# Project 1a: Ruby Warmup


Due: February 2, 2021 at 11:59 PM (late February 3, *10% penalty*). **Note the deadline: just over one week**

Due: Thursday, June 2nd 11:59pm (**No Late Submissions**)


Points: 96 public, 4 semipublic


**This is an individual assignment. You must work on this project alone.**

## Before You Start

**If you have not yet completed [project 0](../project0), you should do so before starting this project.**  At the very least, you should have everything related to Ruby installed correctly.  If you have any trouble with installation, check Piazza (or create a post if you don't find your problem there), or come to office hours to get help from a TA.

## Before You Start

**If you have not yet completed project 0, you should do so before starting this discussion.  Ask your discussion leader for help if needed.**


## Introduction
This project aims to give you some experience with basic Ruby functionality, including using basic data types (integers, strings), collections (arrays and hashes), and classes. You will also become familiar with Ruby's basic control constructs for looping and conditional execution, and how to run Ruby unit tests.

## Getting New Projects
You should have cloned the repository in project 0.  To download new projects (such as this one), go to the cloned repo in your terminal and run `git pull`.  This will download the files for this project and update your cloned repository.

## Submitting

You will submit this the same way you submitted project 0: by running `gradescope-submit` in the `project1a` folder.  If you are unable to get this to work, you can just submit both files in the src/ directory manually to the assignment on Gradescope.

You will submit this the same way you will submit all your other projects: by running `gradescope-submit` in your current working folder.  If you are unable to get this to work, you can just submit `warmup.rb` manually to the assignment on Gradescope.


## A Note on Types
Ruby has no built-in way to restrict the types passed to methods. As such, all method types specified in this document are the only ones you need to handle. You may assume that no arguments will be passed outside of the types we specify, and your program may do anything in cases where improperly typed arguments are passed. This is undefined behavior for this program and **will not be tested**.

The expected types will be represented in the following format at the beginning of each section:

```ruby
(String) -> Array or nil
```

The left-hand side of the arrow specifies the parameter types, and the right-hand side specifies the return type. This example describes a method that takes a single `String` as an argument and either returns an `Array` or `nil`. When implementing a method with this signature, you may assume that a `String` will be passed in and you are responsible for ensuring that *only* a `Array` or `nil` is returned. (Since Ruby is object oriented, the signature also means that a subclass of `String` could be passed in, and that a subclass of `Array` could be returned.)

**Note**: Some shorthand is used to avoid verbosity in type siguatures; namely:
- `Integer` is used to refer to either `Fixnum` or `Bignum` (i.e., we can think of `Integer` as a superclass of these two).
- `Bool` is used to refer to the either `TrueClass` or `FalseClass`.
- `nil` is used to refer to `NilClass`.

# Part 1:Warm-up (Graded)
Implement part 1 in `warmup.rb`. Each of the methods you must implement are described below. We provide you with the signature of each method and a description of its required behavior. For some methods, we state assumptions that you can make about the input. In these cases, it doesn't matter what your code does if the assumption isn't met, since we will never run a test case that contradicts the assumption.

**This part of the discussion will be graded!!!**

#### `fib(n)`
- **Description**: Returns the first `n` [fibonacci numbers](https://www.mathsisfun.com/numbers/fibonacci-sequence.html#:~:text=Here%20is%20a%20longer%20list,196418%2C%20317811%2C%20...).
- **Type**: `(Integer) -> Array`
- **Assumptions**: `n` is non-negative.
- **Examples**:
  ```ruby
  fib(0) == []
  fib(1) == [0]
  fib(2) == [0, 1]
  fib(3) == [0, 1, 1]
  fib(10) == [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
  ```

#### `isPalindrome(n)`
- **Description**: Returns `true` if `n` is a palindrome and `false` otherwise. A palindrome is the same read forward and backward.
- **Type**: `(Integer) -> Bool`
- **Assumptions**: `n` is non-negative; `n` will not be provided with any leading 0s.
- **Hint**: It may be easier to do this after converting the provided integer to a String.
- **Examples**:
  ```ruby
  isPalindrome(0) == true
  isPalindrom(1) == true
  isPalindrome(10) == false
  isPalindrome(101) == true
  isPalindrome(120210) == false
  ```

#### `nthmax(n, a)`
- **Description**: Returns the `n`th largest value in the array `a` or `nil` if it does not exist. That the largest value is specified using n = 0.
- **Type**: `(Integer, Array) -> Integer or nil`
- **Assumptions**: `n` is non-negative.
- **Examples**:
  ```ruby
  nthmax(0, [1,2,3,0]) == 3
  nthmax(1, [3,2,1,0]) == 2
  nthmax(2, [7,3,4,5]) == 4
  nthmax(5, [1,2,3]) == nil
  ```

#### `freq(s)`
- **Description**: Returns a one-character string containing the character that occurs with the highest frequency within 's'. If `s` has no characters, it should return the empty string.
- **Type**: `(String) -> String`
- **Assumptions**: Only one character will have the highest frequency (i.e. there will be no "ties").
- **Examples**:
  ```ruby
  freq("") == ""
  freq("aaabb") == "a"
  freq("bbaaa") == "a"
  freq("ssabcd") == "s"
  freq("a12xxxxxyyyxyxyxy") == "x"
  ```

#### `zipHash(arr1, arr2)`
- **Description**: Returns a hash that maps corresponding elements in `arr1` and `arr2`, i.e., `arr1[i]` maps to `arr2[i]`, for all i. If the two arrays are not the same length, return `nil`.
- **Type**: `(Array, Array) -> Hash or nil`
- **Examples**:
  ```ruby
  zipHash([], []) == {}
  zipHash([1], [2]) == {1 => 2}
  zipHash([1, 5], [2, 4]) == {1 => 2, 5 => 4}
  zipHash([1], [2, 3]) == nil
  zipHash(["Mamat", "Hicks", "Vinnie"], ["prof", "prof", "TA"]) == {"Mamat" => "prof", "Hicks" => "prof", "Vinnie" => "TA"}
  ```

#### `hashToArray(hash)`
- **Description**: Returns an array of arrays; each element of the returned array is a two-element array where the first item is a key from the hash and the second item is its corresponding value. The entries in the returned array must be sorted in the same order as they appear in `hash.keys`.
- **Type**: `(Hash) -> Array`
- **Examples**:
  ```ruby
  hashToArray({}) == []
  hashToArray({"a" => "b"}) == [["a", "b"]]
  hashToArray({"a" => "b", 1 => 2}) == [["a", "b"], [1, 2]]
  hashToArray({"x" => "v", "y" => "w", "z" => "u"}) == [["x", "v"], ["y", "w"], ["z", "u"]]
  ```

# Part 2:PhoneBook class (NOT GRADED)
In part 2, we will be partially implementing a PhoneBook class. For this class, we will be reading in a file that has the name of a person and a phone number that is separated by a comma and then a space.  Store this into a data structure. Valid phone number entries will be in the format ``` NNN-NNN-NNNN```. Where N are integer numbers. Valid names start with one capital letter followed by at least 1 lower case letter . For example, valid entries would be:
```
John, 111-111-1111
Leo, 111-222-2222
Sally, 123-456-7890
Bob, 745-231-3486
```
Invalid Lines would look like.
```
john, 111-111-1111
Leo, 111 222-2222
Sally,123-456-7890
Bob, (745)-231-3486
```
You can skip over any invalid lines. 
You can use any data structure to implement the PhoneBook.

- **Type**: `(String, String, Bool) -> Bool`
- **Assumptions**: No phone number will start with 0.
- **Examples**:


#### `initialize(filename)`
- **Description**: This is the constructor. You should initialize the fields that you think your class needs for successful evaluation of the remaining methods.  Then you need to read the file and store the needed values into your data structure.


#### `lookup(name)`
- **Description**: Looks up `name` in the `PhoneBook` and returns the corresponding phone number in the format `NNN-NNN-NNNN`. Otherwise, return `nil`.
- **Type**: `(String) -> String or nil`
- **Examples**:
  ```ruby
  @phonebook = PhoneBook.new(filename)

  @phonebook.lookup("John") == "111-111-1111"
  @phonebook.lookup("Sally") == "123-456-7890"
  @phonebook.lookup("Bob") == "745-231-3486"
  @phonebook.lookup("Leo") == "111-222-2222"
  @phonebook.lookup("Ravi") == nil
  ```

#### `lookupByNum(num)`
- **Description**: Returns the name associated with a given number. Otherwise, return `nil`.
- **Type**: `(String) -> String or nil`
- **Examples**:
  ```ruby
  @phonebook = PhoneBook.new(filename)

  @phonebook.lookupByNum("111-111-1111") == "John"
  @phonebook.lookupByNum("123-456-7890") == "Sally"
  @phonebook.lookupByNum("745-231-3486") == "Bob"
  @phonebook.lookupByNum("111-222-2222") == "Leo"
  @phonebook.lookupByNum("410-124-1131") == nil
  ```

#### `namesByAc(areacode)`
- **Description**: Returns an array of all names in the `PhoneBook` who have phone numbers beginning with `areacode`.
- **Type**: `(String) -> Array`
- **Examples**:
  ```ruby
  @phonebook = PhoneBook.new(filename)

  @phonebook.namesByAc("111") == ["John","Leo"]
  @phonebook.namesByAc("123") == ["Sally"]
  @phonebook.namesByAc("222") == []

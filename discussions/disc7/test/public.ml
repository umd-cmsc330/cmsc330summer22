open OUnit2
open TestUtils
open Lexer
open Parser

let public_tests _ =
  let result1 = Plus (Int 1, Int 1) in
  let result2 = Plus (Int 3, Mult (Int 7, Plus (Int 6, Int (-6)))) in
  let result3 = Plus (Mult (Int 10, Mult (Int 10, Int 10)),
  Plus (Int 123, Mult (Int 4, Int 10))) in
  let result4 = Mult (Plus (Int 1, Int 2), Plus (Int 3, Int 4)) in
  let result5 = Plus (Plus (Int 1, Int 2), Plus (Int 3, Int 4)) in
  let student1 = "1+1" |> lexer |> parser in
  let student2 = "3+7*(6+-6)" |> lexer |> parser in
  let student3 = "10*10*10+123+4*10" |> lexer |> parser in
  let student4 = "(1+2)*(3+4)" |> lexer |> parser in
  let student5 = "(1+2)+(3+4)" |> lexer |> parser in

  assert_equal student1 result1
  assert_equal student2 result2
  assert_equal student3 result3
  assert_equal student4 result4
  assert_equal student5 result5
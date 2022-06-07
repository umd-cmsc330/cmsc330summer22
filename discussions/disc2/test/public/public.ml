open OUnit2
open Discussion2.Disc2

let test_ispos _ =
  assert_equal "positive" (ispos 150) ~msg:"ispos (150)";
  assert_equal "positive" (ispos 10) ~msg:"ispos (10)";
  assert_equal "negative" (ispos (-100)) ~msg:"ispos (-100)";
  assert_equal "negative" (ispos (-1)) ~msg:"ispos (-1)";
  assert_equal "zero" (ispos 0) ~msg:"ispos (0)"

let test_fizzbuzz _ =
  assert_equal "fizz buzz" (fizzbuzz 90) ~msg:"fizzbuzz (90)";
  assert_equal "fizz buzz" (fizzbuzz 150) ~msg:"fizzbuzz (150)";
  assert_equal "fizz" (fizzbuzz 9) ~msg:"fizzbuzz (9)";
  assert_equal "fizz" (fizzbuzz 27) ~msg:"fizzbuzz (27)";
  assert_equal "buzz" (fizzbuzz 20) ~msg:"fizzbuzz (20)";
  assert_equal "buzz" (fizzbuzz 65) ~msg:"fizzbuzz (65)";
  assert_equal "" (fizzbuzz 32) ~msg:"fizzbuzz (32)"
  
let test_isdivisible _ =
  assert_equal true (isdivisible 9 3) ~msg:"isdivisible 9 3";
  assert_equal true (isdivisible 100 10) ~msg:"isdivisible 100 10";
  assert_equal false (isdivisible 11 33) ~msg:"isdivisible 11 33";
  assert_equal false (isdivisible 1 40) ~msg:"isdivisible 1 40"

let test_size _ =
  assert_equal 5 (size [5;1;2;6;7]) ~msg:"size [5;1;2;6;7]";
  assert_equal 0 (size []) ~msg:"size []";
  assert_equal 7 (size [23;56;88;12;5;1;734]) ~msg:"size [23;56;88;12;5;1;734]";
  assert_equal 1 (size [1]) ~msg:"size [1]"

let test_sum _ = 
  assert_equal 10 (sum [1;2;3;4]) ~msg:"sum [1;2;3;4]";
  assert_equal 11 (sum [11]) ~msg:"sum [11]";
  assert_equal 0 (sum []) ~msg:"sum []";
  assert_equal (-5) (sum [13;5;-20; -3]) ~msg:"[13;5;-20; -3]";
  assert_equal (-11) (sum [45;123;-125;37;0;15;-6;-100]) ~msg:"[45;123;-125;37;0;15;-6;-100]"


let suite =
  "public" >::: [
    "ispos" >:: test_ispos;
    "fizzbuzz" >:: test_fizzbuzz;
    "isdivisible" >:: test_isdivisible;
    "size" >:: test_size;
    "sum" >:: test_sum;
  ]

let _ = run_test_tt_main suite
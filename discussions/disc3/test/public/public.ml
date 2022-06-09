open OUnit2
open Discussion3.Disc3

let two_b = 
  {modeltype = Battler; modelnumber = 2; blackboxactivated = true;
   location = "City Ruins"};;
             
let nine_s =
  {modeltype = Scanner; modelnumber = 9; blackboxactivated = true;
   location = "City Ruins"};;
   
let a_two =
  {modeltype = Attacker; modelnumber = 2; blackboxactivated = false;
   location = "Unknown"};;
   
let two_one_O =
  {modeltype = Operator; modelnumber = 21; blackboxactivated = true;
   location = "Bunker"};;
          
let list_of_androids = [two_b;nine_s;a_two;two_one_O];;
let team1 = [two_b;nine_s]

let test_addtups _ = 
  assert_equal [6;14] (addtups [(1,2);(3,4)] 2);
  assert_equal [9;21;33] (addtups [(1,2);(3,4);(5,6)] 3);
  assert_equal [150] (addtups [(10,20)] 5)

let test_android_name _ =
  assert_equal "A2" (name a_two);
  assert_equal "2B" (name two_b);
  assert_equal "9S" (name nine_s);
  assert_equal "21O" (name two_one_O)

let test_android_getmodeltype _ = 
  assert_equal Attacker (getmodeltype (name a_two));
  assert_equal Battler (getmodeltype (name two_b));
  assert_equal Scanner (getmodeltype (name nine_s));
  assert_equal Operator (getmodeltype (name two_one_O))

let test_android_rogue _ = 
  assert_equal true (rogue a_two);
  assert_equal false (rogue two_b);
  assert_equal false (rogue nine_s);
  assert_equal false (rogue two_one_O)

let test_android_check_androids _ =
  assert_equal [] (check_androids team1 []);
  assert_equal ["A2"] (check_androids list_of_androids [])

let test_android_target _ = 
  assert_equal {modeltype = Scanner; modelnumber = 9; blackboxactivated = true;
  location = "Bunker"} (deploy nine_s "Bunker");
  assert_equal {modeltype = Battler; modelnumber = 2; blackboxactivated = true;
  location = "!DECEASED!"} (deploy two_b "!DECEASED!");
  assert_equal {modeltype = Operator; modelnumber = 21; blackboxactivated = true;
  location = "Resource Recovery Unit"} (deploy two_one_O "Resource Recovery Unit")

let suite =
  "public" >::: [
    "addtups" >:: test_addtups;
    "android_name" >:: test_android_name;
    "android_getmodeltype" >:: test_android_getmodeltype;
    "android_rogue" >:: test_android_rogue;
    "android_check_androids" >:: test_android_check_androids;
    "android_target" >:: test_android_target;
  ]

let _ = run_test_tt_main suite
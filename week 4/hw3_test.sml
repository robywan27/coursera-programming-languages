use "hw3.sml";


(* Exercise 1 *)
val test_only_capitals = only_capitals ["crash", "Bob", "sml", "SML", "Berlin"] = ["Bob","SML","Berlin"]

										      
(* Exercise 2 *)
val test_longest_string1 = longest_string1 ["catarifrangente", "baobab", "beep", "supercalifragilisticexpialidocious"] = "supercalifragilisticexpialidocious"
val test_longest_string1_with_tie = longest_string1 ["baobab", "beep", "forest"] = "baobab"

										       
(* Exercise 3 *)
val test_longest_string2 = longest_string2 ["catarifrangente", "baobab", "beep", "supercalifragilisticexpialidocious"] = "supercalifragilisticexpialidocious"
val test_longest_string2_with_tie = longest_string2 ["baobab", "beep", "forest"] = "forest"

										       
(* Exercise 4 *)
val test_longest_string3 = longest_string3 ["catarifrangente", "baobab", "beep", "supercalifragilisticexpialidocious"] = "supercalifragilisticexpialidocious"
val test_longest_string3_with_tie = longest_string3 ["baobab", "beep", "forest"] = "baobab"

val test_longest_string4 = longest_string4 ["catarifrangente", "baobab", "beep", "supercalifragilisticexpialidocious"] = "supercalifragilisticexpialidocious"
val test_longest_string4_with_tie = longest_string4 ["baobab", "beep", "forest"] = "forest"

										       
(* Exercise 5 *)
val test_longest_capitalized = longest_capitalized ["Catarifrangente", "Baobab", "Beep", "supercalifragilisticexpialidocious"] = "Catarifrangente"
val test_longest_capitalized_with_tie = longest_capitalized ["Baobab", "Beep", "Forest"] = "Baobab"		     
										       

(* Exercise 6 *)
val test_rev_string = rev_string "goodbye" = "eybdoog"


(* Exercise 7 *)
val test_first_answer = first_answer (fn x => if x < 0 then NONE else SOME x) [~2, 3, 5, ~9, ~5, 11] = 3
(* val test_first_answer_exception = first_answer (fn x => if x < 0 then NONE else SOME x) [~2, ~9, ~5] *)

										       
(* Exercise 8 *)
val test_all_answers = all_answers (fn x => if x < 0 then NONE else SOME [0, 0]) [4, 15, 8] = SOME [0, 0, 0, 0, 0, 0]
val test_all_answers_none = all_answers (fn x => if x < 0 then NONE else SOME [0, 0]) [~2, 4, ~7, 15, 8] = NONE
val test_all_answers_empty_list = all_answers (fn x => if x < 0 then NONE else SOME [0, 0]) [] = SOME []

													    
(* Exercise 9 *)


										       
(* Exercise 10 *)


										       
(* Exercise 11 *)


										       
(* Exercise 12 *)

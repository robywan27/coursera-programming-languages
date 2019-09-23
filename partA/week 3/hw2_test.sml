use "hw2.sml";

(* Section 1 *)
(* Exercise a *)
val test_string_in_list = all_except_option ("find me", ["some text", "some other text", "find", "find me", "hola"]) = SOME ["some text","some other text","find","hola"]
val test_string_not_in_list = all_except_option ("find me", ["some text", "some other text", "find", "not here", "hola"]) = NONE


(* Section 2 *)
(* Exercise a *)
val test_black_color = card_color (Club, Num(3)) = Black
val test_red_color = card_color (Diamond, Queen) = Red

						     
(* Exercise b *)
val test_ace_value = card_value (Club, Ace) = 11
val test_king_value = card_value (Club, King) = 10
val test_queen_value = card_value (Heart, Queen) = 10
val test_jack_value = card_value (Club, Jack) = 10
val test_num_value = card_value (Heart, Num 3) = 3


(* Exercise c *)
val test_remove_card_in_deck = remove_card ([(Spade, Jack), (Heart, Num 2), (Diamond, Num 5), (Diamond, Num 7)], (Diamond, Num 5), IllegalMove) = [(Spade,Jack),(Heart,Num 2),(Diamond,Num 7)]

						   
(* Exercise d *)
val test_all_red = all_same_color [(Diamond, Jack), (Diamond, Ace), (Heart, Num 6)] = true
val test_all_black = all_same_color [(Club, Jack), (Spade, Ace), (Spade, Num 6)] = true
val test_mismatched_colors = all_same_color [(Diamond, Jack), (Club, Ace), (Heart, Num 6)] = false

											       
(* Exercise e *)
val test_sum_cards = sum_cards [(Diamond, Jack), (Spade, Num 7), (Club, Ace)] = 28

										  
(* Exercise f *)
val test_score_greater_than_goal = score ([(Club, Queen), (Diamond, Ace), (Spade, Num 5)], 20) = 18
val test_score_smaller_than_goal = score ([(Club, Queen), (Diamond, Ace), (Spade, Num 5)], 30) = 4
val test_score_same_color = score ([(Club, Queen), (Club, Ace), (Spade, Num 5)], 30) = 2


(* Exercise g *)
val test_no_moves = officiate ([(Spade, Num 4), (Diamond, Num 7)], [], 5) = 2
val test_no_more_moves = officiate ([(Spade, Num 7), (Diamond, Num 4)], [Draw], 5) = 3
val test_no_more_moves_2 = officiate ([(Spade, Num 4), (Diamond, Num 7)], [Draw], 5) = 3
val test_sum_greater_than_goal = officiate ([(Spade, Num 4), (Diamond, Num 7)], [Draw, Draw, Draw], 2) = 3
val test_final_sum_greater_than_goal = officiate ([(Spade, Num 4), (Diamond, Num 7)], [Draw, Draw, Draw], 5) = 18
val test_sum_smaller_than_goal = officiate ([(Spade, Num 4), (Diamond, Num 7)], [Draw, Draw, Draw], 15) = 4
val test_remove_card = officiate ([(Spade, Num 4), (Diamond, Num 7), (Heart, King), (Heart, Num 6)], [Draw, Draw, Discard (Diamond, Num 7), Draw, Draw], 20) = 0
(* val test_remove_card_raises_exception = officiate ([(Spade, Num 4), (Diamond, Num 7), (Heart, King), (Heart, Num 6)], [Draw, Draw, Discard (Diamond, Num 8), Draw, Draw], 20) *)

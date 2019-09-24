(* Section 1 *)
(* Exercise a *)
fun same_string(s1 : string, s2 : string) =
    s1 = s2

(* all_except_option : string * string list -> string option *)	     
fun copy_haystack_except_needle (haystack, needle, eq_operator) =
    case haystack of
	[]        => []
      | (x :: xs) => if eq_operator (needle, x)
		     then copy_haystack_except_needle (xs, needle, eq_operator)
		     else x :: copy_haystack_except_needle (xs, needle, eq_operator)

fun length (list) =
    case list of
	[] => 0
      | (_ :: xs) => 1 + length xs
				
(* all_except_option : string * string list -> string list option*)
fun all_except_option (search_string, corpus) =
    let 
	val corpus_except_search_string = copy_haystack_except_needle (corpus, search_string, same_string)
    in
	if length corpus_except_search_string = length corpus
	then NONE
	else SOME corpus_except_search_string
    end	


(* Exercise b *)
(* get_substitutions1 : string list list * string -> string list *)
fun get_substitutions1 (substitutions, s) =
    case substitutions of
	[]                             => []
      | (next_list :: remaining_lists) => let val maybe_list_except_s = all_except_option (s, next_list)
					  in
					      case maybe_list_except_s of
						  NONE      => [] @ get_substitutions1 (remaining_lists, s)
						| SOME list => list @ get_substitutions1 (remaining_lists, s)
					  end


(* Exercise c *)
(* get_substitutions2 : string list list * string -> string list *)
fun get_substitutions2 (substitutions, s) =
    let fun get_substitutions_helper (substitutions, acc) =
	    case substitutions of
		[]                             => acc
	      | (next_list :: remaining_lists) => let val maybe_list_except_s = all_except_option (s, next_list)
						  in
						      case maybe_list_except_s of
							  NONE      => get_substitutions_helper (remaining_lists, acc)
							| SOME list => get_substitutions_helper (remaining_lists, acc @ list)
						  end
    in
	get_substitutions_helper (substitutions, [])
    end

					      
(* Exercise d *)
(* similar_name : string list list * {first: string, last: string, middle: string} ->  {first: string, last: middle, middle: string} list *)
fun similar_names (substitutions, {first = f, middle = m, last = l}) =
    let fun similar_names_helper (names, acc) =
	    case names of
		[] => acc
	      | (n :: ns) => similar_names_helper (ns, acc @ [{first = n, middle = m, last = l}])	    
	val substituted_names = get_substitutions2 (substitutions, f)
    in
	similar_names_helper (substituted_names, [{first = f, middle = m, last = l}])
    end
	

					      

(* Section 2 *)
datatype color = Black | Red
datatype suit = Club | Spade | Heart | Diamond
datatype rank = Ace | King | Queen | Jack | Num of int
						       
type card = suit * rank

exception IllegalMove

(* Exercise a *)
(* card_color : card -> color *)
fun card_color card =
    case card of
	(Club, _)    => Black
     |  (Spade, _)   => Black
     |  (Heart, _)   => Red
     |  (Diamond, _) => Red

			    
(* Exercise b *)
(* card_value : card -> int *)
fun card_value card =
    case card of
	(_, Ace)    => 11
      | (_, King)   => 10
      | (_, Queen)  => 10
      | (_, Jack)   => 10
      | (_, Num n)  => n


(* Exercise c *)
(* remove_card : card list * card * exn -> card list *)
fun same_card (c1, c2) =
    c1 = c2

fun remove_card (cards, card, exc) =
    (* helper functions are defined above for exercise 1.a *)
    let val cards_except_card = copy_haystack_except_needle (cards, card, same_card)
    in
	if length cards_except_card = length cards
	then raise exc
	else cards_except_card
    end
	    

(* Exercise d *)
(* all_same_color : card list -> bool *)
(* Longer solution *)
(* fun all_same_color cards =
    let fun check_all_condition (list, color) =
	    case list of
		[]        => true
	      | (x :: xs) => card_color x = color andalso check_all_condition (xs, color)
    in
	case cards of
	    []        => true
	  | (x :: xs) => if card_color x = Black
			 then check_all_condition (x :: xs, Black)
			 else check_all_condition (x :: xs, Red)
    end	*)
(* More elegant solution using deep nesting *)
fun all_same_color cards =
    case cards of
	[]           => true
      | x :: []      => true
      | x :: y :: xs => card_color x = card_color y andalso all_same_color xs


(* Exercise e *)
(* sum_cards : card list -> int *)
fun sum_cards cards =
    let fun tailco_sum (cards, acc) =
	    case cards of
		[] => acc
	      | _  => acc + card_value (hd cards) + tailco_sum (tl cards, acc)
    in
	tailco_sum (cards, 0)
    end

	
(* Exercise f *)
(* score : card list * int -> int *)
fun score (held_cards, goal) =
    let val sum = sum_cards held_cards
	val preliminary_score = if sum > goal
				then 3 * (sum - goal)
				else goal - sum	    
    in
	if all_same_color held_cards
	then preliminary_score div 2
	else preliminary_score		 
    end
	

(* Exercise g *)
datatype move = Draw | Discard of card

(* officiate : card list * move list * int -> int *)
fun officiate (card_list, moves, goal) =
    let
	fun game_loop (card_list, held_cards, moves) =
	    case moves of
		[]        => score (held_cards, goal)
	      | (next_move :: remaining_moves) => case next_move of
						      Discard card =>  game_loop (card_list, remove_card (held_cards, card, IllegalMove), remaining_moves)
						    | Draw         => case card_list of
									  [] => score (held_cards, goal)
									| (new_card :: remaining_cards) => let val augmented_held_cards = new_card :: held_cards
													   in
													       if sum_cards augmented_held_cards > goal
													       then score (augmented_held_cards, goal)
													       else game_loop (remove_card (card_list, new_card, IllegalMove), augmented_held_cards, moves)
													   end
    in
	game_loop (card_list, [], moves)
    end
	

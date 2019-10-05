(* Exercise 1 *)
(* only_capitals : string list -> string list *)
val only_capitals = List.filter (fn word => Char.isUpper (String.sub (word, 0)))		


(* Exercise 2 *)
(* longest_string1 : string list -> string *)
val longest_string1 = foldl (fn (acc, s) => if String.size s >= String.size acc then s else acc) ""


(* Exercise 3 *)
(* longest_string2 : string list -> string *)
val longest_string2 = foldl (fn (acc, s) => if String.size s > String.size acc then s else acc) ""


(* Exercise 4 *)
(* longest_string_helper : (int * int -> bool) -> string list -> string *)
fun longest_string_helper f ss = foldl (fn (acc, s) => if f (String.size acc, String.size s) then acc else s) "" ss
		       
(* same behavior as longest_string1 *)
val longest_string3 = longest_string_helper (fn (n1, n2) => n1 > n2)

(* same behavior as longest_string2 *)
val longest_string4 = longest_string_helper (fn (n1, n2) => n1 >= n2)


(* Exercise 5 *)
(* longest_capitalized : string list -> string *)
val longest_capitalized = longest_string1 o only_capitals

						
(* Exercise 6 *)
(* rev_string : string -> string *)
val rev_string = String.implode o rev o String.explode


(* Exercise 7 *)
(* first_answer : ('a -> 'b option) -> 'a list -> 'b *)
exception NoAnswer

fun first_answer return_maybe_val elements =
    case elements of
	[] => raise NoAnswer
      | (x :: xs) => case return_maybe_val x of
			 NONE => first_answer return_maybe_val xs
		       | SOME v => v	


(* Exercise 8 *)
(* all_answers : ('a -> 'b list option) -> 'a list -> 'b list option *)
fun all_answers return_maybe_val elements =    
    let fun all_answers_helper f elements acc =
	    case elements of
		[] => acc
	      | (x :: xs) => case f x of
				 NONE => []
				 | SOME vs => all_answers_helper f xs (acc @ vs)
    in
	case elements of
		[] => SOME []
	      | (x :: xs) => case all_answers_helper return_maybe_val elements [] of
				 [] => NONE
			       | xs => SOME xs		       
    end


	
(* Pattern matching exercises *)
datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

(* (unit -> int) -> (string -> int) -> pattern -> int *)
fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end

(* Exercise 9 *)
(*fun count_wildcards pattern =
    g (fn _ => 1) () pattern*)

(*fun count_wild_and_variable_lengths pattern =
    g (fn _ => 1) (fn s => String.size s) pattern*)

(* Exercise 10 *)
(* check_pat : pattern -> bool *)
fun check_pat pattern =
    let fun get_variable_names pattern =
	    
	fun check_repeated_strings strings =
	    
    in
	(check_repeated_strings o get_variables_names) pattern
    end	


(* Exercise 11 *)



(* Exercise 12 *)
					    

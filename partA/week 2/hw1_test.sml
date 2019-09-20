(* Tests for homework 1 *)
use "hw1.sml"

(* Exercise 1 *)
val test1_true = is_older ((1993,12,3), (1993,12,4)) = true
						   
(* Exercise 2 *)
val test2 = number_in_month ([(1995,11,23), (1999,12,24), (1987,11,12)], 11) = 2


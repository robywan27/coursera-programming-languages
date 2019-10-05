(* Tests for homework 1 *)
use "hw1.sml";

(* Exercise 1 *)
val test1_true = is_older ((1993,12,3), (1993,12,4)) = true
val test1_false = is_older ((1993,11,21), (1993,5,30)) = false
							   
(* Exercise 2 *)
val test2 = number_in_month ([(1995,11,23), (1999,12,24), (1987,11,12)], 11) = 2

(* Exercise 3 *)
val test3 = number_in_months ([(1995,11,23), (1999,12,24), (1987,11,12)], [11,10,12]) = 3
val test3_2 = number_in_months ([(1995,11,23), (1999,12,24), (1987,11,12)], [11,10,11]) = 4

(* Exercise 4 *)
val test4 = dates_in_month ([(1995,11,23), (1999,12,24), (1987,11,12)], 11) = [(1995,11,23), (1987,11,12)]

(* Exercise 5 *)
val test5 = dates_in_months ([(1995,11,23), (1993,10,22), (1999,11,10)], [11,12,10]) = [(1995,11,23), (1999,11,10), (1993,10,22)]

(* Exercise 6 *)
val test6 =  get_nth (["foo", "bar", "try", "catch", "ada"], 3) = "try"

(* Exercise 7 *)
val test7 = date_to_string ((2000, 3, 11)) = "March 11, 2000"

(* Exercise 8 *)
val test8 = number_before_reaching_sum (100, [31, 30, 31, 28, 30, 30]) = 4
val test8_2 = number_before_reaching_sum (120, [31, 30, 31, 28, 30, 30]) = 4
val test8_3 = number_before_reaching_sum (160, [31, 30, 31, 28, 30, 30]) = 6

(* Exercise 9 *)
val test9 = what_month (20) = 1
val test9_2 = what_month (200) = 7
val test9_3 = what_month (365) = 12

(* Exercise 10 *)
val test10 = month_range (360, 365) = [12, 12, 12, 12, 12, 12]
val test10_2 = month_range (110, 125) = [4,4,4,4,4,4,4,4,4,4,4,5,5,5,5,5]

(* Exercise 11 *)
val test11 =  oldest ([(1993,11,21), (1993,5,30), (1993,11,30), (1993, 11, 27)]) = SOME (1993,5,30)
val test11_none = oldest ([]) = NONE

(* Exercise 12 *)
val test12 = number_in_months_challenge ([(1995,11,23), (1999,12,24), (1987,11,12)], [11,10,11]) = 2
val test12_2 = dates_in_months_challenge ([(1995,11,23), (1999,12,24), (1987,11,12)], [11,10,11]) =  [(1995,11,23),(1987,11,12)]
		     
(* Exercise 13 *)
val test13 = reasonable_date ((2008,2,29)) = true (* test leap year 2008 *)
val test13_2 = reasonable_date ((2007,2,29)) = false
val test13_3 = reasonable_date ((~2008,2,28)) = false
val test13_4 = reasonable_date ((2008,13,28)) = false
val test13_5 = reasonable_date ((2008,2,35)) = false

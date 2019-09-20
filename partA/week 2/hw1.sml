(* date: int*int*int *)
(* example of date: (1993,10,11) *)
(* day of the year: a number from 1 to 365 *)

(* Exercise 1 *)
(* most inelegant solution*)
(* fun is_older (date1 : int*int*int, date2 : int*int*int) =
    if (#1 date1) < (#1 date2)
    then True
    else if (#1 date1) > (#1 date2)
    then False
    else
	if (#2 date1) < (#2 date2)
	then True
	else if (#2 date1) > (#2 date2)
	then False
	else
	    if (#3 date1) < (#3 date2)
	    then True
	    else False *)

(* better solution *)
(* fun is_older (date1 : int*int*int, date2 : int*int*int) =
    if (#1 date1) <> (#1 date2)
    then (#1 date1) < (#1 date2)   
    else
	if (#2 date1) <> (#2 date2)
	then (#2 date1) < (#2 date2)	
	else
	    if (#3 date1) < (#3 date2)
	    then True
	    else False *)

(*shortest solution *)	   
fun is_older (date1 : int*int*int, date2 : int*int*int) =
    let val day_of_year1 = (#3 date1) + (#2 date1) + (#1 date1)
	val day_of_year2 = (#3 date2) + (#2 date2) + (#1 date2)
    in
	day_of_year1 < day_of_year2
    end
	

(* Exercise 2 *)
fun number_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else (if hd dates = month then 1 else 0) + number_in_month(tl dates, month)
								

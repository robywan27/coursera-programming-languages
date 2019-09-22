(* date: int*int*int *)
(* example of date: (1993,10,11) *)
(* day of the year: a number from 1 to 365 *)

(* Exercise 1 *)
(* most inelegant solution*)
(* fun is_older (date1 : int*int*int, date2 : int*int*int) =
    if (#1 date1) < (#1 date2)
    then true
    else if (#1 date1) > (#1 date2)
    then false
    else
	if (#2 date1) < (#2 date2)
	then true
	else if (#2 date1) > (#2 date2)
	then false
	else
	    if (#3 date1) < (#3 date2)
	    then true
	    else false *)

(* better solution *)
(* fun is_older (date1 : int*int*int, date2 : int*int*int) =
    if (#1 date1) <> (#1 date2)
    then (#1 date1) < (#1 date2)   
    else
	if (#2 date1) <> (#2 date2)
	then (#2 date1) < (#2 date2)	
	else
	    if (#3 date1) < (#3 date2)
	    then true
	    else false *)

(*shortest solution *)	   
fun is_older (date1 : int*int*int, date2 : int*int*int) =
    let val year_in_days = 365
	val month_in_days = 12				
	val day_of_year1 = (#1 date1) * year_in_days + (#2 date1) * month_in_days + (#3 date1)
	val day_of_year2 = (#1 date2)* year_in_days + (#2 date2) * month_in_days + (#3 date2)
    in
	day_of_year1 < day_of_year2
    end
	

(* Exercise 2 *)
fun number_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else (if #2 (hd dates) = month then 1 else 0) + number_in_month (tl dates, month)
							

(* Exercise 3 *)
fun number_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then 0
    else number_in_month (dates, (hd months)) + number_in_months (dates, (tl months))

								 
(* Exercise 4 *)
fun dates_in_month (dates : (int*int*int) list, month : int) =
    if null dates
    then []
    else
	let val date = hd dates
	in
	    if #2 date = month
	    then date :: dates_in_month ((tl dates), month)
	    else dates_in_month ((tl dates), month)
	end


(* Exercise 5 *)
fun dates_in_months (dates : (int*int*int) list, months : int list) =
    if null months
    then []
    else dates_in_month (dates, hd months) @ dates_in_months (dates, tl months)


(* Exercise 6 *)
fun get_nth (shenanigans : string list, nth : int) =
    if nth = 1
    then hd shenanigans
    else get_nth (tl shenanigans, nth - 1)


(* Exercise 7 *)		 
fun date_to_string (date : int*int*int) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
	val month_name = get_nth (months, #2 date)
    in
	month_name ^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)
    end
	

(* Exercise 8 *)
fun number_before_reaching_sum (sum : int, numbers : int list) =
    if sum <= hd numbers
    then 1
    else 1 + number_before_reaching_sum (sum - hd numbers, tl numbers)	


(* Exercise 9 *)
fun what_month (day_of_year : int) =
    let val num_days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    in
	number_before_reaching_sum (day_of_year, num_days_per_month)
    end
	

(* Exercise 10 *)
fun month_range (day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month (day1) :: month_range (day1 + 1, day2)
	

(* Exercise 11 *)
fun oldest (dates : (int*int*int) list) =
    if null dates
    then NONE
    else
	let fun oldest_nonempty (dates : (int*int*int) list) =
		if null (tl dates)
		then hd dates
		else
		    let val tl_oldest = oldest_nonempty (tl dates)
		    in
			if is_older (hd dates, tl_oldest)
			then hd dates
			else tl_oldest
		    end			
	in
	    SOME (oldest_nonempty dates)
	end


(* Exercise 12 *)
fun remove_duplicates (list, copy) =
    let fun contains (needle : int, haystack : int list) =
	    if null haystack
	    then false
	    else
		if needle = hd haystack
		then true
		else contains (needle, tl haystack)
    in
	if null list
	then copy
	else
	    if contains (hd list, copy)
	    then remove_duplicates (tl list, copy)
	    else remove_duplicates (tl list, hd list :: copy)
    end	

fun number_in_months_challenge (dates : (int*int*int) list, months : int list) =    	
    number_in_months (dates, remove_duplicates (months, []))    
	
fun dates_in_months_challenge (dates : (int*int*int) list, months : int list) =
    dates_in_months (dates, remove_duplicates (months, []))
	    


(* Exercise 13 *)
fun reasonable_date (date : int*int*int) =
    let val year = #1 date
	val month = #2 date
	val day = #3 date
	val is_leap_year = year mod 4 = 0 andalso year mod 100 <> 0 orelse year mod 400 = 0										     
    in
	(* check if year, month and day values are valid; this is just a preliminary check for day *)
	(* to avoid doing all the later computation if value is bogus beforehand *)
	if year <= 0 orelse month < 1 orelse month > 12 orelse day < 1 orelse day > 31
	    then false
	    else
		(* check if the day is appropriate for the month *)
		let val num_days_per_month = if is_leap_year
					     then [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
					     else [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
		    val day_in_month = List.nth  (num_days_per_month, month - 1)
		in
		    if day > day_in_month
		    then false
		    else true
		end
    end

	

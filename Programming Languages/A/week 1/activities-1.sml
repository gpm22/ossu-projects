fun is_older ( date1 : int*int*int, date2 : int*int*int) =
    (#1 date1) <= (#1 date2)
    andalso (#2 date1) <= (#2 date2)
    andalso (#3 date1) < (#3 date2);

fun number_in_month (lod : (int*int*int) list, m : int) =
    if null lod
    then 0
    else if (#2 (hd lod)) = m
    then 1 + number_in_month(tl lod, m)
    else number_in_month(tl lod, m);

fun number_in_months (lod: (int*int*int) list, lom: int list) =
    if null lod orelse null lom
    then 0
    else number_in_month(lod, hd lom) + number_in_months(lod, tl lom);

fun dates_in_month (lod: (int*int*int) list, m: int) =
    if null lod
    then []
    else if (#2 (hd lod)) = m
    then hd lod :: dates_in_month(tl lod, m)
    else dates_in_month(tl lod, m);

fun dates_in_months (lod: (int*int*int) list, lom: int list) =
    if null lod orelse null lom
    then []
    else dates_in_month(lod, hd lom) @ dates_in_months(lod, tl lom);
			   
fun get_nth (loa0: string list, n: int) =
    let fun get_nth (loa: string list, i: int) =
	    if null loa
	    then ""
	    else if i = n
	    then hd loa
	    else get_nth (tl loa, i+1);
    in
	get_nth(loa0, 1)
    end;

fun date_to_string (d: int*int*int) =
    let val months = ["January", "February", "March", "April",
		     "May", "June", "July", "August",
		     "September", "October", "November", "December"];
    in 
	get_nth(months, (#2 d)) ^ " " ^ Int.toString((#3 d)) ^ ", " ^ Int.toString((#1 d))
    end;

fun number_before_reaching_sum (sum0 : int, loi0 : int list) =
    let fun number_before_reaching_sum(loi : int list, i: int, sum: int) =
				      if null loi
				      then 0
				      else if sum0 <= sum
				      then i - 1
				      else number_before_reaching_sum(tl loi, i+1, sum+(hd loi));
    in
	number_before_reaching_sum(loi0, 0, 0)
    end;

					  

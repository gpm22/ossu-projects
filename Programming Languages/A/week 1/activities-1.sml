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

fun number_in_months (lod: (int*int*int) list, lon: int list) =
    if null lod orelse null lon
    then 0
    else number_in_month(lod, hd lon) + number_in_months(lod, tl lon);
			   
	

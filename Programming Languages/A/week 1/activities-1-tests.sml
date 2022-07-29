(* Homework1 Simple Test *)
(* These are basic test cases. Passing these tests does not guarantee that your code will pass the actual homework grader *)
(* To run the test, add a new line to the top of this file: use "homeworkname.sml"; *)
(* All the tests should evaluate to true. For example, the REPL should say: val test1 = true : bool *)

use "activities-1.sml";


val test1_1 = is_older ((1,2,3),(2,3,4)) = true;
val test1_2 = is_older ((2,3,4), (1,2,3)) = false;
val test1_3 = is_older ((1,2,3), (1,2,3)) = false;
val test1_4 = is_older ((1,2,3), (1,2,4)) = true;

val test2_1 = number_in_month ([(2012,2,28),(2013,12,1)],2) = 1;
val test2_2 = number_in_month ([(2012,2,28),(2013,12,1)],3) = 0;
val test2_3 = number_in_month ([], 0) = 0;
val test2_4 = number_in_month ([], 10) = 0;

val test3_1 = number_in_months ([(2012,2,28),(2013,12,1)],[2]) = 1;
val test3_2 = number_in_months ([(2012,2,28),(2013,12,1)],[3]) = 0;
val test3_3 = number_in_months ([], [0]) = 0;
val test3_4 = number_in_months ([], [10]) = 0;
val test3_5 = number_in_months ([], []) = 0;
val test3_6 = number_in_months ([(2012,2,28),(2013,12,1)],[]) = 0;
val test3_7 = number_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = 3;

val test4_1 = dates_in_month ([], 1) = [];
val test4_2 = dates_in_month ([(2012,2,28),(2013,12,1)],2) = [(2012,2,28)];
val test4_3 = dates_in_month ([(2012,2,28),(2013,12,1)],3) = [];


val test5_1 = dates_in_months ([], []) = [];
val test5_2 = dates_in_months ([(2012,2,28)], []) = [];
val test5_3 = dates_in_months ([], [1]) = [];
val test5_4 = dates_in_months ([(2012,2,28),(2013,12,1)],[2]) = [(2012,2,28)];
val test5_5 = dates_in_months ([(2012,2,28),(2013,12,1)],[3]) = [];
val test5_6 = dates_in_months ([(2012,2,28),(2013,12,1),(2011,3,31),(2011,4,28)],[2,3,4]) = [(2012,2,28),(2011,3,31),(2011,4,28)];

val test6_1 = get_nth([], 10) = "";
val test6_2 = get_nth (["hi", "there", "how", "are", "you"], 0) = "";
val test6_3 = get_nth (["hi", "there", "how", "are", "you"], ~1) = "";
val test6_4 = get_nth (["hi", "there", "how", "are", "you"], 6) = "";
val test6_5 = get_nth (["hi", "there", "how", "are", "you"], 2) = "there";

val test7_1 = date_to_string (2013, 1, 30) = "January 30, 2013";
val test7_2 = date_to_string (2014, 2, 4) = "February 4, 2014";
val test7_3 = date_to_string (2015, 3, 5) = "March 5, 2015";
val test7_4 = date_to_string (2016, 4, 2) = "April 2, 2016";
val test7_5 = date_to_string (2017, 5, 10) = "May 10, 2017";
val test7_6 = date_to_string (2018, 6, 1) = "June 1, 2018";
val test7_7 = date_to_string (2019, 7, 11) = "July 11, 2019";
val test7_8 = date_to_string (2011, 8, 17) = "August 17, 2011";
val test7_9 = date_to_string (2012, 9, 14) = "September 14, 2012";
val test7_10 = date_to_string (2003, 10, 15) = "October 15, 2003";
val test7_11 = date_to_string (2030, 11, 13) = "November 13, 2030";
val test7_12 = date_to_string (2000, 12, 23) = "December 23, 2000";

val test8_1 = number_before_reaching_sum (10, []) = 0;
val test8_2 = number_before_reaching_sum (100, [1,2,3,4,5]) = 0;
val test8_3 = number_before_reaching_sum (10, [1,2,3,4,5]) = 3;
val test8_4 = number_before_reaching_sum (3, [10,2,3,4,5]) = 0;
(*
val test9 = what_month 70 = 3

val test10 = month_range (31, 34) = [1,2,2,2]

val test11 = oldest([(2012,2,28),(2011,3,31),(2011,4,28)]) = SOME (2011,3,31)*)

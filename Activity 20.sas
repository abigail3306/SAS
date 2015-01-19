* Activity 20 *;
* longitudinal data, reading and manipulating date variables;

*----question 1---;
data dates;
input @1 EX1 MMDDYY10. @12 EX2 MMDDYY8. @21 EX3 DATE9. @31 EX4 DATE7. @39 EX5 MONYY7. @47 EX6 DATE9. @57 EX7 YYMMDD8. ;
datalines;
01/01/1960 01011960 05Jan1960 06Jan60 Jan1960 17/Jan/60 19591230
;
run;

proc print data=dates;
run;

*----question 3---;
data dates2;
input @1 EX1 DDMMYY10. @12 EX2 DDMMYY9. @22 EX3 DATE9. @32 EX4 MONYY6. @39 EX5 YYDDMMw.;
datalines;
25.04.2009 25 4 2009 31Dec1959 Apr 09 20092504
;
run;

proc print data = dates2;
run;


*----question 8---;
data dates;
input @1 EX1 MMDDYY10.;
datalines;
19/01/1960
;
run;

proc print data=dates;
run;


*----additional info---;
*---Example 1--;
data dates;
input @1 EX1 MMDDYY10. @12 EX2 MMDDYY8. @21 EX3 DATE9.
	@31 EX4 DATE7.   @39 EX5 MONYY7.  @47 EX6 DATE9. @57 EX7 YYMMDD8. ;
FORMAT EX1-EX2 DATE8. EX3 WORDDATE18. EX4 WEEKDATE29. EX5 MMDDYY8. EX6 DAY2.
	EX7 MMDDYY10.;
datalines;
01/01/1960 01011960 05Jan1960 06Jan60 Jan1960 17-Jan-60 19591230
;
run;
proc print data=dates noobs;
run;

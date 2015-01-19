* Activity 2
* Proc sort and getting your data into SAS;
 
data USPRESIDENTS;
input PRESIDENT $ PARTY $ NUMBER;
datalines;
Adams F 2
Lincoln R 16
Grant R 18
Kennedy D 35
;
run;

*Question 8 Sort the data then print it;

*title "PRESIDENTSSORTED";
*proc sort out=set2 data=USPRESIDENTS;
*by Number;
*run;

*proc print data=USPRESIDENTS;
*run;


*------------------Question 12-------------------------;
title 'Column Input 1';
data uspres1;
input Pres $ 1-12 Party $ 13-14 No 15-16;
datalines;
Adams       F  2
Abe Lincoln R 16
Grant       R 18
Kennedy     D 35
;
run;

title 'Column Input 2';
data uspres2;
input Pres $ 1-11 Party $ 13-13 No 15-16;
datalines;
Adams       F 2
Abe Lincoln R 16
Grant       R 18
Kennedy     D 35
;
run;

title 'Column Input 3';
data uspres3;
input No 15-16 Pres $ 1-11;
datalines;
Adams       F  2
Abe Lincoln R 16
Grant       R 18
Kennedy     D 35
;
run;

title 'Column Input 4';
data uspres4;
input Pres $ 1-11 Party $ 12-12 No 13-14;
datalines;
Adams      F 2
Abe LincolnR16
Grant      R18
Kennedy    D35
;
run;

proc print data=uspres1;
run;
proc print data=uspres2;
run;
proc print data=uspres3;
run;
proc print data=uspres4;
run;



*------------------Question 18-------------------------;
data uspres5;
input Party $ 12-12 No $ 13-14 Pres $ 1-3;
datalines;
Adams      F 2
Abe LincolnR16
Grant      R18
Kennedy    D35
;
run;

proc print data=uspres5;
run;


*------------------Question 19-------------------------;
title 'Ques 19';
data pumpkin;
input @1 Name $16. @21 Type $1. @23 Month $2. @26 Day $2. @29 Year $4.
@34 Score1 3.1 @41 Score3 4.1 @46 Score4 3.1 @50 Score5 2.1 @37 Score2 4.1 ;
datalines;
Alicia Grossman  13 c 10-28-2003 7.8 6.5 7.2 8.0 79
     Matthew Lee  9 D 10-30-2003 6.5 5.9 6.8 6.0 81
Elizabeth Garcia 10 C 10-29-2003 8.9 7.9 8.5 9.0 88
   Lori Newcombe  6 D 10-30-2003 6.7 5.6 4.9 5.2 61
Jose Martinez     7 d 10-31-2003 8.9 9.510.0 9.7 90
Brian Williams   11 C 10-29-2003 7.8 8.4 8.5 7.9 80
;
run;

proc print data = pumpkin;
run;

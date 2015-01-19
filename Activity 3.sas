*----------------Activity 3----------------;
* Getting your data into SAS;
 
* Question 1
title 'Survey 2';
data survey;
input @12 Q1 5.2 @28 Q2 $6. @48 Q3 $3. @63 Q4 $3. @77 Q5 $2. @94 Q6 $3. @108 Q7 1.
/@12 Q8 4.2 @28 Q9 $4. @44 Q10 $3. @60 Q11 $3. @76 Q12 1. @91 Q13 $1. @106 Q14 $3.
/@13 Q15 $1. @28 Q16 $11. @54 Q17 1. @69 Q18 $5. @89 Q19 $12.
/@13 Q20 $33. ;
datalines;
Ques ID 1  73.25Ques ID 2  Male     Ques ID 3  0   Ques ID 4  Yes Ques ID 5  5    Ques ID 6  No Ques ID 7  0
Ques ID 8  3.4  Ques ID 9  1.5 Ques ID 10  150 Ques ID 11  10  Ques ID 12  120Ques ID 13  0  Ques ID 14  No
Ques ID 15  5  Ques ID 16  Democrat      Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Left on top
Ques ID 20  Based on the individual candidate
Ques ID 1  67.  Ques ID 2  Female   Ques ID 3  70  Ques ID 4  No  Ques ID 5  3    Ques ID 6  No Ques ID 7  1
Ques ID 8  4.32 Ques ID 9  2   Ques ID 10  10  Ques ID 11  120 Ques ID 12  20 Ques ID 13  0  Ques ID 14  No
Ques ID 15  3  Ques ID 16  Republican    Ques ID 17  4  Ques ID 18  Left    Ques ID 19  Right on top
Ques ID 20  Based on the individual candidate
Ques ID 1  77.  Ques ID 2  Male     Ques ID 3  15  Ques ID 4  No  Ques ID 5  4    Ques ID 6  No Ques ID 7  1
Ques ID 8  3.8  Ques ID 9  1.1 Ques ID 10  30  Ques ID 11  15  Ques ID 12  15 Ques ID 13  0  Ques ID 14  No
Ques ID 15  8  Ques ID 16  Democrat      Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Right on top
Ques ID 20  Based on the individual candidate
Ques ID 1  63.  Ques ID 2  Female   Ques ID 3  100 Ques ID 4  No  Ques ID 5  5    Ques ID 6  No Ques ID 7  2
Ques ID 8  3.9  Ques ID 9  2   Ques ID 10  60  Ques ID 11  90  Ques ID 12  3  Ques ID 13  3  Ques ID 14  No
Ques ID 15  3  Ques ID 16  Republican    Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Left on top
Ques ID 20  Based on the individual candidate
Ques ID 1  62.  Ques ID 2  Female   Ques ID 3  45  Ques ID 4  No  Ques ID 5  5    Ques ID 6  No Ques ID 7  2
Ques ID 8  3.8  Ques ID 9  1.5 Ques ID 10  120 Ques ID 11  60  Ques ID 12  3  Ques ID 13  0  Ques ID 14  No
Ques ID 15  3  Ques ID 16  Republican    Ques ID 17  2  Ques ID 18  Right   Ques ID 19  Right on top
Ques ID 20  the Republican candidate
Ques ID 1  74.  Ques ID 2  Male     Ques ID 3  11  Ques ID 4  Yes Ques ID 5  5    Ques ID 6  No Ques ID 7  1
Ques ID 8  3.2  Ques ID 9  1.5 Ques ID 10  1   Ques ID 11  3   Ques ID 12  6  Ques ID 13  5  Ques ID 14  No
Ques ID 15  6  Ques ID 16  Independent   Ques ID 17  5  Ques ID 18  Left    Ques ID 19  Left on top
Ques ID 20  Will not vote
Ques ID 1  63.6 Ques ID 2  Female   Ques ID 3  0   Ques ID 4  Yes Ques ID 5  4    Ques ID 6  YesQues ID 7  1
Ques ID 8  3.2  Ques ID 9  0.75Ques ID 10  30  Ques ID 11  60  Ques ID 12  6  Ques ID 13  0  Ques ID 14  No
Ques ID 15  6  Ques ID 16  Independent   Ques ID 17  3  Ques ID 18  Right   Ques ID 19  Left on top
Ques ID 20  Will not vote
Ques ID 1  68.  Ques ID 2  Male     Ques ID 3  15  Ques ID 4  No  Ques ID 5  2    Ques ID 6  No Ques ID 7  0
Ques ID 8  3.6  Ques ID 9  0.25Ques ID 10  90  Ques ID 11  60  Ques ID 12  60 Ques ID 13  0  Ques ID 14  No
Ques ID 15  5  Ques ID 16  Democrat      Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Right on top
Ques ID 20  Will not vote
Ques ID 1  63.  Ques ID 2  Female   Ques ID 3  40  Ques ID 4  Yes Ques ID 5  10   Ques ID 6  No Ques ID 7  0
Ques ID 8  3.5  Ques ID 9  2.3 Ques ID 10  60  Ques ID 11  150 Ques ID 12  2  Ques ID 13  0  Ques ID 14  No
Ques ID 15  6  Ques ID 16  Democrat      Ques ID 17  3  Ques ID 18  Right   Ques ID 19  Left on top
Ques ID 20  Based on the individual candidate
Ques ID 1  64.  Ques ID 2  Female   Ques ID 3  45  Ques ID 4  Yes Ques ID 5  10   Ques ID 6  No Ques ID 7  1
Ques ID 8  3.3  Ques ID 9  3   Ques ID 10  240 Ques ID 11  120 Ques ID 12  60 Ques ID 13  0  Ques ID 14  No
Ques ID 15  8  Ques ID 16  Democrat      Ques ID 17  2  Ques ID 18  Right   Ques ID 19  Right on top
Ques ID 20  the Democrat candidate
Ques ID 1  74.  Ques ID 2  Male     Ques ID 3  13  Ques ID 4  Yes Ques ID 5  2    Ques ID 6  No Ques ID 7  1
Ques ID 8  3.6  Ques ID 9  0.5 Ques ID 10  30  Ques ID 11  90  Ques ID 12  3  Ques ID 13  0.5Ques ID 14  No
Ques ID 15  6  Ques ID 16  Democrat      Ques ID 17  2  Ques ID 18  Right   Ques ID 19  Right on top
Ques ID 20  the Democrat candidate
Ques ID 1  65.  Ques ID 2  Female   Ques ID 3  15  Ques ID 4  Yes Ques ID 5  4    Ques ID 6  No Ques ID 7  0
Ques ID 8  3.8  Ques ID 9  0   Ques ID 10  30  Ques ID 11  70  Ques ID 12  2  Ques ID 13  0  Ques ID 14  No
Ques ID 15  5  Ques ID 16  Independent   Ques ID 17  2  Ques ID 18  Right   Ques ID 19  Right on top
Ques ID 20  the Democrat candidate
Ques ID 1  68.  Ques ID 2  Male     Ques ID 3  0   Ques ID 4  No  Ques ID 5  5    Ques ID 6  No Ques ID 7  1
Ques ID 8  3.8  Ques ID 9  1   Ques ID 10  60  Ques ID 11  240 Ques ID 12  240Ques ID 13  7  Ques ID 14  No
Ques ID 15  5  Ques ID 16  Independent   Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Left on top
Ques ID 20  the Democrat candidate
Ques ID 1  64.  Ques ID 2  Female   Ques ID 3  15  Ques ID 4  Yes Ques ID 5  2    Ques ID 6   No Ques ID 7 0
Ques ID 8  3.9  Ques ID 9  5   Ques ID 10  0   Ques ID 11  30  Ques ID 12  3  Ques ID 13  0  Ques ID 14  No
Ques ID 15  4  Ques ID 16  Democrat      Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Left on top

Ques ID 1  56.  Ques ID 2  Female   Ques ID 3  35  Ques ID 4  Yes Ques ID 5  8    Ques ID 6   No Ques ID 7 0
Ques ID 8  2.8  Ques ID 9  2   Ques ID 10  60  Ques ID 11  120 Ques ID 12  5  Ques ID 13  0  Ques ID 14  No
Ques ID 15  2  Ques ID 16  Democrat      Ques ID 17  4  Ques ID 18  Right   Ques ID 19  Left on top

;
run;

proc sort data=survey out=gender;
by descending Q2;
run;
proc print data=gender;
run;

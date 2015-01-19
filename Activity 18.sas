*------Activity 18---------;
*-----Question 1-----;
* tests for two categorical variables;
 
title 'Chisquare Densities';
data chisquare;
do x=0.0 to 10 by 0.05;
	y1=pdf('CHISQUARE',x,1);
	y2=pdf('CHISQUARE',x,2);
	y3=pdf('CHISQUARE',x,3);
	y4=pdf('CHISQUARE',x,6);
output;
end;

label y1='Chisquare df=1';
label y2='Chisquare df=2';
label y3='Chisquare df=3';
label y4='Chisquare df=6';
run;

proc print data=chisquare;
run;

symbol1 w=2 c=black i=join l=1;
symbol2 w=2 c=red i=join l=1;
symbol3 w=2 c=blue i=join l=1;
symbol4 w=2 c=green i=join l=1;
axis1 label=('Density') order=0 to 2 by 0.25;
legend1 label=none position=(top right inside);

proc gplot data=chisquare;
* Put all the plots you want to plot into same statement as you do variables;
plot y1*x y2*x y3*x y4*x/ legend=legend1  vaxis=axis1 overlay;
run;


*-----Question 2-----;
data DEBATE;
infile 'F:/SAS/Activities/debate.txt' missover;
input @5 School 1. @8 Gender 1. @15 Argumentation 1.;
run;

*Sort the data by gender first to organize the dataset;
proc sort data = DEBATE;
by Gender;
run;

*Testing is gender is related to argumentation at school=8;
title 'Gender relation to argumentation skills at Skyline High School';
proc freq data = DEBATE;
by Gender;
where School = 8;
run;

*Create new data set containing only schools 5,6,8;
data TEST;
set DEBATE;
if Argumentation = 3 then Argumentation = 4;
else if Argumentation = 2 then Argumentation = 4;
where School = 5 OR School = 6 OR School = 8;
run;

proc sort data = TEST;
by School;
run;

*Compare argumentation in schools with a crosstabulation table;
title 'Effectiveness in argumentation between Kerns, Hunter, and Skyline High Schools';
proc freq data = TEST;
tables Argumentation School Argumentation*School;
run;

*proc freq data=Color
   tables Eyes Hair Eyes*Hair / out=FreqCount outexpect sparse
   weight Count
   title 'Eye and Hair Color of European Children'
run

proc print data=FreqCount noobs
   title2 'Output Data Set from PROC FREQ'
run;


*-----Question 3-----;


*-----Question 4-----;

*-----Question 5-----;

*---------------------------;
*-----Question 6-----;

data cancer;
input death_age death_location deaths  @@;
if death_age=4 then Age='Over 74';
else if death_age=2 then Age='55-64';
else if death_age=3 then Age='65-75';
else Age='15-54';
if death_location=3 then Loc='Chronic-care';
else if death_location=2 then Loc='Acute-care';
else Loc='Home';
label Loc='Location of Death'
deaths='Number of Deaths';
datalines;
1	1	94	1	2	418	1	3	23
2	1	116	2	2	524	2	3	34
3	1	156	3	2	581	3	3	109
4	1	138	4	2	558	4	3	238
;
run;

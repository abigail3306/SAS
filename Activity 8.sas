*-----------------------------------Code for Activity 8-------------------------------------;
*Rather than using PROC FORMAT to recode the variables here we will revert to using IF-THEN-ELSE statements. The 
reason for this is that PROC SORT as well as other SAS PROCs will only operate on the raw/unformatted values of 
variables. This causes issues (as seen in activity 7) if we have formatted the variables using a PROC FORMAT.  The "fixes" 
for these issues are complicated - far more time consuming than writing a few IF-THEN-ELSE statements.;

* Getting help and data storage
*-------------Question 1------------;
TITLE 'Ques 1';
DATA parking;
INFILE 'F:\SAS\ParkingJMU.txt' DLM='09'x MISSOVER;
INPUT ID MILES YEARS JOB CARPOOL CAR PERMIT METERS BUS USEBUS MON TUE WED THUR FRI NDRIVE NBUS NACTIVE IMPED $;
*Recode variables;
if permit=2 then permitc='Has No Permit';
	else if permit=1 then permitc='Has A Permit';
	else permitc='';
if meters=2 then metersc='Sometimes';
	else if meters=1 then metersc='Usually';
	else if meters=3 then metersc='Rarely';
	else if meters=4 then metersc='Never';
	else metersc='';
if 0<ID<300 then campus='JMU';
	else if ID>=300 then campus='UT';
	else campus='';
*Fix the MILES missing value indicators;
if miles=-99 then miles=.;
*Labels;
LABEL 	Metersc='How often do you park at meters on campus?'
		Campus='Your Campus?'
		Miles='Number of miles that you live from campus';
*Keep only the variables we will need in this activity;
KEEP ID Campus Metersc Miles;
run;

*--Figure 1/Question 1--;
proc sort data=parking out=parkingnew;
by Campus Metersc ;
run;
proc boxplot data=parkingnew;
plot miles*Metersc (campus) / BLOCKREP BOXSTYLE=SCHEMATICID vaxis=0 to 100 by 10 idsymbol=dot
boxwidth=8;
id ID;
*by Campus;
run;


* Question 3;
data stats;
x = RAND('BINOMIAL', p, n);
run;

proc print data = stats;
run;

data stats1;
x = RAND('NORMAL', [, ?, ?]);
run;

proc print data = stats1;
run;


*-------------Question 5------------;
PROC FORMAT;
VALUE $votefmt	'D'	= 'Democrat'
		'R' = 'Republican'
		'N'	= 'Did/Will not vote'
		'O' = 'Neither'
		'C' = 'Constitution'
		'G' = 'Green'
		'U' = 'Undecided'
		'L' = 'Libertarian';
RUN;
*--2-Way Frequency Table--;
* Question 5;
proc freq data=politics;
tables last*next;
run;

libname Abigail 'F:/SAS';

DATA Abigail.politics;
INFILE 'F:\SAS\politics.txt' DLM='09'x;
INPUT TYPE $ GENDER AGE PREF $ BASIS LAST $	NEXT $;
FORMAT GNEXT $votefmt. LAST $votefmt.;
*Keep only the variables we will use in this activity;
KEEP LAST NEXT;
RUN;

proc print data = Abigail.politics;
run;

* Question 8;
data Abigail.play;
input X;
datalines;
1
2
;
run;

* Question 9;
data Abigail.play2;
input X;
datalines;
1
2
;
run;

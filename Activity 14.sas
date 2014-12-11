* Activity 14;
* Tests and confidence intervals for one or two populations;

title '-------- Problem A & B Data --------';
data grades;
infile 'F:\SAS\Activities\grades.txt';
input name $ gen $ year  quiz exam1 exam2 final lab;
if gen='f' then gender='Female';
else gender='Male';
run;

proc print data = grades;
run;

title '-------- Problem A --------';
proc ttest data=grades alpha=0.01 h0=0 ci=none;
*CI=NONE suppresses the printing of confidence intervals for variances
but not hypothesis tests which we need;
class gender;
var final;
run;

title '-------- Problem B --------';
proc ttest data=grades alpha=0.05 h0=5 ci=none;
paired exam2*exam1;
run;

title '-------- Problem C Data --------';
data running;
infile 'F:\SAS\Activities\running.txt';
input @1 grade 1. @3 sex $1. @5 m1 1. @7 s1 2. @10 m2 1. @12 s2 2.;
race1=m1*60+s1;
race2=m2*60+s2;
if sex='F';
run;

title '-------- Problem C --------';
proc ttest data=running alpha=0.1 h0=0;
var race1;
run;

title '-------- Problem D Data --------';
data src;
infile 'F:\SAS\Activities\src.txt';
input ID gender environment quality health plants jobs growth job_status hours income age party liberal;
label environment='Environmental Identify (10=strongly agree)';
if 7<environment<11 then environ='Yes';
else environ='No';
run;

title '-------- Problem D --------';
proc freq data=src;
tables environ/alpha=0.1 binomial(p=0.25 level='Yes');
run;

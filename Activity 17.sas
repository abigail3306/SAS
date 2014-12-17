/* ACTIVITY 17*/;
/* Abigail C. Liskey*/;
* Numeric and graphical summaries for 2 quantitative variables;

* Question 1;
libname abigail 'F:/SAS/Activities';


proc import datafile = 'F:/SAS/Activities/voting.csv' out=abigail.voting replace;
getnames = yes;
run;

proc print data = abigail.voting;
run;

proc sort data = abigail.voting;
by VAR4;
run;

* Question 2;
symbol1 c=black v=dot i=none;
symbol2 c=red v=dot i=none;
symbol3;
proc gplot data = abigail.voting;
title 'Scatterplot of popular votes for Democratic Candidates';
plot Dem1980*Dem1984=Southern;
run;
quit;

proc reg data = abigail.voting;
model VAR3=VAR2;
run;
quit;


* Question 11;
symbol1 c=black v=dot;
symbol2 c=purple v=none w=3 l=2 i=RLCLM95;*CLM=95% confidence limits for AVERAGE response;
symbol3 c=green v=none w=3 l=4 i=RLCLI95;*CLI=95% confidence limits for INDIVIDUAL/PREDICTED response;
proc gplot data = abigail.voting;
by VAR4;
title 'Popular Votes for Democrat Presidential Candidates';
plot VAR3*VAR2=1 
	 VAR3*VAR2=2  
	 VAR3*VAR2=3/overlay haxis=20 to 60 by 5 vaxis=20 to 60 by 5;
run;
quit;

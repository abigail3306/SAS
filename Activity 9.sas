* Activity 9
* More on reading data from an external file

* Question 1;
data VOTE;
infile 'F:/SAS/voting.txt' DLM='09'x;
input State $ Dem1980 $ Dem1984 $ Southern;
run;

* Question 1;
libname abigail 'F:/SAS';

* Question 4;
proc import datafile = 'F:/SAS/voting.txt' out=abigail.vote replace;
getnames = no;
run;

proc print data = abigail.vote;
run;

* Question 5;
proc sort data = abigail.vote;
by VAR4;
run;

* Question 5;
title 'Percentage of Popular Votes in 1984';
proc boxplot data = abigail.vote;
plot VAR3 * VAR4;
id VAR3;
label VAR3 = 'Dem1984' VAR4 = 'Southern State or not';
run;


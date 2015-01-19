*Activity 16;
* numeric and graphical summaries for two quantitative variables;
 
*----Read in Data-----;
data utility;
infile 'F:/SAS/Activities/utility2.txt';
input Month $ Year Phone Fuel Power;
*--Create a numeric month (at least until we do this properly later)--;
if Month='Jan' then Mon=1;
else if Month='Feb' then Mon=2;
else if Month='Mar' then Mon=3;
else if Month='Apr' then Mon=4;
else if Month='May' then Mon=5;
else if Month='Jun' then Mon=6;
else if Month='Jul' then Mon=7;
else if Month='Aug' then Mon=8;
else if Month='Sep' then Mon=9;
else if Month='Oct' then Mon=10;
else if Month='Nov' then Mon=11;
else Mon=12; *there are no missing Months;
run;

*----First Plot------;
SYMBOL1 COLOR=black INTERPOL=join VALUE=star;
SYMBOL2 C=red I=join V=dot;*only the first letter for the options is needed;
SYMBOL3 C=black I=join V=square;
SYMBOL4 C=black I=join V==;
AXIS2 LABEL=("Cost ($)");
AXIS1 LABEL=("Month");

PROC GPLOT DATA=utility;
TITLE 'Scatterplot of Phone Costs by Month';
WHERE year>89;
PLOT phone*mon=year/ HAXIS=axis1 VAXIS=axis2;
RUN;
QUIT; *Use this!;

*----Second Plot------;
SYMBOL1 L=1 C=black I=join V=star;
SYMBOL2 L=2 C=black I=join V=dot;
SYMBOL3 L=3 C=black I=join V=square;

PROC GPLOT DATA=utility;
TITLE 'Scatterplot of Costs by Month in 1990';
WHERE year=90;
PLOT phone*mon=1 fuel*mon=2 power*mon=3/LEGEND;
RUN;

*----Third Plot------;
symbol C=black I=none V=circle;
title 'Relationship between Fuel and Power Costs in 1991';
proc gplot data = utility;
where year = 91;
plot fuel*power/legend;
AXIS2 LABEL=("Fuel");
AXIS1 LABEL=("Power");
run;

*----Question 11-15------;
proc corr data = utility;
label mon='Month';
var mon;
with phone fuel power;
run;

proc corr data = utility;
label mon='Month';
var fuel;
with power;
run;

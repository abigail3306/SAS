*------------------------------------------------------

Activity 4
Author: Abigail Liskey
Date Created: September 8th 2014
Purpose: Getting your data into SAS and creating new data;

-------------------------------------------------------;
title 'HANDINJ';
data HAND;
infile 'F:/SAS/HANDINJ.txt';
input ID $ TYPE $ DAYS $ COST ;
run;

proc sort data = HAND;
by descending TYPE;
run;

*proc print data = HAND;
*run;

DATA USHAND;
SET HAND;
KEEP USCost ID Type Days;
USCost=Cost*1.81; *Cost in US dollars;
RUN;

proc print data = USHAND;
run;


*------Question 9---------;
data LHAND;
SET USHAND;
KEEP Type Days Luscost;
LUSCOST = log(USCost);
run;


proc print data = LHAND;
run;


data ushandwork;
set lhand;
if type = 'WORK';
run;

proc print data = ushandwork;
run;


*-------Question 13--------;
data ushandhigh;
set ushand;
if uscost > 380.09;
run;

data usworkhigh;
set ushand;
if uscost > 380.09;
if type = "work";
run;

proc print data = usworkhigh;
run;

*--------Question 15;
data handinjnew;
infile 'F:/SAS/HANDINJNEW.txt' missover dlm = '09'x;
input ID $ Type $ Days $ Cost;
run;

proc print data = handinjnew;
run;

*Activity 15;
* tests and confidence intervals for one or two populations;
 
*Question 2a;
title 'Human data';
data Human;
infile 'F:\SAS\Activities\robot.txt';
input @1 throughput 5.1 @12 quality 5.3;
type = 'Human ';
run;

proc print data = Human;
run;

*Question 2b;
title 'Hybrid data';
data Hybrid;
infile 'F:\SAS\Activities\robot.txt';
input @6 throughput 6.1 @17 quality 5.3;
type = 'Hybrid';
run;

proc print data = Hybrid;
run;

*Question 2c;
title 'Combined data';
data Combined;
set Human Hybrid;
run;

proc print data = Combined;
var type throughput quality;
run;

*Question 3;
proc ttest data = Combined alpha=0.1 H0=0 CI=none;
class type;
var throughput;
run;

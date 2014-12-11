*-----------Activity 6------------;
* Numeric and graphical summaries of quantitative variables;

title 'JMU Parking Data';
data parking;
infile 'F:/SAS/ParkingJMU.txt' missover DLM = '09'X;
input ID MILES YEARS JOB CARPOOL CAR PERMIT METERS BUS USEBUS MON TUE WED THUR FRI NDRIVE NBUS NACTIVE IMPED $; 
run;


* Question 4;
title1 'Additional Information 1';
title2 'Example 1';
data labeled;
set parking;
if 8 < miles <= 16 then cmiles = 'medium';
else if miles > 16 then cmiles = 'large';
else if miles =. or miles = -99 then cmiles = '';
else cmiles = 'small';
keep miles cmiles car;
run;

title2 'Example 2';
data labeled;
set parking;
if car = 1 AND 8 < miles <= 16 then cmiles = 'medium';
else if car = 1 AND miles > 16 then cmiles = 'large';
else if car = 1 AND miles <= 8 then cmiles = 'small';
else if car = 99 AND miles =-99 OR miles =. or car =. then cmiles = '';
else if car = 2 then cmiles = 'none';
keep miles cmiles car;
run;


data parkingnew;
set parking;
keep CAMPUS PERMIT PERMITC METERS MILES ID USEBUS;
run;

data parkingnew1;
set parkingnew;
if ID > 299 then CAMPUS = 'UT ';
else CAMPUS = 'JMU';

if permit = 1 then PERMITC = 'Has A Permit ';
else if permit = 2 then PERMITC = 'Has No Permit';
else if permit =. or PERMETC = 99 then PERMITC = '';

run;


*-----Question 11;
title 'Park';
data park;
set parkingnew1;
keep ID CAMPUS MILES PERMITC METERSC USEBUS USEBUSC;
if meters = 2 then METERSC = 'Sometimes';
else if meters = 1 then METERSC = 'Usually';
else if meters = 3 then METERSC = 'Rarely';
else if meters = 4 then METERSC = 'Never';

if USEBUS = 1 then USEBUSC = 'Yes';
else USEBUSC = 'No';

if miles = -99 then miles = .;
run;


* ----------Activity 6----------------;
* Sort the data by permitc;
proc sort data = park;
by permitc;
run;

* gather statistical information about the data set;
proc means data = park;
var miles;
by permitc;
run;

* Question 4;
proc sort data = park;
by campus;
run;

proc means data = park;
var miles;
by campus;
run;

proc sort data = park;
by usebusc;
run;

proc means data = park;
var miles;
by usebusc;
run;

* Question 6;
proc sort data = park out = parksort;
by permitc campus;
run;

proc boxplot data = parksort;
plot miles * campus / boxstyle = schematicid vaxis = 0 to 50 by 5 idsymbol = star;
id id;
by permitc;
run;


* Question 8;
proc sort data = park out = parkout;
by campus metersc;
run;

proc boxplot data = parkout;
plot miles * metersc / boxstyle = schematicid vaxis = 0 to 50 by 5 idsymbol = dot;
id id;
by campus;
run;

proc means data = parkout;
var miles;
by campus;
run;

data parkinggroup;
set parksort;
group = 'All Students'; * the dummy group variable - any value can be used;
run;

proc boxplot data = parkinggroup;
plot miles * group/boxstyle = schematicid vaxis = 0 to 50 by 5 idsymbol = star;
id id;
run;

* Question 10;
data running;
infile 'F:/SAS/running.txt';
input @1 Grade $1. @3 Sex $1. @5 r1 1. @7 r1_1 2. @10 r2 1. @12 r2_2 2.;
r1_in_sec = r1 * 60;
race_time_1 = r1_in_sec + r1_1;

r2_in_sec = r2 * 60;
race_time_2 = r2_in_sec + r2_2;
run;

proc sort data = running;
by Sex;
run;

proc print data = running;
var Grade Sex race_time_1 race_time_2;
run;

* Question 13;
proc means data = running sum;
var race_time_1;
by Sex;
run;

proc sort data = running;
by Sex;
run;

* Question 14;
proc boxplot data = running;
plot race_time_1 * Sex / boxstyle = schematicid vaxis = 50 to 150 by 10;
run;

proc boxplot data = running;
plot race_time_2 * Sex / boxstyle = schematicid vaxis = 50 to 150 by 10;
run;

proc means data = running;
var race_time_1;
by grade;
run;

* Question 19;
proc sort data=running;
by grade;
run;

proc boxplot data = running;
where Grade = '7' or Grade = '9';
plot race_time_2 * Grade / boxstyle = schematicid vaxis = 50 to 150 by 10;
run;

* Question 20;
proc means data = running ;
where Grade = 7 OR Grade = 9;
var race_time_1;
run;

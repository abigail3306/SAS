*-----------Activity 5------------;

title 'JMU Parking Data';
data parking;
infile 'F:/SAS/ParkingJMU.txt' missover DLM = '09'X;
input ID MILES YEARS JOB CARPOOL CAR PERMIT METERS BUS USEBUS MON TUE WED THUR FRI NDRIVE NBUS NACTIVE IMPED $; 
run;

proc sort data = parking out = parkingsort;
by descending BUS;
run;

proc print data = parkingsort noobs;
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

*proc print data = labeled;
*run;

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
keep CAMPUS PERMIT PERMITC METERS MILES ID ;
run;

data parkingnew1;
set parkingnew;
if ID > 299 then CAMPUS = 'UT ';
else CAMPUS = 'JMU';

if permit = 1 then PERMITC = 'Has A Permit ';
else if permit = 2 then PERMITC = 'Has No Permit';
else if permit =. or PERMETC = 99 then PERMITC = '';

run;

proc print data = parkingnew1;
run;

*-----Question 11;
title 'Park';
data park;
set parkingnew1;
keep ID CAMPUS MILES PERMITC METERSC;
if meters = 2 then METERSC = 'Sometimes';
else if meters = 1 then METERSC = 'Usually';
else if meters = 3 then METERSC = 'Rarely';
else if meters = 4 then METERSC = 'Never';

if miles = -99 then miles = .;
run;

proc print data = park;
run;

* Question 13;
proc univariate plot data = park;
var miles;
run;

* Question 14;
proc univariate data = park;
var miles;
histogram miles/midpoints = 2 to 52 by 4;
qqplot miles;
run;

* Question 19;
data play;
set park;
opposite =- miles;
run;

proc univariate data = play;
id id;
var opposite;
by campus;
label opposite ='Silly Example to illustrate a point';
histogram opposite/midpoints = -52 to -2 by 4 vscale = count;
inset mean = 'Mean' (6.2) STD='Standard Deviation' (6.3)
	/Font='Arial' pos = nw height = 3;
qqplot opposite;
run;

* Activity 10;
* Generating random observations and do-loops
 
* Question 1;
title 'Doloop';
Data doloop;
*example of a do-loop;
*x3 =- 5;
do i =1 to 9 by 2;
	*x1 = i * 5;
	*x2 = 10 - i;
	*x3 = x3 + 1;
	 x4 = log(i);
	output;
end;
run;

proc print data = doloop;
run;

* Question 3;
data random;
*generate values;
x1 = ranbin(0,100,0.2);
x2 = rannor(1000);
run;

proc print data = random;
run;

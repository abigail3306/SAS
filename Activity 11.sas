* Abigail C. Liskey
* Activity 11
* Using simulation to calibrate your qq-plot interpretation

* Question 1;
title 'Normal distribution between 1-10';
DATA NORMAL;
N = 10;
MEAN = 3;
SD = 2;
SEED = 2810;
DO i=1 to N by 1;
	X1 = SD + MEAN * rannor(SEED);
	X2 = SD + MEAN * rannor(SEED);
	X3 = SD + MEAN * rannor(SEED);
	X4 = SD + MEAN * rannor(SEED);
	X5 = SD + MEAN * rannor(SEED);
	OUTPUT;
END;
RUN;

PROC PRINT DATA = NORMAL;
RUN;

PROC UNIVARIATE PLOT DATA = NORMAL;
	QQPLOT X1 X2 X3 X4 X5 / NOPRINT;
RUN;

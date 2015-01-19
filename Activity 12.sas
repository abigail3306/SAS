* Activity 12;
* Assigning Experimental Units to Treatments I.E. Who Gets What?;
 
*-----------------------
ACTIVITY 12
-----------------------;

*-- Page setup for output --;
options linesize=64 pagesize=55;

*--------------Introduction 1-------;


*---Balanced case---;

*Assign to groups;
DATA balanced;
*assuming subjects numbered 1-88;
DO ID=1 TO 88;
	u=RANUNI(45957);
	OUTPUT;
END;
RUN;
*Sorts u (low to high) then forms 2 groups;
PROC RANK DATA=balanced GROUPS=2 OUT=bal_grps;
VAR u;
RANKS groupvar;
RUN;

*descriptive values to group var.;
DATA bal_grouped;
SET bal_grps;
IF groupvar=0 THEN group='NV';
ELSE group='VV';
KEEP ID group;
RUN;

*Sort by ID for ease of use;
PROC SORT DATA=bal_grouped;
BY ID;
RUN;

*Check number in each group;
PROC FREQ DATA=bal_grouped;
TABLES group;
RUN;

*---UnBalanced case---;

*Assign to groups;
DATA unbalanced;
*assuming subjects numbered 1-88;
DO ID=1 TO 88;
	u=RANUNI(45957);
	IF u<=0.5 THEN group='NV';
	ELSE group='VV';
	OUTPUT;
END;
KEEP ID group;
RUN;


*Print for ease of use;
PROC PRINT DATA=unbalanced NOOBS;
VAR ID group;
RUN;

*Check number in each group;
PROC FREQ DATA=unbalanced;
TABLES group;
RUN;


*------------Additional Information 2------------------;

*create data sets;
DATA Parta;N=50;
DO i=1 TO N;
	x1=10+10*RANNOR(9870);
	OUTPUT;
END;
KEEP x1;
RUN;
DATA Partb;N=500;
DO i=1 TO N;
	x2=10+10*RANNOR(9870);
	OUTPUT;
END;
KEEP x2;
RUN;
DATA Partc;N=5000;
DO i=1 TO N;
	x3=10+10*RANNOR(9870);
	OUTPUT;
END;
KEEP x3;
RUN;


*--Set--;
title 'set';
DATA combine_set;
SET parta partb partc;
RUN;
PROC PRINT DATA=combine_set;
RUN;


*--Merge--;
title 'merge';
DATA combine_merge;
MERGE parta partb partc;
RUN;
PROC PRINT DATA=combine_merge;
RUN;

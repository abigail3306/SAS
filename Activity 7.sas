* Activity 7
* Abigail Liskey
* 2014-09-24;
* Numeric and graphical summaries of categorical variables

* Question 1;
data politics;
infile 'F:/SAS/politics.txt' DLM = '09'x missover;
input Type $ Gender Age Pref $ Basis Last $ Next $;

if Gender = 2 then GenderC = 'Female';
else GenderC = 'Male';

if Age >= 30 then AgeCat = "Non-Traditional";
else if Age >= 15 AND Age < 20 then AgeCat = "< 20";
else if Age >= 20 AND Age < 25 then AgeCat = "20 - <25";
else if Age >= 25 AND Age < 30 then AgeCat = "25 - <30";

if Last = 'N' then LastC = 'Will not vote';
else if Last = 'R' then LastC = 'Republican';
else if Last = 'U' then LastC = 'Undecided';
else if Last = 'D' then LastC = 'Democrat';
run;

proc print data = politics;
var LastC GenderC AgeCat Pref Basis Next;
run;


*-- Additional Information 1 --;
PROC FORMAT;
VALUE sexfmt 	1='Male' 
			2='Female';
VALUE agefmt 	LOW-<20 ='<20' 
			20-<25  ='20-<25' 
			25-<30  ='25-<30' 
			30-HIGH ='Non-Traditional'
			OTHER   = '';
VALUE $votefmt	'D'	= 'Democrat'
			'R' = 'Republican'
			'N'	= 'Did/Will not vote'
			'O' = 'Neither'
			'C' = 'Constitution'
			'G' = 'Green'
			'U' = 'Undecided'
			'L' = 'Libertarian';

VALUE basisfmt 1 = 'Individual Candidate Credential'
			   2 = 'Party Preference'
			   3 = 'Neither';
 
RUN;
*----------------------------------------
*Formatting is done in data step. 
Pro: do not have to format in subsequent procedures. 
Con: print of data may be large.;
*----------------------------------------;
DATA politics1;
INFILE 'F:/SAS/politics.txt' DLM='09'x;
INPUT TYPE $ GENDER AGE PREF $ BASIS LAST $ NEXT $;
FORMAT GENDER sexfmt. AGE agefmt. PREF $votefmt. NEXT $votefmt. LAST $votefmt.;
RUN;
PROC PRINT DATA=politics1;
RUN;
*----------------------------------------
*Formatting is done in procedures. 
Pro: Use longer labels only when you need them. 
Con: Need multiple format statements.;
*----------------------------------------;
DATA politics2;
INFILE 'F:/SAS/politics.txt' DLM='09'x;
INPUT TYPE $ GENDER AGE PREF $ BASIS LAST $ NEXT $;
RUN;
PROC PRINT DATA=politics2;
FORMAT GENDER sexfmt. AGE agefmt. PREF $votefmt. NEXT $votefmt. LAST $votefmt.;
RUN;
*Are GENDER, AGE & PREF formatted as specified in PROC FORMAT?
*Are variables other than GENDER, AGE & PREF printed?;
PROC PRINT DATA=politics2;
RUN;
*Are GENDER, AGE & PREF formatted as specified in PROC FORMAT?
*Are variables other than GENDER, AGE & PREF printed?; 

* Question 7;
* it keeps these format we create in the Work.formats folder. 
* you can create more formats in a seperate proc format statement
* later on and it will add those formats to the other ones you 
* created.  Isn't that cool?!

data politics3;
INFILE 'F:/SAS/politics.txt' DLM='09'x;
INPUT TYPE $ GENDER AGE PREF $ BASIS LAST $ NEXT $;
run;

proc print data = politics3;
FORMAT BASIS basisfmt. GENDER sexfmt. AGE agefmt. PREF $votefmt. NEXT $votefmt. LAST $votefmt.;
run;

*--Additional Info 4--;
PATTERN VALUE=empty;
PROC GCHART DATA=politics3;
TITLE 'Dist. of Votes in Last Election';
VBAR last/TYPE=pct AXIS=0 TO 100 BY 10;  
*other type options are freq cfreq cpct;
BY gender;
RUN;
2

PATTERN VALUE=empty;
PROC GCHART DATA=politics3;
TITLE 'Dist. of Votes in Last Election';
HBAR last/GROUP=gender TYPE=PCT NOSTATS; 
RUN;
QUIT;

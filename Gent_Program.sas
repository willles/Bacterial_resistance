proc means data=work.import1;
var susceptible resistant intermediate;
run;

proc sgplot data=work.import1;
	vbar org / group = intermediate groupdisplay= stack datalabel stat = percent
		dataskin=matte;
	yaxis grid;
run;

proc sort data=work.import1 out=work.sorttemp;
	by org;
run;

proc print data=work.sorttemp label;
	by org;
	sum intermediate resistant susceptible;
run;

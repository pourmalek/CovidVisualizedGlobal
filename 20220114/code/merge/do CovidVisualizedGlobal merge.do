
clear all

cd "$pathCovidVisualizedGlobal"

cd merge

capture log close

log using "log CovidVisualizedGlobal merge.smcl", replace


***************************************************************************
* This is "do CovidVisualizedGlobal merge.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************




/* studies / models:
JOHN
DELP 
IHME
IMPE
LANL // The LANL COVID-19 Team made its last real-time forecast on September 27th, 2021. [for 20210926]. This is more than two weeks old and will not be used. 
SRIV
*/



set maxvar 10000 // Stata MP & SE



* JOHN

if regexm(c(os),"Mac") == 1 {

	use "$pathCovidVisualizedGlobal/JOHN/CovidVisualizedGlobal JOHN.dta", clear 
}
else if regexm(c(os),"Windows") == 1 use "$pathCovidVisualizedGlobal\JOHN\CovidVisualizedGlobal JOHN.dta", clear 



* DELP 

if regexm(c(os),"Mac") == 1 {

	merge 1:1 loc_grand_name date using "$pathCovidVisualizedGlobal/DELP/CovidVisualizedGlobal DELP.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\DELP\CovidVisualizedGlobal DELP.dta"

drop _merge



* IHME

if regexm(c(os),"Mac") == 1 {

	merge 1:1 loc_grand_name date using "$pathCovidVisualizedGlobal/IHME/CovidVisualizedGlobal IHME.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\IHME\CovidVisualizedGlobal IHME.dta"

drop _merge



* IMPE

if regexm(c(os),"Mac") == 1 {

	merge 1:1 loc_grand_name date using "$pathCovidVisualizedGlobal/IMPE/CovidVisualizedGlobal IMPE.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\IMPE\CovidVisualizedGlobal IMPE.dta"

drop _merge



/* LANL

if regexm(c(os),"Mac") == 1 {

	merge 1:1 loc_grand_name date using "$pathCovidVisualizedGlobal/LANL/CovidVisualizedGlobal LANL.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\LANL\CovidVisualizedGlobal LANL.dta"

drop _merge */


* SRIV



if regexm(c(os),"Mac") == 1 {

	merge 1:1 loc_grand_name date using "$pathCovidVisualizedGlobal/SRIV/CovidVisualizedGlobal SRIV.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\SRIV\CovidVisualizedGlobal SRIV.dta"

drop _merge



* 

label var loc_grand_name "Location"







*************************************

local list5 GLOBAL AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list5 {

	qui {

	* Cases or infections to deaths ratio
	
	
	gen DayCTDMeRaA00S00`region' =  DayCasMeRaA00S00`region' / DayDeaMeRaA00S00`region'
	
	label var DayCTDMeRaA00S00`region'  "Daily Cases to Deaths S0 JOHN"
	
	gen TotCTDMeRaA00S00`region' =  TotCasMeRaA00S00`region' / TotDeaMeRaA00S00`region'
	
	label var TotCTDMeRaA00S00`region'  "Total Cases to Deaths S0 JOHN"
	
	
	
	
	gen DayCTDMeRaA01S00`region' =  DayCasMeRaA01S00`region' / DayDeaMeRaA01S00`region'
	
	label var DayCTDMeRaA01S00`region'  "Daily Cases to Deaths S0 DELP"
	
	gen TotCTDMeRaA01S00`region' =  TotCasMeRaA01S00`region' / TotDeaMeRaA01S00`region'
	
	label var TotCTDMeRaA01S00`region'  "Total Cases to Deaths S0 DELP"  
	
	
	
	
	gen DayITDMeSmA02S01`region'  =  DayINFMeSmA02S01`region'  / DayDeaMeSmA02S01`region' 
	
	label var DayITDMeSmA02S01`region'   "Daily infections to Deaths S1 IHME"
	
	gen TotITDMeSmA02S01`region'  =  TotINFMeSmA02S01`region'  / TotDeaMeSmA02S01`region' 
	
	label var TotITDMeSmA02S01`region'   "Total infections to Deaths S1 IHME"
	
	
	
	
	gen DayITDMeSmA02S02`region' = DayINFMeSmA02S02`region' / DayDeaMeSmA02S02`region'  
	
	label var DayITDMeSmA02S02`region' "Daily infections to Deaths S2 IHME"
	
	gen TotITDMeSmA02S02`region' = TotINFMeSmA02S02`region' / TotDeaMeSmA02S02`region'  
	
	label var TotITDMeSmA02S02`region' "Total infections to Deaths S2 IHME"
	
	
	
	
	gen DayITDMeSmA02S03`region'  = DayINFMeSmA02S03`region'  / DayDeaMeSmA02S03`region'   
	
	label var DayITDMeSmA02S03`region'  "Daily infections to Deaths S3 IHME"
	
	gen TotITDMeSmA02S03`region'  = TotINFMeSmA02S03`region'  / TotDeaMeSmA02S03`region'   
	
	label var TotITDMeSmA02S03`region'  "Total infections to Deaths S3 IHME"
	
	
	
	
	gen DayITDMeRaA03S01`region'  = DayINFMeSmA03S01`region'  / DayDeaMeRaA03S01`region'   
	
	label var DayITDMeRaA03S01`region'  "Daily infections to Deaths S1 IMPE"
	
	gen TotITDMeRaA03S01`region'  = TotINFMeRaA03S01`region'  / TotDeaMeRaA03S01`region'   
	
	label var TotITDMeRaA03S01`region'  "Total infections to Deaths S1 IMPE"
	
	
	
	
	gen DayITDMeRaA03S02`region'  = DayINFMeSmA03S02`region'  / DayDeaMeRaA03S02`region'   
	
	label var DayITDMeRaA03S02`region'  "Daily infections to Deaths S2 IMPE"
	
	gen TotITDMeRaA03S02`region'  = TotINFMeRaA03S02`region'  / TotDeaMeRaA03S02`region'   
	
	label var TotITDMeRaA03S02`region'  "Total infections to Deaths S2 IMPE"
	
	
	
	
	gen DayITDMeRaA03S03`region'  = DayINFMeSmA03S03`region'  / DayDeaMeRaA03S03`region'   
	
	label var DayITDMeRaA03S03`region'  "Daily infections to Deaths S3 IMPE"
	
	gen TotITDMeRaA03S03`region'  = TotINFMeRaA03S03`region'  / TotDeaMeRaA03S03`region'   
	
	label var TotITDMeRaA03S03`region'  "Total infections to Deaths S3 IMPE"
	
	
	
	gen DayCTDMeRaA05S00`region'  = DayCasMeRaA05S00`region'  / DayDeaMeRaA05S00`region'   
	
	label var DayCTDMeRaA05S00`region'  "Daily Cases to Deaths S0 SRIV"
	
	gen TotCTDMeRaA05S00`region'  = TotCasMeRaA05S00`region'  / TotDeaMeRaA05S00`region'   
	
	label var TotCTDMeRaA05S00`region'  "Total Cases to Deaths S0 SRIV"
	
	
	
	
	***********************
	
	* daily deaths estimated to reported  
	
		
	gen DayDERMeRaA00S00`region' = DayDeaMeRaA00S00`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeRaA00S00`region' "Daily Deaths estim to reported JOHN = 1" 
	
	
	gen DayDERMeRaA01S00`region' = DayDeaMeRaA01S00`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeRaA01S00`region' "Daily Deaths estim to reported Mean DELP S0"
	
	
	gen DayDERMeSmA02S01`region' = DayDeaMeSmA02S01`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeSmA02S01`region' "Daily Deaths estim to reported Mean smoothed IHME S1"
	
	
	gen DayDERMeSmA02S02`region' = DayDeaMeSmA02S02`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeSmA02S02`region' "Daily Deaths estim to reported Mean smoothed IHME S2"
	
	
	gen DayDERMeSmA02S03`region' = DayDeaMeSmA02S03`region' / DayDeaMeSmA00S00`region'
	
	label var DayDERMeSmA02S03`region' "Daily Deaths estim to reported Mean smoothed IHME S3"
	
	
	gen DayDERMeRaA03S01`region' = DayDeaMeRaA03S01`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeRaA03S01`region' "Daily Deaths estim to reported Mean S1 IMPE"
	
	
	gen DayDERMeRaA03S02`region' = DayDeaMeRaA03S02`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeRaA03S02`region' "Daily Deaths estim to reported Mean S2 IMPE"
	
	
	gen DayDERMeRaA03S03`region' = DayDeaMeRaA03S03`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeRaA03S03`region' "Daily Deaths estim to reported Mean S3 IMPE"
	
	
	gen DayDERMeRaA05S00`region'  = DayDeaMeRaA05S00`region' / DayDeaMeRaA00S00`region'
	
	label var DayDERMeRaA05S00`region' "Daily Deaths estim to reported S0 SRIV"
	
	
	
	
	
	
	* daily cases or infections estimated, to reported cases 
	
	
	gen DayCERMeRaA00S00`region' = DayCasMeRaA00S00`region' / DayCasMeRaA00S00`region'
	
	label var DayCERMeRaA00S00`region' "Daily Cases estim to reported JOHN = 1" 
	
	
	gen DayCERMeRaA01S00`region' = DayCasMeRaA01S00`region' / DayCasMeRaA00S00`region'
	
	label var DayCERMeRaA01S00`region' "Daily Cases estim to reported Mean DELP S0"
	
	
	gen DayIERMeSmA02S01`region' = DayINFMeSmA02S01`region' / DayCasMeRaA00S00`region'
	
	label var DayIERMeSmA02S01`region' "Daily infections estim to reported cases Mean smoothed IHME S1"
	
	
	gen DayIERMeSmA02S02`region' = DayINFMeSmA02S02`region' / DayCasMeRaA00S00`region'
	
	label var DayIERMeSmA02S02`region' "Daily infections estim to reported cases Mean smoothed IHME S2"
	
	
	gen DayIERMeSmA02S03`region' = DayINFMeSmA02S03`region' / DayCasMeRaA00S00`region'
	
	label var DayIERMeSmA02S03`region' "Daily infections estim to reported cases Mean smoothed IHME S3"
	
	
	gen DayIERMeRaA03S01`region' = DayINFMeSmA03S01`region' / DayCasMeRaA00S00`region'
	
	label var DayIERMeRaA03S01`region' "Daily infections estim to reported cases Mean S1 IMPE"
	
	
	gen DayIERMeRaA03S02`region' = DayINFMeSmA03S02`region' / DayCasMeRaA00S00`region'
	
	label var DayIERMeRaA03S02`region' "Daily infections estim to reported cases Mean S2 IMPE"
	
	
	gen DayIERMeRaA03S03`region' = DayINFMeSmA03S03`region' / DayCasMeRaA00S00`region'
	
	label var DayIERMeRaA03S03`region' "Daily infections estim to reported cases Mean S3 IMPE"
	
	
	gen DayCERMeRaA05S00`region'  = DayCasMeRaA05S00`region' / DayCasMeRaA00S00`region'
	
	label var DayCERMeRaA05S00`region' "Daily Cases estim to reported S0 SRIV"
	
	
	
	
	
	
	* Total deaths estimated to reported  
	
	
	gen TotDERMeRaA00S00`region' = TotDeaMeRaA00S00`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeRaA00S00`region' "Total Deaths estim to reported JOHN = 1" 
	
	
	gen TotDERMeRaA01S00`region' = TotDeaMeRaA01S00`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeRaA01S00`region' "Total Deaths estim to reported Mean DELP S0"
	
	
	gen TotDERMeSmA02S01`region' = TotDeaMeSmA02S01`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeSmA02S01`region' "Total Deaths estim to reported Mean smoothed IHME S1"
	
	
	gen TotDERMeSmA02S02`region' = TotDeaMeSmA02S02`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeSmA02S02`region' "Total Deaths estim to reported Mean smoothed IHME S2"
	
	
	gen TotDERMeSmA02S03`region' = TotDeaMeSmA02S03`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeSmA02S03`region' "Total Deaths estim to reported Mean smoothed IHME S3"
	
	
	gen TotDERMeRaA03S01`region' = TotDeaMeRaA03S01`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeRaA03S01`region' "Total Deaths estim to reported Mean S1 IMPE"
	
	
	gen TotDERMeRaA03S02`region' = TotDeaMeRaA03S02`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeRaA03S02`region' "Total Deaths estim to reported Mean S2 IMPE"
	
	
	gen TotDERMeRaA03S03`region' = TotDeaMeRaA03S03`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeRaA03S03`region' "Total Deaths estim to reported Mean S3 IMPE"
	
	
	gen TotDERMeRaA05S00`region'  = TotDeaMeRaA05S00`region' / TotDeaMeRaA00S00`region'
	
	label var TotDERMeRaA05S00`region' "Total Deaths estim to reported S0 SRIV"
	
	
	
	
	
	
	* Total cases or infections estimated to reported  
	
	
	gen TotCERMeRaA00S00`region' = TotCasMeRaA00S00`region' / TotCasMeRaA00S00`region'
	
	label var TotCERMeRaA00S00`region' "Total Cases estim to reported JOHN = 1" 
	
	
	gen TotCERMeRaA01S00`region' = TotCasMeRaA01S00`region' / TotCasMeRaA00S00`region'
	
	label var TotCERMeRaA01S00`region' "Total Cases estim to reported Mean DELP S0"
	
	
	gen TotIERMeSmA02S01`region' = TotINFMeSmA02S01`region' / TotCasMeRaA00S00`region'
	
	label var TotIERMeSmA02S01`region' "Total infections estim to reported cases Mean smoothed IHME S1"
	
	
	gen TotIERMeSmA02S02`region' = TotINFMeSmA02S02`region' / TotCasMeRaA00S00`region'
	
	label var TotIERMeSmA02S02`region' "Total infections estim to reported cases Mean smoothed IHME S2"
	
	
	gen TotIERMeSmA02S03`region' = TotINFMeSmA02S03`region' / TotCasMeRaA00S00`region'
	
	label var TotIERMeSmA02S03`region' "Total infections estim to reported cases Mean smoothed IHME S3"
	
	
	gen TotIERMeRaA03S01`region' = TotINFMeRaA03S01`region' / TotCasMeRaA00S00`region'
	
	label var TotIERMeRaA03S01`region' "Total infections estim to reported cases Mean S1 IMPE"
	
	
	gen TotIERMeRaA03S02`region' = TotINFMeRaA03S02`region' / TotCasMeRaA00S00`region'
	
	label var TotIERMeRaA03S02`region' "Total infections estim to reported cases Mean S2 IMPE"
	
	
	gen TotIERMeRaA03S03`region' = TotINFMeRaA03S03`region' / TotCasMeRaA00S00`region'
	
	label var TotIERMeRaA03S03`region' "Total infections estim to reported cases Mean S3 IMPE"
	
	
	gen TotCERMeRaA05S00`region'  = TotCasMeRaA05S00`region' / TotCasMeRaA00S00`region'
	
	label var TotCERMeRaA05S00`region' "Total Cases estim to reported S0 SRIV"
	
	
	}
	
} 
*







sort date

save "CovidVisualizedGlobal merge.dta", replace


*


* gen calendar file


clear

di td(01jan2020) // 21915

di td(01jan2022) // 22646

di td(01jan2022) - td(01jan2020) // 731 + 1 = 732



set obs 732

gen date = .

replace date = 21915 in 1

replace date = date[_n-1] + 1 in 2/l

replace date = date[_n-1] + 1 in 2/732

format date %tdDDMonCCYY

codebook date


merge m:m date using "CovidVisualizedGlobal merge.dta"

sort date loc_grand_name

isid date loc_grand_name

drop _merge

qui compress


save "CovidVisualizedGlobal merge.dta", replace





*

di in red "********* Description of vars in this final file named CovidVisualizedGlobal merge.dta *********" 


desc, fullnames
 


 
***************

***************

* graphs 


grstyle init

grstyle color background white




**********

* gen monthspast vars for #thicknumber of graphs


summ date

gen mergemaxdate = r(max)


gen monthspast01jan2020merge = ((mergemaxdate - td(01jan2020)) / 30)

replace monthspast01jan2020merge = round(monthspast01jan2020merge)

global monthspast01jan2020merge = monthspast01jan2020merge

di $monthspast01jan2020merge



gen monthspast01jan2021merge = ((mergemaxdate - td(01jan2021)) / 30)

replace monthspast01jan2021merge = round(monthspast01jan2021merge)

global monthspast01jan2021merge = monthspast01jan2021merge

di $monthspast01jan2021merge



gen monthspast01jan2022merge = ((mergemaxdate - td(01jan2022)) / 30)

replace monthspast01jan2022merge = round(monthspast01jan2022merge)

global monthspast01jan2022merge = monthspast01jan2022merge

di $monthspast01jan2022merge





******************


local list5 GLOBAL AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list5 {



	******************
	
	* daily deaths (graph numbers start w/ 11)
	
	
	
	****
	* daily deaths, reference scenarios, all time
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 3 "DELP"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 4 "IHME"
	(line DayDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 5 "IMPE"
	(line DayDeaMeRaA05S00`region' date, sort lcolor(green)) /// 6 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IMPE" 6 "SRIV") size(small) row(2)) ///
	subtitle("  .", size(small) color(white)) 
	
	qui graph save "graph `region' 11a COVID-19 daily deaths, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 11a COVID-19 daily deaths, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	
	****
	* daily deaths, reference scenarios, all time, with IHME excess deaths
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 3 "DELP"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 4 "IHME"
	(line DayDeXMeSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 5 "IHME"
	(line DayDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 6 "IMPE"
	(line DayDeaMeRaA05S00`region' date, sort lcolor(green)) /// 7 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IHME excess" 6 "IMPE" 7 "SRIV") size(small) row(2)) ///
	subtitle("  .", size(small) color(white)) 
	
	qui graph save "graph `region' 11b COVID-19 daily deaths, `region', reference scenarios, all time with IHME excess deaths.gph", replace
	qui graph export "graph `region' 11b COVID-19 daily deaths, `region', reference scenarios, all time with IHME excess deaths.pdf", replace
	
	
	
	
	****
	* daily deaths, reference scenarios, 2021
	
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 3 "DELP"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 4 "IHME"
	(line DayDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 5 "IMPE"
	(line DayDeaMeRaA05S00`region' date, sort lcolor(green)) /// 6 "SRIV"
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IMPE" 6 "SRIV") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small))
	
	qui graph save "graph `region' 12a COVID-19 daily deaths, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 12a COVID-19 daily deaths, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* daily deaths, reference scenarios, 2021
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 3 "DELP"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 4 "IHME"
	(line DayDeXMeSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 5 "IHME"
	(line DayDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 6 "IMPE"
	(line DayDeaMeRaA05S00`region' date, sort lcolor(green)) /// 7 "SRIV"
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IHME excess" 6 "IMPE" 7 "SRIV") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small))
	
	qui graph save "graph `region' 12b COVID-19 daily deaths, `region', reference scenarios, 2021 with IHME excess deaths.gph", replace
	qui graph export "graph `region' 12b COVID-19 daily deaths, `region', reference scenarios, 2021 with IHME excess deaths.pdf", replace
	
	
	
	
	
	****
	* daily deaths, reference scenarios, 2021, uncertainty
	
	twoway ///
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP" mean
	(line DayDeaLoRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 3 "DELP" lower
	(line DayDeaUpRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 4 "DELP" upper
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 5 IHME mean
	(line DayDeaLoSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
	(line DayDeaUpSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
	(line DayDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 8 IMPE mean
	(line DayDeaLoRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
	(line DayDeaUpRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
	(line DayDeaMeRaA05S00`region' date, sort lcolor(green)) /// 11 "SRIV" mean
	(line DayDeaLoRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
	(line DayDeaUpRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "SRIV") size(small) row(2)) ///
	subtitle("after 2021-01-01, w/ uncertainty", size(small)) ///
	note("Uncertainty limits: dashed curves") 
	
	qui graph save "graph `region' 13 COVID-19 daily deaths, `region', reference scenarios, 2021, uncertainty.gph", replace
	qui graph export "graph `region' 13 COVID-19 daily deaths, `region', reference scenarios, 2021, uncertainty.pdf", replace
	
	
	
	
	****
	* daily deaths, 3 scenarios, 2021
	
	twoway ///
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP" mean
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 IHME mean, reference scenario
	(line DayDeaMeSmA02S02`region' date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 4 IHME mean, better scenario
	(line DayDeaMeSmA02S03`region' date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 5 IHME mean, worse scenario
	(line DayDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 6 IMPE mean, reference scenario
	(line DayDeaMeRaA03S01`region' date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 7 IMPE mean, better scenario
	(line DayDeaMeRaA03S03`region' date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 8 IMPE mean, worse scenario
	(line DayDeaMeRaA05S00`region' date, sort lcolor(green)) /// 9 "SRIV" mean
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN smooth" 2 "DELP" 3 "IHME" 6 "IMPE" 9 "SRIV") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) ///
	note("Better and worse scenarios: tight dot (|||||) curves; IHME and IMPE") 
	
	qui graph save "graph `region' 14 COVID-19 daily deaths, `region', 3 scenarios, 2021.gph", replace
	qui graph export "graph `region' 14 COVID-19 daily deaths, `region', 3 scenarios, 2021.pdf", replace
	
	
	
	
	****
	* daily deaths, reference scenario, uncertainty, 2021, IHME 
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 IHME reference mean
	(line DayDeaLoSmA02S01`region' date, sort lcolor(green) lpattern(dash)) /// 4 IHME reference lower
	(line DayDeaUpSmA02S01`region' date, sort lcolor(red) lpattern(dash)) /// 5 IHME reference upper
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenario w/ uncertainty, IHME", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IHME mean" 4 "IHME lower" ///
	5 "IHME upper") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) ///
	note("Uncertainty limits: dashed (– – –) curves")
	
	qui graph save "graph `region' 15 COVID-19 daily deaths, `region', reference scenario, uncertainty, 2021, IHME.gph", replace
	qui graph export "graph `region' 15 COVID-19 daily deaths, `region', reference scenario, uncertainty, 2021, IHME.pdf", replace
	
	
	
	
	****
	* daily deaths, 3 scenarios, uncertainty, 2021, IHME 
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 IHME reference mean
	(line DayDeaMeSmA02S02`region' date, sort lcolor(green) lwidth(thick) lpattern(tight_dot)) /// 4 IHME best mean
	(line DayDeaMeSmA02S03`region' date, sort lcolor(red) lwidth(thick) lpattern(tight_dot)) /// 5 IHME worse mean
	(line DayDeaUpSmA02S03`region' date, sort lcolor(red) lpattern(dash)) /// 6 IHME worse upper
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', 3 scenarios, IHME", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IHME reference" 4 " IHME best" ///
	5 "IHME worse" 6 "IHME worse upper") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) ///
	note("Better and worse scenarios: tight dot (|||||) curves; Uncertainty limits: dashed (– – –) curves") 
	
	qui graph save "graph `region' 16 COVID-19 daily deaths, `region', 3 scenarios, uncertainty, 2021, IHME.gph", replace
	qui graph export "graph `region' 16 COVID-19 daily deaths, `region', 3 scenarios, uncertainty, 2021, IHME.pdf", replace
	
	
	
	
	****
	* daily deaths, reference scenario, uncertainty, 2021, IMPE 
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeRaA03S02`region' date, sort lcolor(black)) /// 3 IMPE reference mean
	(line DayDeaLoRaA03S02`region' date, sort lcolor(green) lpattern(dash)) /// 4 IMPE reference lower
	(line DayDeaUpRaA03S02`region' date, sort lcolor(red) lpattern(dash)) /// 5 IMPE reference upper
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', reference scenario w/ uncertainty, IMPE", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IMPE mean" 4 "IMPE lower" 5 "IMPE upper") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) ///
	note("Uncertainty limits: dashed (– – –) curves") 
	
	qui graph save "graph `region' 17 COVID-19 daily deaths, `region', reference scenario, uncertainty, 2021, IMPE.gph", replace
	qui graph export "graph `region' 17 COVID-19 daily deaths, `region', reference scenario, uncertainty, 2021, IMPE.pdf", replace
	
	
	
	
	****
	* daily deaths, 3 scenarios, uncertainty, 2021, IMPE 
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
	(line DayDeaMeRaA03S02`region' date, sort lcolor(black)) /// 3 IMPE reference mean
	(line DayDeaMeRaA03S01`region' date, sort lcolor(green) lwidth(thick) lpattern(tight_dot)) /// 4 IMPE better mean
	(line DayDeaMeRaA03S03`region' date, sort lcolor(red) lwidth(thick) lpattern(tight_dot)) /// 5 IMPE worse mean
	(line DayDeaUpRaA03S03`region' date, sort lcolor(red) lpattern(dash)) /// 6 IMPE worse upper
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', 3 scenarios, IMPE", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IMPE reference" 4 "IMPE better" 5 "IMPE worse" ///
	6 "IMPE worse upper") size(small) row(3)) ///
	subtitle("after 2021-01-01", size(small)) ///
	note("Better and worse scenarios: tight dot (|||||) curves; Uncertainty limits: dashed (– – –) curves") 
	
	qui graph save "graph `region' 18 COVID-19 daily deaths, `region', 3 scenarios, uncertainty, 2021, IMPE.gph", replace
	qui graph export "graph `region' 18 COVID-19 daily deaths, `region', 3 scenarios, uncertainty, 2021, IMPE.pdf", replace
	
	
	
	
	***********************
	
	* Daily cases or infections (graph numbers start w/ 21)
	
	
	
	****
	* daily cases or infections, reference scenarios, all time
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN raw"
	(line DayCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayINFMeSmA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayCasMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases" ) size(small) row(2)) ///
	subtitle("  .", size(small) color(white)) 
	
	qui graph save "graph `region' 21 COVID-19 daily cases, `region', reference scenarios.gph", replace
	qui graph export "graph `region' 21 COVID-19 daily cases, `region', reference scenarios.pdf", replace
	
	
	
	
	****
	* daily cases or infections, reference scenarios, 2021
	
	twoway ///
	(line DayCasMeRaA00S00`region' date, sort lcolor(cyan*1.2)) /// 1 "JOHN"
	(line DayCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayINFMeSmA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayCasMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases" ) size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) 
	
	qui graph save "graph `region' 22 COVID-19 daily cases, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 22 COVID-19 daily cases, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* daily cases, reference scenarios, 2021
	
	twoway ///
	(line DayCasMeRaA00S00`region' date, sort lcolor(cyan) lwidth(medium)) /// 1 "JOHN"
	(line DayCasMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN"
	(line DayCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayCasMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases) title("COVID-19 daily cases, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases raw" 2 "JOHN cases smooth" 3 "DELP cases" 4 "SRIV cases") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) 
	
	qui graph save "graph `region' 22b COVID-19 daily cases, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 22b COVID-19 daily cases, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* daily cases or infections, reference scenario, 2021, uncertainty 
	
	twoway ///
	(line DayCasMeSmA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
	(line DayCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 DELP mean
	(line DayCasLoRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
	(line DayCasUpRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) /// 5 IHME mean
	(line DayINFLoSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
	(line DayINFUpSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
	(line DayINFMeSmA03S02`region' date, sort lcolor(magenta)) /// 8 IMPE mean
	(line DayINFLoRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
	(line DayINFUpRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
	(line DayCasMeRaA05S00`region' date, sort lcolor(green)) /// 11 "SRIV" mean
	(line DayCasLoRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
	(line DayCasUpRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 5 "IHME infections" 8 ///
	"IMPE infections" 11 "SRIV cases") size(small) row(2)) ///
	note("Uncertainty limits: dashed curves") ///
	subtitle("after 2021-01-01, w/ uncertainty", size(small))
	
	qui graph save "graph `region' 23 COVID-19 daily cases, `region', reference scenarios, 2021, uncertainty.gph", replace
	qui graph export "graph `region' 23 COVID-19 daily cases, `region', reference scenarios, 2021, uncertainty.pdf", replace
	
	
	
	
	****
	* daily cases or infections, 3 scenarios, 2021
	
	twoway ///
	(line DayCasMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
	(line DayCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP" mean
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) /// 3 IHME mean, reference scenario
	(line DayINFMeSmA02S02`region' date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 4 IHME mean, better scenario
	(line DayINFMeSmA02S03`region' date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 5 IHME mean, worse scenario
	(line DayINFMeSmA03S02`region' date, sort lcolor(magenta)) /// 6 IMPE mean, reference scenario
	(line DayINFMeSmA03S01`region' date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 7 IMPE mean, better scenario
	(line DayINFMeSmA03S03`region' date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 8 IMPE mean, worse scenario
	(line DayCasMeRaA05S00`region' date, sort lcolor(green)) /// 9 "SRIV" mean
	if date >= td(01jan2021)  ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, `region', 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 6 ///
	"IMPE infections" 9 "SRIV cases") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small)) ///
	note("Better and worse scenarios: tight dot (|||||) curves; IHME and IMPE") 
	
	qui graph save "graph `region' 24 COVID-19 daily cases, `region', 3 scenarios, 2021, uncertainty.gph", replace
	qui graph export "graph `region' 24 COVID-19 daily cases, `region', 3 scenarios, 2021, uncertainty.pdf", replace
	
	
	
	
	
	
	
	****
	* daily estimated infections to reported cases IHME, IMPE, all time
	
	
	gen DayITCMeSmA02S01`region' =  DayINFMeSmA02S01`region' / DayCasMeRaA00S00`region'
	
	label var DayITCMeSmA02S01`region'  "Daily Infections IHME to cases JOHN"
	
	gen DayITCMeRaA03S02`region' =  DayINFMeSmA03S02`region' / DayCasMeRaA00S00`region'
	
	label var DayITCMeRaA03S02`region'  "Daily Infections IMPE to cases JOHN"
	
	
	twoway ///
	(line DayITCMeSmA02S01`region' date, sort lcolor(black)) /// 1 "IHME"
	(line DayITCMeRaA03S02`region' date, sort lcolor(magenta)) /// 2 "IMPE"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily estimated infections to reported cases) title("COVID-19 daily estimated infections to reported cases, `region'", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "IHME" 2 "IMPE" 3) size(small) row(1)) ///
	subtitle("reference scenarios", size(small)) 
	
	qui graph save "graph `region' 25 C19 daily estimated infections to reported cases, `region', reference scenarios.gph", replace
	qui graph export "graph `region' 25 C19 daily estimated infections to reported cases, `region', reference scenarios.pdf", replace
	
	
	
	
	****
	* daily estimated infections to reported cases IHME, IMPE, 2021
	
	
	* smooth Infections to cases ratio of IHME and IMPE
	
	capture drop loc_grand_name_encoded
	
	encode loc_grand_name, generate(loc_grand_name_encoded)
	
	tsset date loc_grand_name_encoded, daily   
	
	
	foreach var of varlist ///
	DayITCMeSmA02S01`region' DayITCMeRaA03S02`region' {
	
	
	tssmooth ma `var'_w = `var', window(3 1 3) // _w = _window
	
	tssmooth ma `var'sm = `var'_w, weights( 1 2 3 <4> 3 2 1) replace
	
	drop `var'_w
	
	}
	*
	
	tsset, clear
	
	ssc install labutil2
	
	labvars DayITCMeSmA02S01`region'sm DayITCMeRaA03S02`region'sm ,names
	
			  
	qui summ DayITCMeSmA02S01`region'sm if date >= td(01jan2021) , detail
	
	gen DayITCMeSmA02S01`region'sm_m = r(p50) // _m = _median
	
	replace DayITCMeSmA02S01`region'sm_m = round(DayITCMeSmA02S01`region'sm_m)
	
	local DayITCMeSmA02S01`region'sm_m = DayITCMeSmA02S01`region'sm_m
	
	
	qui summ DayITCMeRaA03S02`region'sm if date >= td(01jan2021) , detail
	
	gen DayITCMeRaA03S02`region'sm_m = r(p50)
	
	replace DayITCMeRaA03S02`region'sm_m = round(DayITCMeRaA03S02`region'sm_m)
	
	local DayITCMeRaA03S02`region'sm_m = DayITCMeRaA03S02`region'sm_m
	
	twoway ///
	(line DayITCMeSmA02S01`region' date, sort lcolor(black*0.2)) /// 1 "IHME"
	(line DayITCMeRaA03S02`region' date, sort lcolor(magenta*0.2)) /// 2 "IMPE"
	(line DayITCMeSmA02S01`region'sm date, sort lcolor(black) lwidth(medthick)) /// 3 "IHME"
	(line DayITCMeRaA03S02`region'sm date, sort lcolor(magenta) lwidth(medthick)) /// 4 "IMPE"
	(line DayITCMeSmA02S01`region'sm_m date, sort lcolor(black) lwidth(thin) lpattern(dash)) /// 5 "IHME"
	(line DayITCMeRaA03S02`region'sm_m date, sort lcolor(magenta) lwidth(thin) lpattern(dash)) /// 6 "IMPE"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily estimated infections to reported cases) title("COVID-19 daily estimated infections to reported cases, `region'", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "IHME" 2 "IMPE" 3 "IHME smooth" 4 "IMPE smooth" 5 "IHME smooth meadian" 6 "IMPE smooth meadian") size(small) row(2)) ///
	subtitle("reference scenarios", size(small)) ///
	note("IHME smooth median 2021 on = `DayITCMeSmA02S01`region'sm_m'; IMPE smooth median 2021 on = `DayITCMeRaA03S02`region'sm_m'")
	
	qui graph save "graph `region' 26 C19 daily estimated infections to reported cases, `region', reference scenarios 2021.gph", replace
	qui graph export "graph `region' 26 C19 daily estimated infections to reported cases, `region', reference scenarios 2021.pdf", replace
	
	
	
	
	
	
	
	
	
	
	
	*****************
	
	* total deaths (graph numbers start w/ 31)
	
	
	****
	* total deaths, reference scenarios, all time
	
	twoway ///
	(line TotDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotDeaMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotDeaMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
	subtitle("  .", size(small) color(white))
	
	qui graph save "graph `region' 31a COVID-19 total deaths, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 31a COVID-19 total deaths, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	
	****
	* total deaths, reference scenarios, all time, with IHME excess mortality 
	
	twoway ///
	(line TotDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotDeaMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotDeXMeSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 4 "IHME"
	(line TotDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 5 "IMPE"
	(line TotDeaMeRaA05S00`region' date, sort lcolor(green)) /// 6 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IHME excess" 5 "IMPE" 6 "SRIV") size(small) row(2)) ///
	subtitle("  .", size(small) color(white))
	
	qui graph save "graph `region' 31b COVID-19 total deaths, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 31b COVID-19 total deaths, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	
	
	****
	* total deaths, reference scenarios, 2021
	
	twoway ///
	(line TotDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotDeaMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotDeaMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
	subtitle("after 2021-01-01", size(small))
	
	qui graph save "graph `region' 32 COVID-19 total deaths, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 32 COVID-19 total deaths, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* total deaths, reference scenarios, 2021, uncertainty 
	
	twoway ///
	(line TotDeaMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
	(line TotDeaMeRaA01S00`region' date, sort lcolor(red)) /// 2 DELP mean
	(line TotDeaLoRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
	(line TotDeaUpRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) /// 5 IHME mean
	(line TotDeaLoSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
	(line TotDeaUpSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
	(line TotDeaMeRaA03S02`region' date, sort lcolor(magenta)) /// 8 IMPE mean
	(line TotDeaLoRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
	(line TotDeaUpRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
	(line TotDeaMeRaA05S00`region' date, sort lcolor(green)) /// 11 "SRIV" mean
	(line TotDeaLoRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
	(line TotDeaUpRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "SRIV") size(small) row(1)) ///
	note("Uncertainty limits: dashed curves") ///
	subtitle("after 2021-01-01, w/ uncertainty", size(small))
	
	qui graph save "graph `region' 33 COVID-19 total deaths, `region', reference scenarios, 2021, uncertainty.gph", replace
	qui graph export "graph `region' 33 COVID-19 total deaths, `region', reference scenarios, 2021, uncertainty.pdf", replace
	
	
	
	
	
	*****************
	
	* total cases or infections (graph numbers start w/ 41)
	
	
	
	****
	* total cases or infections, reference scenarios, all time
	
	twoway ///
	(line TotCasMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotINFMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotINFMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotCasMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases or infections) title("COVID-19 total cases or infections, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("  .", size(small) color(white))
	
	qui graph save "graph `region' 41 COVID-19 total cases, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 41 COVID-19 total cases, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* total cases or infections, reference scenarios, 2021
	
	twoway ///
	(line TotCasMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotINFMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotINFMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotCasMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases or infections) title("COVID-19 total cases or infections, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("after 2021-01-01", size(small))
	
	qui graph save "graph `region' 42 COVID-19 total cases, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 42 COVID-19 total cases, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* total cases or infections, reference scenarios, 2021, uncertainty
	
	twoway ///
	(line TotCasMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
	(line TotCasMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotCasLoRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 3 "DELP"
	(line TotCasUpRaA01S00`region' date, sort lcolor(red) lpattern(dash)) /// 4 "DELP"
	(line TotINFMeSmA02S01`region' date, sort lcolor(black)) /// 5 IHME mean
	(line TotINFLoSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
	(line TotINFUpSmA02S01`region' date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
	(line TotINFMeRaA03S02`region' date, sort lcolor(magenta)) /// 8 IMPE mean
	(line TotINFLoRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
	(line TotINFUpRaA03S02`region' date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
	(line TotCasMeRaA05S00`region' date, sort lcolor(green)) /// 11 "SRIV" mean
	(line TotCasMeRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
	(line TotCasMeRaA05S00`region' date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases or infections) title("COVID-19 total cases or infections, `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 5 "IHME infections" 8 "IMPE infections" ///
	11 "SRIV cases") size(small) row(2)) ///
	note("Uncertainty limits: dashed curves") ///
	subtitle("after 2021-01-01, w/ uncertainty", size(small))
	
	qui graph save "graph `region' 43 COVID-19 total cases, `region', reference scenarios, 2021, uncertainty.gph", replace
	qui graph export "graph `region' 43 COVID-19 total cases, `region', reference scenarios, 2021, uncertainty.pdf", replace
	
	
	
	
	************************
	
	* other outcomes (graph numbers start w/ 61)
	
	****
	* daily hospital-related outcomes
	
	twoway ///
	(line DayHosMeRaA01S00`region' date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
	(line DayVenMeRaA01S00`region' date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
	(line DayBedMeSmA02S01`region' date, sort lcolor(black)) /// 3 IHME Bed need (Daily Beds needed Mean IHME S1)
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) /// 4 IHME ICU need (Daily ICU beds needed Mean IHME S1)
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
	(line DayHodMeRaA03S01`region' date, sort lcolor(magenta)) /// 6 IMPE Hosp demand (Daily hospital demand Mean A03 S01`region' )
	(line DayHoiMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash)) /// 7 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01`region' )
	(line DayIcdMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash_dot)) /// 8 IMPE ICU demand (Daily ICU demand Mean A03 S01`region' )
	(line DayIciMeRaA03S01`region' date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 9 IMPE ICU incidence (Daily ICU incidence Mean A03 S01`region' )
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME Bed need" 4 "IHME ICU need" ///
	5 "IHME Admissions" 6 "IMPE Hosp demand" ///
	7 "IMPE Hosp incidence" 8 "IMPE ICU demand" 9 "IMPE ICU incidence") rows(4) size(small)) ///
	subtitle("  .", size(small) color(white))
	
	* ICU new of IHME retired
	
	qui graph save "graph `region' 61a COVID-19 hospital-related outcomes.gph", replace
	qui graph export "graph `region' 61a COVID-19 hospital-related outcomes.pdf", replace
	
	
	
	****
	* daily hospital-related outcomes, with IHME bed capcity
	
	twoway ///
	(line DayHosMeRaA01S00`region' date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
	(line DayVenMeRaA01S00`region' date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
	(line DayBedMeSmA02S01`region' date, sort lcolor(black)) /// 3 IHME Bed need (Daily Beds needed Mean IHME S1)
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) /// 4 IHME ICU need (Daily ICU beds needed Mean IHME S1)
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
	(line DayHodMeRaA03S01`region' date, sort lcolor(magenta)) /// 6 IMPE Hosp demand (Daily hospital demand Mean A03 S01`region' )
	(line DayHoiMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash)) /// 7 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01`region' )
	(line DayIcdMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash_dot)) /// 8 IMPE ICU demand (Daily ICU demand Mean A03 S01`region' )
	(line DayIciMeRaA03S01`region' date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 9 IMPE ICU incidence (Daily ICU incidence Mean A03 S01`region' )
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME Bed need" 4 "IHME ICU need" ///
	5 "IHME Admissions" 6 "IMPE Hosp demand" ///
	7 "IMPE Hosp incidence" 8 "IMPE ICU demand" 9 "IMPE ICU incidence") rows(5) size(small)) ///
	subtitle("  .", size(small) color(white))
	
	* ICU new of IHME retired
	
	qui graph save "graph `region' 61b COVID-19 hospital-related outcomes with bed capcity.gph", replace
	qui graph export "graph `region' 61b COVID-19 hospital-related outcomes with bed capcity.pdf", replace
	
	
	
	****
	* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand, with IHME ICU bed capcity
	
	twoway ///
	(line DayHosMeRaA01S00`region' date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
	(line DayVenMeRaA01S00`region' date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
	(line DayHoiMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash)) /// 5 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01`region' )
	(line DayIcdMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash_dot)) /// 6 IMPE ICU demand (Daily ICU demand Mean A03 S01`region' )
	(line DayIciMeRaA03S01`region' date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 7 IMPE ICU incidence (Daily ICU incidence Mean A03 S01`region' )
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
	4 "IHME Admissions" 5 "IMPE Hosp incidence" 6 "IMPE ICU demand" 7 "IMPE ICU incidence") rows(3) size(small)) ///
	subtitle("without IHME Bed need, IMPE Hosp demand", size(small))
	
	qui graph save "graph `region' 62a COVID-19 hospital-related outcomes, wo extremes.gph", replace
	qui graph export "graph `region' 62a COVID-19 hospital-related outcomes, wo extremes.pdf", replace
	
	
	
	
	****
	* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand
	
	twoway ///
	(line DayHosMeRaA01S00`region' date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
	(line DayVenMeRaA01S00`region' date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
	(line DayHoiMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash)) /// 5 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01`region' )
	(line DayIcdMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash_dot)) /// 6 IMPE ICU demand (Daily ICU demand Mean A03 S01`region' )
	(line DayIciMeRaA03S01`region' date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 7 IMPE ICU incidence (Daily ICU incidence Mean A03 S01`region' )
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
	4 "IHME Admissions" 5 "IMPE Hosp incidence" 6 "IMPE ICU demand" 7 "IMPE ICU incidence") rows(4) size(small)) ///
	subtitle("without IHME Bed need, IMPE Hosp demand", size(small))
	
	qui graph save "graph `region' 62b COVID-19 hospital-related outcomes, wo extremes ICU bed capcity.gph", replace
	qui graph export "graph `region' 62b COVID-19 hospital-related outcomes, wo extremes ICU bed capcity.pdf", replace
	
	
	
	
	****
	* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand, 2021
	
	twoway ///
	(line DayHosMeRaA01S00`region' date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
	(line DayVenMeRaA01S00`region' date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
	(line DayHoiMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash)) /// 5 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01`region' )
	(line DayIcdMeRaA03S01`region' date, sort lcolor(magenta) lpattern(dash_dot)) /// 6 IMPE ICU demand (Daily ICU demand Mean A03 S01`region' )
	(line DayIciMeRaA03S01`region' date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 7 IMPE ICU incidence (Daily ICU incidence Mean A03 S01`region' )
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes `region', reference scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
	4 "IHME Admissions" 5 "IMPE Hosp incidence" 6 "IMPE ICU demand" 7 "IMPE ICU incidence") rows(3) size(small)) ///
	subtitle("after 2021-01-01, without IHME Bed need, IMPE Hosp demand", size(small))
	
	qui graph save "graph `region' 63 COVID-19 hospital-related outcomes, wo extremes, 2021.gph", replace
	qui graph export "graph `region' 63 COVID-19 hospital-related outcomes, wo extremes, 2021.pdf", replace
	
	
	
	*******************************
	
	* daily cases or infections to deaths (CTD) (graph numbers start w/ 71)
	
	
	
	****
	* Daily cases or infections to deaths (CTD) all studies, reference scenarios, all time
	
	twoway ///
	(line DayCTDMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line DayCTDMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayITDMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayITDMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayCTDMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("daily cases or infections to deaths", size(small))
	
	qui graph save "graph `region' 71 COVID-19 daily cases to deaths, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 71 COVID-19 daily cases to deaths, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* Daily cases or infections to deaths (CTD) all studies, reference scenarios, 2021
	
	twoway ///
	(line DayCTDMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line DayCTDMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayITDMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayITDMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayCTDMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("daily cases or infections to deaths; after 2021-01-01", size(small))
	
	qui graph save "graph `region' 72 COVID-19 daily cases to deaths, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 72 COVID-19 daily cases to deaths, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* Total cases or infections to deaths (CTD) all studies, reference scenarios, all time
	
	twoway ///
	(line TotCTDMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotCTDMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotITDMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotITDMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotCTDMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases to deaths) title("COVID-19 total cases to deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("daily cases or infections to deaths", size(small))
	
	qui graph save "graph `region' 73 COVID-19 total cases to deaths, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 73 COVID-19 total cases to deaths, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* Total cases or infections to deaths (CTD) all studies, reference scenarios, 2021
	
	twoway ///
	(line TotCTDMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotCTDMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotITDMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotITDMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotCTDMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases to deaths) title("COVID-19 total cases to deaths, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("daily cases or infections to deaths; after 2021-01-01", size(small))
	
	qui graph save "graph `region' 74 COVID-19 total cases to deaths, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 74 COVID-19 total cases to deaths, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	*******************************
	
	*  estimated to reported (graph numbers start w/ 81)
	
	
	* daily deaths estimated to reported  
	
	
	
	****
	* daily deaths estimated to reported (DER) all studies, reference scenarios, all time
	
	twoway ///
	(line DayDERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line DayDERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayDERMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayDERMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayDERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
	subtitle("  .", size(small) color(white)) yscale(titlegap(2))
	
	qui graph save "graph `region' 81 COVID-19 daily deaths estimated to reported, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 81 COVID-19 daily deaths estimated to reported, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* daily deaths estimated to reported (DER) all studies, reference scenarios, 2021
	
	twoway ///
	(line DayDERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line DayDERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayDERMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayDERMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayDERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
	subtitle("  .", size(small) color(white)) yscale(titlegap(2))
	
	qui graph save "graph `region' 82 COVID-19 daily deaths estimated to reported, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 82 COVID-19 daily deaths estimated to reported, `region', reference scenarios, 2021.pdf", replace
	
	
	
	* daily cases or infections estimated to reported cases
	
	
	
	****
	* daily cases or infections estimated to reported cases all studies, reference scenarios, all time
	
	twoway ///
	(line DayCERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line DayCERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayITDMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayITDMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayCERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("daily cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))
	
	qui graph save "graph `region' 83 COVID-19 daily cases estimated to reported, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 83 COVID-19 daily cases estimated to reported, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* daily cases or infections estimated to reported cases all studies, reference scenarios, 2021
	
	twoway ///
	(line DayCERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line DayCERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line DayITDMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line DayITDMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line DayCERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
	5 "SRIV cases") size(small) row(2)) ///
	subtitle("daily cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))
	
	qui graph save "graph `region' 84 COVID-19 daily cases estimated to reported, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 84 COVID-19 daily cases estimated to reported, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* total deaths estimated to reported (DER) all studies, reference scenarios, all time
	
	twoway ///
	(line TotDERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN
	(line TotDERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotDERMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotDERMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotDERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
	subtitle("  .", size(small) color(white)) yscale(titlegap(2))
	
	qui graph save "graph `region' 85 COVID-19 total deaths estimated to reported, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 85 COVID-19 total deaths estimated to reported, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* total deaths estimated to reported (DER) all studies, reference scenarios, 2021
	
	twoway ///
	(line TotDERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN
	(line TotDERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotDERMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotDERMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotDERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
	subtitle("  .", size(small) color(white)) yscale(titlegap(2))
	
	qui graph save "graph `region' 86 COVID-19 total deaths estimated to reported, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 86 COVID-19 total deaths estimated to reported, `region', reference scenarios, 2021.pdf", replace
	
	
	
	
	****
	* total cases or infections estimated to reported cases all studies, reference scenarios, all time
	
	twoway ///
	(line TotCERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotCERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotIERMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotIERMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotCERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" 5 "SRIV cases") size(small) row(2)) ///
	subtitle("total cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))
	
	qui graph save "graph `region' 87 COVID-19 total cases estimated to reported, `region', reference scenarios, all time.gph", replace
	qui graph export "graph `region' 87 COVID-19 total cases estimated to reported, `region', reference scenarios, all time.pdf", replace
	
	
	
	
	****
	* total cases or infections estimated to reported cases all studies, reference scenarios, 2021
	
	twoway ///
	(line TotCERMeRaA00S00`region' date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
	(line TotCERMeRaA01S00`region' date, sort lcolor(red)) /// 2 "DELP"
	(line TotIERMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	(line TotIERMeRaA03S02`region' date, sort lcolor(magenta)) /// 4 "IMPE"
	(line TotCERMeRaA05S00`region' date, sort lcolor(green)) /// 5 "SRIV"
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, `region', reference scenarios", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" 5 "SRIV cases") size(small) row(2)) ///
	subtitle("total cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))
	
	qui graph save "graph `region' 88 COVID-19 total cases estimated to reported, `region', reference scenarios, 2021.gph", replace
	qui graph export "graph `region' 88 COVID-19 total cases estimated to reported, `region', reference scenarios, 2021.pdf", replace
	
	***
	
	
	
	* IHME graphs

	
	
	* daily mask use Percent of population reporting always wearing a mask when leaving home
	
	twoway ///
	(line mask_use_mean_A02S02`region' date, sort lcolor(green)) ///
	(line mask_use_mean_A02S03`region' date, sort lcolor(red)) ///
	(line mask_use_mean_A02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily mask use) title("COVID-19 daily mask use, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1)) ///
	subtitle(Proportion of population reporting always wearing a mask when leaving home, size(small))
	
	qui graph save "graph `region' 93 COVID-19 daily mask_use, `region', 3 scenarios.gph", replace
	qui graph export "graph `region' 93 COVID-19 daily mask_use, `region', 3 scenarios.pdf", replace
	
	
}
*




*************************
	
* GLOBAL only


	
* daily Infection outcomes ratios, 3 scenarios 
  
twoway ///
(line InfDetectA02S01GLOBAL date, sort lcolor(green)) ///
(line InfHospitA02S01GLOBAL date, sort lcolor(black)) ///
(line InfFatalA02S01GLOBAL date, sort lcolor(red)) ///
(line InfDetectA02S02GLOBAL date, sort lcolor(green) lpattern(dash)) ///
(line InfHospitA02S02GLOBAL date, sort lcolor(black) lpattern(dash)) ///
(line InfFatalA02S02GLOBAL date, sort lcolor(red) lpattern(dash)) ///
(line InfDetectA02S03GLOBAL date, sort lcolor(green) lpattern(dash)) ///
(line InfHospitA02S03GLOBAL date, sort lcolor(black) lpattern(dash)) ///
(line InfFatalA02S03GLOBAL date, sort lcolor(red) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, GLOBAL, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2)) ///
note("Better and worse scenarios: dashed curves")

qui graph save "graph GLOBAL 91 COVID-19 daily Infection outcomes ratios, GLOBAL 3 scenarios, IHME.gph", replace
qui graph export "graph GLOBAL 91 COVID-19 daily Infection outcomes ratios, GLOBAL 3 scenarios, IHME.pdf", replace




	
* daily Infection outcomes (hospitalizationratios, fatality), 3 scenarios 
  
twoway ///
(line InfHospitA02S01GLOBAL date, sort lcolor(black)) ///
(line InfFatalA02S01GLOBAL date, sort lcolor(red)) ///
(line InfHospitA02S02GLOBAL date, sort lcolor(black) lpattern(dash)) ///
(line InfFatalA02S02GLOBAL date, sort lcolor(red) lpattern(dash)) ///
(line InfHospitA02S03GLOBAL date, sort lcolor(black) lpattern(dash)) ///
(line InfFatalA02S03GLOBAL date, sort lcolor(red) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, GLOBAL, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1  "Infection hospitalization ratio" 2 "Infection fatality ratio") rows(2)) ///
note("Better and worse scenarios: dashed curves")

qui graph save "graph GLOBAL 91b COVID-19 daily Infection outcomes ratios, GLOBAL 3 scenarios, IHME.gph", replace
qui graph export "graph GLOBAL 91b COVID-19 daily Infection outcomes ratios, GLOBAL 3 scenarios, IHME.pdf", replace





* daily % change in mobility, CI

twoway ///
(line mobility_mean_A02S02GLOBAL date, sort lcolor(green)) ///
(line mobility_mean_A02S03GLOBAL date, sort lcolor(red)) ///
(line mobility_mean_A02S01GLOBAL date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily % change in mobility from baseline) title("COVID-19 daily % change in mobility, GLOBAL, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1)) 

qui graph save "graph GLOBAL 92 COVID-19 daily mobility, GLOBAL, 3 scenarios.gph", replace
qui graph export "graph GLOBAL 92 COVID-19 daily mobility, GLOBAL, 3 scenarios.pdf", replace



* cumulative vaccinated percent

twoway ///
(line CumAllVaxPctGLOBAL date, sort lcolor(black)) ///
(line CumAllEffVaxPctGLOBAL date, sort lcolor(blue)) ///
(line CumAllFulVaxPctGLOBAL date, sort lcolor(green) lwidth(thick)) ///
if date >= td(01dec2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(% Cumulative vaccinated percent) title("COVID-19 cumulative vaccinated percent, GLOBAL, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small))

qui graph save "graph GLOBAL 94 COVID-19 cumulative vaccinated percent, GLOBAL, IHME.gph", replace
qui graph export "graph GLOBAL 94 COVID-19 cumulative vaccinated percent, GLOBAL, IHME.pdf", replace




   

* daily vaccinated percent

twoway ///
(line DayAllVaxPctGLOBAL date, sort lcolor(black)) ///
(line DayAllEffVaxPctGLOBAL date, sort lcolor(blue)) ///
(line DayAllFulVaxPctGLOBAL date, sort lcolor(green) lwidth(thick)) ///
if date >= td(01dec2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(% Daily vaccinated percent) title("COVID-19 daily vaccinated percent, GLOBAL, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small))

qui graph save "graph GLOBAL 95 COVID-19 daily vaccinated percent, GLOBAL.gph", replace
qui graph export "graph GLOBAL 95 COVID-19 daily vaccinated percent, GLOBAL.pdf", replace



     
* daily vaccinated number

twoway ///
(line DayAllVaxGLOBAL date, sort lcolor(black)) ///
(line DayAllEffVaxGLOBAL date, sort lcolor(blue)) ///
(line DayAllFulVaxGLOBAL date, sort lcolor(green) lwidth(thick)) ///
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#$monthspast01jan2021merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily vaccinated number) title("COVID-19 daily vaccinated number, GLOBAL, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small))

qui graph save "graph GLOBAL 96 COVID-19 daily vaccinated number, GLOBAL.gph", replace
qui graph export "graph GLOBAL 96 COVID-19 daily vaccinated number, GLOBAL.pdf", replace










*******************************
*******************************


* regions together

* JOHN

* models

* two sets of graphs: first set = IHME and IMPE (graph ??1), second set: DELP and SRIV (graph ??2)

* (a) with global, (b) w/o global 





* JOHN



* daily deaths, with GLOBAL, JOHN

twoway ///
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) /// JOHN
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
(line DayDeaMeSmA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) 

qui graph save "graph 1a1 JOHN COVID-19 daily deaths, regions together, JOHN.gph", replace
qui graph export "graph 1a1 JOHN COVID-19 daily deaths, regions together, JOHN.pdf", replace




* daily deaths, without GLOBAL, JOHN

twoway ///
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) /// JOHN
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph save "graph 1a2 JOHN COVID-19 daily deaths, regions together, JOHN.gph", replace
qui graph export "graph 1a2 JOHN COVID-19 daily deaths, regions together, JOHN.pdf", replace



* models


* daily deaths, with GLOBAL, IHME, IMPE

twoway ///
(line DayDeaMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line DayDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA02S01WPRO date, sort lcolor(blue) ) ///
(line DayDeaMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
(line DayDeaMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line DayDeaMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayDeaMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayDeaMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayDeaMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayDeaMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayDeaMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayDeaMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line DayDeaMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("IHME: solid curves; IMPE: dashed curves")

qui graph save "graph 1a1 COVID-19 daily deaths, regions together, IHME, IMPE.gph", replace
qui graph export "graph 1a1 COVID-19 daily deaths, regions together, IHME, IMPE.pdf", replace




* daily deaths, with GLOBAL, DELP, SRIV

twoway ///
(line DayDeaMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line DayDeaMeRaA01S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeRaA01S00EURO date, sort lcolor(green)) ///
(line DayDeaMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line DayDeaMeRaA01S00GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line DayDeaMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line DayDeaMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayDeaMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayDeaMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayDeaMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayDeaMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayDeaMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayDeaMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line DayDeaMeRaA05S00GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) ///
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("DELP: solid curves; SRIV: dashed curves")

qui graph save "graph 1a2 COVID-19 daily deaths, regions together, DELP, SRIV.gph", replace
qui graph export "graph 1a2 COVID-19 daily deaths, regions together, DELP, SRIV.pdf", replace




* daily deaths, without GLOBAL, IHME, IMPE

twoway ///
(line DayDeaMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line DayDeaMeSmA02S01AMRO date, sort lcolor(red)) /// 
(line DayDeaMeSmA02S01AMR1 date, sort lcolor(orange)) /// 
(line DayDeaMeSmA02S01AMR2 date, sort lcolor(purple)) /// 
(line DayDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line DayDeaMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line DayDeaMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayDeaMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayDeaMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayDeaMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayDeaMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayDeaMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayDeaMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("IHME: solid curves; IMPE: dashed curves")

qui graph save "graph 1b1 COVID-19 daily deaths, regions together wo global, IHME, IMPE.gph", replace
qui graph export "graph 1b1 COVID-19 daily deaths, regions together wo global, IHME, IMPE.pdf", replace




* daily deaths, without GLOBAL, DELP, SRIV

twoway ///
(line DayDeaMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line DayDeaMeRaA01S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeRaA01S00EURO date, sort lcolor(green)) ///
(line DayDeaMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line DayDeaMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line DayDeaMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayDeaMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayDeaMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayDeaMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayDeaMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayDeaMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayDeaMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("DELP: solid curves; SRIV: dashed curves")

qui graph save "graph 1b2 COVID-19 daily deaths, regions together wo global, DELP, SRIV.gph", replace
qui graph export "graph 1b2 COVID-19 daily deaths, regions together wo global, DELP, SRIV.pdf", replace




* daily excess deaths, with GLOBAL, IHME

twoway ///
(line DayDeXMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line DayDeXMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeXMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayDeXMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayDeXMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeXMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeXMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeXMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line DayDeXMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily excess deaths) title("COVID-19 daily excess deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) 

qui graph save "graph 1 2 a1 COVID-19 daily excess deaths, regions together, IHME.gph", replace
qui graph export "graph 1 2 a1 COVID-19 daily excess deaths, regions together, IHME.pdf", replace




* daily excess deaths, without GLOBAL, IHME

twoway ///
(line DayDeXMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line DayDeXMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeXMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayDeXMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayDeXMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeXMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeXMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeXMeSmA02S01WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily excess deaths) title("COVID-19 daily excess deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph save "graph 1 2 a1 COVID-19 daily excess deaths, regions together wo global, IHME.gph", replace
qui graph export "graph 1 2 a1 COVID-19 daily excess deaths, regions together  wo global, IHME.pdf", replace





* JOHN


* daily cases, with GLOBAL, JOHN

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) /// JOHN
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
(line DayCasMeSmA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) 

qui graph save "graph 2a1 JOHN COVID-19 daily cases, regions together, JOHN.gph", replace
qui graph export "graph 2a1 JOHN COVID-19 daily cases, regions together, JOHN.pdf", replace




* daily cases, without GLOBAL, JOHN

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) /// JOHN
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph save "graph 2a2 JOHN COVID-19 daily cases, regions together, JOHN.gph", replace
qui graph export "graph 2a2 JOHN COVID-19 daily cases, regions together, JOHN.pdf", replace



* daily cases, without GLOBAL, JOHN, recent

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) /// JOHN
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(17dec2021) & date <= td(15jan2022) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph save "graph 2a3 JOHN COVID-19 daily cases, regions together, JOHN recent.gph", replace
qui graph export "graph 2a3 JOHN COVID-19 daily cases, regions together, JOHN recent.pdf", replace



* models


* daily infections, with GLOBAL, IHME, IMPE

twoway ///
(line DayINFMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line DayINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayINFMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line DayINFMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line DayINFMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line DayINFMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayINFMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayINFMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayINFMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayINFMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayINFMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayINFMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line DayINFMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("IHME infections: solid curves; IMPE infections: dashed curves")

qui graph save "graph 2a1 COVID-19 daily infections, regions together, IHME, IMPE.gph", replace
qui graph export "graph 2a1 COVID-19 daily infections, regions together, IHME, IMPE.pdf", replace






* daily cases, with GLOBAL, DELP, SRIV

twoway ///
(line DayCasMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line DayCasMeRaA01S00AMRO date, sort lcolor(red)) ///
(line DayCasMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeRaA01S00EURO date, sort lcolor(green)) ///
(line DayCasMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line DayCasMeRaA01S00GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line DayCasMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line DayCasMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayCasMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayCasMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayCasMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayCasMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayCasMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayCasMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line DayCasMeRaA05S00GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) ///
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("DELP cases: solid curves; SRIV cases: dashed curves")

qui graph save "graph 2a2 COVID-19 daily cases, regions together, DELP, SRIV.gph", replace
qui graph export "graph 2a2 COVID-19 daily cases, regions together, DELP, SRIV.pdf", replace




* daily infections, without GLOBAL, IHME, IMPE

twoway ///
(line DayINFMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line DayINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayINFMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line DayINFMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line DayINFMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayINFMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayINFMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayINFMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayINFMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayINFMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayINFMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("IHME infections: solid curves; IMPE infections: dashed curves")

qui graph save "graph 2b1 COVID-19 daily infections, regions together wo global, IHME, IMPE.gph", replace
qui graph export "graph 2b1 COVID-19 daily infections, regions together wo global, IHME, IMPE.pdf", replace




* daily cases, without GLOBAL, DELP, SRIV

twoway ///
(line DayCasMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line DayCasMeRaA01S00AMRO date, sort lcolor(red)) ///
(line DayCasMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeRaA01S00EURO date, sort lcolor(green)) ///
(line DayCasMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line DayCasMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line DayCasMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayCasMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line DayCasMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line DayCasMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line DayCasMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line DayCasMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line DayCasMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("DELP cases: solid curves; SRIV cases: dashed curves")

qui graph save "graph 2b2 COVID-19 daily cases, regions together wo global, DELP, SRIV.gph", replace
qui graph export "graph 2b2 COVID-19 daily cases, regions together wo global, DELP, SRIV.pdf", replace





* total deaths, with GLOBAL, IHME, IMPE

twoway ///
(line TotDeaMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line TotDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotDeaMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line TotDeaMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line TotDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotDeaMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line TotDeaMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line TotDeaMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotDeaMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotDeaMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotDeaMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotDeaMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotDeaMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotDeaMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line TotDeaMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("IHME: solid curves; IMPE: dashed curves")

qui graph save "graph 3a1 COVID-19 total deaths, regions together, IHME, IMPE.gph", replace
qui graph export "graph 3a1 COVID-19 total deaths, regions together, IHME, IMPE.pdf", replace




* total deaths, with GLOBAL, DELP, SRIV

twoway ///
(line TotDeaMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line TotDeaMeRaA01S00AMRO date, sort lcolor(red)) ///
(line TotDeaMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line TotDeaMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line TotDeaMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line TotDeaMeRaA01S00EURO date, sort lcolor(green)) ///
(line TotDeaMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line TotDeaMeRaA01S00GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line TotDeaMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line TotDeaMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotDeaMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotDeaMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotDeaMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotDeaMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotDeaMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotDeaMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line TotDeaMeRaA05S00GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) /// 
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("DELP: solid curves; SRIV: dashed curves")

qui graph save "graph 3a2 COVID-19 total deaths, regions together, DELP, SRIV.gph", replace
qui graph export "graph 3a2 COVID-19 total deaths, regions together, DELP, SRIV.pdf", replace




* total deaths, without GLOBAL, IHME, IMPE

twoway ///
(line TotDeaMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line TotDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotDeaMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line TotDeaMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line TotDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotDeaMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line TotDeaMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotDeaMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotDeaMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotDeaMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotDeaMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotDeaMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotDeaMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("IHME: solid curves; IMPE: dashed curves")

qui graph save "graph 3b1 COVID-19 total deaths, regions together wo global, IHME, IMPE.gph", replace
qui graph export "graph 3b1 COVID-19 total deaths, regions together wo global, IHME, IMPE.pdf", replace




* total deaths, without GLOBAL, DELP, SRIV

twoway ///
(line TotDeaMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line TotDeaMeRaA01S00AMRO date, sort lcolor(red)) ///
(line TotDeaMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line TotDeaMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line TotDeaMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line TotDeaMeRaA01S00EURO date, sort lcolor(green)) ///
(line TotDeaMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line TotDeaMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line TotDeaMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotDeaMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotDeaMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotDeaMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotDeaMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotDeaMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotDeaMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("DELP: solid curves; SRIV: dashed curves")

qui graph save "graph 3b2 COVID-19 total deaths, regions together wo global, DELP, SRIV.gph", replace
qui graph export "graph 3b2 COVID-19 total deaths, regions together wo global, DELP, SRIV.pdf", replace




* total excess deaths, with GLOBAL, IHME

twoway ///
(line TotDeXMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line TotDeXMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotDeXMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line TotDeXMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line TotDeXMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotDeXMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotDeXMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotDeXMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotDeXMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total excess deaths) title("COVID-19 total excess deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) 

qui graph save "graph 3 2 a1 COVID-19 total excess deaths, regions together, IHME.gph", replace
qui graph export "graph 3 2 a1 COVID-19 total excess deaths, regions together, IHME.pdf", replace




* total excess deaths, without GLOBAL, IHME

twoway ///
(line TotDeXMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line TotDeXMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotDeXMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line TotDeXMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line TotDeXMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotDeXMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotDeXMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotDeXMeSmA02S01WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total excess deaths) title("COVID-19 total excess deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph save "graph 3 2 a1 COVID-19 total excess deaths, regions together wo global, IHME.gph", replace
qui graph export "graph 3 2 a1 COVID-19 total excess deaths, regions together wo global, IHME.pdf", replace




* total infections, with GLOBAL, IHME, IMPE

twoway ///
(line TotINFMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line TotINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotINFMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line TotINFMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line TotINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotINFMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line TotINFMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line TotINFMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotINFMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotINFMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotINFMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotINFMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotINFMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotINFMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line TotINFMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("IHME: solid curves; IMPE: dashed curves")

qui graph save "graph 4a1 COVID-19 total infections, regions together, IHME, IMPE.gph", replace
qui graph export "graph 4a1 COVID-19 total infections, regions together, IHME, IMPE.pdf", replace




* total cases, with GLOBAL, DELP, SRIV

twoway ///
(line TotCasMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line TotCasMeRaA01S00AMRO date, sort lcolor(red)) ///
(line TotCasMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line TotCasMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line TotCasMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line TotCasMeRaA01S00EURO date, sort lcolor(green)) ///
(line TotCasMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line TotCasMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line TotCasMeRaA01S00GLOBAL date, sort lcolor(black) lwidth(thick)) /// 
(line TotCasMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line TotCasMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotCasMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotCasMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotCasMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotCasMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotCasMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotCasMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
(line TotCasMeRaA05S00GLOBAL date, sort lcolor(black) lwidth(thick) lpattern(dash)) /// 
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) ///
note("DELP: solid curves; SRIV: dashed curves")

qui graph save "graph 4a2 COVID-19 total cases, regions together, DELP, SRIV.gph", replace
qui graph export "graph 4a2 COVID-19 total cases, regions together, DELP, SRIV.pdf", replace




* total infections, without GLOBAL, IHME, IMPE

twoway ///
(line TotINFMeSmA02S01AFRO date, sort lcolor(brown)) /// IHME
(line TotINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotINFMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line TotINFMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line TotINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotINFMeRaA03S02AFRO date, sort lcolor(brown) lpattern(dash)) /// IMPE
(line TotINFMeRaA03S02AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotINFMeRaA03S02AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotINFMeRaA03S02AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotINFMeRaA03S02EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotINFMeRaA03S02EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotINFMeRaA03S02SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotINFMeRaA03S02WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, WHO regions, IHME, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("IHME: solid curves; IMPE: dashed curves")

qui graph save "graph 4b1 COVID-19 total infections, regions together wo global, IHME, IMPE.gph", replace
qui graph export "graph 4b1 COVID-19 total infections, regions together wo global, IHME, IMPE.pdf", replace




* total cases, without GLOBAL, DELP, SRIV

twoway ///
(line TotCasMeRaA01S00AFRO date, sort lcolor(brown)) /// DELP
(line TotCasMeRaA01S00AMRO date, sort lcolor(red)) ///
(line TotCasMeRaA01S00AMR1 date, sort lcolor(orange)) ///
(line TotCasMeRaA01S00AMR2 date, sort lcolor(purple)) ///
(line TotCasMeRaA01S00EMRO date, sort lcolor(gold)) ///
(line TotCasMeRaA01S00EURO date, sort lcolor(green)) ///
(line TotCasMeRaA01S00SEARO date, sort lcolor(cyan)) ///
(line TotCasMeRaA01S00WPRO date, sort lcolor(blue)) ///
(line TotCasMeRaA05S00AFRO date, sort lcolor(brown) lpattern(dash)) /// SRIV
(line TotCasMeRaA05S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotCasMeRaA05S00AMR1 date, sort lcolor(orange) lpattern(dash)) ///
(line TotCasMeRaA05S00AMR2 date, sort lcolor(purple) lpattern(dash)) ///
(line TotCasMeRaA05S00EMRO date, sort lcolor(gold) lpattern(dash)) ///
(line TotCasMeRaA05S00EURO date, sort lcolor(green) lpattern(dash)) ///
(line TotCasMeRaA05S00SEARO date, sort lcolor(cyan) lpattern(dash)) ///
(line TotCasMeRaA05S00WPRO date, sort lcolor(blue) lpattern(dash)) ///
if date >= td(01oct2021) ///
, xtitle(Date) xlabel(#8, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, WHO regions, DELP, SRIV", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) ///
note("DELP: solid curves; SRIV: dashed curves")

qui graph save "graph 4b2 COVID-19 total cases, regions together wo global, DELP, SRIV.gph", replace
qui graph export "graph 4b2 COVID-19 total cases, regions together wo global, DELP, SRIV.pdf", replace








	

************

* restore native scheme (of the local machine)

set scheme $nativescheme

di c(scheme)


view "log CovidVisualizedGlobal merge.smcl"

log close

exit, clear




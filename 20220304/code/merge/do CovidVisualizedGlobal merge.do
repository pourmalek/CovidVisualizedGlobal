
clear all

cd "$pathCovidVisualizedGlobal"

cd merge

capture log close

log using "log CovidVisualizedGlobal merge.smcl", replace


***************************************************************************
* This is "do CovidVisualizedGlobal merge.do"

* Project: Combine and visualize international periodically updating 
* estimates of C-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************



/* models:
JOHN
DELP 
IHME
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



* 

label var loc_grand_name "Location"

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

isid date loc_grand_name, missok

drop _merge

qui compress


save "CovidVisualizedGlobal merge.dta", replace





***************

***************

* graphs 


grstyle init

grstyle color background white




**********

* gen monthspast vars for #thicknumber of graphs


summ date

gen mergemaxdate = r(max)


gen monthspast01jan2020merge = ((mergemaxdate - td(01jan2020)) / 30) + 1

replace monthspast01jan2020merge = round(monthspast01jan2020merge)

global monthspast01jan2020merge = monthspast01jan2020merge

di $monthspast01jan2020merge



gen monthspast01jan2021merge = ((mergemaxdate - td(01jan2021)) / 30) + 1

replace monthspast01jan2021merge = round(monthspast01jan2021merge)

global monthspast01jan2021merge = monthspast01jan2021merge

di $monthspast01jan2021merge



gen monthspast01jan2022merge = ((mergemaxdate - td(01jan2022)) / 30) + 1

replace monthspast01jan2022merge = round(monthspast01jan2022merge)

global monthspast01jan2022merge = monthspast01jan2022merge

di $monthspast01jan2022merge








*******************************************************



* Selected graphs - Regions together, JOHN



*******************************************************
* 1 daily deaths, regions, 2020 on

twoway ///
(line DayDeaMeSmA00S00GLOBAL date, sort lcolor(black)) /// 
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) /// 
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, smooth, WHO regions, JOHN, 2020 on", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" 5 ///
"AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "01 regions C-19 daily deaths, JOHN 2020.gph", replace
qui graph export "01 regions C-19 daily deaths, JOHN 2020.pdf", replace







*******************************************************
* 2 daily deaths, regions, 2020 on

twoway ///
(line DayDeaMeSmA00S00GLOBAL date, sort lcolor(black)) /// 
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) /// 
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2022) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#3, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, smooth, WHO regions, JOHN, 2022", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" 5 ///
"AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "02 regions C-19 daily deaths, JOHN 2022.gph", replace
qui graph export "02 regions C-19 daily deaths, JOHN 2022.pdf", replace





*******************************************************
* 3 daily cases, regions, 2020 on

twoway ///
(line DayCasMeSmA00S00GLOBAL date, sort lcolor(black)) /// 
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) /// 
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2020) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported cases) title("C-19 daily reported cases, smooth, WHO regions, JOHN, 2020 on", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" 5 ///
"AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "03 regions C-19 daily cases, JOHN 2020.gph", replace
qui graph export "03 regions C-19 daily cases, JOHN 2020.pdf", replace







*******************************************************
* 4 daily cases, regions, 2020 on

twoway ///
(line DayCasMeSmA00S00GLOBAL date, sort lcolor(black)) /// 
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) /// 
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayCasMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2022) & date <= td(01mar2022) ///
, xtitle(Date) xlabel(#3, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported cases) title("C-19 daily reported cases, smooth, WHO regions, JOHN, 2022", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" 5 ///
"AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "04 regions C-19 daily cases, JOHN 2022.gph", replace
qui graph export "04 regions C-19 daily cases, JOHN 2022.pdf", replace






*******************************************************



* Selected graphs - Regions --- models



*******************************************************


local list GLOBAL AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list {

* 5 daily deaths, reference scenarios, 2020 on

	twoway ///
	(line DayDeaMeSmA00S00`region' date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
	(line DayDeaMeRaA01S00`region' date, sort lcolor(red)) /// 1 "DELP"
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("C-19 daily deaths, `region', reference scenarios, 2020 on", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN" 2 "DELP" 3 "IHME") size(small) row(1))
	
	qui graph save "05 `region' C-19 daily deaths, reference scenarios, 2020 on.gph", replace
	qui graph export "05 `region' C-19 daily deaths, reference scenarios, 2020 on.pdf", replace
	
	
* 6 daily cases or infections, reference scenarios, 2020 on
	
	twoway ///
	(line DayCasMeSmA00S00`region' date, sort lcolor(cyan) lwidth(thick)) /// 1 "JOHN smooth"
	(line DayCasMeRaA01S00`region' date, sort lcolor(red)) /// 1 "DELP"
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) /// 3 "IHME"
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily cases or infections) title("C-19 daily cases or infections, `region', reference scenarios, 2020 on", size(medium)) /// 
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections") size(small) row(1))
	
	qui graph save "06 `region' C-19 daily cases, reference scenarios, 2020 on.gph", replace
	qui graph export "06 `region' C-19 daily cases, reference scenarios, 2020 on.pdf", replace
	
}	
*



	


	
	
*******************************************************



* Selected graphs - Regions together IHME



*******************************************************	
* 7 Daily deaths, IHME, 2020 on

twoway ///
(line DayDeaMeSmA02S01GLOBAL date, sort lcolor(black)) ///
(line DayDeaMeSmA02S01AFRO date, sort lcolor(brown)) /// 
(line DayDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA02S01WPRO date, sort lcolor(blue) ) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, WHO regions, IHME, 2020 on", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" ///
5 "AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "07 regions C-19 daily deaths, IHME reference scenarios, 2020 on.gph", replace
qui graph export "07 regions C-19 daily deaths, IHME reference scenarios, 2020 on.pdf", replace
	
	
	
	
*******************************************************	
* 8 Daily deaths, IHME, 2020 on

twoway ///
(line DayDeaMeSmA02S01GLOBAL date, sort lcolor(black)) ///
(line DayDeaMeSmA02S01AFRO date, sort lcolor(brown)) /// 
(line DayDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA02S01WPRO date, sort lcolor(blue) ) ///
if date >= td(01jan2022) ///
, xtitle(Date) xlabel(#$monthspast01jan2022merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("C-19 daily deaths, WHO regions, IHME, 2022", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" ///
5 "AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "08 regions C-19 daily deaths, IHME reference scenarios, 2022.gph", replace
qui graph export "08 regions C-19 daily deaths, IHME reference scenarios, 2022.pdf", replace
	
	
	
	

*******************************************************	
* 9 Daily infections, IHME, 2020 on

twoway ///
(line DayINFMeSmA02S01GLOBAL date, sort lcolor(black)) ///
(line DayINFMeSmA02S01AFRO date, sort lcolor(brown)) /// 
(line DayINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayINFMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA02S01WPRO date, sort lcolor(blue) ) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("C-19 daily infections, WHO regions, IHME, 2020 on", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" ///
5 "AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "09 regions C-19 daily infections, IHME reference scenarios, 2020 on.gph", replace
qui graph export "09 regions C-19 daily infections, IHME reference scenarios, 2020 on.pdf", replace
	
	
	
	
*******************************************************	
* 10 Daily infections, IHME, 2020 on

twoway ///
(line DayINFMeSmA02S01GLOBAL date, sort lcolor(black)) ///
(line DayINFMeSmA02S01AFRO date, sort lcolor(brown)) /// 
(line DayINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA02S01AMR1 date, sort lcolor(orange)) ///
(line DayINFMeSmA02S01AMR2 date, sort lcolor(purple)) ///
(line DayINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA02S01WPRO date, sort lcolor(blue) ) ///
if date >= td(01jan2022) ///
, xtitle(Date) xlabel(#$monthspast01jan2022merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("C-19 daily infections, WHO regions, IHME, 2022", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "GLOBAL" 2 "AFRO" 3 "AMRO" 4 "AMRCANUSA" ///
5 "AMRwoCANUSA" 6 "EMRO" 7 "EURO" 8 "SEARO" 9 "WPRO") size(small) rows (3)) 

qui graph save "10 regions C-19 daily infections, IHME reference scenarios, 2022.gph", replace
qui graph export "10 regions C-19 daily infections, IHME reference scenarios, 2022.pdf", replace
	
		
	
	



************

* restore native scheme (of the local machine)

set scheme $nativescheme

di c(scheme)


view "log CovidVisualizedGlobal merge.smcl"

log close

exit, clear




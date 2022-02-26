
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

/*

The magnitudes of the estimates in this SRIV update are several times – and generally highly implausibly – more than the estimates from all other models. That suppresses all the curves of the other models in the graphs. Therefore, in this uptake, the estimates from the SRIV model are not included.
*/


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





*******************************
*******************************


* regions together



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
(line DayDeaMeSmA00S00GLOBAL date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) 

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

qui graph export "graph 1a2 JOHN COVID-19 daily deaths, regions together, JOHN.pdf", replace




* daily deaths, without GLOBAL, JOHN, recent

twoway ///
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) /// JOHN
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMR1 date, sort lcolor(orange)) ///
(line DayDeaMeSmA00S00AMR2 date, sort lcolor(purple)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
if date >= td(01jan2022) & date <= td(01feb2022) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph export "graph 1a3 JOHN COVID-19 daily deaths, regions together, JOHN.pdf", replace




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
(line DayCasMeSmA00S00GLOBAL date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#$monthspast01jan2020merge, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small)) 

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
if date >= td(01jan2022) & date <= td(01feb2022) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, JOHN", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small)) 

qui graph export "graph 2a3 JOHN COVID-19 daily cases, regions together, JOHN.pdf", replace




	

************

* restore native scheme (of the local machine)

set scheme $nativescheme

di c(scheme)


view "log CovidVisualizedGlobal merge.smcl"

log close

exit, clear




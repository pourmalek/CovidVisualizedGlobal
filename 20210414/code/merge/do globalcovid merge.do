
clear all

cd "$pathglobalcovid"

cd merge

capture log close

log using "log global merge.smcl", replace


***************************************************************************
* This is "do globalcovid merge.do"

* Project: Rapid review of estimates of global COVID-19
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14

* OBJECTIVE: Get, prepare, and combine component studies' estimates

* This update   20210414             // update date of these codes
* Date update   ind. models          // update date of study estimates used here
* Date coverage 01dec2019,01aug2021   // dates covered by study estimates
***************************************************************************


/* studies / models:
JOHN
DELP
IHME
IMPE
LANL
SRIV
*/




* JOHN

if regexm(c(os),"Mac") == 1 {

	use "$pathglobalcovid/JOHN/global JOHN.dta", clear 
}
else if regexm(c(os),"Windows") == 1 use "$pathglobalcovid\JOHN\global JOHN.dta", clear 



* DELP 

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathglobalcovid/DELP/global DELP.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathglobalcovid\DELP\global DELP.dta"

drop _merge



* IHME

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathglobalcovid/IHME/global IHME.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathglobalcovid\IHME\global IHME.dta"

drop _merge



* IMPE

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathglobalcovid/IMPE/global IMPE.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathglobalcovid\IMPE\global IMPE.dta"

drop _merge



* LANL

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathglobalcovid/LANL/global LANL.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathglobalcovid\LANL\global LANL.dta"

drop _merge


* SRIV



if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathglobalcovid/SRIV/global SRIV.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathglobalcovid\SRIV\global SRIV.dta"

drop _merge


* 

label var loc_grand_name "Location"







*************************************


* Cases to deaths ratio


gen DayCTDMeRaA00S00V00 =  DayCasMeRaA00S00V00 / DayDeaMeRaA00S00V00

label var DayCTDMeRaA00S00V00  "Daily Cases to Deaths S0 JOHN"

gen TotCTDMeRaA00S00V00 =  TotCasMeRaA00S00V00 / TotDeaMeRaA00S00V00

label var TotCTDMeRaA00S00V00  "Total Cases to Deaths S0 JOHN"




gen DayCTDMeRaA01S00V03 =  DayCasMeRaA01S00V03 / DayDeaMeRaA01S00V03

label var DayCTDMeRaA01S00V03  "Daily Cases to Deaths S0 DELP"

gen TotCTDMeRaA01S00V03 =  TotCasMeRaA01S00V03 / TotDeaMeRaA01S00V03

label var TotCTDMeRaA01S00V03  "Total Cases to Deaths S0 DELP"  




gen DayCTDMeRaA02S01V03  =  DayCasMeRaA02S01V03  / DayDeaMeRaA02S01V03 

label var DayCTDMeRaA02S01V03   "Daily Cases to Deaths S1 IHME"

gen TotCTDMeRaA02S01V03  =  TotCasMeRaA02S01V03  / TotDeaMeRaA02S01V03 

label var TotCTDMeRaA02S01V03   "Total Cases to Deaths S1 IHME"




gen DayCTDMeRaA02S02V03 = DayCasMeRaA02S02V03 / DayDeaMeRaA02S02V03  

label var DayCTDMeRaA02S02V03 "Daily Cases to Deaths S2 IHME"

gen TotCTDMeRaA02S02V03 = TotCasMeRaA02S02V03 / TotDeaMeRaA02S02V03  

label var TotCTDMeRaA02S02V03 "Total Cases to Deaths S2 IHME"




gen DayCTDMeRaA02S03V03  = DayCasMeRaA02S03V03  / DayDeaMeRaA02S03V03   

label var DayCTDMeRaA02S03V03  "Daily Cases to Deaths S3 IHME"

gen TotCTDMeRaA02S03V03  = TotCasMeRaA02S03V03  / TotDeaMeRaA02S03V03   

label var TotCTDMeRaA02S03V03  "Total Cases to Deaths S3 IHME"






gen DayCTDMeRaA03S01V07  = DayCasMeRaA03S01V07  / DayDeaMeRaA03S01V07   

label var DayCTDMeRaA03S01V07  "Daily Cases to Deaths S1 IMPE"

gen TotCTDMeRaA03S01V07  = TotCasMeRaA03S01V07  / TotDeaMeRaA03S01V07   

label var TotCTDMeRaA03S01V07  "Total Cases to Deaths S1 IMPE"



gen DayCTDMeRaA03S02V07  = DayCasMeRaA03S02V07  / DayDeaMeRaA03S02V07   

label var DayCTDMeRaA03S02V07  "Daily Cases to Deaths S2 IMPE"

gen TotCTDMeRaA03S02V07  = TotCasMeRaA03S02V07  / TotDeaMeRaA03S02V07   

label var TotCTDMeRaA03S02V07  "Total Cases to Deaths S2 IMPE"



gen DayCTDMeRaA03S03V07  = DayCasMeRaA03S03V07  / DayDeaMeRaA03S03V07   

label var DayCTDMeRaA03S03V07  "Daily Cases to Deaths S3 IMPE"

gen TotCTDMeRaA03S03V07  = TotCasMeRaA03S03V07  / TotDeaMeRaA03S03V07   

label var TotCTDMeRaA03S03V07  "Total Cases to Deaths S3 IMPE"





gen DayCTDMeRaA04S00V02  = DayCasMeRaA04S00V02  / DayDeaMeRaA04S00V02   

label var DayCTDMeRaA04S00V02  "Daily Cases to Deaths S0 LANL"

gen TotCTDMeRaA04S00V02  = TotCasMeRaA04S00V02  / TotDeaMeRaA04S00V02   

label var TotCTDMeRaA04S00V02  "Total Cases to Deaths S0 LANL"






gen DayCTDMeRaA05S00V02  = DayCasMeRaA05S00V02  / DayDeaMeRaA05S00V02   

label var DayCTDMeRaA05S00V02  "Daily Cases to Deaths S0 SRIV"

gen TotCTDMeRaA05S00V02  = TotCasMeRaA05S00V02  / TotDeaMeRaA05S00V02   

label var TotCTDMeRaA05S00V02  "Total Cases to Deaths S0 SRIV"




***********************

* daily deaths estimated to reported  

    
gen DayDERMeRaA00S00V00 = DayDeaMeRaA00S00V00 / DayDeaMeRaA00S00V00

label var DayDERMeRaA00S00V00 "Daily Deaths estim to reported JOHN = 1" 


gen DayDERMeRaA01S00V03 = DayDeaMeRaA01S00V03 / DayDeaMeRaA00S00V00

label var DayDERMeRaA01S00V03 "Daily Deaths estim to reported Mean DELP S0 V3"

line DayDeaMeRaA01S00V03  DayDeaMeRaA00S00V00 date

* DELPHI does not have back-casting, so no overlap of DayDeaMeRaA01S00V03 and DayDeaMeRaA00S00V00



gen DayDERMeRaA02S01V03 = DayDeaMeRaA02S01V03 / DayDeaMeRaA00S00V00

label var DayDERMeRaA02S01V03 "Daily Deaths estim to reported Mean not smoothed IHME S1"


gen DayDERMeRaA02S02V03 = DayDeaMeRaA02S02V03 / DayDeaMeRaA00S00V00

label var DayDERMeRaA02S02V03 "Daily Deaths estim to reported Mean not smoothed IHME S2"


gen DayDERMeRaA02S03V03 = DayDeaMeRaA02S03V03 / DayDeaMeRaA00S00V00

label var DayDERMeRaA02S03V03 "Daily Deaths estim to reported Mean not smoothed IHME S3"



gen DayDERMeRaA03S01V07 = DayDeaMeRaA03S01V07 / DayDeaMeRaA00S00V00

label var DayDERMeRaA03S01V07 "Daily Deaths estim to reported Mean S1 IMPE"


gen DayDERMeRaA03S02V07 = DayDeaMeRaA03S02V07 / DayDeaMeRaA00S00V00

label var DayDERMeRaA03S02V07 "Daily Deaths estim to reported Mean S2 IMPE"


gen DayDERMeRaA03S03V07 = DayDeaMeRaA03S03V07 / DayDeaMeRaA00S00V00

label var DayDERMeRaA03S03V07 "Daily Deaths estim to reported Mean S3 IMPE"



gen DayDERMeRaA04S00V02 = DayDeaMeRaA04S00V02 / DayDeaMeRaA00S00V00

label var DayDERMeRaA04S00V02 "Daily Deaths estim to reported to Deaths S0 LANL"



gen DayDERMeRaA05S00V02  = DayDeaMeRaA05S00V02 / DayDeaMeRaA00S00V00

label var DayDERMeRaA05S00V02 "Daily Deaths estim to reported S0 SRIV"






* daily cases estimated to reported  


gen DayCERMeRaA00S00V00 = DayCasMeRaA00S00V00 / DayCasMeRaA00S00V00

label var DayCERMeRaA00S00V00 "Daily Cases estim to reported JOHN = 1" 



gen DayCERMeRaA01S00V03 = DayCasMeRaA01S00V03 / DayCasMeRaA00S00V00

label var DayCERMeRaA01S00V03 "Daily Cases estim to reported Mean DELP S0 V3"



gen DayCERMeRaA02S01V03 = DayCasMeRaA02S01V03 / DayCasMeRaA00S00V00

label var DayCERMeRaA02S01V03 "Daily Cases estim to reported Mean not smoothed IHME S1"


gen DayCERMeRaA02S02V03 = DayCasMeRaA02S02V03 / DayCasMeRaA00S00V00

label var DayCERMeRaA02S02V03 "Daily Cases estim to reported Mean not smoothed IHME S2"


gen DayCERMeRaA02S03V03 = DayCasMeRaA02S03V03 / DayCasMeRaA00S00V00

label var DayCERMeRaA02S03V03 "Daily Cases estim to reported Mean not smoothed IHME S3"



gen DayCERMeRaA03S01V07 = DayCasMeRaA03S01V07 / DayCasMeRaA00S00V00

label var DayCERMeRaA03S01V07 "Daily Cases estim to reported Mean S1 IMPE"


gen DayCERMeRaA03S02V07 = DayCasMeRaA03S02V07 / DayCasMeRaA00S00V00

label var DayCERMeRaA03S02V07 "Daily Cases estim to reported Mean S2 IMPE"


gen DayCERMeRaA03S03V07 = DayCasMeRaA03S03V07 / DayCasMeRaA00S00V00

label var DayCERMeRaA03S03V07 "Daily Cases estim to reported Mean S3 IMPE"



gen DayCERMeRaA04S00V02 = DayCasMeRaA04S00V02 / DayCasMeRaA00S00V00

label var DayCERMeRaA04S00V02 "Daily Cases estim to reported to Cases S0 LANL"



gen DayCERMeRaA05S00V02  = DayCasMeRaA05S00V02 / DayCasMeRaA00S00V00

label var DayCERMeRaA05S00V02 "Daily Cases estim to reported S0 SRIV"






* Total deaths estimated to reported  


gen TotDERMeRaA00S00V00 = TotDeaMeRaA00S00V00 / TotDeaMeRaA00S00V00

label var TotDERMeRaA00S00V00 "Total Deaths estim to reported JOHN = 1" 



gen TotDERMeRaA01S00V03 = TotDeaMeRaA01S00V03 / TotDeaMeRaA00S00V00

label var TotDERMeRaA01S00V03 "Total Deaths estim to reported Mean DELP S0 V3"



gen TotDERMeRaA02S01V03 = TotDeaMeRaA02S01V03 / TotDeaMeRaA00S00V00

label var TotDERMeRaA02S01V03 "Total Deaths estim to reported Mean not smoothed IHME S1"


gen TotDERMeRaA02S02V03 = TotDeaMeRaA02S02V03 / TotDeaMeRaA00S00V00

label var TotDERMeRaA02S02V03 "Total Deaths estim to reported Mean not smoothed IHME S2"


gen TotDERMeRaA02S03V03 = TotDeaMeRaA02S03V03 / TotDeaMeRaA00S00V00

label var TotDERMeRaA02S03V03 "Total Deaths estim to reported Mean not smoothed IHME S3"



gen TotDERMeRaA03S01V07 = TotDeaMeRaA03S01V07 / TotDeaMeRaA00S00V00

label var TotDERMeRaA03S01V07 "Total Deaths estim to reported Mean S1 IMPE"


gen TotDERMeRaA03S02V07 = TotDeaMeRaA03S02V07 / TotDeaMeRaA00S00V00

label var TotDERMeRaA03S02V07 "Total Deaths estim to reported Mean S2 IMPE"


gen TotDERMeRaA03S03V07 = TotDeaMeRaA03S03V07 / TotDeaMeRaA00S00V00

label var TotDERMeRaA03S03V07 "Total Deaths estim to reported Mean S3 IMPE"



gen TotDERMeRaA04S00V02 = TotDeaMeRaA04S00V02 / TotDeaMeRaA00S00V00

label var TotDERMeRaA04S00V02 "Total Deaths estim to reported to Deaths S0 LANL"



gen TotDERMeRaA05S00V02  = TotDeaMeRaA05S00V02 / TotDeaMeRaA00S00V00

label var TotDERMeRaA05S00V02 "Total Deaths estim to reported S0 SRIV"






* Total cases estimated to reported  


gen TotCERMeRaA00S00V00 = TotCasMeRaA00S00V00 / TotCasMeRaA00S00V00

label var TotCERMeRaA00S00V00 "Total Cases estim to reported JOHN = 1" 


gen TotCERMeRaA01S00V03 = TotCasMeRaA01S00V03 / TotCasMeRaA00S00V00

label var TotCERMeRaA01S00V03 "Total Cases estim to reported Mean DELP S0 V3"



gen TotCERMeRaA02S01V03 = TotCasMeRaA02S01V03 / TotCasMeRaA00S00V00

label var TotCERMeRaA02S01V03 "Total Cases estim to reported Mean not smoothed IHME S1"


gen TotCERMeRaA02S02V03 = TotCasMeRaA02S02V03 / TotCasMeRaA00S00V00

label var TotCERMeRaA02S02V03 "Total Cases estim to reported Mean not smoothed IHME S2"


gen TotCERMeRaA02S03V03 = TotCasMeRaA02S03V03 / TotCasMeRaA00S00V00

label var TotCERMeRaA02S03V03 "Total Cases estim to reported Mean not smoothed IHME S3"



gen TotCERMeRaA03S01V07 = TotCasMeRaA03S01V07 / TotCasMeRaA00S00V00

label var TotCERMeRaA03S01V07 "Total Cases estim to reported Mean S1 IMPE"


gen TotCERMeRaA03S02V07 = TotCasMeRaA03S02V07 / TotCasMeRaA00S00V00

label var TotCERMeRaA03S02V07 "Total Cases estim to reported Mean S2 IMPE"


gen TotCERMeRaA03S03V07 = TotCasMeRaA03S03V07 / TotCasMeRaA00S00V00

label var TotCERMeRaA03S03V07 "Total Cases estim to reported Mean S3 IMPE"



gen TotCERMeRaA04S00V02 = TotCasMeRaA04S00V02 / TotCasMeRaA00S00V00

label var TotCERMeRaA04S00V02 "Total Cases estim to reported to Cases S0 LANL"



gen TotCERMeRaA05S00V02  = TotCasMeRaA05S00V02 / TotCasMeRaA00S00V00

label var TotCERMeRaA05S00V02 "Total Cases estim to reported S0 SRIV"




*

di in red "********* The follwoing is -descri-ption of vars in final combined file global.dta *********" 


desc, fullnames
 
 
*

sort date

qui compress

save "global.dta", replace

export delimited using "global.csv", replace 


*





***************

* graphs 


grstyle init

grstyle color background white



******************

** order of graphs: 

** (A) outcomes, (B) correction factors, (C) time coverage, (D) confidence intervals



** (A) outcomes: 

* daily deaths, daily cases, total deaths, total cases, daily CFR, daily active cases, 
* daily hospital-related outcomes, 
* daily cases to deaths, total cases to deaths,
* daily deaths estimated to reported, daily cases estimated to reported, total deaths estimated to reported, total cases estimated to reported



** (B) time coverage

* all time, 2021-01-01 on



** (C) confidence intervals 

* without confidence intervals, with confidence intervals, not show extremes 




*****************

* daily deaths (graph numbers start with 11)


* daily deaths, median or reference scenario

twoway ///
(line DayDeaMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayDeaMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line DayDeaMeSmA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line DayDeaMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayDeaMeRaA04S00V02 date, sort lcolor(gold)) /// 5 "LANL"
(line DayDeaMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020)  ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 11 COVID-19 daily deaths, global, reference scenarios.gph", replace
graph export "graph 11 COVID-19 daily deaths, global, reference scenarios.pdf", replace



* daily deaths, median or reference scenario, 2021-01-01 on

twoway ///
(line DayDeaMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayDeaMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line DayDeaMeSmA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line DayDeaMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayDeaMeRaA04S00V02 date, sort lcolor(gold)) /// 5 "LANL"
(line DayDeaMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("after 2021-01-01", size(small)) 

graph save "graph 12 COVID-19 daily deaths, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 12 COVID-19 daily deaths, global, reference scenarios, 2021-01-01 on.pdf", replace



* daily deaths, median or reference scenario, 2021-01-01 on, CI

twoway ///
(line DayDeaMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 JOHN
(line DayDeaMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayDeaLoRaA01S00V03 date, sort lcolor(red) lpattern(dash)) /// 3 "DELP" lower
(line DayDeaUpRaA01S00V03 date, sort lcolor(red) lpattern(dash)) /// 4 "DELP" upper
(line DayDeaMeSmA02S02V03 date, sort lcolor(black)) /// 5 IHME mean
(line DayDeaLoSmA02S02V03 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line DayDeaUpSmA02S02V03 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line DayDeaMeRaA03S02V07 date, sort lcolor(magenta)) /// 8 IMPE mean
(line DayDeaLoRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line DayDeaUpRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line DayDeaMeRaA04S00V02 date, sort lcolor(gold)) /// 11 LANL mean
(line DayDeaLoRaA04S00V02 date, sort lcolor(gold) lpattern(dash)) /// 12 LANL lower
(line DayDeaUpRaA04S00V02 date, sort lcolor(gold) lpattern(dash)) /// 13 LANL upper
(line DayDeaMeRaA05S00V02 date, sort lcolor(green)) /// 14 "SRIV" mean
(line DayDeaMeRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line DayDeaMeRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(1)) ///
subtitle("after 2021-01-01, with uncertainty", size(small)) ///
note("Uncertainty limits: dashed curves") 

graph save "graph 13 COVID-19 daily deaths, global, reference scenarios, 2021-01-01 on, CI.gph", replace
graph export "graph 13 COVID-19 daily deaths, global, reference scenarios, 2021-01-01 on, CI.pdf", replace





***********************

* Daily cases (graph numbers start with 21)


* daily cases, median or reference scenario

twoway ///
(line DayCasMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCasMeRaA01S00V03 date, sort lcolor(red)) /// 4 "DELP"
(line DayCasMeRaA02S01V03 date, sort lcolor(black)) /// 5 "IHME"
(line DayCasMeRaA03S02V07 date, sort lcolor(magenta)) /// 6 "IMPE"
(line DayCasMeRaA04S00V02 date, sort lcolor(gold)) /// 7 "LANL"
(line DayCasMeRaA05S00V02 date, sort lcolor(green)) /// 8 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV" ) size(small) row(1)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 21 COVID-19 daily cases, global, reference scenarios.gph", replace
graph export "graph 21 COVID-19 daily cases, global, reference scenarios.pdf", replace



* daily cases, median or reference scenario, 2021-01-01

twoway ///
(line DayCasMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCasMeRaA01S00V03 date, sort lcolor(red)) /// 4 "DELP"
(line DayCasMeRaA02S01V03 date, sort lcolor(black)) /// 5 "IHME"
(line DayCasMeRaA03S02V07 date, sort lcolor(magenta)) /// 6 "IMPE"
(line DayCasMeRaA04S00V02 date, sort lcolor(gold)) /// 7 "LANL"
(line DayCasMeRaA05S00V02 date, sort lcolor(green)) /// 8 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV" ) size(small) row(1)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 22 COVID-19 daily cases, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 22 COVID-19 daily cases, global, reference scenarios, 2021-01-01 on.pdf", replace



* daily cases, median or reference scenario, 2021-01-01 on, CI

twoway ///
(line DayCasMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 JOHN
(line DayCasMeRaA01S00V03  date, sort lcolor(red)) /// 2 DELP mean
(line DayCasLoRaA01S00V03  date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
(line DayCasUpRaA01S00V03  date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
(line DayCasMeRaA02S01V03 date, sort lcolor(black)) /// 5 IHME mean
(line DayCasLoRaA02S02V03 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line DayCasUpRaA02S02V03 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line DayCasMeRaA03S02V07 date, sort lcolor(magenta)) /// 8 IMPE mean
(line DayCasLoRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line DayCasUpRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line DayCasMeRaA04S00V02 date, sort lcolor(gold)) /// 11 LANL mean
(line DayCasLoRaA04S00V02 date, sort lcolor(gold) lpattern(dash)) /// 12 LANL lower
(line DayCasUpRaA04S00V02 date, sort lcolor(gold) lpattern(dash)) /// 13 LANL upper
(line DayCasMeRaA05S00V02 date, sort lcolor(green)) /// 14 "SRIV" mean
(line DayCasLoRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line DayCasUpRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(1)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, with uncertainty", size(small))

graph save "graph 23 COVID-19 daily cases, global, reference scenarios, 2021-01-01 on, CI.gph", replace
graph export "graph 23 COVID-19 daily cases, global, reference scenarios, 2021-01-01 on, CI.pdf", replace




*****************

* total deaths (graph numbers start with 31)



* total deaths, median or reference scenario

twoway ///
(line TotDeaMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotDeaMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeaMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDeaMeRaA04S00V0 date, sort lcolor(gold)) /// 5 "LANL"
(line TotDeaMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 31 COVID-19 total deaths, global, reference scenarios.gph", replace
graph export "graph 31 COVID-19 total deaths, global, reference scenarios.pdf", replace



* total deaths, median or reference scenario, 2021-01-01 on

twoway ///
(line TotDeaMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotDeaMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeaMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDeaMeRaA04S00V0 date, sort lcolor(gold)) /// 5 "LANL"
(line TotDeaMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("after 2021-01-01", size(small))


graph save "graph 32 COVID-19 total deaths, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 32 COVID-19 total deaths, global, reference scenarios, 2021-01-01 on.pdf", replace



* total deaths, median or reference scenario, 2021-01-01 on, CI

twoway ///
(line TotDeaMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 JOHN
(line TotDeaMeRaA01S00V03 date, sort lcolor(red)) /// 2 DELP mean
(line TotDeaLoRaA01S00V03 date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
(line TotDeaUpRaA01S00V03 date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
(line TotDeaMeSmA02S02V03 date, sort lcolor(black)) /// 5 IHME mean
(line TotDeaLoSmA02S02V03 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line TotDeaUpSmA02S02V03 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line TotDeaMeRaA03S02V07 date, sort lcolor(magenta)) /// 8 IMPE mean
(line TotDeaLoRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line TotDeaUpRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line TotDeaMeRaA04S00V0 date, sort lcolor(gold)) /// 11 LANL mean
(line TotDeaLoRaA04S00V0 date, sort lcolor(gold) lpattern(dash)) /// 12 LANL lower
(line TotDeaUpRaA04S00V0 date, sort lcolor(gold) lpattern(dash)) /// 13 LANL upper
(line TotDeaMeRaA05S00V02 date, sort lcolor(green)) /// 14 "SRIV" mean
(line TotDeaLoRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line TotDeaUpRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(1)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2020-12-01, with uncertainty", size(small))

graph save "graph 33 COVID-19 total deaths, global, reference scenarios, 2021-01-01 on, CI.gph", replace
graph export "graph 33 COVID-19 total deaths, global, reference scenarios, 2021-01-01 on, CI.pdf", replace





*****************

* total cases (graph numbers start with 41)


* total cases, median or reference scenario

twoway ///
(line TotCasMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotCasMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line TotCasMeRaA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line TotCasMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCasMeRaA04S00V0 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCasMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 41 COVID-19 total cases, global, reference scenarios.gph", replace
graph export "graph 41 COVID-19 total cases, global, reference scenarios.pdf", replace



* total cases, median or reference scenario, 2021-01-01 on

twoway ///
(line TotCasMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotCasMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line TotCasMeRaA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line TotCasMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCasMeRaA04S00V0 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCasMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("after 2020-12-01", size(small))

graph save "graph 42 COVID-19 total cases, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 42 COVID-19 total cases, global, reference scenarios, 2021-01-01 on.pdf", replace



* total cases, median or reference scenario, 2021-01-01 on, CI

twoway ///
(line TotCasMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 JOHN
(line TotCasMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line TotCasLoRaA01S00V03 date, sort lcolor(red) lpattern(dash)) /// 3 "DELP"
(line TotCasUpRaA01S00V03 date, sort lcolor(red) lpattern(dash)) /// 4 "DELP"
(line TotCasMeRaA02S01V03 date, sort lcolor(black)) /// 5 IHME mean
(line TotCasLoRaA02S01V03 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line TotCasUpRaA02S01V03 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line TotCasMeRaA03S02V07 date, sort lcolor(magenta)) /// 8 IMPE mean
(line TotCasLoRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line TotCasUpRaA03S02V07 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line TotCasMeRaA04S00V0 date, sort lcolor(gold)) /// 11 LANL mean
(line TotCasLoRaA04S00V0 date, sort lcolor(gold)  lpattern(dash)) /// 12 LANL lower
(line TotCasUpRaA04S00V0 date, sort lcolor(gold)  lpattern(dash)) /// 13 LANL upper
(line TotCasMeRaA05S00V02 date, sort lcolor(green)) /// 14 "SRIV" mean
(line TotCasMeRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line TotCasMeRaA05S00V02 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(1)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2020-12-01, with uncertainty", size(small))

graph save "graph 43 COVID-19 total cases, global, reference scenarios, 2021-01-01 on, CI.gph", replace
graph export "graph 43 COVID-19 total cases, global, reference scenarios, 2021-01-01 on, CI.pdf", replace




*****************

* daily cfr (graph numbers start with 51)


* cfr all studies, all time, reference scenarios


twoway ///
(line DayCfrMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCfrMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line DayCfrMeRaA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line DayCfrMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCfrMeRaA04S00V0 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCfrMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 51 COVID-19 daily CFR, global, reference scenarios.gph", replace
graph export "graph 51 COVID-19 daily CFR, global, reference scenarios.pdf", replace



* cfr all studies, reference scenarios, 2020-01-01 on

twoway ///
(line DayCfrMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCfrMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line DayCfrMeRaA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line DayCfrMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCfrMeRaA04S00V0 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCfrMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#16, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("after 2020-01-01", size(small))

graph save "graph 52 COVID-19 daily CFR, global, reference scenarios, 2020-01-01 on.gph", replace
graph export "graph 52 COVID-19 daily CFR, global, reference scenarios, 2020-01-01 on.pdf", replace



* cfr all studies, reference scenarios, with CIs

twoway ///
(line DayCfrMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCfrMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayCfrLoRaA01S00V03 date, sort lcolor(red*.3) lpattern(dash)) /// 3 "DELP" lower
(line DayCfrUpRaA01S00V03 date, sort lcolor(red*.3) lpattern(dash)) /// 4 "DELP" upper
(line DayCfrMeRaA02S01V03 date, sort lcolor(black)) /// 5 "IHME" mean
(line DayCfrLoRaA02S01V03 date, sort lcolor(black*.2) lpattern(dash)) /// 6 "IHME" lower
(line DayCfrUpRaA02S01V03 date, sort lcolor(black*.2) lpattern(dash)) /// 7 "IHME" upper
(line DayCfrMeRaA03S02V07 date, sort lcolor(magenta)) /// 8 "IMPE" mean
(line DayCfrLoRaA03S02V07 date, sort lcolor(magenta*.2) lpattern(dash)) /// 9 "IMPE" lower
(line DayCfrUpRaA03S02V07 date, sort lcolor(magenta*.2) lpattern(dash)) /// 10 "IMPE" upper
(line DayCfrMeRaA04S00V0 date, sort lcolor(gold)) /// 11 "LANL"
(line DayCfrLoRaA04S00V0 date, sort lcolor(gold*.2) lpattern(dash)) /// 12 "LANL"
(line DayCfrUpRaA04S00V0 date, sort lcolor(gold*.2) lpattern(dash)) /// 13 "LANL"
(line DayCfrMeRaA05S00V02 date, sort lcolor(green)) /// 14 "SRIV" mean
(line DayCfrMeRaA05S00V02 date, sort lcolor(green*.2) lpattern(dash)) /// 15 "SRIV" lower
(line DayCfrMeRaA05S00V02 date, sort lcolor(green*.2) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#16, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(1)) ///
note("Uncertainty limits: dashed light curves.") ///
subtitle("after 2020-01-01, with uncertainty", size(small))

graph save "graph 53 COVID-19 daily CFR, global, reference scenarios, 2020-01-01 on, with CIs.gph", replace
graph export "graph 53 COVID-19 daily CFR, global, reference scenarios, 2020-01-01 on, with CIs.pdf", replace




*****************

* daily active cases (graph numbers start with 61)


* daily active cases

twoway ///
(line DayActMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN" 
(line DayActMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP" 
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active cases) title("COVID-19 daily active cases, global", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 61 COVID-19 daily active cases.gph", replace
graph export "graph 61 COVID-19 daily active cases.pdf", replace





************************

* other outcomes (graph numbers start with 71)

	   

* daily hospital-related outcomes, DELP, IHME, IMPE


twoway ///
(line DayHosMeRaA01S00V03 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0 V3)
(line DayVenMeRaA01S00V03 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0 V3)
(line DayBedMeSmA02S01V03 date, sort lcolor(black)) /// 3 IHME Bed need (Daily Beds needed Mean IHME S1)
(line DayIcuMeSmA02S01V03 date, sort lcolor(green)) /// 4 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayVenMeSmA02S01V03 date, sort lcolor(red)) /// 5 IHME Vent need (Daily invasive Ventilation needed Mean IHME S1)
(line DayAdmMeSmA02S01V03 date, sort lcolor(yellow)) /// 6 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayIcnMeSmA02S01V03 date, sort lcolor(blue)) /// 7 IHME ICU new (Daily new people going to ICU Mean IHME S1)
(line DayHodMeRaA03S01V07 date, sort lcolor(magenta)) /// 8 IMPE Hosp demand (Daily hospital demand Mean A03 S01 V07)
(line DayHoiMeRaA03S01V07 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 V07)
(line DayIcdMeRaA03S01V07 date, sort lcolor(magenta) lpattern(dash_dot)) /// 10 IMPE ICU demand (Daily ICU demand Mean A03 S01 V07)
(line DayIciMeRaA03S01V07 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 11 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 V07)
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, median scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME Bed need" 4 "IHME ICU need" 5 "IHME Vent need" ///
6 "IHME Admissions" 7 "IHME ICU new" 8 "IMPE Hosp demand" ///
9 "IMPE Hosp incidence" 10 "IMPE ICU demand" 11 "IMPE ICU incidence") rows(4) size(small)) ///
subtitle("  .", size(small) color(white))

graph save "graph 71 COVID-19 hospital-related outcomes.gph", replace
graph export "graph 71 COVID-19 hospital-related outcomes.pdf", replace



* daily hospital-related outcomes, DELP, IHME, IMPE, wo extremes (IHME Bed need, IHME Bed over, IMPE Hosp demand)


twoway ///
(line DayHosMeRaA01S00V03 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0 V3)
(line DayVenMeRaA01S00V03 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0 V3)
(line DayIcuMeSmA02S01V03 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayVenMeSmA02S01V03 date, sort lcolor(red)) /// 4 IHME Vent need (Daily invasive Ventilation needed Mean IHME S1)
(line DayAdmMeSmA02S01V03 date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayIcnMeSmA02S01V03 date, sort lcolor(blue)) /// 6 IHME ICU new (Daily new people going to ICU Mean IHME S1)
(line DayHoiMeRaA03S01V07 date, sort lcolor(magenta) lpattern(dash)) /// 7 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 V07)
(line DayIcdMeRaA03S01V07 date, sort lcolor(magenta) lpattern(dash_dot)) /// 8 IMPE ICU demand (Daily ICU demand Mean A03 S01 V07)
(line DayIciMeRaA03S01V07 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 9 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 V07)
if date >= td(30dec2019) & date < td(02jul2021) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, median scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" 4 "IHME Vent need" ///
5 "IHME Admissions" 6 "IHME ICU new" 7 "IMPE Hosp incidence" 8 "IMPE ICU demand" 9 "IMPE ICU incidence") rows(3) size(small)) ///
subtitle("without IHME Bed need, IHME Bed over, IMPE Hosp demand)", size(small))

graph save "graph 72 COVID-19 hospital-related outcomes, wo extremes.gph", replace
graph export "graph 72 COVID-19 hospital-related outcomes, wo extremes.pdf", replace



* daily hospital-related outcomes, DELP, IHME, IMPE, wo extremes (IHME Bed need, IHME Bed over, IMPE Hosp demand), 2021-01-01 on 

twoway ///
(line DayHosMeRaA01S00V03 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0 V3)
(line DayVenMeRaA01S00V03 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0 V3)
(line DayIcuMeSmA02S01V03 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayVenMeSmA02S01V03 date, sort lcolor(red)) /// 4 IHME Vent need (Daily invasive Ventilation needed Mean IHME S1)
(line DayAdmMeSmA02S01V03 date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayIcnMeSmA02S01V03 date, sort lcolor(blue)) /// 6 IHME ICU new (Daily new people going to ICU Mean IHME S1)
(line DayHoiMeRaA03S01V07 date, sort lcolor(magenta) lpattern(dash)) /// 7 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 V07)
(line DayIcdMeRaA03S01V07 date, sort lcolor(magenta) lpattern(dash_dot)) /// 8 IMPE ICU demand (Daily ICU demand Mean A03 S01 V07)
(line DayIciMeRaA03S01V07 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 9 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 V07)
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, median scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" 4 "IHME Vent need" ///
5 "IHME Admissions" 6 "IHME ICU new" 7 "IMPE Hosp incidence" 8 "IMPE ICU demand" 9 "IMPE ICU incidence") rows(3) size(small)) ///
subtitle("after 2020-12-01, without IHME Bed need, IHME Bed over, IMPE Hosp demand)", size(small))

graph save "graph 73 COVID-19 hospital-related outcomes, wo extremes, 2021-01-01 on.gph", replace
graph export "graph 73 COVID-19 hospital-related outcomes, wo extremes, 2021-01-01 on.pdf", replace




*******************************

* daily cases to deaths (CTD) 




* Daily cases to deaths (CTD) all studies, all time, reference scenarios

twoway ///
(line DayCTDMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCTDMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line DayCTDMeRaA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line DayCTDMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCTDMeRaA04S00V02 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCTDMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 81 COVID-19 daily cases to deaths, global, reference scenarios.gph", replace
graph export "graph 81 COVID-19 daily cases to deaths, global, reference scenarios.pdf", replace



* Daily cases to deaths (CTD) all studies, 2021-01-01 on, reference scenarios

twoway ///
(line DayCTDMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCTDMeRaA01S00V03 date, sort lcolor(red)) /// 2 "DELP"
(line DayCTDMeRaA02S01V03 date, sort lcolor(black)) /// 3 "IHME"
(line DayCTDMeRaA03S02V07 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCTDMeRaA04S00V02 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCTDMeRaA05S00V02 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#16, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 82 COVID-19 daily cases to deaths, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 82 COVID-19 daily cases to deaths, global, reference scenarios, 2021-01-01 on.pdf", replace





*******************************

*  estimated to reported (graph numbers start with 91)


* daily deaths estimated to reported  


* daily deaths estimated to reported (DER) all studies, all time, reference scenarios


twoway ///
(line DayDERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayDERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line DayDERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line DayDERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("(no backcasting in DELPHI and SRIV)", size(small))

graph save "graph 91 COVID-19 daily deaths estimated to reported, global, reference scenarios.gph", replace
graph export "graph 91 COVID-19 daily deaths estimated to reported, global, reference scenarios.pdf", replace



* daily deaths estimated to reported (DER) all studies, reference scenarios, 2021-01-01 on


twoway ///
(line DayDERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayDERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line DayDERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line DayDERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("(2021-01-01 on, no backcasting in DELPHI and SRIV)", size(small))

graph save "graph 92 COVID-19 daily deaths estimated to reported, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 92 COVID-19 daily deaths estimated to reported, global, reference scenarios, 2021-01-01 on.pdf", replace






**************************************

* daily cases estimated to reported  


* daily cases estimated to reported (CER) all studies, all time, reference scenarios

twoway ///
(line DayCERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line DayCERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line DayCERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("(no backcasting in DELPHI and SRIV)", size(small) color(white))

graph save "graph 93 COVID-19 daily cases estimated to reported, global, reference scenarios.gph", replace
graph export "graph 93 COVID-19 daily cases estimated to reported, global, reference scenarios.pdf", replace



* daily cases estimated to reported (CER) all studies, reference scenarios, 2021-01-01 on

twoway ///
(line DayCERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line DayCERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line DayCERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line DayCERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL" 5) size(small) row(1)) ///
subtitle("after 2021-01-01, no backcasting in DELPHI and SRIV", size(small))

graph save "graph 94 COVID-19 daily cases estimated to reported, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 94 COVID-19 daily cases estimated to reported, global, reference scenarios, 2021-01-01 on.pdf", replace




* total deaths estimated to reported (DER) all studies, all time, reference scenarios

twoway ///
(line TotDERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotDERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line TotDERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line TotDERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("(no backcasting in DELPHI and SRIV)", size(small) color(white))

graph save "graph 95 COVID-19 total deaths estimated to reported, global, reference scenarios.gph", replace
graph export "graph 95 COVID-19 total deaths estimated to reported, global, reference scenarios.pdf", replace



* total deaths estimated to reported (DER) all studies, reference scenarios, 2021-01-01 on

twoway ///
(line TotDERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotDERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line TotDERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line TotDERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("after 2021-03-01, no backcasting in DELPHI and SRIV", size(small))

graph save "graph 96 COVID-19 total deaths estimated to reported, global, reference scenarios, 01mar2021 on.gph", replace
graph export "graph 96 COVID-19 total deaths estimated to reported, global, reference scenarios, 01mar2021 on.pdf", replace


* total cases estimated to reported (CER) all studies, all time, reference scenarios

twoway ///
(line TotCERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotCERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line TotCERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line TotCERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("(no backcasting in DELPHI and SRIV)", size(small) color(white))

graph save "graph 97 COVID-19 total cases estimated to reported, global, reference scenarios.gph", replace
graph export "graph 97 COVID-19 total cases estimated to reported, global, reference scenarios.pdf", replace



* total cases estimated to reported (CER) all studies, reference scenarios, 2021-01-01 on

twoway ///
(line TotCERMeRaA00S00V00 date, sort lcolor(cyan) lwidth(vthick) lpattern(tight_dot)) /// 1 "JOHN"
(line TotCERMeRaA02S01V03 date, sort lcolor(black)) /// 2 "IHME"
(line TotCERMeRaA03S02V07 date, sort lcolor(magenta)) /// 3 "IMPE"
(line TotCERMeRaA04S00V02 date, sort lcolor(gold)) /// 4 "LANL"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#9, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "IHME" 3 "IMPE" 4 "LANL") size(small) row(1)) ///
subtitle("after 2021-01-01, no backcasting in DELPHI and SRIV", size(small))

graph save "graph 98 COVID-19 total cases estimated to reported, global, reference scenarios, 2021-01-01 on.gph", replace
graph export "graph 98 COVID-19 total cases estimated to reported, global, reference scenarios, 2021-01-01 on.pdf", replace









************

* restore native scheme (of the local machine)

set scheme $nativescheme

di c(scheme)


view "log global merge.smcl"

log close

exit, clear





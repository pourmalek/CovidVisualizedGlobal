
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
LANL
SRIV
*/




* JOHN

if regexm(c(os),"Mac") == 1 {

	use "$pathCovidVisualizedGlobal/JOHN/CovidVisualizedGlobal JOHN.dta", clear 
}
else if regexm(c(os),"Windows") == 1 use "$pathCovidVisualizedGlobal\JOHN\CovidVisualizedGlobal JOHN.dta", clear 



* DELP 

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathCovidVisualizedGlobal/DELP/CovidVisualizedGlobal DELP.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\DELP\CovidVisualizedGlobal DELP.dta"

drop _merge



* IHME

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathCovidVisualizedGlobal/IHME/CovidVisualizedGlobal IHME.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\IHME\CovidVisualizedGlobal IHME.dta"

drop _merge



* IMPE

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathCovidVisualizedGlobal/IMPE/CovidVisualizedGlobal IMPE.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\IMPE\CovidVisualizedGlobal IMPE.dta"

drop _merge



* LANL

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathCovidVisualizedGlobal/LANL/CovidVisualizedGlobal LANL.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\LANL\CovidVisualizedGlobal LANL.dta"

drop _merge


* SRIV



if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathCovidVisualizedGlobal/SRIV/CovidVisualizedGlobal SRIV.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\SRIV\CovidVisualizedGlobal SRIV.dta"

drop _merge



* 

label var loc_grand_name "Location"







*************************************


* Cases or infections to deaths ratio


gen DayCTDMeRaA00S00 =  DayCasMeRaA00S00 / DayDeaMeRaA00S00

label var DayCTDMeRaA00S00  "Daily Cases to Deaths S0 JOHN"

gen TotCTDMeRaA00S00 =  TotCasMeRaA00S00 / TotDeaMeRaA00S00

label var TotCTDMeRaA00S00  "Total Cases to Deaths S0 JOHN"




gen DayCTDMeRaA01S00 =  DayCasMeRaA01S00 / DayDeaMeRaA01S00

label var DayCTDMeRaA01S00  "Daily Cases to Deaths S0 DELP"

gen TotCTDMeRaA01S00 =  TotCasMeRaA01S00 / TotDeaMeRaA01S00

label var TotCTDMeRaA01S00  "Total Cases to Deaths S0 DELP"  




gen DayITDMeRaA02S01  =  DayINFMeRaA02S01  / DayDeaMeRaA02S01 

label var DayITDMeRaA02S01   "Daily infections to Deaths S1 IHME"

gen TotITDMeRaA02S01  =  TotINFMeRaA02S01  / TotDeaMeRaA02S01 

label var TotITDMeRaA02S01   "Total infections to Deaths S1 IHME"




gen DayITDMeRaA02S02 = DayINFMeRaA02S02 / DayDeaMeRaA02S02  

label var DayITDMeRaA02S02 "Daily infections to Deaths S2 IHME"

gen TotITDMeRaA02S02 = TotINFMeRaA02S02 / TotDeaMeRaA02S02  

label var TotITDMeRaA02S02 "Total infections to Deaths S2 IHME"




gen DayITDMeRaA02S03  = DayINFMeRaA02S03  / DayDeaMeRaA02S03   

label var DayITDMeRaA02S03  "Daily infections to Deaths S3 IHME"

gen TotITDMeRaA02S03  = TotINFMeRaA02S03  / TotDeaMeRaA02S03   

label var TotITDMeRaA02S03  "Total infections to Deaths S3 IHME"




gen DayITDMeRaA03S01  = DayINFMeRaA03S01  / DayDeaMeRaA03S01   

label var DayITDMeRaA03S01  "Daily infections to Deaths S1 IMPE"

gen TotITDMeRaA03S01  = TotINFMeRaA03S01  / TotDeaMeRaA03S01   

label var TotITDMeRaA03S01  "Total infections to Deaths S1 IMPE"




gen DayITDMeRaA03S02  = DayINFMeRaA03S02  / DayDeaMeRaA03S02   

label var DayITDMeRaA03S02  "Daily infections to Deaths S2 IMPE"

gen TotITDMeRaA03S02  = TotINFMeRaA03S02  / TotDeaMeRaA03S02   

label var TotITDMeRaA03S02  "Total infections to Deaths S2 IMPE"




gen DayITDMeRaA03S03  = DayINFMeRaA03S03  / DayDeaMeRaA03S03   

label var DayITDMeRaA03S03  "Daily infections to Deaths S3 IMPE"

gen TotITDMeRaA03S03  = TotINFMeRaA03S03  / TotDeaMeRaA03S03   

label var TotITDMeRaA03S03  "Total infections to Deaths S3 IMPE"




gen DayCTDMeRaA04S00  = DayCasMeRaA04S00  / DayDeaMeRaA04S00   

label var DayCTDMeRaA04S00  "Daily Cases to Deaths S0 LANL"

gen TotCTDMeRaA04S00  = TotCasMeRaA04S00  / TotDeaMeRaA04S00   

label var TotCTDMeRaA04S00  "Total Cases to Deaths S0 LANL"




gen DayCTDMeRaA05S00  = DayCasMeRaA05S00  / DayDeaMeRaA05S00   

label var DayCTDMeRaA05S00  "Daily Cases to Deaths S0 SRIV"

gen TotCTDMeRaA05S00  = TotCasMeRaA05S00  / TotDeaMeRaA05S00   

label var TotCTDMeRaA05S00  "Total Cases to Deaths S0 SRIV"




***********************

* daily deaths estimated to reported  

    
gen DayDERMeRaA00S00 = DayDeaMeRaA00S00 / DayDeaMeRaA00S00

label var DayDERMeRaA00S00 "Daily Deaths estim to reported JOHN = 1" 


gen DayDERMeRaA01S00 = DayDeaMeRaA01S00 / DayDeaMeRaA00S00

label var DayDERMeRaA01S00 "Daily Deaths estim to reported Mean DELP S0"


gen DayDERMeRaA02S01 = DayDeaMeRaA02S01 / DayDeaMeRaA00S00

label var DayDERMeRaA02S01 "Daily Deaths estim to reported Mean not smoothed IHME S1"


gen DayDERMeRaA02S02 = DayDeaMeRaA02S02 / DayDeaMeRaA00S00

label var DayDERMeRaA02S02 "Daily Deaths estim to reported Mean not smoothed IHME S2"


gen DayDERMeRaA02S03 = DayDeaMeRaA02S03 / DayDeaMeRaA00S00

label var DayDERMeRaA02S03 "Daily Deaths estim to reported Mean not smoothed IHME S3"


gen DayDERMeRaA03S01 = DayDeaMeRaA03S01 / DayDeaMeRaA00S00

label var DayDERMeRaA03S01 "Daily Deaths estim to reported Mean S1 IMPE"


gen DayDERMeRaA03S02 = DayDeaMeRaA03S02 / DayDeaMeRaA00S00

label var DayDERMeRaA03S02 "Daily Deaths estim to reported Mean S2 IMPE"


gen DayDERMeRaA03S03 = DayDeaMeRaA03S03 / DayDeaMeRaA00S00

label var DayDERMeRaA03S03 "Daily Deaths estim to reported Mean S3 IMPE"


gen DayDERMeRaA04S00 = DayDeaMeRaA04S00 / DayDeaMeRaA00S00

label var DayDERMeRaA04S00 "Daily Deaths estim to reported to Deaths S0 LANL"


gen DayDERMeRaA05S00  = DayDeaMeRaA05S00 / DayDeaMeRaA00S00

label var DayDERMeRaA05S00 "Daily Deaths estim to reported S0 SRIV"






* daily cases or infections estimated, to reported cases 


gen DayCERMeRaA00S00 = DayCasMeRaA00S00 / DayCasMeRaA00S00

label var DayCERMeRaA00S00 "Daily Cases estim to reported JOHN = 1" 


gen DayCERMeRaA01S00 = DayCasMeRaA01S00 / DayCasMeRaA00S00

label var DayCERMeRaA01S00 "Daily Cases estim to reported Mean DELP S0"


gen DayIERMeRaA02S01 = DayINFMeRaA02S01 / DayCasMeRaA00S00

label var DayIERMeRaA02S01 "Daily infections estim to reported cases Mean not smoothed IHME S1"


gen DayIERMeRaA02S02 = DayINFMeRaA02S02 / DayCasMeRaA00S00

label var DayIERMeRaA02S02 "Daily infections estim to reported cases Mean not smoothed IHME S2"


gen DayIERMeRaA02S03 = DayINFMeRaA02S03 / DayCasMeRaA00S00

label var DayIERMeRaA02S03 "Daily infections estim to reported cases Mean not smoothed IHME S3"


gen DayIERMeRaA03S01 = DayINFMeRaA03S01 / DayCasMeRaA00S00

label var DayIERMeRaA03S01 "Daily infections estim to reported cases Mean S1 IMPE"


gen DayIERMeRaA03S02 = DayINFMeRaA03S02 / DayCasMeRaA00S00

label var DayIERMeRaA03S02 "Daily infections estim to reported cases Mean S2 IMPE"


gen DayIERMeRaA03S03 = DayINFMeRaA03S03 / DayCasMeRaA00S00

label var DayIERMeRaA03S03 "Daily infections estim to reported cases Mean S3 IMPE"


gen DayCERMeRaA04S00 = DayCasMeRaA04S00 / DayCasMeRaA00S00

label var DayCERMeRaA04S00 "Daily Cases estim to reported to Cases S0 LANL"


gen DayCERMeRaA05S00  = DayCasMeRaA05S00 / DayCasMeRaA00S00

label var DayCERMeRaA05S00 "Daily Cases estim to reported S0 SRIV"






* Total deaths estimated to reported  


gen TotDERMeRaA00S00 = TotDeaMeRaA00S00 / TotDeaMeRaA00S00

label var TotDERMeRaA00S00 "Total Deaths estim to reported JOHN = 1" 


gen TotDERMeRaA01S00 = TotDeaMeRaA01S00 / TotDeaMeRaA00S00

label var TotDERMeRaA01S00 "Total Deaths estim to reported Mean DELP S0"


gen TotDERMeRaA02S01 = TotDeaMeRaA02S01 / TotDeaMeRaA00S00

label var TotDERMeRaA02S01 "Total Deaths estim to reported Mean not smoothed IHME S1"


gen TotDERMeRaA02S02 = TotDeaMeRaA02S02 / TotDeaMeRaA00S00

label var TotDERMeRaA02S02 "Total Deaths estim to reported Mean not smoothed IHME S2"


gen TotDERMeRaA02S03 = TotDeaMeRaA02S03 / TotDeaMeRaA00S00

label var TotDERMeRaA02S03 "Total Deaths estim to reported Mean not smoothed IHME S3"


gen TotDERMeRaA03S01 = TotDeaMeRaA03S01 / TotDeaMeRaA00S00

label var TotDERMeRaA03S01 "Total Deaths estim to reported Mean S1 IMPE"


gen TotDERMeRaA03S02 = TotDeaMeRaA03S02 / TotDeaMeRaA00S00

label var TotDERMeRaA03S02 "Total Deaths estim to reported Mean S2 IMPE"


gen TotDERMeRaA03S03 = TotDeaMeRaA03S03 / TotDeaMeRaA00S00

label var TotDERMeRaA03S03 "Total Deaths estim to reported Mean S3 IMPE"


gen TotDERMeRaA04S00 = TotDeaMeRaA04S00 / TotDeaMeRaA00S00

label var TotDERMeRaA04S00 "Total Deaths estim to reported to Deaths S0 LANL"


gen TotDERMeRaA05S00  = TotDeaMeRaA05S00 / TotDeaMeRaA00S00

label var TotDERMeRaA05S00 "Total Deaths estim to reported S0 SRIV"






* Total cases or infections estimated to reported  


gen TotCERMeRaA00S00 = TotCasMeRaA00S00 / TotCasMeRaA00S00

label var TotCERMeRaA00S00 "Total Cases estim to reported JOHN = 1" 


gen TotCERMeRaA01S00 = TotCasMeRaA01S00 / TotCasMeRaA00S00

label var TotCERMeRaA01S00 "Total Cases estim to reported Mean DELP S0"


gen TotIERMeRaA02S01 = TotINFMeRaA02S01 / TotCasMeRaA00S00

label var TotIERMeRaA02S01 "Total infections estim to reported cases Mean not smoothed IHME S1"


gen TotIERMeRaA02S02 = TotINFMeRaA02S02 / TotCasMeRaA00S00

label var TotIERMeRaA02S02 "Total infections estim to reported cases Mean not smoothed IHME S2"


gen TotIERMeRaA02S03 = TotINFMeRaA02S03 / TotCasMeRaA00S00

label var TotIERMeRaA02S03 "Total infections estim to reported cases Mean not smoothed IHME S3"


gen TotIERMeRaA03S01 = TotINFMeRaA03S01 / TotCasMeRaA00S00

label var TotIERMeRaA03S01 "Total infections estim to reported cases Mean S1 IMPE"


gen TotIERMeRaA03S02 = TotINFMeRaA03S02 / TotCasMeRaA00S00

label var TotIERMeRaA03S02 "Total infections estim to reported cases Mean S2 IMPE"


gen TotIERMeRaA03S03 = TotINFMeRaA03S03 / TotCasMeRaA00S00

label var TotIERMeRaA03S03 "Total infections estim to reported cases Mean S3 IMPE"


gen TotCERMeRaA04S00 = TotCasMeRaA04S00 / TotCasMeRaA00S00

label var TotCERMeRaA04S00 "Total Cases estim to reported to Cases S0 LANL"


gen TotCERMeRaA05S00  = TotCasMeRaA05S00 / TotCasMeRaA00S00

label var TotCERMeRaA05S00 "Total Cases estim to reported S0 SRIV"


 
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

replace loc_grand_name = "global"

sort date loc_grand_name

isid date loc_grand_name

drop _merge

qui compress


save "CovidVisualizedGlobal merge.dta", replace

export delimited using "CovidVisualizedGlobal merge.csv", replace 




*

di in red "********* Description of vars in this final file named CovidVisualizedGlobal merge.dta *********" 


desc, fullnames
 


 
***************

***************

* graphs 


grstyle init

grstyle color background white



******************

** order of graphs: 

** (A) outcomes, (B) correction factors, (C) time coverage, (D) confidence intervals



** (A) outcomes: 

* daily deaths, daily cases, total deaths, total cases, daily CFR,
* daily hospital-related outcomes, 
* daily cases to deaths, total cases to deaths,
* daily deaths estimated to reported, daily cases estimated to reported, total deaths estimated to reported, total cases estimated to reported



** (B) correction factors 2 and 5 (for deaths and cases) 

* w/ correction factors 2 and 5, without correction factors 2 and 5



** (C) time coverage

* all time, 2021-01-01 on



** (D) confidence intervals 

* without confidence intervals, w/ confidence intervals, not show extremes 




*****************

* daily deaths (graph numbers start w/ 11)



****
* daily deaths, reference scenarios, all time

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(medthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 3 "DELP"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 4 "IHME"
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 5 "IMPE"
(line DayDeaMeRaA04S00 date, sort lcolor(gold)) /// 6 "LANL"
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 7 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IMPE" 6 "LANL" 7 "SRIV") size(small) row(2)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 11 COVID-19 daily deaths, global, reference scenarios, all time.gph", replace
graph export "graph 11 COVID-19 daily deaths, global, reference scenarios, all time.pdf", replace




****
* daily deaths, reference scenarios, 2021

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(medthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 3 "DELP"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 4 "IHME"
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 5 "IMPE"
(line DayDeaMeRaA04S00 date, sort lcolor(gold)) /// 6 "LANL"
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 7 "SRIV"
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IMPE" 6 "LANL" 7 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 12 COVID-19 daily deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 12 COVID-19 daily deaths, global, reference scenarios, 2021.pdf", replace




****
* daily deaths, reference scenarios, 2021, uncertainty

twoway ///
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayDeaLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 "DELP" lower
(line DayDeaUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 "DELP" upper
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line DayDeaLoSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line DayDeaUpSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line DayDeaLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line DayDeaUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line DayDeaMeRaA04S00 date, sort lcolor(gold)) /// 11 LANL mean
(line DayDeaLoRaA04S00 date, sort lcolor(gold) lpattern(dash)) /// 12 LANL lower
(line DayDeaUpRaA04S00 date, sort lcolor(gold) lpattern(dash)) /// 13 LANL upper
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 14 "SRIV" mean
(line DayDeaLoRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line DayDeaUpRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01, w/ uncertainty", size(small)) ///
note("Uncertainty limits: dashed curves") 

graph save "graph 13 COVID-19 daily deaths, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 13 COVID-19 daily deaths, global, reference scenarios, 2021, uncertainty.pdf", replace




****
* daily deaths, 3 scenarios, 2021

twoway ///
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 3 IHME mean, reference scenario
(line DayDeaMeSmA02S02 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 4 IHME mean, better scenario
(line DayDeaMeSmA02S03 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 5 IHME mean, worse scenario
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 6 IMPE mean, reference scenario
(line DayDeaMeRaA03S01 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 7 IMPE mean, better scenario
(line DayDeaMeRaA03S03 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 8 IMPE mean, worse scenario
(line DayDeaMeRaA04S00 date, sort lcolor(gold)) /// 9 LANL mean
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 10 "SRIV" mean
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP" 3 "IHME" 6 "IMPE" 9 "LANL" 10 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Better and worse scenarios: tight dot (|||||) curves; IHME and IMPE") 

graph save "graph 14 COVID-19 daily deaths, global, 3 scenarios, 2021.gph", replace
graph export "graph 14 COVID-19 daily deaths, global, 3 scenarios, 2021.pdf", replace




****
* daily deaths, reference scenario, uncertainty, 2021, IHME 

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA02S01 date, sort lcolor(black)) /// 3 IHME reference mean
(line DayDeaLoRaA02S01 date, sort lcolor(green) lpattern(dash)) /// 4 IHME reference lower
(line DayDeaUpRaA02S01 date, sort lcolor(red) lpattern(dash)) /// 5 IHME reference upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenario w/ uncertainty, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IHME mean" 4 "IHME lower" ///
5 "IHME upper") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Uncertainty limits: dashed (– – –) curves")

graph save "graph 15 COVID-19 daily deaths, global, reference scenario, uncertainty, 2021, IHME.gph", replace
graph export "graph 15 COVID-19 daily deaths, global, reference scenario, uncertainty, 2021, IHME.pdf", replace




****
* daily deaths, 3 scenarios, uncertainty, 2021, IHME 

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA02S01 date, sort lcolor(black)) /// 3 IHME reference mean
(line DayDeaMeRaA02S02 date, sort lcolor(green) lwidth(thick) lpattern(tight_dot)) /// 4 IHME best mean
(line DayDeaMeRaA02S03 date, sort lcolor(red) lwidth(thick) lpattern(tight_dot)) /// 5 IHME worse mean
(line DayDeaUpRaA02S03 date, sort lcolor(red) lpattern(dash)) /// 6 IHME worse upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, 3 scenarios, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IHME reference" 4 " IHME best" ///
5 "IHME worse" 6 "IHME worse upper") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Better and worse scenarios: tight dot (|||||) curves; Uncertainty limits: dashed (– – –) curves") 

graph save "graph 16 COVID-19 daily deaths, global, 3 scenarios, uncertainty, 2021, IHME.gph", replace
graph export "graph 16 COVID-19 daily deaths, global, 3 scenarios, uncertainty, 2021, IHME.pdf", replace




****
* daily deaths, reference scenario, uncertainty, 2021, IMPE 

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA03S02 date, sort lcolor(black)) /// 3 IMPE reference mean
(line DayDeaLoRaA03S02 date, sort lcolor(green) lpattern(dash)) /// 4 IMPE reference lower
(line DayDeaUpRaA03S02 date, sort lcolor(red) lpattern(dash)) /// 5 IMPE reference upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenario w/ uncertainty, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IMPE mean" 4 "IMPE lower" 5 "IMPE upper") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Uncertainty limits: dashed (– – –) curves") 

graph save "graph 17 COVID-19 daily deaths, global, reference scenario, uncertainty, 2021, IMPE.gph", replace
graph export "graph 17 COVID-19 daily deaths, global, reference scenario, uncertainty, 2021, IMPE.pdf", replace




****
* daily deaths, 3 scenarios, uncertainty, 2021, IMPE 

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA03S02 date, sort lcolor(black)) /// 3 IMPE reference mean
(line DayDeaMeRaA03S01 date, sort lcolor(green) lwidth(thick) lpattern(tight_dot)) /// 4 IMPE better mean
(line DayDeaMeRaA03S03 date, sort lcolor(red) lwidth(thick) lpattern(tight_dot)) /// 5 IMPE worse mean
(line DayDeaUpRaA03S03 date, sort lcolor(red) lpattern(dash)) /// 6 IMPE worse upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, 3 scenarios, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "IMPE reference" 4 "IMPE better" 5 "IMPE worse" ///
6 "IMPE worse upper") size(small) row(3)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Better and worse scenarios: tight dot (|||||) curves; Uncertainty limits: dashed (– – –) curves") 

graph save "graph 18 COVID-19 daily deaths, global, 3 scenarios, uncertainty, 2021, IMPE.gph", replace
graph export "graph 18 COVID-19 daily deaths, global, 3 scenarios, uncertainty, 2021, IMPE.pdf", replace




***********************

* Daily cases or infections (graph numbers start w/ 21)



****
* daily cases or infections, reference scenarios, all time

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medthick)) /// 1 "JOHN raw"
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 4 "DELP"
(line DayINFMeRaA02S01 date, sort lcolor(black)) /// 5 "IHME"
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 6 "IMPE"
(line DayCasMeRaA04S00 date, sort lcolor(gold)) /// 7 "LANL"
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 8 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases" ) size(small) row(2)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 21 COVID-19 daily cases, global, reference scenarios.gph", replace
graph export "graph 21 COVID-19 daily cases, global, reference scenarios.pdf", replace




****
* daily cases or infections, reference scenarios, 2021

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medthick)) /// 1 "JOHN"
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayINFMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCasMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases" ) size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) 

graph save "graph 22 COVID-19 daily cases, global, reference scenarios, 2021.gph", replace
graph export "graph 22 COVID-19 daily cases, global, reference scenarios, 2021.pdf", replace




****
* daily cases or infections, reference scenario, 2021, uncertainty 

twoway ///
(line DayCasMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 DELP mean
(line DayCasLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
(line DayCasUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
(line DayINFMeRaA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line DayINFLoRaA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line DayINFUpRaA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line DayINFLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line DayINFUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line DayCasMeRaA04S00 date, sort lcolor(gold)) /// 11 LANL mean
(line DayCasLoRaA04S00 date, sort lcolor(gold) lpattern(dash)) /// 12 LANL lower
(line DayCasUpRaA04S00 date, sort lcolor(gold) lpattern(dash)) /// 13 LANL upper
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 14 "SRIV" mean
(line DayCasLoRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line DayCasUpRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 5 "IHME infections" 8 ///
"IMPE infections" 11 "LANL cases" 14 "SRIV cases") size(small) row(2)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, w/ uncertainty", size(small))

graph save "graph 23 COVID-19 daily cases, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 23 COVID-19 daily cases, global, reference scenarios, 2021, uncertainty.pdf", replace




****
* daily cases or infections, 3 scenarios, 2021

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayINFMeRaA02S01 date, sort lcolor(black)) /// 3 IHME mean, reference scenario
(line DayINFMeRaA02S02 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 4 IHME mean, better scenario
(line DayINFMeRaA02S03 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 5 IHME mean, worse scenario
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 6 IMPE mean, reference scenario
(line DayINFMeRaA03S01 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 7 IMPE mean, better scenario
(line DayINFMeRaA03S03 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 8 IMPE mean, worse scenario
(line DayCasMeRaA04S00 date, sort lcolor(gold)) /// 9 LANL mean
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 10 "SRIV" mean
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 6 ///
"IMPE infections" 9 "LANL cases" 10 "SRIV cases") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Better and worse scenarios: tight dot (|||||) curves; IHME and IMPE") 

graph save "graph 24 COVID-19 daily cases, global, 3 scenarios, 2021, uncertainty.gph", replace
graph export "graph 24 COVID-19 daily cases, global, 3 scenarios, 2021, uncertainty.pdf", replace




*****************

* total deaths (graph numbers start w/ 31)


****
* total deaths, reference scenarios, all time

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDeaMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 31 COVID-19 total deaths, global, reference scenarios, all time.gph", replace
graph export "graph 31 COVID-19 total deaths, global, reference scenarios, all time.pdf", replace




****
* total deaths, reference scenarios, 2021

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDeaMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 32 COVID-19 total deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 32 COVID-19 total deaths, global, reference scenarios, 2021.pdf", replace




****
* total deaths, reference scenarios, 2021, uncertainty 

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 DELP mean
(line TotDeaLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
(line TotDeaUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line TotDeaLoSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line TotDeaUpSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line TotDeaLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line TotDeaUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line TotDeaMeRaA04S00 date, sort lcolor(gold)) /// 11 LANL mean
(line TotDeaLoRaA04S00 date, sort lcolor(gold) lpattern(dash)) /// 12 LANL lower
(line TotDeaUpRaA04S00 date, sort lcolor(gold) lpattern(dash)) /// 13 LANL upper
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 14 "SRIV" mean
(line TotDeaLoRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line TotDeaUpRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "LANL" 14 "SRIV") size(small) row(1)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, w/ uncertainty", size(small))

graph save "graph 33 COVID-19 total deaths, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 33 COVID-19 total deaths, global, reference scenarios, 2021, uncertainty.pdf", replace





*****************

* total cases or infections (graph numbers start w/ 41)



****
* total cases or infections, reference scenarios, all time

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotINFMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCasMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCasMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases or infections) title("COVID-19 total cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("  .", size(small) color(white))

graph save "graph 41 COVID-19 total cases, global, reference scenarios, all time.gph", replace
graph export "graph 41 COVID-19 total cases, global, reference scenarios, all time.pdf", replace




****
* total cases or infections, reference scenarios, 2021

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotINFMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCasMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCasMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases or infections) title("COVID-19 total cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 42 COVID-19 total cases, global, reference scenarios, 2021.gph", replace
graph export "graph 42 COVID-19 total cases, global, reference scenarios, 2021.pdf", replace




****
* total cases or infections, reference scenarios, 2021, uncertainty

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 JOHN
(line TotCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotCasLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 "DELP"
(line TotCasUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 "DELP"
(line TotINFMeRaA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line TotINFLoRaA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line TotINFUpRaA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line TotINFMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line TotINFLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line TotINFUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line TotCasMeRaA04S00 date, sort lcolor(gold)) /// 11 LANL mean
(line TotCasLoRaA04S00 date, sort lcolor(gold)  lpattern(dash)) /// 12 LANL lower
(line TotCasUpRaA04S00 date, sort lcolor(gold)  lpattern(dash)) /// 13 LANL upper
(line TotCasMeRaA05S00 date, sort lcolor(green)) /// 14 "SRIV" mean
(line TotCasMeRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 15 "SRIV" lower
(line TotCasMeRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 16 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases or infections) title("COVID-19 total cases or infections, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 5 "IHME infections" 8 "IMPE infections" ///
11 "LANL cases" 14 "SRIV cases") size(small) row(2)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, w/ uncertainty", size(small))

graph save "graph 43 COVID-19 total cases, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 43 COVID-19 total cases, global, reference scenarios, 2021, uncertainty.pdf", replace




*****************

* daily CFR or IFR (graph numbers start w/ 51)

****
* CFR or IFR  all studies, reference scenarios, all time

twoway ///
(line DayCfrMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medthick)) /// 1 "JOHN"
(line DayCfrMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayIFRMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayIFRMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCfrMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCfrMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR or IFR) title("COVID-19 daily CFR or IFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN CFR" 2 "DELP CFR" 3 "IHME IFR" 4 "IMPE IFR" ///
5 "LANL CFR" 6 "SRIV CFR") size(small) row(2)) ///
subtitle("  .", size(small) color(white))

graph save "graph 51 COVID-19 daily CFR, global, reference scenarios, all time.gph", replace
graph export "graph 51 COVID-19 daily CFR, global, reference scenarios, all time.pdf", replace




****
* CFR or IFR all studies, reference scenarios, 2021

twoway ///
(line DayCfrMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medthick)) /// 1 "JOHN"
(line DayCfrMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayIFRMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayIFRMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCfrMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCfrMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR or IFR) title("COVID-19 daily CFR or IFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN CFR" 2 "DELP CFR" 3 "IHME IFR" 4 "IMPE IFR" ///
5 "LANL CFR" 6 "SRIV CFR") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 52 COVID-19 daily CFR, global, reference scenarios, 2021.gph", replace
graph export "graph 52 COVID-19 daily CFR, global, reference scenarios, 2021.pdf", replace




****
* CFR or IFR wo JOHN LANL, reference scenarios, 2021, uncertainty

twoway ///
(line DayCfrMeRaA01S00 date, sort lcolor(red)) /// 1 "DELP" mean
(line DayCfrLoRaA01S00 date, sort lcolor(red*.3) lpattern(dash)) /// 2 "DELP" lower
(line DayCfrUpRaA01S00 date, sort lcolor(red*.3) lpattern(dash)) /// 3 "DELP" upper
(line DayIFRMeRaA02S01 date, sort lcolor(black)) /// 4 "IHME" mean
(line DayIFRLoRaA02S01 date, sort lcolor(black*.2) lpattern(dash)) /// 5 "IHME" lower
(line DayIFRUpRaA02S01 date, sort lcolor(black*.2) lpattern(dash)) /// 6 "IHME" upper
(line DayIFRMeRaA03S02 date, sort lcolor(magenta)) /// 7 "IMPE" mean
(line DayIFRLoRaA03S02 date, sort lcolor(magenta*.2) lpattern(dash)) /// 8 "IMPE" lower
(line DayIFRUpRaA03S02 date, sort lcolor(magenta*.2) lpattern(dash)) /// 9 "IMPE" upper
(line DayCfrMeRaA05S00 date, sort lcolor(green)) /// 10 "SRIV" mean
(line DayCfrMeRaA05S00 date, sort lcolor(green*.2) lpattern(dash)) /// 11 "SRIV" lower
(line DayCfrMeRaA05S00 date, sort lcolor(green*.2) lpattern(dash)) /// 12 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR or IFR) title("COVID-19 daily CFR or IFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP CFR" 4 "IHME IFR" 7 "IMPE IFR" 10 "SRIV CFR") size(small) row(1)) ///
note("Uncertainty limits: dashed light curves.") ///
subtitle("after 2021-01-01, without JOHN, LANL, w/ uncertainty", size(small))

graph save "graph 53 COVID-19 daily CFR, global, reference scenarios, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 53 COVID-19 daily CFR, global, reference scenarios, reference scenarios, 2021, uncertainty.pdf", replace





************************

* other outcomes (graph numbers start w/ 61)



* base codes w/ IHME

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayBedMeSmA02S01 date, sort lcolor(black)) /// 3 IHME Bed need (Daily Beds needed Mean IHME S1)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 4 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) /// 6 IHME ICU new (Daily new people going to ICU Mean IHME S1)
(line DayHodMeRaA03S01 date, sort lcolor(magenta)) /// 7 IMPE Hosp demand (Daily hospital demand Mean A03 S01 )
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 8 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 9 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 10 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, median scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME Bed need" 4 "IHME ICU need" ///
5 "IHME Admissions" 6 "IHME ICU new" 7 "IMPE Hosp demand" ///
8 "IMPE Hosp incidence" 9 "IMPE ICU demand" 10 "IMPE ICU incidence") rows(4) size(small)) ///
subtitle("  .", size(small) color(white))

graph save "graph 61 COVID-19 hospital-related outcomes.gph", replace
graph export "graph 61 COVID-19 hospital-related outcomes.pdf", replace




****
* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) /// 5 IHME ICU new (Daily new people going to ICU Mean IHME S1)
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 6 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 7 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 8 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, median scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
4 "IHME Admissions" 5 "IHME ICU new" 6 "IMPE Hosp incidence" 7 "IMPE ICU demand" 8 "IMPE ICU incidence") rows(3) size(small)) ///
subtitle("without IHME Bed need, IMPE Hosp demand", size(small))

graph save "graph 62 COVID-19 hospital-related outcomes, wo extremes.gph", replace
graph export "graph 62 COVID-19 hospital-related outcomes, wo extremes.pdf", replace




****
* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand, 2021

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) /// 5 IHME ICU new (Daily new people going to ICU Mean IHME S1)
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 6 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 7 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 8 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, median scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
4 "IHME Admissions" 5 "IHME ICU new" 6 "IMPE Hosp incidence" 7 "IMPE ICU demand" 8 "IMPE ICU incidence") rows(3) size(small)) ///
subtitle("after 2021-01-01, without IHME Bed need, IMPE Hosp demand", size(small))

graph save "graph 63 COVID-19 hospital-related outcomes, wo extremes, 2021.gph", replace
graph export "graph 63 COVID-19 hospital-related outcomes, wo extremes, 2021.pdf", replace



*******************************

* daily cases or infections to deaths (CTD) (graph numbers start w/ 71)



****
* Daily cases or infections to deaths (CTD) all studies, reference scenarios, all time

twoway ///
(line DayCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line DayCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCTDMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCTDMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths", size(small))

graph save "graph 71 COVID-19 daily cases to deaths, global, reference scenarios, all time.gph", replace
graph export "graph 71 COVID-19 daily cases to deaths, global, reference scenarios, all time.pdf", replace




****
* Daily cases or infections to deaths (CTD) all studies, reference scenarios, 2021

twoway ///
(line DayCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line DayCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCTDMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCTDMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths; after 2021-01-01", size(small))

graph save "graph 72 COVID-19 daily cases to deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 72 COVID-19 daily cases to deaths, global, reference scenarios, 2021.pdf", replace




****
* Total cases or infections to deaths (CTD) all studies, reference scenarios, all time

twoway ///
(line TotCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotITDMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCTDMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCTDMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases to deaths) title("COVID-19 total cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths", size(small))

graph save "graph 73 COVID-19 total cases to deaths, global, reference scenarios, all time.gph", replace
graph export "graph 73 COVID-19 total cases to deaths, global, reference scenarios, all time.pdf", replace




****
* Total cases or infections to deaths (CTD) all studies, reference scenarios, 2021

twoway ///
(line TotCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotITDMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCTDMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCTDMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases to deaths) title("COVID-19 total cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths; after 2021-01-01", size(small))

graph save "graph 74 COVID-19 total cases to deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 74 COVID-19 total cases to deaths, global, reference scenarios, 2021.pdf", replace




*******************************

*  estimated to reported (graph numbers start w/ 81)


* daily deaths estimated to reported  



****
* daily deaths estimated to reported (DER) all studies, reference scenarios, all time

twoway ///
(line DayDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line DayDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayDERMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayDERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayDERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 81 COVID-19 daily deaths estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 81 COVID-19 daily deaths estimated to reported, global, reference scenarios, all time.pdf", replace




****
* daily deaths estimated to reported (DER) all studies, reference scenarios, 2021

twoway ///
(line DayDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line DayDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayDERMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayDERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayDERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 82 COVID-19 daily deaths estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 82 COVID-19 daily deaths estimated to reported, global, reference scenarios, 2021.pdf", replace



* daily cases or infections estimated to reported cases



****
* daily cases or infections estimated to reported cases all studies, reference scenarios, all time

twoway ///
(line DayCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line DayCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 83 COVID-19 daily cases estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 83 COVID-19 daily cases estimated to reported, global, reference scenarios, all time.pdf", replace




****
* daily cases or infections estimated to reported cases all studies, reference scenarios, 2021

twoway ///
(line DayCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line DayCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line DayCERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 84 COVID-19 daily cases estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 84 COVID-19 daily cases estimated to reported, global, reference scenarios, 2021.pdf", replace




****
* total deaths estimated to reported (DER) all studies, reference scenarios, all time

twoway ///
(line TotDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN
(line TotDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDERMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotDERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 85 COVID-19 total deaths estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 85 COVID-19 total deaths estimated to reported, global, reference scenarios, all time.pdf", replace




****
* total deaths estimated to reported (DER) all studies, reference scenarios, 2021

twoway ///
(line TotDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN
(line TotDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDERMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotDERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "LANL" 6 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 86 COVID-19 total deaths estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 86 COVID-19 total deaths estimated to reported, global, reference scenarios, 2021.pdf", replace




****
* total cases or infections estimated to reported cases all studies, reference scenarios, all time

twoway ///
(line TotCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotIERMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotIERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" 5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("total cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 87 COVID-19 total cases estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 87 COVID-19 total cases estimated to reported, global, reference scenarios, all time.pdf", replace




****
* total cases or infections estimated to reported cases all studies, reference scenarios, 2021

twoway ///
(line TotCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN"
(line TotCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotIERMeRaA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotIERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCERMeRaA04S00 date, sort lcolor(gold)) /// 5 "LANL"
(line TotCERMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" 5 "LANL cases" 6 "SRIV cases") size(small) row(2)) ///
subtitle("total cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 88 COVID-19 total cases estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 88 COVID-19 total cases estimated to reported, global, reference scenarios, 2021.pdf", replace

***









************

* restore native scheme (of the local machine)

set scheme $nativescheme

di c(scheme)


view "log CovidVisualizedGlobal merge.smcl"

log close

exit, clear





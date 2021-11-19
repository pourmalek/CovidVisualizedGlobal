
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



/* LANL

if regexm(c(os),"Mac") == 1 {

	merge 1:1 date using "$pathCovidVisualizedGlobal/LANL/CovidVisualizedGlobal LANL.dta"
}
else if regexm(c(os),"Windows") == 1 merge 1:1 date using "$pathCovidVisualizedGlobal\LANL\CovidVisualizedGlobal LANL.dta"

drop _merge */


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




gen DayITDMeSmA02S01  =  DayINFMeSmA02S01  / DayDeaMeSmA02S01 

label var DayITDMeSmA02S01   "Daily infections to Deaths S1 IHME"

gen TotITDMeSmA02S01  =  TotINFMeSmA02S01  / TotDeaMeSmA02S01 

label var TotITDMeSmA02S01   "Total infections to Deaths S1 IHME"




gen DayITDMeSmA02S02 = DayINFMeSmA02S02 / DayDeaMeSmA02S02  

label var DayITDMeSmA02S02 "Daily infections to Deaths S2 IHME"

gen TotITDMeSmA02S02 = TotINFMeSmA02S02 / TotDeaMeSmA02S02  

label var TotITDMeSmA02S02 "Total infections to Deaths S2 IHME"




gen DayITDMeSmA02S03  = DayINFMeSmA02S03  / DayDeaMeSmA02S03   

label var DayITDMeSmA02S03  "Daily infections to Deaths S3 IHME"

gen TotITDMeSmA02S03  = TotINFMeSmA02S03  / TotDeaMeSmA02S03   

label var TotITDMeSmA02S03  "Total infections to Deaths S3 IHME"




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


gen DayDERMeSmA02S01 = DayDeaMeSmA02S01 / DayDeaMeRaA00S00

label var DayDERMeSmA02S01 "Daily Deaths estim to reported Mean smoothed IHME S1"


gen DayDERMeSmA02S02 = DayDeaMeSmA02S02 / DayDeaMeRaA00S00

label var DayDERMeSmA02S02 "Daily Deaths estim to reported Mean smoothed IHME S2"


gen DayDERMeSmA02S03 = DayDeaMeSmA02S03 / DayDeaMeSmA00S00

label var DayDERMeSmA02S03 "Daily Deaths estim to reported Mean smoothed IHME S3"


gen DayDERMeRaA03S01 = DayDeaMeRaA03S01 / DayDeaMeRaA00S00

label var DayDERMeRaA03S01 "Daily Deaths estim to reported Mean S1 IMPE"


gen DayDERMeRaA03S02 = DayDeaMeRaA03S02 / DayDeaMeRaA00S00

label var DayDERMeRaA03S02 "Daily Deaths estim to reported Mean S2 IMPE"


gen DayDERMeRaA03S03 = DayDeaMeRaA03S03 / DayDeaMeRaA00S00

label var DayDERMeRaA03S03 "Daily Deaths estim to reported Mean S3 IMPE"


gen DayDERMeRaA05S00  = DayDeaMeRaA05S00 / DayDeaMeRaA00S00

label var DayDERMeRaA05S00 "Daily Deaths estim to reported S0 SRIV"






* daily cases or infections estimated, to reported cases 


gen DayCERMeRaA00S00 = DayCasMeRaA00S00 / DayCasMeRaA00S00

label var DayCERMeRaA00S00 "Daily Cases estim to reported JOHN = 1" 


gen DayCERMeRaA01S00 = DayCasMeRaA01S00 / DayCasMeRaA00S00

label var DayCERMeRaA01S00 "Daily Cases estim to reported Mean DELP S0"


gen DayIERMeSmA02S01 = DayINFMeSmA02S01 / DayCasMeRaA00S00

label var DayIERMeSmA02S01 "Daily infections estim to reported cases Mean smoothed IHME S1"


gen DayIERMeSmA02S02 = DayINFMeSmA02S02 / DayCasMeRaA00S00

label var DayIERMeSmA02S02 "Daily infections estim to reported cases Mean smoothed IHME S2"


gen DayIERMeSmA02S03 = DayINFMeSmA02S03 / DayCasMeRaA00S00

label var DayIERMeSmA02S03 "Daily infections estim to reported cases Mean smoothed IHME S3"


gen DayIERMeRaA03S01 = DayINFMeRaA03S01 / DayCasMeRaA00S00

label var DayIERMeRaA03S01 "Daily infections estim to reported cases Mean S1 IMPE"


gen DayIERMeRaA03S02 = DayINFMeRaA03S02 / DayCasMeRaA00S00

label var DayIERMeRaA03S02 "Daily infections estim to reported cases Mean S2 IMPE"


gen DayIERMeRaA03S03 = DayINFMeRaA03S03 / DayCasMeRaA00S00

label var DayIERMeRaA03S03 "Daily infections estim to reported cases Mean S3 IMPE"


gen DayCERMeRaA05S00  = DayCasMeRaA05S00 / DayCasMeRaA00S00

label var DayCERMeRaA05S00 "Daily Cases estim to reported S0 SRIV"






* Total deaths estimated to reported  


gen TotDERMeRaA00S00 = TotDeaMeRaA00S00 / TotDeaMeRaA00S00

label var TotDERMeRaA00S00 "Total Deaths estim to reported JOHN = 1" 


gen TotDERMeRaA01S00 = TotDeaMeRaA01S00 / TotDeaMeRaA00S00

label var TotDERMeRaA01S00 "Total Deaths estim to reported Mean DELP S0"


gen TotDERMeSmA02S01 = TotDeaMeSmA02S01 / TotDeaMeRaA00S00

label var TotDERMeSmA02S01 "Total Deaths estim to reported Mean smoothed IHME S1"


gen TotDERMeSmA02S02 = TotDeaMeSmA02S02 / TotDeaMeRaA00S00

label var TotDERMeSmA02S02 "Total Deaths estim to reported Mean smoothed IHME S2"


gen TotDERMeSmA02S03 = TotDeaMeSmA02S03 / TotDeaMeRaA00S00

label var TotDERMeSmA02S03 "Total Deaths estim to reported Mean smoothed IHME S3"


gen TotDERMeRaA03S01 = TotDeaMeRaA03S01 / TotDeaMeRaA00S00

label var TotDERMeRaA03S01 "Total Deaths estim to reported Mean S1 IMPE"


gen TotDERMeRaA03S02 = TotDeaMeRaA03S02 / TotDeaMeRaA00S00

label var TotDERMeRaA03S02 "Total Deaths estim to reported Mean S2 IMPE"


gen TotDERMeRaA03S03 = TotDeaMeRaA03S03 / TotDeaMeRaA00S00

label var TotDERMeRaA03S03 "Total Deaths estim to reported Mean S3 IMPE"


gen TotDERMeRaA05S00  = TotDeaMeRaA05S00 / TotDeaMeRaA00S00

label var TotDERMeRaA05S00 "Total Deaths estim to reported S0 SRIV"






* Total cases or infections estimated to reported  


gen TotCERMeRaA00S00 = TotCasMeRaA00S00 / TotCasMeRaA00S00

label var TotCERMeRaA00S00 "Total Cases estim to reported JOHN = 1" 


gen TotCERMeRaA01S00 = TotCasMeRaA01S00 / TotCasMeRaA00S00

label var TotCERMeRaA01S00 "Total Cases estim to reported Mean DELP S0"


gen TotIERMeSmA02S01 = TotINFMeSmA02S01 / TotCasMeRaA00S00

label var TotIERMeSmA02S01 "Total infections estim to reported cases Mean smoothed IHME S1"


gen TotIERMeSmA02S02 = TotINFMeSmA02S02 / TotCasMeRaA00S00

label var TotIERMeSmA02S02 "Total infections estim to reported cases Mean smoothed IHME S2"


gen TotIERMeSmA02S03 = TotINFMeSmA02S03 / TotCasMeRaA00S00

label var TotIERMeSmA02S03 "Total infections estim to reported cases Mean smoothed IHME S3"


gen TotIERMeRaA03S01 = TotINFMeRaA03S01 / TotCasMeRaA00S00

label var TotIERMeRaA03S01 "Total infections estim to reported cases Mean S1 IMPE"


gen TotIERMeRaA03S02 = TotINFMeRaA03S02 / TotCasMeRaA00S00

label var TotIERMeRaA03S02 "Total infections estim to reported cases Mean S2 IMPE"


gen TotIERMeRaA03S03 = TotINFMeRaA03S03 / TotCasMeRaA00S00

label var TotIERMeRaA03S03 "Total infections estim to reported cases Mean S3 IMPE"


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

*****************

* daily deaths (graph numbers start w/ 11)



****
* daily deaths, reference scenarios, all time

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 3 "DELP"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 4 "IHME"
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 5 "IMPE"
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IMPE" 6 "SRIV") size(small) row(2)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 11a COVID-19 daily deaths, global, reference scenarios, all time.gph", replace
graph export "graph 11a COVID-19 daily deaths, global, reference scenarios, all time.pdf", replace





****
* daily deaths, reference scenarios, all time, with IHME excess deaths

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 3 "DELP"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 4 "IHME"
(line DayDeXMeSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 5 "IHME"
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 6 "IMPE"
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 7 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IHME excess" 6 "IMPE" 7 "SRIV") size(small) row(2)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 11b COVID-19 daily deaths, global, reference scenarios, all time with IHME excess deaths.gph", replace
graph export "graph 11b COVID-19 daily deaths, global, reference scenarios, all time with IHME excess deaths.pdf", replace




****
* daily deaths, reference scenarios, 2021


twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 3 "DELP"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 4 "IHME"
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 5 "IMPE"
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IMPE" 6 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 12a COVID-19 daily deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 12a COVID-19 daily deaths, global, reference scenarios, 2021.pdf", replace




****
* daily deaths, reference scenarios, 2021

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 3 "DELP"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 4 "IHME"
(line DayDeXMeSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 5 "IHME"
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 6 "IMPE"
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 7 "SRIV"
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN raw" 2 "JOHN smooth" 3 "DELP" 4 "IHME" 5 "IHME excess" 6 "IMPE" 7 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 12b COVID-19 daily deaths, global, reference scenarios, 2021 with IHME excess deaths.gph", replace
graph export "graph 12b COVID-19 daily deaths, global, reference scenarios, 2021 with IHME excess deaths.pdf", replace





****
* daily deaths, reference scenarios, 2021, uncertainty

twoway ///
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayDeaLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 "DELP" lower
(line DayDeaUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 "DELP" upper
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line DayDeaLoSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line DayDeaUpSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line DayDeaLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line DayDeaUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 11 "SRIV" mean
(line DayDeaLoRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
(line DayDeaUpRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01, w/ uncertainty", size(small)) ///
note("Uncertainty limits: dashed curves") 

graph save "graph 13 COVID-19 daily deaths, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 13 COVID-19 daily deaths, global, reference scenarios, 2021, uncertainty.pdf", replace




****
* daily deaths, 3 scenarios, 2021

twoway ///
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN smooth"
(line DayDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 3 IHME mean, reference scenario
(line DayDeaMeSmA02S02 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 4 IHME mean, better scenario
(line DayDeaMeSmA02S03 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 5 IHME mean, worse scenario
(line DayDeaMeRaA03S02 date, sort lcolor(magenta)) /// 6 IMPE mean, reference scenario
(line DayDeaMeRaA03S01 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 7 IMPE mean, better scenario
(line DayDeaMeRaA03S03 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 8 IMPE mean, worse scenario
(line DayDeaMeRaA05S00 date, sort lcolor(green)) /// 9 "SRIV" mean
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN smooth" 2 "DELP" 3 "IHME" 6 "IMPE" 9 "SRIV") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Better and worse scenarios: tight dot (|||||) curves; IHME and IMPE") 

graph save "graph 14 COVID-19 daily deaths, global, 3 scenarios, 2021.gph", replace
graph export "graph 14 COVID-19 daily deaths, global, 3 scenarios, 2021.pdf", replace




****
* daily deaths, reference scenario, uncertainty, 2021, IHME 

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(medium) lpattern(tight_dot)) /// 1 "JOHN raw"
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 3 IHME reference mean
(line DayDeaLoSmA02S01 date, sort lcolor(green) lpattern(dash)) /// 4 IHME reference lower
(line DayDeaUpSmA02S01 date, sort lcolor(red) lpattern(dash)) /// 5 IHME reference upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
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
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeSmA02S01 date, sort lcolor(black)) /// 3 IHME reference mean
(line DayDeaMeSmA02S02 date, sort lcolor(green) lwidth(thick) lpattern(tight_dot)) /// 4 IHME best mean
(line DayDeaMeSmA02S03 date, sort lcolor(red) lwidth(thick) lpattern(tight_dot)) /// 5 IHME worse mean
(line DayDeaUpSmA02S03 date, sort lcolor(red) lpattern(dash)) /// 6 IHME worse upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
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
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA03S02 date, sort lcolor(black)) /// 3 IMPE reference mean
(line DayDeaLoRaA03S02 date, sort lcolor(green) lpattern(dash)) /// 4 IMPE reference lower
(line DayDeaUpRaA03S02 date, sort lcolor(red) lpattern(dash)) /// 5 IMPE reference upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
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
(line DayDeaMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN smooth"
(line DayDeaMeRaA03S02 date, sort lcolor(black)) /// 3 IMPE reference mean
(line DayDeaMeRaA03S01 date, sort lcolor(green) lwidth(thick) lpattern(tight_dot)) /// 4 IMPE better mean
(line DayDeaMeRaA03S03 date, sort lcolor(red) lwidth(thick) lpattern(tight_dot)) /// 5 IMPE worse mean
(line DayDeaUpRaA03S03 date, sort lcolor(red) lpattern(dash)) /// 6 IMPE worse upper
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
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
(line DayDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(thick)) /// 1 "JOHN raw"
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayINFMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases" ) size(small) row(2)) ///
subtitle("  .", size(small) color(white)) 

graph save "graph 21 COVID-19 daily cases, global, reference scenarios.gph", replace
graph export "graph 21 COVID-19 daily cases, global, reference scenarios.pdf", replace




****
* daily cases or infections, reference scenarios, 2021

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(cyan*1.2)) /// 1 "JOHN"
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayINFMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases" ) size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) 

graph save "graph 22 COVID-19 daily cases, global, reference scenarios, 2021.gph", replace
graph export "graph 22 COVID-19 daily cases, global, reference scenarios, 2021.pdf", replace




****
* daily cases, reference scenarios, 2021

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(cyan) lwidth(medium)) /// 1 "JOHN"
(line DayCasMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 2 "JOHN"
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases) title("COVID-19 daily cases, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases raw" 2 "JOHN cases smooth" 3 "DELP cases" 4 "SRIV cases") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) 

graph save "graph 22b COVID-19 daily cases, global, reference scenarios, 2021.gph", replace
graph export "graph 22b COVID-19 daily cases, global, reference scenarios, 2021.pdf", replace




****
* daily cases or infections, reference scenario, 2021, uncertainty 

twoway ///
(line DayCasMeSmA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 JOHN
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 DELP mean
(line DayCasLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
(line DayCasUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
(line DayINFMeSmA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line DayINFLoSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line DayINFUpSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line DayINFLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line DayINFUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 11 "SRIV" mean
(line DayCasLoRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
(line DayCasUpRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 5 "IHME infections" 8 ///
"IMPE infections" 11 "SRIV cases") size(small) row(2)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, w/ uncertainty", size(small))

graph save "graph 23 COVID-19 daily cases, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 23 COVID-19 daily cases, global, reference scenarios, 2021, uncertainty.pdf", replace




****
* daily cases or infections, 3 scenarios, 2021

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 JOHN
(line DayCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP" mean
(line DayINFMeSmA02S01 date, sort lcolor(black)) /// 3 IHME mean, reference scenario
(line DayINFMeSmA02S02 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 4 IHME mean, better scenario
(line DayINFMeSmA02S03 date, sort lcolor(black) lwidth(thick) lpattern(tight_dot)) /// 5 IHME mean, worse scenario
(line DayINFMeRaA03S02 date, sort lcolor(magenta)) /// 6 IMPE mean, reference scenario
(line DayINFMeRaA03S01 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 7 IMPE mean, better scenario
(line DayINFMeRaA03S03 date, sort lcolor(magenta) lwidth(thick) lpattern(tight_dot)) /// 8 IMPE mean, worse scenario
(line DayCasMeRaA05S00 date, sort lcolor(green)) /// 9 "SRIV" mean
if date >= td(01jan2021)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases or infections) title("COVID-19 daily cases or infections, global, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 6 ///
"IMPE infections" 9 "SRIV cases") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small)) ///
note("Better and worse scenarios: tight dot (|||||) curves; IHME and IMPE") 

graph save "graph 24 COVID-19 daily cases, global, 3 scenarios, 2021, uncertainty.gph", replace
graph export "graph 24 COVID-19 daily cases, global, 3 scenarios, 2021, uncertainty.pdf", replace




*****************

* total deaths (graph numbers start w/ 31)


****
* total deaths, reference scenarios, all time

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white))

graph save "graph 31a COVID-19 total deaths, global, reference scenarios, all time.gph", replace
graph export "graph 31a COVID-19 total deaths, global, reference scenarios, all time.pdf", replace





****
* total deaths, reference scenarios, all time, with IHME excess mortality 

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeXMeSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 4 "IHME"
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 5 "IMPE"
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 6 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IHME excess" 5 "IMPE" 6 "SRIV") size(small) row(2)) ///
subtitle("  .", size(small) color(white))

graph save "graph 31b COVID-19 total deaths, global, reference scenarios, all time.gph", replace
graph export "graph 31b COVID-19 total deaths, global, reference scenarios, all time.pdf", replace






****
* total deaths, reference scenarios, 2021

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 32 COVID-19 total deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 32 COVID-19 total deaths, global, reference scenarios, 2021.pdf", replace




****
* total deaths, reference scenarios, 2021, uncertainty 

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 JOHN
(line TotDeaMeRaA01S00 date, sort lcolor(red)) /// 2 DELP mean
(line TotDeaLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 DELP lower
(line TotDeaUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 DELP upper
(line TotDeaMeSmA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line TotDeaLoSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line TotDeaUpSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line TotDeaMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line TotDeaLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line TotDeaUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line TotDeaMeRaA05S00 date, sort lcolor(green)) /// 11 "SRIV" mean
(line TotDeaLoRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
(line TotDeaUpRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 5 "IHME" 8 "IMPE" 11 "SRIV") size(small) row(1)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, w/ uncertainty", size(small))

graph save "graph 33 COVID-19 total deaths, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 33 COVID-19 total deaths, global, reference scenarios, 2021, uncertainty.pdf", replace





*****************

* total cases or infections (graph numbers start w/ 41)



****
* total cases or infections, reference scenarios, all time

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotINFMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCasMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases or infections) title("COVID-19 total cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("  .", size(small) color(white))

graph save "graph 41 COVID-19 total cases, global, reference scenarios, all time.gph", replace
graph export "graph 41 COVID-19 total cases, global, reference scenarios, all time.pdf", replace




****
* total cases or infections, reference scenarios, 2021

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotINFMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotINFMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCasMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases or infections) title("COVID-19 total cases or infections, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 42 COVID-19 total cases, global, reference scenarios, 2021.gph", replace
graph export "graph 42 COVID-19 total cases, global, reference scenarios, 2021.pdf", replace




****
* total cases or infections, reference scenarios, 2021, uncertainty

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 JOHN
(line TotCasMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotCasLoRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 3 "DELP"
(line TotCasUpRaA01S00 date, sort lcolor(red) lpattern(dash)) /// 4 "DELP"
(line TotINFMeSmA02S01 date, sort lcolor(black)) /// 5 IHME mean
(line TotINFLoSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 6 IHME lower
(line TotINFUpSmA02S01 date, sort lcolor(black) lpattern(dash)) /// 7 IHME upper
(line TotINFMeRaA03S02 date, sort lcolor(magenta)) /// 8 IMPE mean
(line TotINFLoRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 9 IMPE lower
(line TotINFUpRaA03S02 date, sort lcolor(magenta) lpattern(dash)) /// 10 IMPE upper
(line TotCasMeRaA05S00 date, sort lcolor(green)) /// 11 "SRIV" mean
(line TotCasMeRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 12 "SRIV" lower
(line TotCasMeRaA05S00 date, sort lcolor(green) lpattern(dash)) /// 13 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases or infections) title("COVID-19 total cases or infections, global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 5 "IHME infections" 8 "IMPE infections" ///
11 "SRIV cases") size(small) row(2)) ///
note("Uncertainty limits: dashed curves") ///
subtitle("after 2021-01-01, w/ uncertainty", size(small))

graph save "graph 43 COVID-19 total cases, global, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 43 COVID-19 total cases, global, reference scenarios, 2021, uncertainty.pdf", replace




*****************

* daily CFR or IFR (graph numbers start w/ 51)

****
* CFR or IFR  all studies, reference scenarios, all time

twoway ///
(line DayCfrMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayCfrMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line infection_fatality_A02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayIFRMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCfrMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR or IFR) title("COVID-19 daily CFR or IFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN CFR" 2 "DELP CFR" 3 "IHME IFR" 4 "IMPE IFR" ///
5 "SRIV CFR") size(small) row(2)) ///
subtitle("  .", size(small) color(white))

graph save "graph 51 COVID-19 daily CFR, global, reference scenarios, all time.gph", replace
graph export "graph 51 COVID-19 daily CFR, global, reference scenarios, all time.pdf", replace




****
* CFR or IFR all studies, reference scenarios, 2021

twoway ///
(line DayCfrMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayCfrMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line infection_fatality_A02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayIFRMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCfrMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR or IFR) title("COVID-19 daily CFR or IFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN CFR" 2 "DELP CFR" 3 "IHME IFR" 4 "IMPE IFR" ///
5 "SRIV CFR") size(small) row(2)) ///
subtitle("after 2021-01-01", size(small))

graph save "graph 52 COVID-19 daily CFR, global, reference scenarios, 2021.gph", replace
graph export "graph 52 COVID-19 daily CFR, global, reference scenarios, 2021.pdf", replace




****
* CFR or IFR wo JOHN, reference scenarios, 2021, uncertainty

twoway ///
(line DayCfrMeRaA01S00 date, sort lcolor(red)) /// 1 "DELP" mean
(line DayCfrLoRaA01S00 date, sort lcolor(red*.3) lpattern(dash)) /// 2 "DELP" lower
(line DayCfrUpRaA01S00 date, sort lcolor(red*.3) lpattern(dash)) /// 3 "DELP" upper
(line infection_fatality_A02S01 date, sort lcolor(black)) /// 4 "IHME" mean
(line DayIFRMeRaA03S02 date, sort lcolor(magenta)) /// 5 "IMPE" mean
(line DayIFRLoRaA03S02 date, sort lcolor(magenta*.2) lpattern(dash)) /// 6 "IMPE" lower
(line DayIFRUpRaA03S02 date, sort lcolor(magenta*.2) lpattern(dash)) /// 7 "IMPE" upper
(line DayCfrMeRaA05S00 date, sort lcolor(green)) /// 8 "SRIV" mean
(line DayCfrMeRaA05S00 date, sort lcolor(green*.2) lpattern(dash)) /// 9 "SRIV" lower
(line DayCfrMeRaA05S00 date, sort lcolor(green*.2) lpattern(dash)) /// 10 "SRIV" upper
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR or IFR) title("COVID-19 daily CFR or IFR, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP CFR" 4 "IHME IFR" 5 "IMPE IFR" 8 "SRIV CFR") size(small) row(1)) ///
note("Uncertainty limits: dashed light curves.") ///
subtitle("after 2021-01-01, without JOHN, with uncertainty", size(small))

graph save "graph 53 COVID-19 daily CFR, global, reference scenarios, reference scenarios, 2021, uncertainty.gph", replace
graph export "graph 53 COVID-19 daily CFR, global, reference scenarios, reference scenarios, 2021, uncertainty.pdf", replace





************************

* other outcomes (graph numbers start w/ 61)

****
* daily hospital-related outcomes

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayBedMeSmA02S01 date, sort lcolor(black)) /// 3 IHME Bed need (Daily Beds needed Mean IHME S1)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 4 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayHodMeRaA03S01 date, sort lcolor(magenta)) /// 6 IMPE Hosp demand (Daily hospital demand Mean A03 S01 )
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 7 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 8 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 9 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME Bed need" 4 "IHME ICU need" ///
5 "IHME Admissions" 6 "IMPE Hosp demand" ///
7 "IMPE Hosp incidence" 8 "IMPE ICU demand" 9 "IMPE ICU incidence") rows(4) size(small)) ///
subtitle("  .", size(small) color(white))

* ICU new of IHME retired

graph save "graph 61a COVID-19 hospital-related outcomes.gph", replace
graph export "graph 61a COVID-19 hospital-related outcomes.pdf", replace



****
* daily hospital-related outcomes, with IHME bed capcity

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayBedMeSmA02S01 date, sort lcolor(black)) /// 3 IHME Bed need (Daily Beds needed Mean IHME S1)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 4 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 5 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayHodMeRaA03S01 date, sort lcolor(magenta)) /// 6 IMPE Hosp demand (Daily hospital demand Mean A03 S01 )
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 7 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 8 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 9 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
(line DayBEDMeSmA02    date, sort lcolor(black) lpattern(dash)) /// 10
(line DayICUMeSmA02    date, sort lcolor(cyan) lpattern(dash)) /// 11
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME Bed need" 4 "IHME ICU need" ///
5 "IHME Admissions" 6 "IMPE Hosp demand" ///
7 "IMPE Hosp incidence" 8 "IMPE ICU demand" 9 "IMPE ICU incidence" ///
10 "IHME All bed capcity" 11 "IHME ICU bed capacity") rows(5) size(small)) ///
subtitle("  .", size(small) color(white))

* ICU new of IHME retired

graph save "graph 61b COVID-19 hospital-related outcomes with bed capcity.gph", replace
graph export "graph 61b COVID-19 hospital-related outcomes with bed capcity.pdf", replace



****
* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand, with IHME ICU bed capcity

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 5 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 6 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 7 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
4 "IHME Admissions" 5 "IMPE Hosp incidence" 6 "IMPE ICU demand" 7 "IMPE ICU incidence") rows(3) size(small)) ///
subtitle("without IHME Bed need, IMPE Hosp demand", size(small))

graph save "graph 62a COVID-19 hospital-related outcomes, wo extremes.gph", replace
graph export "graph 62a COVID-19 hospital-related outcomes, wo extremes.pdf", replace




****
* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 5 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 6 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 7 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
(line DayICUMeSmA02    date, sort lcolor(cyan) lpattern(dash)) /// 8
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
4 "IHME Admissions" 5 "IMPE Hosp incidence" 6 "IMPE ICU demand" 7 "IMPE ICU incidence" 8 "IHME ICU bed capacity") rows(4) size(small)) ///
subtitle("without IHME Bed need, IMPE Hosp demand", size(small))

graph save "graph 62b COVID-19 hospital-related outcomes, wo extremes ICU bed capcity.gph", replace
graph export "graph 62b COVID-19 hospital-related outcomes, wo extremes ICU bed capcity.pdf", replace




****
* daily hospital-related outcomes, DELP, IHME, IMPE, wo IHME Bed need, IMPE Hosp demand, 2021

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(red)  lwidth(thick)) /// 1 DELP Hospitalized (Daily Cases Active Hospitalized Mean DELP S0)
(line DayVenMeRaA01S00 date, sort lcolor(red) lpattern(dash)  lwidth(thick)) /// 2 DELP Ventilated (Daily Cases Active Ventilated Mean DELP S0)
(line DayIcuMeSmA02S01 date, sort lcolor(green)) /// 3 IHME ICU need (Daily ICU beds needed Mean IHME S1)
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) /// 4 IHME Admissions (Daily hospital admissions Mean IHME S1)
(line DayHoiMeRaA03S01 date, sort lcolor(magenta) lpattern(dash)) /// 5 IMPE Hosp incidence (Daily hospital incidence Mean A03 S01 )
(line DayIcdMeRaA03S01 date, sort lcolor(magenta) lpattern(dash_dot)) /// 6 IMPE ICU demand (Daily ICU demand Mean A03 S01 )
(line DayIciMeRaA03S01 date, sort lcolor(magenta) lpattern(longdash_shortdash)) /// 7 IMPE ICU incidence (Daily ICU incidence Mean A03 S01 )
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, reference scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "DELP Hospitalized" 2 "DELP Ventilated" 3 "IHME ICU need" ///
4 "IHME Admissions" 5 "IMPE Hosp incidence" 6 "IMPE ICU demand" 7 "IMPE ICU incidence") rows(3) size(small)) ///
subtitle("after 2021-01-01, without IHME Bed need, IMPE Hosp demand", size(small))

graph save "graph 63 COVID-19 hospital-related outcomes, wo extremes, 2021.gph", replace
graph export "graph 63 COVID-19 hospital-related outcomes, wo extremes, 2021.pdf", replace



*******************************

* daily cases or infections to deaths (CTD) (graph numbers start w/ 71)



****
* Daily cases or infections to deaths (CTD) all studies, reference scenarios, all time

twoway ///
(line DayCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCTDMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths", size(small))

graph save "graph 71 COVID-19 daily cases to deaths, global, reference scenarios, all time.gph", replace
graph export "graph 71 COVID-19 daily cases to deaths, global, reference scenarios, all time.pdf", replace




****
* Daily cases or infections to deaths (CTD) all studies, reference scenarios, 2021

twoway ///
(line DayCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCTDMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases to deaths) title("COVID-19 daily cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths; after 2021-01-01", size(small))

graph save "graph 72 COVID-19 daily cases to deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 72 COVID-19 daily cases to deaths, global, reference scenarios, 2021.pdf", replace




****
* Total cases or infections to deaths (CTD) all studies, reference scenarios, all time

twoway ///
(line TotCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotITDMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCTDMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases to deaths) title("COVID-19 total cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths", size(small))

graph save "graph 73 COVID-19 total cases to deaths, global, reference scenarios, all time.gph", replace
graph export "graph 73 COVID-19 total cases to deaths, global, reference scenarios, all time.pdf", replace




****
* Total cases or infections to deaths (CTD) all studies, reference scenarios, 2021

twoway ///
(line TotCTDMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotCTDMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotITDMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCTDMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases to deaths) title("COVID-19 total cases to deaths, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections to deaths; after 2021-01-01", size(small))

graph save "graph 74 COVID-19 total cases to deaths, global, reference scenarios, 2021.gph", replace
graph export "graph 74 COVID-19 total cases to deaths, global, reference scenarios, 2021.pdf", replace




*******************************

*  estimated to reported (graph numbers start w/ 81)


* daily deaths estimated to reported  



****
* daily deaths estimated to reported (DER) all studies, reference scenarios, all time

twoway ///
(line DayDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayDERMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayDERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 81 COVID-19 daily deaths estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 81 COVID-19 daily deaths estimated to reported, global, reference scenarios, all time.pdf", replace




****
* daily deaths estimated to reported (DER) all studies, reference scenarios, 2021

twoway ///
(line DayDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayDERMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayDERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths estimated to reported) title("COVID-19 daily deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 82 COVID-19 daily deaths estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 82 COVID-19 daily deaths estimated to reported, global, reference scenarios, 2021.pdf", replace



* daily cases or infections estimated to reported cases



****
* daily cases or infections estimated to reported cases all studies, reference scenarios, all time

twoway ///
(line DayCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 83 COVID-19 daily cases estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 83 COVID-19 daily cases estimated to reported, global, reference scenarios, all time.pdf", replace




****
* daily cases or infections estimated to reported cases all studies, reference scenarios, 2021

twoway ///
(line DayCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line DayCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line DayITDMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line DayITDMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line DayCERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases estimated to reported) title("COVID-19 daily cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" ///
5 "SRIV cases") size(small) row(2)) ///
subtitle("daily cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 84 COVID-19 daily cases estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 84 COVID-19 daily cases estimated to reported, global, reference scenarios, 2021.pdf", replace




****
* total deaths estimated to reported (DER) all studies, reference scenarios, all time

twoway ///
(line TotDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN
(line TotDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDERMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 85 COVID-19 total deaths estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 85 COVID-19 total deaths estimated to reported, global, reference scenarios, all time.pdf", replace




****
* total deaths estimated to reported (DER) all studies, reference scenarios, 2021

twoway ///
(line TotDERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN
(line TotDERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotDERMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotDERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotDERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths estimated to reported) title("COVID-19 total deaths estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN" 2 "DELP" 3 "IHME" 4 "IMPE" 5 "SRIV") size(small) row(1)) ///
subtitle("  .", size(small) color(white)) yscale(titlegap(2))

graph save "graph 86 COVID-19 total deaths estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 86 COVID-19 total deaths estimated to reported, global, reference scenarios, 2021.pdf", replace




****
* total cases or infections estimated to reported cases all studies, reference scenarios, all time

twoway ///
(line TotCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotIERMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotIERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#26, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" 5 "SRIV cases") size(small) row(2)) ///
subtitle("total cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 87 COVID-19 total cases estimated to reported, global, reference scenarios, all time.gph", replace
graph export "graph 87 COVID-19 total cases estimated to reported, global, reference scenarios, all time.pdf", replace




****
* total cases or infections estimated to reported cases all studies, reference scenarios, 2021

twoway ///
(line TotCERMeRaA00S00 date, sort lcolor(cyan*1.2) lwidth(vthick)) /// 1 "JOHN"
(line TotCERMeRaA01S00 date, sort lcolor(red)) /// 2 "DELP"
(line TotIERMeSmA02S01 date, sort lcolor(black)) /// 3 "IHME"
(line TotIERMeRaA03S02 date, sort lcolor(magenta)) /// 4 "IMPE"
(line TotCERMeRaA05S00 date, sort lcolor(green)) /// 5 "SRIV"
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid)  ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases estimated to reported) title("COVID-19 total cases estimated to reported, global, reference scenarios", size(medium)) /// 
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "JOHN cases" 2 "DELP cases" 3 "IHME infections" 4 "IMPE infections" 5 "SRIV cases") size(small) row(2)) ///
subtitle("total cases or infections estimated, to reported cases", size(small)) yscale(titlegap(2))

graph save "graph 88 COVID-19 total cases estimated to reported, global, reference scenarios, 2021.gph", replace
graph export "graph 88 COVID-19 total cases estimated to reported, global, reference scenarios, 2021.pdf", replace

***



* IHME graphs



* daily Infection outcomes ratios, 3 scenarios 
  
twoway ///
(line infection_detection_A02S01 date, sort lcolor(green)) ///
(line infection_hospitalization_A02S01 date, sort lcolor(black)) ///
(line infection_fatality_A02S01 date, sort lcolor(red)) ///
(line infection_detection_A02S02 date, sort lcolor(green) lpattern(dash)) ///
(line infection_hospitalization_A02S02 date, sort lcolor(black) lpattern(dash)) ///
(line infection_fatality_A02S02 date, sort lcolor(red) lpattern(dash)) ///
(line infection_detection_A02S03 date, sort lcolor(green) lpattern(dash)) ///
(line infection_hospitalization_A02S03 date, sort lcolor(black) lpattern(dash)) ///
(line infection_fatality_A02S03 date, sort lcolor(red) lpattern(dash)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2)) ///
note("Better and worse scenarios: dashed curves")

graph save "graph 91 COVID-19 daily Infection outcomes ratios, global 3 scenarios, IHME.gph", replace
graph export "graph 91 COVID-19 daily Infection outcomes ratios, global 3 scenarios, IHME.pdf", replace






* daily % change in mobility, CI

twoway ///
(line mobility_mean_A02S02 date, sort lcolor(green)) ///
(line mobility_mean_A02S03 date, sort lcolor(red)) ///
(line mobility_mean_A02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily % change in mobility from baseline) title("COVID-19 daily % change in mobility, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1)) 

graph save "graph 92 COVID-19 daily mobility, global, 3 scenarios.gph", replace
graph export "graph 92 COVID-19 daily mobility, global, 3 scenarios.pdf", replace







* daily mask use Percent of population reporting always wearing a mask when leaving home

twoway ///
(line mask_use_mean_A02S02 date, sort lcolor(green)) ///
(line mask_use_mean_A02S03 date, sort lcolor(red)) ///
(line mask_use_mean_A02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily mask use) title("COVID-19 daily mask use, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1)) ///
subtitle(Proportion of population reporting always wearing a mask when leaving home, size(small))

graph save "graph 93 COVID-19 daily mask_use, global, 3 scenarios.gph", replace
graph export "graph 93 COVID-19 daily mask_use, global, 3 scenarios.pdf", replace



* cumulative vaccinated percent

twoway ///
(line cumulative_all_vaccin_pct date, sort lcolor(black)) ///
(line cumul_all_effect_vacci_pct date, sort lcolor(blue)) ///
(line cumul_all_fully_vacci_pct date, sort lcolor(green) lwidth(thick)) ///
if date >= td(01dec2020) ///
, xtitle(Date) xlabel(#13, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(% Cumulative vaccinated percent) title("COVID-19 cumulative vaccinated percent, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small))

graph save "graph 94 COVID-19 cumulative vaccinated percent, global, IHME.gph", replace
graph export "graph 94 COVID-19 cumulative vaccinated percent, global, IHME.pdf", replace





* daily vaccinated percent

twoway ///
(line daily_all_vaccin_pct date, sort lcolor(black)) ///
(line daily_all_effect_vacci_pct date, sort lcolor(blue)) ///
(line daily_all_fully_vacci_pct date, sort lcolor(green) lwidth(thick)) ///
if date >= td(01dec2020) ///
, xtitle(Date) xlabel(#13, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(% Daily vaccinated percent) title("COVID-19 daily vaccinated percent, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small))

graph save "graph 95 COVID-19 daily vaccinated percent, global.gph", replace
graph export "graph 95 COVID-19 daily vaccinated percent, global.pdf", replace




* daily vaccinated number

twoway ///
(line daily_all_vaccinated date, sort lcolor(black)) ///
(line daily_all_effectively_vacci date, sort lcolor(blue)) ///
(line daily_all_fully_vaccinated date, sort lcolor(green) lwidth(thick)) ///
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#13, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily vaccinated number) title("COVID-19 daily vaccinated number, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small))

graph save "graph 96 COVID-19 daily vaccinated number, global.gph", replace
graph export "graph 96 COVID-19 daily vaccinated number, global.pdf", replace









************

* restore native scheme (of the local machine)

set scheme $nativescheme

di c(scheme)


view "log CovidVisualizedGlobal merge.smcl"

log close

exit, clear





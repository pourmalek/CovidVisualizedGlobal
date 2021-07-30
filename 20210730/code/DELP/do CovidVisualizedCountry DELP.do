
clear all

cd "$pathCovidVisualizedCountry"

cd DELP

capture log close 

log using "log CovidVisualizedCountry DELP.smcl", replace

***************************************************************************
* This is "do CovidVisualizedCountry DELP.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the country level (CovidVisualizedCountry)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
* Time (initial): 2021-04-14
***************************************************************************


                                                                                                         ***************************
* To change update date, find and replace all, 20210730 (old), with 20210730 (new) <<--           <<<--- * change update date here *
                                                                                                         ***************************


clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V4_since100_20210730.csv Global_V4_since100_20210730.csv

import delimited using "Global_V4_since100_20210730.csv", clear varnames(1)

rename country loc_grand_name

keep if loc_grand_name == "$country"

drop continent

rename province provincestate

replace provincestate = " National" if provincestate == "None"



* gen date

rename day date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date

drop year month day date2


* rename outcome variables


* total vars

rename totaldetecteddeaths   TotDeaMeRaA01S00
rename totaldetecteddeathslb TotDeaLoRaA01S00
rename totaldetecteddeathsub TotDeaUpRaA01S00

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"
label var TotDeaMeRaA01S00 "Total Deaths Lower DELP S0"
label var TotDeaMeRaA01S00 "Total Deaths Upper DELP S0"

rename totaldetected   TotCasMeRaA01S00
rename totaldetectedlb TotCasLoRaA01S00
rename totaldetectedub TotCasUpRaA01S00

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"
label var TotCasMeRaA01S00 "Total Cases Lower DELP S0"
label var TotCasMeRaA01S00 "Total Cases Upper DELP S0"


* gen daily vars and rename

sort provincestate date

bysort provincestate (date): gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

bysort provincestate (date): gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

bysort provincestate (date): gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

bysort provincestate (date): gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

bysort provincestate (date): gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

bysort provincestate (date): gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


label var DayDeaMeRaA01S00 "Daily Deaths Mean DELP S0"
label var DayDeaLoRaA01S00 "Daily Deaths Lower DELP S0"
label var DayDeaUpRaA01S00 "Daily Deaths Upper DELP S0"

label var DayCasMeRaA01S00 "Daily Cases Mean DELP S0"
label var DayCasLoRaA01S00 "Daily Cases Lower DELP S0"
label var DayCasUpRaA01S00 "Daily Cases Upper DELP S0"

label var TotDeaMeRaA01S00 "Total Deaths Mean DELP S0"
label var TotDeaLoRaA01S00 "Total Deaths Lower DELP S0"
label var TotDeaUpRaA01S00 "Total Deaths Upper DELP S0"

label var TotCasMeRaA01S00 "Total Cases Mean DELP S0"
label var TotCasLoRaA01S00 "Total Cases Lower DELP S0"
label var TotCasUpRaA01S00 "Total Cases Upper DELP S0"


* 

* other outcomes

* active activehospitalized activeventilated cumulativehospitalized

/*
***********************
* rename convention

active					Act

activehospitalized		Hos

activeventilated 		Ven

cumulativehospitalized 	Hos

*/


rename active DayActMeRaA01S00

rename activehospitalized DayHosMeRaA01S00

rename activeventilated DayVenMeRaA01S00

rename cumulativehospitalized TotHosMeRaA01S00

label var DayActMeRaA01S00 "Daily Cases Active Mean DELP S0"

label var DayHosMeRaA01S00 "Daily Cases Active Hospitalized Mean DELP S0"

label var DayVenMeRaA01S00 "Daily Cases Active Ventilated Mean DELP S0"

label var TotHosMeRaA01S00 "Total Cases Active Mean DELP S0"

 

keep ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name provincestate date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00



* gen cfr

gen DayCfrMeRaA01S00 = 100 * DayDeaMeRaA01S00 / DayCasMeRaA01S00
gen DayCfrLoRaA01S00 = 100 * DayDeaLoRaA01S00 / DayCasLoRaA01S00
gen DayCfrUpRaA01S00 = 100 * DayDeaUpRaA01S00 / DayCasUpRaA01S00

label var DayCfrMeRaA01S00 "Daily CFR Mean DELP S0"
label var DayCfrLoRaA01S00 "Daily CFR Lower DELP S0"
label var DayCfrUpRaA01S00 "Daily CFR Upper DELP S0"

*

* smooth daily deaths and daily cases

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA01S00 "Daily deaths mean smooth DELP"


tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaLoSmA01S00 "Daily deaths lower smooth DELP"


tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaUpSmA01S00 "Daily deaths upper smooth DELP"



tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasMeSmA01S00 "Daily cases mean smooth DELP"


tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasLoSmA01S00 "Daily cases lower smooth DELP"


tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)

tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasUpSmA01S00 "Daily cases upper smooth DELP"


drop *_window

drop provincestate_encoded

tsset, clear





* gen "Daily cases mean div by daily deaths mean DELP DayCbD" for visulization of temporal relation of deaths and cases peaks 


summ DayDeaMeRaA01S00 
gen DayDeMMeRaA01S00 = r(mean)
label var DayDeMMeRaA01S00 "Daily deaths mean DELP DayDeM"

summ DayCasMeRaA01S00 
gen DayCaMMeRaA01S00 = r(mean)
label var DayCaMMeRaA01S00 "Daily cases mean DELP DayCaM"
                              
gen DayCbDMeRaA01S00 = DayCaMMeRaA01S00 / DayDeaMeRaA01S00
label var DayCbDMeRaA01S00 "Daily cases mean div by daily deaths mean DELP DayCbD"
summ DayCbDMeRaA01S00
	
gen DayDMuMeRaA01S00 = DayDeaMeRaA01S00 * DayCbDMeRaA01S00
label var DayDMuMeRaA01S00 "Daily deaths scaled (times means of cases by deaths) only for visualization DELP"
summ DayDMuMeRaA01S00	






* gen vars by provincestate 

foreach var of varlist ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 /// 
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00 ///
DayCfrMeRaA01S00 DayCfrLoRaA01S00 DayCfrUpRaA01S00 ///
DayDeMMeRaA01S00 DayCaMMeRaA01S00 DayCbDMeRaA01S00 DayDMuMeRaA01S00 {

*
			 
qui gen `var'XAB = `var' 
qui replace `var'XAB = . if provincestate != "Alberta"

qui gen `var'XBC = `var'
qui replace `var'XBC = . if provincestate != "British Columbia"

qui gen `var'XMB = `var'
qui replace `var'XMB = . if provincestate != "Manitoba"

qui gen `var'XXX = `var'
qui replace `var'XXX = . if provincestate != " National"

qui gen `var'XNB = `var'
qui replace `var'XNB = . if provincestate != "New Brunswick"

qui gen `var'XNL = `var'
qui replace `var'XNL = . if provincestate != "Newfoundland and Labrador"

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"


label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNS "`var' Nova Scotia"
label var `var'XON "`var' Ontario"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"


                
}
*




sort loc_grand_name provincestate date

order loc_grand_name provincestate date

qui compress

save "CovidVisualizedCountry DELP.dta", replace





***********************

* graphs


grstyle init

grstyle color background white



*****************
* daily deaths (graph numbers starting with 1)


****
* 1 a daily deaths, national, all subnational

twoway ///
(line DayDeaMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeaMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeaMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeaMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayDeaMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayDeaMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayDeaMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayDeaMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayDeaMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayDeaMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "1aDayDeaDELPsub1 - COVID-19 daily deaths, $country, subnational, DELP.gph", replace
graph export "1aDayDeaDELPsub1 - COVID-19 daily deaths, $country, subnational, DELP.pdf", replace




****
* 1 b daily deaths, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayDeaMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeaMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeaMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeaMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayDeaMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayDeaMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "1bDayDeaDELPsub2 - COVID-19 daily deaths, $country, subnational, most affected, DELP.gph", replace
graph export "1bDayDeaDELPsub2 - COVID-19 daily deaths, $country, subnational, most affected, DELP.pdf", replace




****
* 1 c daily deaths, national, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeaLoRaA01S00 DayDeaUpRaA01S00 date, sort color(green*.2)) ///
(line DayDeaMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayDeaMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario, with confidence limits", size(small))	
  	   
qui graph save "1cDayDeaDELPsub3 `l' - COVID-19 daily deaths, $country, `l', DELP.gph", replace
qui graph export "1cDayDeaDELPsub3 `l' - COVID-19 daily deaths, $country, `l', DELP.pdf", replace

}
*







*****************
* daily cases (graph numbers starting with 2)


****
* 2 a daily cases, national, all subnational

twoway ///
(line DayCasMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCasMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCasMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCasMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayCasMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayCasMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayCasMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayCasMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayCasMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayCasMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "2aDayCasDELPsub1 - COVID-19 daily cases, $country, subnational, DELP.gph", replace
graph export "2aDayCasDELPsub1 - COVID-19 daily cases, $country, subnational, DELP.pdf", replace




****
* 2 b daily cases, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayCasMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCasMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCasMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCasMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayCasMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayCasMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "2bDayCasDELPsub2 - COVID-19 daily cases, $country, subnational, most affected, DELP.gph", replace
graph export "2bDayCasDELPsub2 - COVID-19 daily cases, $country, subnational, most affected, DELP.pdf", replace




****
* 2 c daily cases, national, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayCasLoRaA01S00 DayCasUpRaA01S00 date, sort color(green*.2)) ///
(line DayCasMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayCasMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases) title("COVID-19 daily cases, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario, with confidence limits", size(small))	
  	   
qui graph save "2cDayCasDELPsub3 `l' - COVID-19 daily cases, $country, `l', DELP.gph", replace
qui graph export "2cDayCasDELPsub3 `l' - COVID-19 daily cases, $country, `l', DELP.pdf", replace

}
*





*****************
* total deaths (graph numbers starting with 3)


****
* 3 a total deaths, national, all subnational

twoway ///
(line TotDeaMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotDeaMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotDeaMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotDeaMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line TotDeaMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line TotDeaMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line TotDeaMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line TotDeaMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line TotDeaMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line TotDeaMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "3aTotDeaDELPsub1 - COVID-19 total deaths, $country, subnational, DELP.gph", replace
graph export "3aTotDeaDELPsub1 - COVID-19 total deaths, $country, subnational, DELP.pdf", replace




****
* 3 b total deaths, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line TotDeaMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotDeaMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotDeaMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotDeaMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line TotDeaMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line TotDeaMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "3bTotDeaDELPsub2 - COVID-19 total deaths, $country, subnational, most affected, DELP.gph", replace
graph export "3bTotDeaDELPsub2 - COVID-19 total deaths, $country, subnational, most affected, DELP.pdf", replace




****
* 3 c total deaths, national, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotDeaLoRaA01S00 TotDeaUpRaA01S00 date, sort color(green*.2)) ///
(line TotDeaMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotDeaMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario, with confidence limits", size(small))	
  	   
qui graph save "3cTotDeaDELPsub3 `l' - COVID-19 total deaths, $country, `l', DELP.gph", replace
qui graph export "3cTotDeaDELPsub3 `l' - COVID-19 total deaths, $country, `l', DELP.pdf", replace

}
*






*****************
* total cases (graph numbers starting with 4)


****
* 4 a total cases, national, all subnational

twoway ///
(line TotCasMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotCasMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotCasMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotCasMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line TotCasMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line TotCasMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line TotCasMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line TotCasMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line TotCasMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line TotCasMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "4aTotCasDELPsub1 - COVID-19 total cases, $country, subnational, DELP.gph", replace
graph export "4aTotCasDELPsub1 - COVID-19 total cases, $country, subnational, DELP.pdf", replace




****
* 4 b total cases, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line TotCasMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotCasMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotCasMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotCasMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line TotCasMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line TotCasMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "4bTotCasDELPsub2 - COVID-19 total cases, $country, subnational, most affected, DELP.gph", replace
graph export "4bTotCasDELPsub2 - COVID-19 total cases, $country, subnational, most affected, DELP.pdf", replace




****
* 4 c total cases, national, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotCasLoRaA01S00 TotCasUpRaA01S00 date, sort color(green*.2)) ///
(line TotCasMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotCasMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total cases) title("COVID-19 total cases, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario, with confidence limits", size(small))	
  	   
qui graph save "4cTotCasDELPsub3 `l' - COVID-19 total cases, $country, `l', DELP.gph", replace
qui graph export "4cTotCasDELPsub3 `l' - COVID-19 total cases, $country, `l', DELP.pdf", replace

}
*






*****************
* daily CFR (graph numbers starting with 5)


****
* 5 a daily CFR, national, all subnational

twoway ///
(line DayCfrMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCfrMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCfrMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCfrMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayCfrMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayCfrMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayCfrMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayCfrMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayCfrMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayCfrMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "5aDayCfrDELPsub1 - COVID-19 daily CFR, $country, subnational, DELP.gph", replace
graph export "5aDayCfrDELPsub1 - COVID-19 daily CFR, $country, subnational, DELP.pdf", replace




****
* 5 b daily CFR, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayCfrMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCfrMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCfrMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCfrMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayCfrMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayCfrMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "5bDayCfrDELPsub2 - COVID-19 daily CFR, $country, subnational, most affected, DELP.gph", replace
graph export "5bDayCfrDELPsub2 - COVID-19 daily CFR, $country, subnational, most affected, DELP.pdf", replace




****
* 5 c daily CFR, national, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayCfrLoRaA01S00 DayCfrUpRaA01S00 date, sort color(green*.2)) ///
(line DayCfrMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayCfrMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario, with confidence limits", size(small))	
  	   
qui graph save "5cDayCfrDELPsub3 `l' - COVID-19 daily CFR, $country, `l', DELP.gph", replace
qui graph export "5cDayCfrDELPsub3 `l' -  COVID-19 daily CFR, $country, `l', DELP.pdf", replace

}
*






*****************
* daily active cases (graph numbers starting with 6)


****
* 6 a daily active cases, national, all subnational

twoway ///
(line DayActMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayActMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayActMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayActMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayActMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayActMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayActMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayActMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayActMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayActMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active cases) title("COVID-19 daily active cases, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "6aDayActDELPsub1 -  COVID-19 daily active cases, $country, subnational, DELP.gph", replace
graph export "6aDayActDELPsub1 - COVID-19 daily active cases, $country, subnational, DELP.pdf", replace




****
* 6 b daily active cases, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayActMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayActMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayActMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayActMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayActMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayActMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active cases) title("COVID-19 daily active cases, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "6bDayActDELPsub2 - COVID-19 daily active cases, $country, subnational, most affected, DELP.gph", replace
graph export "6bDayActDELPsub2 - COVID-19 daily active cases, $country, subnational, most affected, DELP.pdf", replace




****
* 6 c daily active cases, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayActMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayActMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily active cases) title("COVID-19 daily active cases, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario", size(small)) 

qui graph save "6cDayActDELPsub3 `l' - COVID-19 daily active cases, $country, `l', DELP.gph", replace
qui graph export "6cDayActDELPsub3 `l' - COVID-19 daily active cases, $country, `l', DELP.pdf", replace

}
*








*****************
* daily active hospitalized (graph numbers starting with 7)


****
* 7 a daily active hospitalized, national, all subnational

twoway ///
(line DayHosMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayHosMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayHosMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayHosMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayHosMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayHosMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayHosMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayHosMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayHosMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayHosMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active hospitalized) title("COVID-19 daily active hospitalized, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "7aDayHosDELPsub1 - COVID-19 daily active hospitalized, $country, subnational, DELP.gph", replace
graph export "7aDayHosDELPsub1 - COVID-19 daily active hospitalized, $country, subnational, DELP.pdf", replace




****
* 7 b daily active hospitalized, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayHosMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayHosMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayHosMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayHosMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayHosMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayHosMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active hospitalized) title("COVID-19 daily active hospitalized, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) ///

qui graph save "7bDayHosDELPsub2 - COVID-19 daily active hospitalized, $country, subnational, most affected, DELP.gph", replace
graph export "7bDayHosDELPsub2 - COVID-19 daily active hospitalized, $country, subnational, most affected, DELP.pdf", replace




****
* 7 c daily active hospitalized, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayHosMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayHosMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily active hospitalized) title("COVID-19 daily active hospitalized, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario", size(small)) 

qui graph save "7cDayHosDELPsub3 `l' - COVID-19 daily active hospitalized, $country, `l', DELP.gph", replace
qui graph export "7cDayHosDELPsub3 `l' - COVID-19 daily active hospitalized, $country, `l', DELP.pdf", replace

}
*






*****************
* daily active ventilated (graph numbers starting with 8)


****
* 8 a daily active ventilated, national, all subnational

twoway ///
(line DayVenMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayVenMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayVenMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayVenMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayVenMeRaA01S00XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayVenMeRaA01S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayVenMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayVenMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayVenMeRaA01S00XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayVenMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active ventilated) title("COVID-19 daily active ventilated, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("single scenario, all provinces avilable in DELP", size(small)) 

qui graph save "8aDayVenDELPsub1 - COVID-19 daily active ventilated, $country, subnational, DELP.gph", replace
graph export "8aDayVenDELPsub1 - COVID-19 daily active ventilated, $country, subnational, DELP.pdf", replace




****
* 8 b daily active ventilated, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayVenMeRaA01S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayVenMeRaA01S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayVenMeRaA01S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayVenMeRaA01S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayVenMeRaA01S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayVenMeRaA01S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily active ventilated) title("COVID-19 daily active ventilated, $country, DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("single scenario, 5 most affected provinces", size(small)) 

qui graph save "8bDayVenDELPsub2 - COVID-19 daily active ventilated, $country, subnational, most affected, DELP.gph", replace
graph export "8bDayVenDELPsub2 - COVID-19 daily active ventilated, $country, subnational, most affected, DELP.pdf", replace




****
* 8 c daily active ventilated, subnational, separate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayVenMeRaA01S00 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayVenMeRaA01S00 != ., legend(off) ///	   
xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily active ventilated) title("COVID-19 daily active ventilated, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("single scenario", size(small)) 
  	   
qui graph save "8cDayVenDELPsub3 `l' - COVID-19 daily active ventilated, $country, `l', DELP.gph", replace
qui graph export "8cDayVenDELPsub3 `l' - COVID-19 daily active ventilated, $country, `l', DELP.pdf", replace

}
*




*************************************

** DayCas DayDea DayDea_multip

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayCasMeRaA01S00 date, sort lcolor(blue)) ///
(line DayDeaMeRaA01S00 date, sort lcolor(red)) ///
(line DayDMuMeRaA01S00 date, sort lpattern(dot) lcolor(red)) ///
if provincestate == "`l'" & date > td(01jan2020) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily cases and deaths) title("COVID-19 daily cases and deaths, $country, `l', DELP", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(4)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled for visualization") size(small)) ///
subtitle("Daily deaths, scaled = times (means of cases divided by deaths) for visualization only", size(small)) ///
note("Single scenario, mean estimate")

qui graph save "9DayDMuDELPsub3 `l' - COVID-19 daily deaths and cases, $country, `l', DELP.gph", replace
graph export "9DayDMuDELPsub3 `l' - COVID-19 daily deaths and cases,  $country, `l', DELP.pdf", replace

}
*




view "log CovidVisualizedCountry DELP.smcl"

log close

exit, clear





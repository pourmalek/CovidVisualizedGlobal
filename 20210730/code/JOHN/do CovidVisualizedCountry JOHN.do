
clear all

cd "$pathCovidVisualizedCountry"

cd JOHN

capture log close 

log using "log CovidVisualizedCountry JOHN.smcl", replace

***************************************************************************
* This is "do CovidVisualizedCountry JOHN.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the country level (CovidVisualizedCountry)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
* Time (initial): 2021-04-14
***************************************************************************




****************************************

* get Johns Hopkins data for deaths


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(1:2)

save "time_series_covid19_deaths_global col 2.dta", replace


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv" ///
, clear varnames(1) colrange(5)

save "time_series_covid19_deaths_global col 5 on.dta", replace


use "time_series_covid19_deaths_global col 2.dta", clear 

merge 1:1 _n using "time_series_covid19_deaths_global col 5 on.dta"

drop _merge

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name

keep if loc_grand_name == "$country"

qui destring v*, replace

save "time_series_covid19_deaths_global.dta", replace 





* gen national sum

collapse (sum) v*, by(loc_grand_name) 

gen provincestate = " National"

order provincestate

save "time_series_covid19_deaths_global National sum.dta", replace



* append National sum to subNationals

use "time_series_covid19_deaths_global.dta", clear 

gen provincestate_proper = provincestate // non-provincestate_proper is included in National sum

replace provincestate_proper = "" if provincestate == "Diamond Princess" | ///
 provincestate == "Grand Princess" |  provincestate == "Repatriated Travellers"

drop if provincestate_proper == ""

qui append using "time_series_covid19_deaths_global National sum.dta"

order provincestate loc_grand_name, last 

save "time_series_covid19_deaths_global with National sum.dta", replace


* reshape 

order loc_grand_name, last

gen counter = _n

qui reshape long v, i(counter) 

drop counter 

codebook _j


* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

sort loc_grand_name date

bysort loc_grand_name: replace date = date + _j - 1

format date %td

codebook date

order date 

rename v TotDeaMeRaA00S00

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

destring TotDeaMeRaA00S00, replace

gen DayDeaMeRaA00S00 =  TotDeaMeRaA00S00[_n] - TotDeaMeRaA00S00[_n-1]

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

replace DayDeaMeRaA00S00 = TotDeaMeRaA00S00 if _j == 1

drop _j 

order loc_grand_name date provincestate_proper DayDeaMeRaA00S00 TotDeaMeRaA00S00		

sort loc_grand_name provincestate_proper date 


* replace outcomes = . before first date reported


levelsof provincestate, local(levels)

foreach l of local levels {

summ date if provincestate == "`l'" & TotDeaMeRaA00S00 == 0

gen TotDeaMeRaA00S00zerodate = r(max)

replace DayDeaMeRaA00S00 = . if date <= r(max) & provincestate == "`l'"

replace TotDeaMeRaA00S00 = . if date <= r(max) & provincestate == "`l'"

drop TotDeaMeRaA00S00zerodate

}
*

qui compress

save "$country JOHN deaths.dta", replace




****************************************

* get Johns Hopkins data for cases


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv" ///
, clear varnames(1) colrange(1:2)

save "time_series_covid19_confirmed_global col 2.dta", replace


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv" ///
, clear varnames(1) colrange(5)

save "time_series_covid19_confirmed_global col 5 on.dta", replace


use "time_series_covid19_confirmed_global col 2.dta", clear 

merge 1:1 _n using "time_series_covid19_confirmed_global col 5 on.dta"

drop _merge

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name

keep if loc_grand_name == "$country"

qui destring v*, replace

save "time_series_covid19_confirmed_global.dta", replace 



* gen National sum

collapse (sum) v*, by(loc_grand_name) 

gen provincestate = " National"

order provincestate

save "time_series_covid19_confirmed_global national sum.dta", replace



* append national sum to subnationals

use "time_series_covid19_confirmed_global.dta", clear 

gen provincestate_proper = provincestate // non-provincestate_proper is included in national sum // provincestate names for "$country"

replace provincestate_proper = "" if provincestate == "Diamond Princess" | ///
 provincestate == "Grand Princess" |  provincestate == "Repatriated Travellers"

drop if provincestate_proper == ""

qui append using "time_series_covid19_confirmed_global national sum.dta"

order provincestate loc_grand_name, last 

save "time_series_covid19_confirmed_global with national sum.dta", replace


* reshape 

order loc_grand_name, last

gen counter = _n

qui reshape long v, i(counter) 

drop counter 

codebook _j


* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

sort loc_grand_name date

bysort loc_grand_name: replace date = date + _j - 1

format date %td

codebook date

order date 

rename v TotCasMeRaA00S00

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

destring TotCasMeRaA00S00, replace

gen DayCasMeRaA00S00 =  TotCasMeRaA00S00[_n] - TotCasMeRaA00S00[_n-1]

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

replace DayCasMeRaA00S00 = TotCasMeRaA00S00 if _j == 1

drop _j 

order loc_grand_name date provincestate_proper DayCasMeRaA00S00 TotCasMeRaA00S00	

sort loc_grand_name provincestate_proper date 


* replace outcomes = . before first date reported


levelsof provincestate, local(levels)

foreach l of local levels {

summ date if provincestate == "`l'" & TotCasMeRaA00S00 == 0

gen TotCasMeRaA00S00zerodate = r(max)

replace DayCasMeRaA00S00 = . if date <= r(max) & provincestate == "`l'"

replace TotCasMeRaA00S00 = . if date <= r(max) & provincestate == "`l'"

drop TotCasMeRaA00S00zerodate

}
*

qui compress

save "$country JOHN cases.dta", replace






****************************************

* merge deaths and cases 

use "$country JOHN deaths.dta", clear 

merge 1:1 date loc_grand_name provincestate using "$country JOHN Cases.dta"

drop _merge



*

* gen cfr

gen DayCfrMeRaA00S00 = 100 * DayDeaMeRaA00S00 / DayCasMeRaA00S00

label var DayCfrMeRaA00S00 "Daily CFR raw JOHN"

*





*************************

* to visualize timing of deaths and cases peaks

summ DayDeaMeRaA00S00 
gen DayDeMMeRaA00S00 = r(mean)
label var DayDeMMeRaA00S00 "Daily deaths raw mean JOHN DayDeM"

summ DayCasMeRaA00S00 
gen DayCaMMeRaA00S00 = r(mean)
label var DayCaMMeRaA00S00 "Daily cases raw mean JOHN DayCaM"

gen DayCbDMeRaA00S00 = DayCaMMeRaA00S00 / DayDeMMeRaA00S00
label var DayCbDMeRaA00S00 "Daily cases mean div by daily deaths mean JOHN DayCbD"
summ DayCbDMeRaA00S00 

gen DayDeaMeRaA00multip = DayDeaMeRaA00S00 * DayCbDMeRaA00S00 
label var DayDeaMeRaA00multip "Daily deaths scaled (times means of cases by deaths) only for visualization JOHN"
summ DayDeaMeRaA00multip




******************

* smooth 

encode provincestate, gen(provincestate_encoded)

tsset provincestate_encoded date, daily   


tssmooth ma DayDeaMeRaA00S00_window = DayDeaMeRaA00S00 if DayDeaMeRaA00S00 >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA00S00 = DayDeaMeRaA00S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA00S00 "Daily deaths smooth A00 JOHN"

drop DayDeaMeRaA00S00_window


tssmooth ma DayCasMeRaA00S00_window = DayCasMeRaA00S00 if DayCasMeRaA00S00 >= 0, window(3 1 3)

tssmooth ma DayCasMeSmA00S00 = DayCasMeRaA00S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCasMeSmA00S00 "Daily cases smooth A00 JOHN"

drop DayCasMeRaA00S00_window


tssmooth ma DayCfrMeRaA00S00_window = DayCfrMeRaA00S00 if DayCfrMeRaA00S00 >= 0, window(3 1 3)

tssmooth ma DayCfrMeSmA00S00 = DayCfrMeRaA00S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayCfrMeSmA00S00 "Daily CFR smooth A00 JOHN"

drop DayCfrMeRaA00S00_window



tssmooth ma DayDeaMeRaA00multip_window = DayDeaMeRaA00multip if DayDeaMeRaA00multip >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA00multip = DayDeaMeRaA00multip_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA00multip "Daily deaths scaled smooth A00 JOHN"

drop DayDeaMeRaA00multip_window



drop provincestate_encoded

tsset, clear


*

* gen vars by provincestate 

foreach var of varlist DayDeaMeRaA00S00 TotDeaMeRaA00S00 DayCasMeRaA00S00 TotCasMeRaA00S00 ///
DayCfrMeRaA00S00 DayDeMMeRaA00S00 DayCaMMeRaA00S00 DayCbDMeRaA00S00 DayDeaMeRaA00multip ///
DayDeaMeSmA00S00 DayCasMeSmA00S00 DayCfrMeSmA00S00 DayDeaMeSmA00multip {

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

qui gen `var'XNT = `var'
qui replace `var'XNT = . if provincestate != "Northwest Territories"

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XNU = `var'
qui replace `var'XNU = . if provincestate != "Nunavut"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XPE = `var'
qui replace `var'XPE = . if provincestate != "Prince Edward Island"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"

qui gen `var'XYT = `var'
qui replace `var'XYT = . if provincestate != "Yukon"

label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNT "`var' Northwest Territories"
label var `var'XNS "`var' Nova Scotia"
label var `var'XNU "`var' Nunavut"
label var `var'XON "`var' Ontario"
label var `var'XPE "`var' Prince Edward Island"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"
label var `var'XYT "`var' Yukon"


                
}
*




sort loc_grand_name provincestate date

order loc_grand_name provincestate date

qui compress

save "CovidVisualizedCountry JOHN.dta", replace



***************************************

* graphs


grstyle init

grstyle color background white



*****************
* daily deaths (graph numbers starting with 1)


****
* 1 a daily deaths, national, all subnational

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line DayDeaMeSmA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeaMeSmA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeaMeSmA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeaMeSmA00S00XNB date, sort lwidth(medthin) lpattern(dash) lcolor(brown)) /// 4 "NB"
(line DayDeaMeSmA00S00XNL date, sort lwidth(medthin) lpattern(dash) lcolor(gray)) /// 5 "NL"
(line DayDeaMeSmA00S00XNT date, sort lwidth(medthin) lpattern(dash) lcolor(khaki)) /// 6 "NT"
(line DayDeaMeSmA00S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 7 "NS" magenta
(line DayDeaMeSmA00S00XNU date, sort lwidth(medthin) lpattern(dash) lcolor(lavender)) /// 8 "NU"
(line DayDeaMeSmA00S00XON date, sort lwidth(medium) lcolor(red)) /// 9 "ON" red
(line DayDeaMeSmA00S00XPE date, sort lwidth(medthin) lpattern(dash) lcolor(gold)) /// 10 "PE" 
(line DayDeaMeSmA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 11 "QC" black
(line DayDeaMeSmA00S00XSK date, sort lwidth(medium) lcolor(orange)) /// 12 "SK" orange
(line DayDeaMeSmA00S00XYT date, sort lwidth(medthin) lpattern(dash) lcolor(green)) /// 13 "YT'"
(line DayDeaMeSmA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 14 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NB" 5 "NL" 6 "NT" ///
7 "NS" 8 "NU" 9 "ON" 10 "PE" 11 "QC" 12 "SK" 13 "YT" 14 "CAN") rows(3) size(small)) ///
subtitle("All provinces and territories", size(small)) 

qui graph save "graph 1 a COVID-19 daily deaths, $country, subnational, Johns Hopkins.gph", replace
qui graph export "graph 1 a COVID-19 daily deaths, $country, subnational, Johns Hopkins.pdf", replace




****
* 1 b daily deaths, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line DayDeaMeSmA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeaMeSmA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeaMeSmA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeaMeSmA00S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayDeaMeSmA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayDeaMeSmA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 1 b COVID-19 daily deaths, $country, subnational, most affected, Johns Hopkins.gph", replace
qui graph export "graph 1 b COVID-19 daily deaths, $country, subnational, most affected, Johns Hopkins.pdf", replace




****
* 1 c daily deaths, national, subnational, separate

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayDeaMeRaA00S00 date, sort lcolor(gray)) ///
(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
if provincestate == "`l'" & DayDeaMeRaA00S00 >= 0 ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) ///
subtitle("`l'", size(small)) 

qui qui graph save "graph 1 c COVID-19 daily deaths, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 1 c COVID-19 daily deaths, $country, `l', Johns Hopkins.pdf", replace

}
*





*****************
* daily cases (graph numbers starting with 2)


****
* 2 a daily cases, national, all subnational

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line DayCasMeSmA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCasMeSmA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCasMeSmA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCasMeSmA00S00XNB date, sort lwidth(medthin) lpattern(dash) lcolor(brown)) /// 4 "NB"
(line DayCasMeSmA00S00XNL date, sort lwidth(medthin) lpattern(dash) lcolor(gray)) /// 5 "NL"
(line DayCasMeSmA00S00XNT date, sort lwidth(medthin) lpattern(dash) lcolor(khaki)) /// 6 "NT"
(line DayCasMeSmA00S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 7 "NS" magenta
(line DayCasMeSmA00S00XNU date, sort lwidth(medthin) lpattern(dash) lcolor(lavender)) /// 8 "NU"
(line DayCasMeSmA00S00XON date, sort lwidth(medium) lcolor(red)) /// 9 "ON" red
(line DayCasMeSmA00S00XPE date, sort lwidth(medthin) lpattern(dash) lcolor(gold)) /// 10 "PE" 
(line DayCasMeSmA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 11 "QC" black
(line DayCasMeSmA00S00XSK date, sort lwidth(medium) lcolor(orange)) /// 12 "SK" orange
(line DayCasMeSmA00S00XYT date, sort lwidth(medthin) lpattern(dash) lcolor(green)) /// 13 "YT'"
(line DayCasMeSmA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 14 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NB" 5 "NL" 6 "NT" ///
7 "NS" 8 "NU" 9 "ON" 10 "PE" 11 "QC" 12 "SK" 13 "YT" 14 "CAN") rows(3) size(small)) ///
subtitle("All provinces and territories", size(small)) 

qui graph save "graph 2 a COVID-19 daily cases, $country, subnational, Johns Hopkins.gph", replace
qui graph export "graph 2 a COVID-19 daily cases, $country, subnational, Johns Hopkins.pdf", replace




****
* 2 b daily cases, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line DayCasMeSmA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCasMeSmA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCasMeSmA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCasMeSmA00S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayCasMeSmA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayCasMeSmA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 2 b COVID-19 daily cases, $country, subnational, most affected, Johns Hopkins.gph", replace
qui graph export "graph 2 b COVID-19 daily cases, $country, subnational, most affected, Johns Hopkins.pdf", replace




****
* 2 c daily cases, national, subnational, separate

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(gray)) ///
(line DayCasMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
if provincestate == "`l'" & DayCasMeRaA00S00 >= 0 ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) ///
subtitle("`l'", size(small)) 

qui qui graph save "graph 2 c COVID-19 daily cases, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 2 c COVID-19 daily cases, $country, `l', Johns Hopkins.pdf", replace

}
*






*****************
* total deaths (graph numbers starting with 3)


****
* 3 a total deaths, national, all subnational

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line TotDeaMeRaA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotDeaMeRaA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotDeaMeRaA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotDeaMeRaA00S00XNB date, sort lwidth(medthin) lpattern(dash) lcolor(brown)) /// 4 "NB"
(line TotDeaMeRaA00S00XNL date, sort lwidth(medthin) lpattern(dash) lcolor(gray)) /// 5 "NL"
(line TotDeaMeRaA00S00XNT date, sort lwidth(medthin) lpattern(dash) lcolor(khaki)) /// 6 "NT"
(line TotDeaMeRaA00S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 7 "NS" magenta
(line TotDeaMeRaA00S00XNU date, sort lwidth(medthin) lpattern(dash) lcolor(lavender)) /// 8 "NU"
(line TotDeaMeRaA00S00XON date, sort lwidth(medium) lcolor(red)) /// 9 "ON" red
(line TotDeaMeRaA00S00XPE date, sort lwidth(medthin) lpattern(dash) lcolor(gold)) /// 10 "PE" 
(line TotDeaMeRaA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 11 "QC" black
(line TotDeaMeRaA00S00XSK date, sort lwidth(medium) lcolor(orange)) /// 12 "SK" orange
(line TotDeaMeRaA00S00XYT date, sort lwidth(medthin) lpattern(dash) lcolor(green)) /// 13 "YT'"
(line TotDeaMeRaA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 14 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NB" 5 "NL" 6 "NT" ///
7 "NS" 8 "NU" 9 "ON" 10 "PE" 11 "QC" 12 "SK" 13 "YT" 14 "CAN") rows(3) size(small)) ///
subtitle("All provinces and territories", size(small)) 

qui graph save "graph 3 a COVID-19 total deaths, $country, subnational, Johns Hopkins.gph", replace
qui graph export "graph 3 a COVID-19 total deaths, $country, subnational, Johns Hopkins.pdf", replace




****
* 3 b total deaths, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line TotDeaMeRaA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotDeaMeRaA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotDeaMeRaA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotDeaMeRaA00S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line TotDeaMeRaA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line TotDeaMeRaA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 3 b COVID-19 total deaths, $country, subnational, most affected, Johns Hopkins.gph", replace
qui graph export "graph 3 b COVID-19 total deaths, $country, subnational, most affected, Johns Hopkins.pdf", replace




****
* 3 c total deaths, national, subnational, separate

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line TotDeaMeRaA00S00 date, sort lcolor(gray)) ///
(line TotDeaMeRaA00S00 date, sort lwidth(thick) lcolor(red)) ///
if provincestate == "`l'" & TotDeaMeRaA00S00 >= 0 ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) ///
subtitle("`l'", size(small)) 

qui qui graph save "graph 3 c COVID-19 total deaths, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 3 c COVID-19 total deaths, $country, `l', Johns Hopkins.pdf", replace

}
*





*****************
* total cases (graph numbers starting with 4)


****
* 4 a total cases, national, all subnational

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line TotCasMeRaA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotCasMeRaA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotCasMeRaA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotCasMeRaA00S00XNB date, sort lwidth(medthin) lpattern(dash) lcolor(brown)) /// 4 "NB"
(line TotCasMeRaA00S00XNL date, sort lwidth(medthin) lpattern(dash) lcolor(gray)) /// 5 "NL"
(line TotCasMeRaA00S00XNT date, sort lwidth(medthin) lpattern(dash) lcolor(khaki)) /// 6 "NT"
(line TotCasMeRaA00S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 7 "NS" magenta
(line TotCasMeRaA00S00XNU date, sort lwidth(medthin) lpattern(dash) lcolor(lavender)) /// 8 "NU"
(line TotCasMeRaA00S00XON date, sort lwidth(medium) lcolor(red)) /// 9 "ON" red
(line TotCasMeRaA00S00XPE date, sort lwidth(medthin) lpattern(dash) lcolor(gold)) /// 10 "PE" 
(line TotCasMeRaA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 11 "QC" black
(line TotCasMeRaA00S00XSK date, sort lwidth(medium) lcolor(orange)) /// 12 "SK" orange
(line TotCasMeRaA00S00XYT date, sort lwidth(medthin) lpattern(dash) lcolor(green)) /// 13 "YT'"
(line TotCasMeRaA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 14 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NB" 5 "NL" 6 "NT" ///
7 "NS" 8 "NU" 9 "ON" 10 "PE" 11 "QC" 12 "SK" 13 "YT" 14 "CAN") rows(3) size(small)) ///
subtitle("All provinces and territories", size(small)) 

qui graph save "graph 4 a COVID-19 total cases, $country, subnational, Johns Hopkins.gph", replace
qui graph export "graph 4 a COVID-19 total cases, $country, subnational, Johns Hopkins.pdf", replace




****
* 4 b total cases, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line TotCasMeRaA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotCasMeRaA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotCasMeRaA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotCasMeRaA00S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line TotCasMeRaA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line TotCasMeRaA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 4 b COVID-19 total cases, $country, subnational, most affected, Johns Hopkins.gph", replace
qui graph export "graph 4 b COVID-19 total cases, $country, subnational, most affected, Johns Hopkins.pdf", replace




****
* 4 c total cases, national, subnational, separate

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line TotCasMeRaA00S00 date, sort lcolor(gray)) ///
(line TotCasMeRaA00S00 date, sort lwidth(thick) lcolor(red)) ///
if provincestate == "`l'" & TotCasMeRaA00S00 >= 0 ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) ///
subtitle("`l'", size(small)) 

qui qui graph save "graph 4 c COVID-19 total cases, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 4 c COVID-19 total cases, $country, `l', Johns Hopkins.pdf", replace

}
*





*****************
* daily CFR (graph numbers starting with 5)


****
* 5 a daily CFR, national, all subnational

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line DayCfrMeSmA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCfrMeSmA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCfrMeSmA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCfrMeSmA00S00XNB date, sort lwidth(medthin) lpattern(dash) lcolor(brown)) /// 4 "NB"
(line DayCfrMeSmA00S00XNL date, sort lwidth(medthin) lpattern(dash) lcolor(gray)) /// 5 "NL"
(line DayCfrMeSmA00S00XNT date, sort lwidth(medthin) lpattern(dash) lcolor(khaki)) /// 6 "NT"
(line DayCfrMeSmA00S00XNS date, sort lwidth(medium) lcolor(magenta)) /// 7 "NS" magenta
(line DayCfrMeSmA00S00XNU date, sort lwidth(medthin) lpattern(dash) lcolor(lavender)) /// 8 "NU"
(line DayCfrMeSmA00S00XON date, sort lwidth(medium) lcolor(red)) /// 9 "ON" red
(line DayCfrMeSmA00S00XPE date, sort lwidth(medthin) lpattern(dash) lcolor(gold)) /// 10 "PE" 
(line DayCfrMeSmA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 11 "QC" black
(line DayCfrMeSmA00S00XSK date, sort lwidth(medium) lcolor(orange)) /// 12 "SK" orange
(line DayCfrMeSmA00S00XYT date, sort lwidth(medthin) lpattern(dash) lcolor(green)) /// 13 "YT'"
(line DayCfrMeSmA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 14 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "NB" 5 "NL" 6 "NT" ///
7 "NS" 8 "NU" 9 "ON" 10 "PE" 11 "QC" 12 "SK" 13 "YT" 14 "CAN") rows(3) size(small)) ///
subtitle("All provinces and territories", size(small)) 

qui graph save "graph 5 a COVID-19 daily CFR, $country, subnational, Johns Hopkins.gph", replace
qui graph export "graph 5 a COVID-19 daily CFR, $country, subnational, Johns Hopkins.pdf", replace




****
* 5 b daily CFR, subnational, most affected 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

twoway ///
(line DayCfrMeSmA00S00XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayCfrMeSmA00S00XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayCfrMeSmA00S00XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayCfrMeSmA00S00XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayCfrMeSmA00S00XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayCfrMeSmA00S00XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC"6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 5 b COVID-19 daily CFR, $country, subnational, most affected, Johns Hopkins.gph", replace
qui graph export "graph 5 b COVID-19 daily CFR, $country, subnational, most affected, Johns Hopkins.pdf", replace




****
* 5 c daily CFR, national, subnational, separate

forval i = 1(1)12 {
	local date2020 = mdy(`i', 1, 2020)
	local dates2020 `dates2020' `date2020'
}
local wanted : di %tdNN daily("$S_DATE", "DMY")
forval i = 1(1)`wanted' {
	local date2021 = mdy(`i', 1, 2021)
	local dates2021 `dates2021' `date2021'
}
*

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayCfrMeSmA00S00 date, sort lcolor(gray)) ///
(line DayCfrMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
if provincestate == "`l'" & DayCfrMeSmA00S00 >= 0 ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) ///
subtitle("`l'", size(small)) 

qui qui graph save "graph 5 c COVID-19 daily CFR, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 5 c COVID-19 daily CFR, $country, `l', Johns Hopkins.pdf", replace

}
*




* visualize timing of deaths and cases peaks, raw

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(blue)) ///
(line DayDeaMeRaA00S00 date, sort lcolor(red)) ///
(line DayDeaMeRaA00multip date, sort lpattern(tight_dot) lcolor(red)) ///
if provincestate == "`l'" & DayCasMeRaA00S00 >= 0 & DayDeaMeRaA00S00 >= 0 & date >= td(01jan2021) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, raw, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled") rows(1)) ///
subtitle("`l'. Daily deaths scaled (times means of cases by deaths) only for visualization", size(small))

qui qui graph save "graph 6 COVID-19 daily deaths and cases timing, raw, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 6 COVID-19 daily deaths and cases timing, raw, $country, `l', Johns Hopkins.pdf", replace

}
*





* visualize timing of deaths and cases peaks, smooth 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayCasMeSmA00S00 date, sort lcolor(blue)) ///
(line DayDeaMeSmA00S00 date, sort lcolor(red)) ///
(line DayDeaMeSmA00multip date, sort lpattern(tight_dot) lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2021) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, smooth, $country, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled") rows(1)) ///
subtitle("`l'. Daily deaths scaled (times means of cases by deaths) only for visualization", size(small))

qui qui graph save "graph 7 COVID-19 daily deaths and cases timing, smooth, $country, `l', Johns Hopkins.gph", replace
qui qui graph export "graph 7 COVID-19 daily deaths and cases timing, smooth, $country, `l', Johns Hopkins.pdf", replace

}
*


****************



view "log CovidVisualizedCountry JOHN.smcl"

log close

exit, clear





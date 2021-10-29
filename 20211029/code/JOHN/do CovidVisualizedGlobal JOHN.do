
clear all

cd "$pathCovidVisualizedGlobal"

cd JOHN

capture log close 

log using "log CovidVisualizedGlobal JOHN.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal JOHN.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
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

order provincestate countryregion, last

count

qui destring v*, replace

collapse (sum) v*, by(countryregion) // sum to add subnational estimates to national level and omit subnational estimates

count

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name

isid loc_grand_name



* gen global sum

drop loc_grand_name
 
collapse (sum) *

gen loc_grand_name = "global"
  

gen counter = _n

reshape long v, i(counter) 

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

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00		
					
sort date

save "global JOHN deaths.dta", replace




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

order provincestate countryregion, last

count

qui destring v*, replace

collapse (sum) v*, by(countryregion) // sum to add subnational estimates to national level and omit subnational estimates

count

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name

isid loc_grand_name



* gen global sum

drop loc_grand_name
 
collapse (sum) *

gen loc_grand_name = "global"
  

gen counter = _n

reshape long v, i(counter) 

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

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00		
					
sort date

save "global JOHN cases.dta", replace





****************************************

* get Johns Hopkins data for recoverd


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv" ///
, clear varnames(1) colrange(1:2)

save "time_series_covid19_recovered_global col 2.dta", replace


import delimited ///
"https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv" ///
, clear varnames(1) colrange(5)

save "time_series_covid19_recovered_global col 5 on.dta", replace


use "time_series_covid19_recovered_global col 2.dta", clear 

merge 1:1 _n using "time_series_covid19_recovered_global col 5 on.dta"

drop _merge

order provincestate countryregion, last

count

qui destring v*, replace

collapse (sum) v*, by(countryregion) // sum to add subnational estimates to national level and omit subnational estimates

count

replace countryregion = trim(countryregion)

rename countryregion loc_grand_name

label var loc_grand_name loc_grand_name

isid loc_grand_name



* gen global sum

drop loc_grand_name
 
collapse (sum) *

gen loc_grand_name = "global"
  

gen counter = _n

reshape long v, i(counter) 

drop counter 

codebook _j


* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

sort loc_grand_name date

bysort loc_grand_name: replace date = date + _j - 1

format date %td

codebook date

order date 

rename v TotRecMeRaA00S00

label var TotRecMeRaA00S00 "Total recovered raw A00 JOHN"

destring TotRecMeRaA00S00, replace

gen DayRecMeRaA00S00 =  TotRecMeRaA00S00[_n] - TotRecMeRaA00S00[_n-1]

label var DayRecMeRaA00S00 "Daily recovered raw A00 JOHN"

replace DayRecMeRaA00S00 = TotRecMeRaA00S00 if _j == 1

drop _j 

order loc_grand_name date DayRecMeRaA00S00 TotRecMeRaA00S00		
					
sort date

save "global JOHN recovered.dta", replace






****************************************

* merge deaths and cases and recovered

use "global JOHN deaths.dta", clear 

merge 1:1 date using "global JOHN Cases.dta"

drop _merge

merge 1:1 date using "global JOHN recovered.dta"

drop _merge

*

* gen cfr

gen DayCfrMeRaA00S00 = 100 * DayDeaMeRaA00S00 / DayCasMeRaA00S00

label var DayCfrMeRaA00S00 "Daily CFR raw JOHN"

*





****** add obs 01 Jan 2020 to 21 Jan 2020 for better graphing


expand 22 in 1

sort date

rename date date_original 

gen date = .

replace date = td(01Jan2020) in 1

replace date = date[_n-1] + 1 in 2/l

format date %tdDDMonCCYY

codebook date

drop date_original

order date

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

tsset date, daily   


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



tssmooth ma DayRecMeRaA00S00_window = DayRecMeRaA00S00 if DayRecMeRaA00S00 >= 0, window(3 1 3)

tssmooth ma DayRecMeSmA00S00 = DayRecMeRaA00S00_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayRecMeSmA00S00 "Daily recovered smooth A00 JOHN"

drop DayRecMeRaA00S00_window



tssmooth ma DayDeaMeRaA00multip_window = DayDeaMeRaA00multip if DayDeaMeRaA00multip >= 0, window(3 1 3)

tssmooth ma DayDeaMeSmA00multip = DayDeaMeRaA00multip_window, weights( 1 2 3 <4> 3 2 1) replace

label var DayDeaMeSmA00multip "Daily deaths scaled smooth A00 JOHN"

drop DayDeaMeRaA00multip_window





tsset, clear







***************************************

* graphs


grstyle init

grstyle color background white




* daily deaths


* adjust x axis ticks from Jan 2020 to this month and avoid globals
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
(line DayDeaMeRaA00S00 date, sort lcolor(gray)) ///
(line DayDeaMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) 

graph save "graph 1 COVID-19 daily deaths, global, Johns Hopkins.gph", replace
graph export "graph 1 COVID-19 daily deaths, global, Johns Hopkins.pdf", replace





* daily cases 


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
(line DayCasMeRaA00S00 date, sort lcolor(gray)) ///
(line DayCasMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) 


graph save "graph 2 COVID-19 daily cases, global, Johns Hopkins.gph", replace
graph export "graph 2 COVID-19 daily cases, global, Johns Hopkins.pdf", replace





* total deaths

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
(line TotDeaMeRaA00S00 date, sort lcolor(black)) ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) 

graph save "graph 3 COVID-19 total deaths, global, Johns Hopkins.gph", replace
graph export "graph 3 COVID-19 total deaths, global, Johns Hopkins.pdf", replace





* total cases 

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
(line TotCasMeRaA00S00 date, sort lcolor(black)) ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) 



graph save "graph 4 COVID-19 total cases, global, Johns Hopkins.gph", replace
graph export "graph 4 COVID-19 total cases, global, Johns Hopkins.pdf", replace





* daily cfr 


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
(line DayCfrMeRaA00S00 date, sort lcolor(gray)) ///
(line DayCfrMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) 


graph save "graph 5 COVID-19 daily CFR, global, Johns Hopkins.gph", replace
graph export "graph 5 COVID-19 daily CFR, global, Johns Hopkins.pdf", replace





* daily cfr after 01dec2020



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
(line DayCfrMeRaA00S00 date, sort lcolor(gray)) ///
(line DayCfrMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily CFR, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("after 2021-01-01", size(small)) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) 



graph save "graph 6 COVID-19 daily CFR, global, Johns Hopkins, 01dec2020 on.gph", replace
graph export "graph 6 COVID-19 daily CFR, global, Johns Hopkins, 01dec2020 on.pdf", replace





* visualize timing of deaths and cases peaks


twoway ///
(line DayCasMeRaA00S00 date, sort lcolor(blue)) ///
(line DayDeaMeRaA00S00 date, sort lcolor(red)) ///
(line DayDeaMeRaA00multip date, sort lpattern(tight_dot) lcolor(red)) ///
if date > td(01jan2020)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, raw, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled") rows(1)) ///
subtitle("Daily deaths scaled (times means of cases by deaths) only for visualization", size(small))


graph save "graph 7 COVID-19 daily deaths and cases timing, raw, global, Johns Hopkins.gph", replace
graph export "graph 7 COVID-19 daily deaths and cases timing, raw, global, Johns Hopkins.pdf", replace





* visualize timing of deaths and cases peaks


twoway ///
(line DayCasMeSmA00S00 date, sort lcolor(blue)) ///
(line DayDeaMeSmA00S00 date, sort lcolor(red)) ///
(line DayDeaMeSmA00multip date, sort lpattern(tight_dot) lcolor(red)) ///
if date > td(01jan2020)  ///
, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, smooth, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled") rows(1)) ///
subtitle("Daily deaths scaled (times means of cases by deaths) only for visualization", size(small))


graph save "graph 8 COVID-19 daily deaths and cases timing, smooth, global, Johns Hopkins.gph", replace
graph export "graph 8 COVID-19 daily deaths and cases timing, smooth, global, Johns Hopkins.pdf", replace





* daily recovered


* adjust x axis ticks from Jan 2020 to this month and avoid globals
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
(line DayRecMeRaA00S00 date, sort lcolor(gray)) ///
(line DayRecMeSmA00S00 date, sort lwidth(thick) lcolor(red)) ///
if date >= td(01jan2020) & DayRecMeRaA00S00 >=0 ///
, xtitle(Date) xlabel(`dates2020' `dates2021', format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily recovered) title("COVID-19 daily recovered, global, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Raw" 2 "Smoothed") size(small)) 

graph save "graph 8 COVID-19 daily recovered, global, Johns Hopkins.gph", replace
graph export "graph 8 COVID-19 daily recovered, global, Johns Hopkins.pdf", replace







****************

sort date loc_grand_name

order date loc_grand_name

qui compress


save "CovidVisualizedGlobal JOHN.dta", replace




view "log CovidVisualizedGlobal JOHN.smcl"

log close

exit, clear





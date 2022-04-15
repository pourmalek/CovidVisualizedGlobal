
clear all

cd "$pathCovidVisualizedGlobal"

cd IMPE

capture log close 

log using "log CovidVisualizedGlobal IMPE 2.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IMPE 2.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************
 

* merge files




******************

* append regions

use "IMPE GLOBAL.dta", clear 

local list2 AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list2 {

	append using "IMPE `region'.dta"
	
}
*





*************

* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   


tssmooth ma DayINFMeRaA03S01_w = DayINFMeRaA03S01, window(3 1 3) // _w = _window

tssmooth ma DayINFMeSmA03S01 = DayINFMeRaA03S01_w, weights( 1 2 3 <4> 3 2 1) replace

label var DayINFMeSmA03S01 "Daily infections smooth A03 IMPE S01"

drop *_w



tssmooth ma DayINFMeRaA03S02_w = DayINFMeRaA03S02, window(3 1 3) // _w = _window

tssmooth ma DayINFMeSmA03S02 = DayINFMeRaA03S02_w, weights( 1 2 3 <4> 3 2 1) replace

label var DayINFMeSmA03S02 "Daily infections smooth A03 IMPE S02"

drop *_w



tssmooth ma DayINFMeRaA03S03_w = DayINFMeRaA03S03, window(3 1 3) // _w = _window

tssmooth ma DayINFMeSmA03S03 = DayINFMeRaA03S03_w, weights( 1 2 3 <4> 3 2 1) replace

label var DayINFMeSmA03S03 "Daily infections smooth A03 IMPE S03"

drop *_w



tssmooth ma DayINFMeRaA03S04_w = DayINFMeRaA03S04, window(3 1 3) // _w = _window

tssmooth ma DayINFMeSmA03S04 = DayINFMeRaA03S04_w, weights( 1 2 3 <4> 3 2 1) replace

label var DayINFMeSmA03S04 "Daily infections smooth A03 IMPE S04"

drop *_w



tssmooth ma DayINFMeRaA03S05_w = DayINFMeRaA03S05, window(3 1 3) // _w = _window

tssmooth ma DayINFMeSmA03S05 = DayINFMeRaA03S05_w, weights( 1 2 3 <4> 3 2 1) replace

label var DayINFMeSmA03S05 "Daily infections smooth A03 IMPE S05"

drop *_w



tssmooth ma DayINFMeRaA03S06_w = DayINFMeRaA03S06, window(3 1 3) // _w = _window

tssmooth ma DayINFMeSmA03S06 = DayINFMeRaA03S06_w, weights( 1 2 3 <4> 3 2 1) replace

label var DayINFMeSmA03S06 "Daily infections smooth A03 IMPE S06"

drop *_w



tsset, clear

*





* gen vars by location 

foreach var of varlist TotDeaMeRaA03S01-DayINFMeSmA03S06 {


	qui gen `var'AFRO = `var' 
	qui replace `var'AFRO = . if loc_grand_name != "AFRO"
	
	qui gen `var'AMRO = `var'
	qui replace `var'AMRO = . if loc_grand_name != "AMRO"
	
	qui gen `var'AMR1 = `var'
	qui replace `var'AMR1 = . if loc_grand_name != "AMR1"
	
	qui gen `var'AMR2 = `var'
	qui replace `var'AMR2 = . if loc_grand_name != "AMR2"	
	
	qui gen `var'EMRO = `var'
	qui replace `var'EMRO = . if loc_grand_name != "EMRO"
	
	qui gen `var'EURO = `var'
	qui replace `var'EURO = . if loc_grand_name != "EURO"
	
	qui gen `var'GLOBAL = `var'
	qui replace `var'GLOBAL = . if loc_grand_name != " GLOBAL"
	
	qui gen `var'SEARO = `var'
	qui replace `var'SEARO = . if loc_grand_name != "SEARO"
	
	qui gen `var'WPRO = `var'
	qui replace `var'WPRO = . if loc_grand_name != "WPRO"
	
	
	label var `var'AFRO "`var' AFRO"
	label var `var'AMRO "`var' AMRO"
	label var `var'AMR1 "`var' AMR1"
	label var `var'AMR2 "`var' AMR2"	
	label var `var'EMRO "`var' EMRO"
	label var `var'EURO "`var' EURO"
	label var `var'GLOBAL "`var' GLOBAL"
	label var `var'SEARO "`var' SEARO"
	label var `var'WPRO "`var' WPRO"

				
}
*





* Forecast start date 

gen epoch_IMPE = td(31Jan2022) // update release date
label var epoch_IMPE "IMPE Forecast start date"

foreach var in AFRO AMRO AMR1 AMR2 EMRO EURO GLOBAL SEARO WPRO {

	gen DayDeaFOREA03S02`var' = DayDeaMeRaA03S02`var'
	replace DayDeaFOREA03S02`var' = . if date < td(31Jan2022)
	label var DayDeaFOREA03S02`var' "Daily Forecasted Deaths Mean raw IMPE `var'"
	
	gen DayINFFOREA03S02`var' = DayINFMeSmA03S02`var'
	replace DayINFFOREA03S02`var' = . if date < td(31Jan2022)
	label var DayINFFOREA03S02`var' "Daily Forecasted Infections Mean raw IMPE `var'"

}
*




sort date loc_grand_name

qui compress

save "CovidVisualizedGlobal IMPE.dta", replace








view "log CovidVisualizedGlobal IMPE 2.smcl"

log close

exit, clear




clear all

cd "$pathCovidVisualizedGlobal"

cd SRIV

capture log close 

log using "log CovidVisualizedGlobal SRIV 1.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal SRIV 1.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


di in red "SRIVdate = " "$SRIVdate"


clear 

* Get SRIV estimates 


copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/$SRIVdate/global_forecasts_deaths.csv global_forecasts_deaths.csv
copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/$SRIVdate/global_forecasts_deaths_lb.csv global_forecasts_deaths_lb.csv
copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/$SRIVdate/global_forecasts_deaths_ub.csv global_forecasts_deaths_ub.csv
copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/$SRIVdate/global_forecasts_cases.csv global_forecasts_cases.csv
copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/$SRIVdate/global_forecasts_cases_lb.csv global_forecasts_cases_lb.csv
copy https://raw.githubusercontent.com/scc-usc/ReCOVER-COVID-19/master/results/historical_forecasts/$SRIVdate/global_forecasts_cases_ub.csv global_forecasts_cases_ub.csv



* gen one file with original vars for all countries

local list1 ///
global_forecasts_deaths global_forecasts_deaths_lb global_forecasts_deaths_ub ///
global_forecasts_cases global_forecasts_cases_lb global_forecasts_cases_ub

foreach l of local list1 {

	import delimited "`l'.csv", clear varnames(1)
	
	label var id id
	
	foreach v of var * {
		local lbl : var label `v'
		local lbl = strtoname("`lbl'")
		rename `v' `lbl'			
	}
	*
	
	drop id
		
	foreach v of var * {
		capture replace `v' = "" if `v' == "NaN"
	}
	*
	
	
	destring *, replace
	
	
	gen i = _n
		
	reshape long _, i(i) j(j, string)
	
	rename _ `l'
	
	rename j date 
	
	drop i
	
	rename Country country
	
	order date country
	
	save "`l'.dta", replace 

}
*


use global_forecasts_deaths, clear

merge 1:1 date country using global_forecasts_deaths_lb
drop _merge

merge 1:1 date country using global_forecasts_deaths_ub
drop _merge

merge 1:1 date country using global_forecasts_cases
drop _merge

merge 1:1 date country using global_forecasts_cases_lb
drop _merge

merge 1:1 date country using global_forecasts_cases_ub
drop _merge


rename global_forecasts_deaths_lb TotDeaLoRaA05S00	
rename global_forecasts_deaths_ub TotDeaUpRaA05S00	
rename global_forecasts_deaths    TotDeaMeRaA05S00
rename global_forecasts_cases_lb  TotCasLoRaA05S00
rename global_forecasts_cases_ub  TotCasUpRaA05S00	
rename global_forecasts_cases	  TotCasMeRaA05S00

label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV"


save "SRIV.dta", replace





* gen one file for each country with original vars for all countries

clear 
use "SRIV.dta", clear
levelsof country, local(levels)


foreach l of local levels {
	use "SRIV.dta", clear
	di "`l'"
	keep if country == "`l'"
    save "`l'", replace
}
*


* use the single files for each country for formatting the date 


clear 
use "SRIV.dta", clear
levelsof country, local(levels)


foreach l of local levels {
	use "`l'", clear
	di "`l'"
	gen day1 = date[1]
	
	gen year = substr(day1,1,4) 
	gen month = substr(day1,6,2) 
	gen day = substr(day1,9,2) 
	egen date2 = concat(day month year)
	gen day1b = date(date2, "DMY", 2050)
	format day1b %tdDDMonCCYY
	codebook day1b
	drop day1 year month day date2
	
	bysort country: gen n = _n
	bysort country: replace day1b = day1b[n] + n - 1
	drop n
	drop date
	rename day1b date
	
	
	local list2 ///
	DeaMeRaA05S00 DeaLoRaA05S00 DeaUpRaA05S00 ///
	CasMeRaA05S00 CasLoRaA05S00 CasUpRaA05S00 
	
	foreach s of local list2 {
		bysort country: gen Day`s' =  Tot`s'[_n] - Tot`s'[_n-1] // genn1
	}
	*
	
	
	label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
	label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
	label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
	label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
	label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
	label var DayCasUpRaA05S00 "Daily Cases Upper SRIV"
	
	
	* gen "Daily cases mean div by daily deaths mean SRIV  DayCbD" for visulization of temporal relation of deaths and cases peaks 
	
	
	summ DayDeaMeRaA05S00 
	gen DayDeMMeRaA05S00   = r(mean)
	label var DayDeMMeRaA05S00   "Daily deaths mean SRIV  DayDeM"
	
	summ DayCasMeRaA05S00   
	gen DayCaMMeRaA05S00   = r(mean)
	label var DayCaMMeRaA05S00   "Daily cases mean SRIV  DayCaM"
							   
	gen DayCbDMeRaA05S00   = DayCaMMeRaA05S00   / DayDeMMeRaA05S00  
	label var DayCbDMeRaA05S00   "Daily cases mean div by daily deaths mean SRIV  DayCbD"
	summ DayCbDMeRaA05S00  
												  
	gen DayDMuMeRaA05S00   = DayDeaMeRaA05S00   * DayCbDMeRaA05S00  
	label var DayDMuMeRaA05S00   "Daily deaths scaled (times means of cases by deaths) SRIV"
	summ DayDMuMeRaA05S00  
			
	
	save "`l'", replace
}
*	



* append country files


clear 	
local list3 `" Afghanistan Albania Algeria Andorra Angola "Antigua and Barbuda" Argentina Armenia Australia Austria Azerbaijan Bahrain Bangladesh Barbados Belarus Belgium Belize Benin Bhutan Bolivia "Bosnia and Herzegovina" Botswana Brazil Brunei Bulgaria "Burkina Faso" Burundi Cambodia Cameroon Canada "Cape Verde" "Central African Republic" Chad Chile China Colombia Congo "Costa Rica" "Cote d'Ivoire" Croatia Cuba Cyprus "Czech Republic" "Democratic Republic of the Congo" Denmark "Diamond Princess" Djibouti Dominica "Dominican Republic" Ecuador Egypt "El Salvador" "Equatorial Guinea" Eritrea Estonia Eswatini Ethiopia Fiji Finland France Gabon Georgia Germany Ghana Greece Grenada Guatemala Guinea "Guinea-Bissau" Guyana Haiti "Holy See" Honduras Hungary Iceland India Indonesia Iran Iraq Ireland Israel Italy Jamaica Japan Jordan Kazakhstan Kenya Kosovo Kuwait Kyrgyzstan Laos Latvia Lebanon Liberia Libya Liechtenstein Lithuania Luxembourg "MS Zaandam" Macedonia Madagascar Malawi Malaysia Maldives Mali Malta Mauritania Mauritius Mexico Moldova Monaco Mongolia Montenegro Morocco Mozambique Myanmar Namibia Nepal Netherlands "New Zealand" Nicaragua Niger Nigeria Norway Oman Pakistan Panama "Papua New Guinea" Paraguay Peru Philippines Poland Portugal Qatar Romania "Russian Federation" Rwanda "Saint Kitts and Nevis" "Saint Lucia" "Saint Vincent and the Grenadines" "San Marino" "Sao Tome and Principe" "Saudi Arabia" Senegal Serbia Seychelles "Sierra Leone" Singapore Slovakia Slovenia Somalia "South Africa" "South Korea" "South Sudan" Spain "Sri Lanka" Sudan Suriname Sweden Switzerland Syria Tanzania Thailand "The Bahamas" "The Gambia" "Timor-Leste" Togo "Trinidad and Tobago" Tunisia Turkey Uganda Ukraine "United Arab Emirates" "United Kingdom" "United States" Uruguay Uzbekistan Venezuela Vietnam "West Bank and Gaza" "Western Sahara" Yemen Zambia Zimbabwe "'

foreach m of local list3 {
	di "`m'"
	append using "`m'"
	
}	
*	

rename country loc_grand_name

order loc_grand_name date

sort loc_grand_name date

save "SRIV.dta", replace
 


 
***********

* gen global sum

use "SRIV.dta", clear 

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)
 
foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*	
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"
	
gen loc_grand_name = " GLOBAL"

save "SRIV GLOBAL.dta", replace 








*****************************

* gen AFRO

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Algeria" | ///
loc_grand_name == "Angola" | ///
loc_grand_name == "Benin" | ///
loc_grand_name == "Botswana" | ///
loc_grand_name == "Burkina Faso" | ///
loc_grand_name == "Burundi" | ///
loc_grand_name == "Cameroon" | ///
loc_grand_name == "Cape Verde" | ///
loc_grand_name == "Central African Republic" | ///
loc_grand_name == "Chad" | ///
loc_grand_name == "Congo" | ///
loc_grand_name == "Cote d'Ivoire" | ///
loc_grand_name == "Democratic Republic of the Congo" | ///
loc_grand_name == "Equatorial Guinea" | ///
loc_grand_name == "Eritrea" | ///
loc_grand_name == "Eswatini" | ///
loc_grand_name == "Ethiopia" | ///
loc_grand_name == "Gabon" | ///
loc_grand_name == "Ghana" | ///
loc_grand_name == "Guinea" | ///
loc_grand_name == "Guinea-Bissau" | ///
loc_grand_name == "Kenya" | ///
loc_grand_name == "Liberia" | ///
loc_grand_name == "Madagascar" | ///
loc_grand_name == "Malawi" | ///
loc_grand_name == "Mali" | ///
loc_grand_name == "Mauritania" | ///
loc_grand_name == "Mauritius" | ///
loc_grand_name == "Mozambique" | ///
loc_grand_name == "Namibia" | ///
loc_grand_name == "Niger" | ///
loc_grand_name == "Nigeria" | ///
loc_grand_name == "Rwanda" | ///
loc_grand_name == "Sao Tome and Principe" | ///
loc_grand_name == "Senegal" | ///
loc_grand_name == "Seychelles" | ///
loc_grand_name == "Sierra Leone" | ///
loc_grand_name == "South Africa" | ///
loc_grand_name == "South Sudan" | ///
loc_grand_name == "Tanzania" | ///
loc_grand_name == "The Gambia" | ///
loc_grand_name == "Togo" | ///
loc_grand_name == "Uganda" | ///
loc_grand_name == "Zambia" | ///
loc_grand_name == "Zimbabwe" 

drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "AFRO"

order loc_grand_name date

qui compress

save "SRIV AFRO.dta", replace 











*****************************

* gen AMRO

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Belize" | ///
loc_grand_name == "Bolivia" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Canada" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
loc_grand_name == "Diamond Princess" | ///
loc_grand_name == "Dominica" | ///
loc_grand_name == "Dominican Republic" | ///
loc_grand_name == "Ecuador" | ///
loc_grand_name == "El Salvador" | ///
loc_grand_name == "Grenada" | ///
loc_grand_name == "Guatemala" | ///
loc_grand_name == "Guyana" | ///
loc_grand_name == "Haiti" | ///
loc_grand_name == "Honduras" | ///
loc_grand_name == "Jamaica" | ///
loc_grand_name == "MS Zaandam" | ///
loc_grand_name == "Mexico" | ///
loc_grand_name == "Nicaragua" | ///
loc_grand_name == "Panama" | ///
loc_grand_name == "Paraguay" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Saint Kitts and Nevis" | ///
loc_grand_name == "Saint Lucia" | ///
loc_grand_name == "Saint Vincent and the Grenadines" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "The Bahamas" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "United States" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Venezuela" 

drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "AMRO"

order loc_grand_name date

qui compress

save "SRIV AMRO.dta", replace 




*****************************

* gen AMR1

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "United States" 

drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "AMR1"

order loc_grand_name date

qui compress

save "SRIV AMR1.dta", replace 




*****************************

* gen AMR2

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Belize" | ///
loc_grand_name == "Bolivia" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
loc_grand_name == "Diamond Princess" | ///
loc_grand_name == "Dominica" | ///
loc_grand_name == "Dominican Republic" | ///
loc_grand_name == "Ecuador" | ///
loc_grand_name == "El Salvador" | ///
loc_grand_name == "Grenada" | ///
loc_grand_name == "Guatemala" | ///
loc_grand_name == "Guyana" | ///
loc_grand_name == "Haiti" | ///
loc_grand_name == "Honduras" | ///
loc_grand_name == "Jamaica" | ///
loc_grand_name == "MS Zaandam" | ///
loc_grand_name == "Mexico" | ///
loc_grand_name == "Nicaragua" | ///
loc_grand_name == "Panama" | ///
loc_grand_name == "Paraguay" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Saint Kitts and Nevis" | ///
loc_grand_name == "Saint Lucia" | ///
loc_grand_name == "Saint Vincent and the Grenadines" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "The Bahamas" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Venezuela" 

drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "AMR2"

order loc_grand_name date

qui compress

save "SRIV AMR2.dta", replace 












*****************************

* gen EMRO

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Afghanistan" | ///
loc_grand_name == "Bahrain" | ///
loc_grand_name == "Djibouti" | ///
loc_grand_name == "Egypt" | ///
loc_grand_name == "Iran" | ///
loc_grand_name == "Iraq" | ///
loc_grand_name == "Jordan" | ///
loc_grand_name == "Kuwait" | ///
loc_grand_name == "Lebanon" | ///
loc_grand_name == "Libya" | ///
loc_grand_name == "Morocco" | ///
loc_grand_name == "Oman" | ///
loc_grand_name == "Pakistan" | ///
loc_grand_name == "Qatar" | ///
loc_grand_name == "Saudi Arabia" | ///
loc_grand_name == "Somalia" | ///
loc_grand_name == "Sudan" | ///
loc_grand_name == "Syria" | ///
loc_grand_name == "Tunisia" | ///
loc_grand_name == "United Arab Emirates" | ///
loc_grand_name == "West Bank and Gaza" | ///
loc_grand_name == "Western Sahara" | ///
loc_grand_name == "Yemen" 


drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "EMRO"

order loc_grand_name date

qui compress

save "SRIV EMRO.dta", replace 










*****************************

* gen EURO

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Albania" | ///
loc_grand_name == "Andorra" | ///
loc_grand_name == "Armenia" | ///
loc_grand_name == "Austria" | ///
loc_grand_name == "Azerbaijan" | ///
loc_grand_name == "Belarus" | ///
loc_grand_name == "Belgium" | ///
loc_grand_name == "Bosnia and Herzegovina" | ///
loc_grand_name == "Bulgaria" | ///
loc_grand_name == "Croatia" | ///
loc_grand_name == "Cyprus" | ///
loc_grand_name == "Czech Republic" | ///
loc_grand_name == "Denmark" | ///
loc_grand_name == "Estonia" | ///
loc_grand_name == "Finland" | ///
loc_grand_name == "France" | ///
loc_grand_name == "Georgia" | ///
loc_grand_name == "Germany" | ///
loc_grand_name == "Greece" | ///
loc_grand_name == "Holy See" | ///
loc_grand_name == "Hungary" | ///
loc_grand_name == "Iceland" | ///
loc_grand_name == "Ireland" | ///
loc_grand_name == "Israel" | ///
loc_grand_name == "Italy" | ///
loc_grand_name == "Kazakhstan" | ///
loc_grand_name == "Kosovo" | ///
loc_grand_name == "Kyrgyzstan" | ///
loc_grand_name == "Latvia" | ///
loc_grand_name == "Liechtenstein" | ///
loc_grand_name == "Lithuania" | ///
loc_grand_name == "Luxembourg" | ///
loc_grand_name == "Macedonia" | ///
loc_grand_name == "Malta" | ///
loc_grand_name == "Moldova" | ///
loc_grand_name == "Monaco" | ///
loc_grand_name == "Montenegro" | ///
loc_grand_name == "Netherlands" | ///
loc_grand_name == "Norway" | ///
loc_grand_name == "Poland" | ///
loc_grand_name == "Portugal" | ///
loc_grand_name == "Romania" | ///
loc_grand_name == "Russian Federation" | ///
loc_grand_name == "San Marino" | ///
loc_grand_name == "Serbia" | ///
loc_grand_name == "Slovakia" | ///
loc_grand_name == "Slovenia" | ///
loc_grand_name == "Spain" | ///
loc_grand_name == "Sweden" | ///
loc_grand_name == "Switzerland" | ///
loc_grand_name == "Turkey" | ///
loc_grand_name == "Ukraine" | ///
loc_grand_name == "United Kingdom" | ///
loc_grand_name == "Uzbekistan" 


drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "EURO"

order loc_grand_name date

qui compress

save "SRIV EURO.dta", replace 









*****************************

* gen SEARO

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "Bhutan" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Myanmar" | ///
loc_grand_name == "Nepal" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand" | ///
loc_grand_name == "Timor-Leste" 


drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "SEARO"

order loc_grand_name date

qui compress

save "SRIV SEARO.dta", replace 









*****************************

* gen WPRO

use "SRIV.dta", clear

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "Brunei" | ///
loc_grand_name == "Cambodia" | ///
loc_grand_name == "China" | ///
loc_grand_name == "Fiji" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Laos" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "Mongolia" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Papua New Guinea" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "South Korea" | ///
loc_grand_name == "Vietnam" 


drop loc_grand_name

collapse (sum) TotDeaMeRaA05S00-DayDMuMeRaA05S00, by(date)

foreach var of varlist DayDeaMeRaA05S00 DayDeaLoRaA05S00 DayDeaUpRaA05S00 ///
DayCasMeRaA05S00 DayCasLoRaA05S00 DayCasUpRaA05S00 {
	replace `var' = . if `var' == 0
}
*
 
label var TotDeaMeRaA05S00 "Total Deaths Mean SRIV"
label var TotDeaLoRaA05S00 "Total Deaths Lower SRIV"
label var TotDeaUpRaA05S00 "Total Deaths Upper SRIV"
label var TotCasMeRaA05S00 "Total Cases Mean SRIV"
label var TotCasLoRaA05S00 "Total Cases Lower SRIV"
label var TotCasUpRaA05S00 "Total Cases Upper SRIV" 

label var DayDeaMeRaA05S00 "Daily Deaths Mean SRIV"
label var DayDeaLoRaA05S00 "Daily Deaths Lower SRIV"
label var DayDeaUpRaA05S00 "Daily Deaths Upper SRIV"
label var DayCasMeRaA05S00 "Daily Cases Mean SRIV"
label var DayCasLoRaA05S00 "Daily Cases Lower SRIV"
label var DayCasUpRaA05S00 "Daily Cases Upper SRIV" 

label var DayDeMMeRaA05S00 "Daily deaths mean SRIV  DayDeM"
label var DayCaMMeRaA05S00 "Daily cases mean SRIV  DayCaM"
label var DayCbDMeRaA05S00 "Daily cases mean div by daily deaths mean SRIV  DayCbD"
label var DayDMuMeRaA05S00 "Daily deaths scaled (times means of cases by deaths) SRIV"

gen loc_grand_name = "WPRO"

order loc_grand_name date

qui compress

save "SRIV WPRO.dta", replace 











******************

* append regions

use "SRIV GLOBAL.dta", clear 

local list4 AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list4 {

	append using "SRIV `region'.dta"
	
}
*




* gen vars by location 

foreach var of varlist TotDeaMeRaA05S00-DayDMuMeRaA05S00 {


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






order loc_grand_name date

qui compress

save "CovidVisualizedGlobal SRIV.dta", replace 















view "log CovidVisualizedGlobal SRIV 1.smcl"

log close

exit, clear






clear all

cd "$pathCovidVisualizedGlobal"

cd IHME

capture log close 

log using "log CovidVisualizedGlobal IHME 2.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IHME 2.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


* continue preparation


ssc install labutil2

 



*****************************

* gen global sum

use "IHME.dta", clear

keep if loc_grand_name == "Global"

replace loc_grand_name = " GLOBAL"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "IHME GLOBAL.dta", replace








*****************************

* gen AFRO

use "IHME.dta", clear

keep if ///
loc_grand_name == "Algeria" | ///
loc_grand_name == "Angola" | ///
loc_grand_name == "Benin" | ///
loc_grand_name == "Burkina Faso" | ///
loc_grand_name == "C√¥te d'Ivoire" | location_id == 205 | ///
loc_grand_name == "Cabo Verde" | ///
loc_grand_name == "Cameroon" | ///
loc_grand_name == "Central African Republic" | ///
loc_grand_name == "Chad" | ///
loc_grand_name == "Comoros" | ///
loc_grand_name == "Congo" | ///
loc_grand_name == "Democratic Republic of the Congo" | ///
loc_grand_name == "Equatorial Guinea" | ///
loc_grand_name == "Eswatini" | ///
loc_grand_name == "Ethiopia" | ///
loc_grand_name == "Gabon" | ///
loc_grand_name == "Gambia" | ///
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
loc_grand_name == "Sierra Leone" | ///
loc_grand_name == "South Africa" | ///
loc_grand_name == "South Sudan" | ///
loc_grand_name == "Togo" | ///
loc_grand_name == "Uganda" | ///
loc_grand_name == "Zambia" | ///
loc_grand_name == "Zimbabwe" 


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "AFRO"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME AFRO.dta", replace







*****************************

* gen AMRO

use "IHME.dta", clear

keep if ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Bolivia (Plurinational State of)" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Canada" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
loc_grand_name == "Dominican Republic" | ///
loc_grand_name == "Ecuador" | ///
loc_grand_name == "El Salvador" | ///
loc_grand_name == "Guatemala" | ///
loc_grand_name == "Guyana" | ///
loc_grand_name == "Haiti" | ///
loc_grand_name == "Honduras" | ///
loc_grand_name == "Jamaica" | ///
loc_grand_name == "Mexico" | ///
loc_grand_name == "Nicaragua" | ///
loc_grand_name == "Panama" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Puerto Rico" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "United States of America" | ///
loc_grand_name == "United States Virgin Islands" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Venezuela (Bolivarian Republic of)" 


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "AMRO"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME AMRO.dta", replace





*****************************

* gen AMR1

use "IHME.dta", clear

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "United States of America" 


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "AMR1"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME AMR1.dta", replace






*****************************

* gen AMR2

use "IHME.dta", clear

keep if ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Bolivia (Plurinational State of)" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
loc_grand_name == "Dominican Republic" | ///
loc_grand_name == "Ecuador" | ///
loc_grand_name == "El Salvador" | ///
loc_grand_name == "Guatemala" | ///
loc_grand_name == "Guyana" | ///
loc_grand_name == "Haiti" | ///
loc_grand_name == "Honduras" | ///
loc_grand_name == "Jamaica" | ///
loc_grand_name == "Mexico" | ///
loc_grand_name == "Nicaragua" | ///
loc_grand_name == "Panama" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Puerto Rico" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "United States Virgin Islands" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Venezuela (Bolivarian Republic of)" 


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "AMR2"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME AMR2.dta", replace







*****************************

* gen EMRO

use "IHME.dta", clear

keep if ///
loc_grand_name == "Afghanistan" | ///
loc_grand_name == "Bahrain" | ///
loc_grand_name == "Djibouti" | ///
loc_grand_name == "Egypt" | ///
loc_grand_name == "Iran (Islamic Republic of)" | ///
loc_grand_name == "Iraq" | ///
loc_grand_name == "Jordan" | ///
loc_grand_name == "Kuwait" | ///
loc_grand_name == "Lebanon" | ///
loc_grand_name == "Libya" | ///
loc_grand_name == "Morocco" | ///
loc_grand_name == "Oman" | ///
loc_grand_name == "Pakistan" | ///
loc_grand_name == "Palestine" | ///
loc_grand_name == "Qatar" | ///
loc_grand_name == "Saudi Arabia" | ///
loc_grand_name == "Somalia" | ///
loc_grand_name == "Sudan" | ///
loc_grand_name == "Syrian Arab Republic" | ///
loc_grand_name == "Tunisia" | ///
loc_grand_name == "United Arab Emirates" | ///
loc_grand_name == "Yemen"


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "EMRO"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME EMRO.dta", replace








*****************************

* gen EURO

use "IHME.dta", clear

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
loc_grand_name == "Czechia" | ///
loc_grand_name == "Denmark" | ///
loc_grand_name == "Estonia" | ///
loc_grand_name == "Finland" | ///
loc_grand_name == "France" | ///
loc_grand_name == "Germany" | ///
loc_grand_name == "Greece" | ///
loc_grand_name == "Hungary" | ///
loc_grand_name == "Iceland" | ///
loc_grand_name == "Ireland" | ///
loc_grand_name == "Israel" | ///
loc_grand_name == "Italy" | ///
loc_grand_name == "Kazakhstan" | ///
loc_grand_name == "Kyrgyzstan" | ///
loc_grand_name == "Latvia" | ///
loc_grand_name == "Lithuania" | ///
loc_grand_name == "Luxembourg" | ///
loc_grand_name == "Malta" | ///
loc_grand_name == "Netherlands" | ///
loc_grand_name == "North Macedonia" | ///
loc_grand_name == "Norway" | ///
loc_grand_name == "Poland" | ///
loc_grand_name == "Portugal" | ///
loc_grand_name == "Republic of Moldova" | ///
loc_grand_name == "Romania" | ///
loc_grand_name == "Russian Federation" | ///
loc_grand_name == "San Marino" | ///
loc_grand_name == "Serbia" | ///
loc_grand_name == "Slovakia" | ///
loc_grand_name == "Slovenia" | ///
loc_grand_name == "Spain" | ///
loc_grand_name == "Sweden" | ///
loc_grand_name == "Switzerland" | ///
loc_grand_name == "Tajikistan" | ///
loc_grand_name == "Turkey" | ///
loc_grand_name == "Ukraine" | ///
loc_grand_name == "Umbria" | ///
loc_grand_name == "United Kingdom" | ///
loc_grand_name == "Uzbekistan" | ///
loc_grand_name == "Georgia" & location_id == 35 // The counry Georgia, not the Georgia state in USA


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "EURO"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME EURO.dta", replace







*****************************

* gen SEARO

use "IHME.dta", clear

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Myanmar" | ///
loc_grand_name == "Nepal" | ///
loc_grand_name == "Republic of Korea" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand"


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "SEARO"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME SEARO.dta", replace







*****************************

* gen WPRO

use "IHME.dta", clear

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "China" | ///
loc_grand_name == "Guam" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Taiwan (Province of China)" | ///
loc_grand_name == "Viet Nam" 


collapse (sum) DayINFMeSmA02S01-daily_all_fully_vacci_pct, by(date)

labvars ,names

gen loc_grand_name = "WPRO"

order date loc_grand_name

sort date loc_grand_name

qui compress
save "IHME WPRO.dta", replace








******************

* append regions

use "IHME GLOBAL.dta", clear 

local list2 AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list2 {

	append using "IHME `region'.dta"
	
}
*




rename cumul_all_effect_vacci_pct CumAllEffVaxPct
rename cumul_all_fully_vacci_pct CumAllFulVaxPct
rename cumul_deaths_unscaled_A02S01 CumDeaUnsA02S01
rename cumul_deaths_unscaled_A02S02 CumDeaUnsA02S02
rename cumul_deaths_unscaled_A02S03 CumDeaUnsA02S03
rename cumul_deaths_unscaled_A02S04 CumDeaUnsA02S04
rename cumul_deaths_unscaled_A02S05 CumDeaUnsA02S05
rename cumulative_all_effectively_vacci CumAllEffVax
rename cumulative_all_fully_vaccinated CumAllFulVax
rename cumulative_all_vaccin_pct CumAllVaxPct
rename cumulative_all_vaccinated CumAllVax
rename cumulative_cases_A02S01 CumCasA02S01
rename cumulative_cases_A02S02 CumCasA02S02
rename cumulative_cases_A02S03 CumCasA02S03
rename cumulative_cases_A02S04 CumCasA02S04
rename cumulative_cases_A02S05 CumCasA02S05
rename cumulative_deaths_A02S02 CumDeaA02S02
rename cumulative_deaths_A02S03 CumDeaA02S03
rename cumulative_deaths_A02S04 CumDeaA02S04
rename cumulative_deaths_A02S05 CumDeaA02S05
rename cumulative_hosp_A02S01 CumHospA02S01
rename cumulative_hosp_A02S02 CumHospA02S02
rename cumulative_hosp_A02S03 CumHospA02S03
rename cumulative_hosp_A02S04 CumHospA02S04
rename cumulative_hosp_A02S05 CumHospA02S05
rename dai_dea_unscaled_A02S01 DayDeaUnsA02S01
rename dai_dea_unscaled_A02S02 DayDeaUnsA02S02
rename dai_dea_unscaled_A02S03 DayDeaUnsA02S03
rename dai_dea_unscaled_A02S04 DayDeaUnsA02S04
rename dai_dea_unscaled_A02S05 DayDeaUnsA02S05
rename daily_all_effect_vacci_pct DayAllEffVaxPct
rename daily_all_effectively_vacci DayAllEffVax
rename daily_all_fully_vacci_pct DayAllFulVaxPct
rename daily_all_fully_vaccinated DayAllFulVax
rename daily_all_vaccin_pct DayAllVaxPct
rename daily_all_vaccinated DayAllVax
rename daily_deaths_A02S01 DayDeaA02S01
rename daily_deaths_A02S02 DayDeaA02S02
rename daily_deaths_A02S03 DayDeaA02S03
rename daily_deaths_A02S04 DayDeaA02S04
rename daily_deaths_A02S05 DayDeaA02S05
rename infection_detection_A02S01 InfDetectA02S01
rename infection_detection_A02S02 InfDetectA02S02
rename infection_detection_A02S03 InfDetectA02S03
rename infection_detection_A02S04 InfDetectA02S04
rename infection_detection_A02S05 InfDetectA02S05
rename infection_fatality_A02S01 InfFatalA02S01
rename infection_fatality_A02S02 InfFatalA02S02
rename infection_fatality_A02S03 InfFatalA02S03
rename infection_fatality_A02S04 InfFatalA02S04
rename infection_fatality_A02S05 InfFatalA02S05
rename infection_hospitalization_A02S01 InfHospitA02S01
rename infection_hospitalization_A02S02 InfHospitA02S02
rename infection_hospitalization_A02S03 InfHospitA02S03




* gen vars by location 

foreach var of varlist DayINFMeSmA02S01-DayAllFulVaxPct {



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




sort date loc_grand_name

qui compress

save "CovidVisualizedGlobal IHME.dta", replace











view "log CovidVisualizedGlobal IHME 2.smcl"

log close

exit, clear




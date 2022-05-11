
clear all
 
cd "$pathCovidVisualizedGlobal"

cd WHO

capture log close 

log using "log CovidVisualizedGlobal WHO.smcl", replace

******************************************************************************
* This is "do CovidVisualizedGlobal WHO.do"

* Project: CovidVisualized country - countries without subnational estimates
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-02-10

* OBJECTIVE: Get and prepare WHO data for country
******************************************************************************




* Global excess deaths associated with COVID-19 (modelled estimates) 
* Most recent update: 5 May 2022
* Temporal coverage	1 January 2020 - 31 December 2021
* Source web page:
* https://www.who.int/data/sets/global-excess-deaths-associated-with-covid-19-modelled-estimates




* Get WHO data for countries (194)


clear

copy https://cdn.who.int/media/docs/default-source/world-health-data-platform/covid-19-excessmortality/2022-03-25_covid-19_gem.zip 2022-03-25_covid-19_gem.zip

unzipfile 2022-03-25_covid-19_gem.zip

import excel using "WHO_COVID_Excess_Deaths_EstimatesByCountry.xlsx", clear sheet("Country by year and month") cellrange(A13:K4669) firstrow


label var expectedmean "Expected deaths from all-causes by location, year and month (mean)"
label var acmmean "Estimated deaths from all-causes by location, year and month (mean)"
label var excessmean "Excess deaths associated with COVID-19 pandemic from all-causes by location, year and month (mean)"
label var cumulexcessmean "Cumulative excess deaths associated with COVID-19 pandemic (mean)"  
label var cumulexcesslow "Cumulative excess deaths associated with COVID-19 pandemic (lower 95% confidence interval)"
label var cumulexcesshigh "Cumulative excess deaths associated with COVID-19 pandemic (upper 95% confidence interval)"


gen DayDeXMeRaA06S00 = excessmean / 31
replace DayDeXMeRaA06S00 = excessmean / 30 if month == 4 | month == 6 | month == 9 | month == 11
replace DayDeXMeRaA06S00 = excessmean / 29 if month == 2 & year == 2020
replace DayDeXMeRaA06S00 = excessmean / 28 if month == 2 & year == 2021
label var DayDeXMeRaA06S00 "Daily Excess Deaths Raw Mean WHO S0"



* gen date

egen eom = eom(month year), f(%tdDDMonCCYY)
label var eom eomdate

expand 31 if month == 1 | month == 3 | month == 5 | month == 7 | month == 8 | month == 10 | month == 12
expand 30 if month == 4 | month == 6 | month == 9 | month == 11
expand 29 if month == 2 & year == 2020
expand 28 if month == 2 & year == 2021

sort eom

egen countryyearmonth = group(country year month), label lname(name) 

bysort countryyearmonth: gen day = [_n]

gen yearnew = year
tostring yearnew, replace

gen monthnew = month
tostring monthnew, replace
replace monthnew = "01" if monthnew == "1"
replace monthnew = "02" if monthnew == "2"
replace monthnew = "03" if monthnew == "3"
replace monthnew = "04" if monthnew == "4"
replace monthnew = "05" if monthnew == "5"
replace monthnew = "06" if monthnew == "6"
replace monthnew = "07" if monthnew == "7"
replace monthnew = "08" if monthnew == "8"
replace monthnew = "09" if monthnew == "9"

gen daynew = day
tostring daynew, replace
replace daynew = "01" if daynew == "1"
replace daynew = "02" if daynew == "2"
replace daynew = "03" if daynew == "3"
replace daynew = "04" if daynew == "4"
replace daynew = "05" if daynew == "5"
replace daynew = "06" if daynew == "6"
replace daynew = "07" if daynew == "7"
replace daynew = "08" if daynew == "8"
replace daynew = "09" if daynew == "9"

egen date2 = concat(daynew monthnew yearnew)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date


* smooth

encode country, generate(countryencoded) label(name)

tsset countryencoded date, daily   


tssmooth ma DayDeXMeRaA06S00_window = DayDeXMeRaA06S00, window(3 1 3) 

tssmooth ma DayDeXMeSmA06S00 = DayDeXMeRaA06S00_window, weights( 1 2 3 <4> 3 2 1) replace 

label var DayDeXMeSmA06S00 "Daily Excess Deaths Smooth Mean WHO S0"
          
drop DayDeXMeRaA06S00_window

tsset, clear



rename country loc_grand_name

keep loc_grand_name DayDeXMeRaA06S00 DayDeXMeSmA06S00 date

sort loc_grand_name date

order loc_grand_name date

qui compress

save "WHO.dta", replace




*****************
* gen regions




* gen GLOBAL 

use "WHO.dta", clear


collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = " GLOBAL"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO GLOBAL.dta", replace










* gen AFRO

use "WHO.dta", clear

keep if ///
loc_grand_name == "Algeria" | ///
loc_grand_name == "Angola" | ///
loc_grand_name == "Benin" | ///
loc_grand_name == "Botswana" | ///
loc_grand_name == "Burkina Faso" | ///
loc_grand_name == "Burundi" | ///
loc_grand_name == "Cabo Verde" | ///
loc_grand_name == "Cameroon" | ///
loc_grand_name == "Central African Republic" | ///
loc_grand_name == "Chad" | ///
loc_grand_name == "Comoros" | ///
loc_grand_name == "Congo" | ///
loc_grand_name == "Côte d'Ivoire" |  ///
loc_grand_name == "Democratic Republic of the Congo" | ///
loc_grand_name == "Equatorial Guinea" | ///
loc_grand_name == "Eritrea" | ///
loc_grand_name == "Eswatini" | ///
loc_grand_name == "Ethiopia" | ///
loc_grand_name == "Gabon" | ///
loc_grand_name == "Gambia" | ///
loc_grand_name == "Ghana" | ///
loc_grand_name == "Guinea-Bissau" | ///
loc_grand_name == "Guinea" | ///
loc_grand_name == "Kenya" | ///
loc_grand_name == "Lesotho" | ///
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
loc_grand_name == "Togo" | ///
loc_grand_name == "Uganda" | ///
loc_grand_name == "United Republic of Tanzania" | ///
loc_grand_name == "Zambia" | ///
loc_grand_name == "Zimbabwe" 


collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "AFRO"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO AFRO.dta", replace








* gen AMRO

use "WHO.dta", clear

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Belize" | ///
loc_grand_name == "Bolivia (Plurinational State of)" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Canada" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
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
loc_grand_name == "Mexico" | ///
loc_grand_name == "Nicaragua" | ///
loc_grand_name == "Panama" | ///
loc_grand_name == "Paraguay" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Saint Kitts and Nevis" | ///
loc_grand_name == "Saint Lucia" | ///
loc_grand_name == "Saint Vincent and the Grenadines" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "United States of America" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Vanuatu" 


collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "AMRO"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO AMRO.dta", replace






* gen AMR1

use "WHO.dta", clear

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "United States of America" 



collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "AMR1"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO AMR1.dta", replace









* gen AMR2

use "WHO.dta", clear

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Belize" | ///
loc_grand_name == "Bolivia (Plurinational State of)" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
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
loc_grand_name == "Mexico" | ///
loc_grand_name == "Nicaragua" | ///
loc_grand_name == "Panama" | ///
loc_grand_name == "Paraguay" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Saint Kitts and Nevis" | ///
loc_grand_name == "Saint Lucia" | ///
loc_grand_name == "Saint Vincent and the Grenadines" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Vanuatu" 


collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "AMR2"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO AMR2.dta", replace







* gen EMRO

use "WHO.dta", clear

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
loc_grand_name == "Qatar" | ///
loc_grand_name == "Saudi Arabia" | ///
loc_grand_name == "Somalia" | ///
loc_grand_name == "Sudan" | ///
loc_grand_name == "Syrian Arab Republic" | ///
loc_grand_name == "Tunisia" | ///
loc_grand_name == "United Arab Emirates" | ///
loc_grand_name == "Yemen"



collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "EMRO"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO EMRO.dta", replace







* gen EURO

use "WHO.dta", clear

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
loc_grand_name == "Georgia" | ///
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
loc_grand_name == "Monaco" | ///
loc_grand_name == "Montenegro" | ///
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
loc_grand_name == "Turkmenistan" | ///
loc_grand_name == "Ukraine" | ///
loc_grand_name == "The United Kingdom" | ///
loc_grand_name == "Uzbekistan" 



collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "EURO"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO EURO.dta", replace






* gen SEARO

use "WHO.dta", clear

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "Bhutan" | ///
loc_grand_name == "Democratic People's Republic of Korea" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Mongolia" | ///
loc_grand_name == "Myanmar" | ///
loc_grand_name == "Nauru" | ///
loc_grand_name == "Republic of Korea" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand" | ///
loc_grand_name == "Timor-Leste"



collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "SEARO"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO SEARO.dta", replace







* gen WPRO

use "WHO.dta", clear

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "Brunei Darussalam" | ///
loc_grand_name == "Cambodia" | ///
loc_grand_name == "China" | ///
loc_grand_name == "Cook Islands" | ///
loc_grand_name == "Fiji" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Kiribati" | ///
loc_grand_name == "Lao People's Democratic Republic" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "Marshall Islands" | ///
loc_grand_name == "Micronesia (Federated States of)" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Niue" | ///
loc_grand_name == "Niue" | ///
loc_grand_name == "Palau" | ///
loc_grand_name == "Papua New Guinea" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Samoa" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Solomon Islands" | ///
loc_grand_name == "Tonga" | ///
loc_grand_name == "Tuvalu" | ///
loc_grand_name == "Viet Nam" 



collapse (sum) DayDeXMeRaA06S00 DayDeXMeSmA06S00, by(date)

labvars ,names

gen loc_grand_name = "WPRO"

order date loc_grand_name

sort date loc_grand_name

qui compress

save "WHO WPRO.dta", replace









******************

* append regions

use "WHO GLOBAL.dta", clear 

local list2 AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list2 {

	append using "WHO `region'.dta"
	
}
*





* gen vars by location 

foreach var of varlist ///
DayDeXMeSmA06S00 DayDeXMeRaA06S00 {


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

save "CovidVisualizedGlobal WHO.dta", replace





view "log CovidVisualizedGlobal WHO.smcl"

log close

exit, clear






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


gen counter = _n

reshape long v, i(counter) 

rename v TotDeaMeRaA00S00

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

bysort loc_grand_name: gen DayDeaMeRaA00S00 =  TotDeaMeRaA00S00[_n] - TotDeaMeRaA00S00[_n-1]

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"


* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

bysort loc_grand_name: replace date = date + _j - 1

format date %td

codebook date

drop counter _j

save "all JOHN deaths.dta", replace









*****************************

* gen global sum

use "all JOHN deaths.dta", clear 

collapse (sum) TotDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

gen DayDeaMeRaA00S00 =  TotDeaMeRaA00S00[_n] - TotDeaMeRaA00S00[_n-1]

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = " GLOBAL"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths GLOBAL.dta", replace










*****************************

* gen AFRO

use "all JOHN deaths.dta", clear 

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
loc_grand_name == "Congo (Brazzaville)" | ///
loc_grand_name == "Congo (Kinshasa)" | ///
loc_grand_name == "Cote d'Ivoire" | ///
loc_grand_name == "Equatorial Guinea" | ///
loc_grand_name == "Eritrea" | ///
loc_grand_name == "Eswatini" | ///
loc_grand_name == "Ethiopia" | ///
loc_grand_name == "Gabon" | ///
loc_grand_name == "Gambia" | ///
loc_grand_name == "Ghana" | ///
loc_grand_name == "Guinea" | ///
loc_grand_name == "Guinea-Bissau" | ///
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
loc_grand_name == "Tanzania" | ///
loc_grand_name == "Togo" | ///
loc_grand_name == "Uganda" | ///
loc_grand_name == "Zambia" | ///
loc_grand_name == "Zimbabwe" 


drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "AFRO"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths AFRO.dta", replace









*****************************

* gen AMRO

use "all JOHN deaths.dta", clear 

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
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
loc_grand_name == "Mexico" | ///
loc_grand_name == "MS Zaandam" | ///
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
loc_grand_name == "US" | ///
loc_grand_name == "Venezuela" 


drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "AMRO"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths AMRO.dta", replace




*****************************

* gen AMR1

use "all JOHN deaths.dta", clear 

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "US" 



drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "AMR1"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths AMR1.dta", replace



*****************************

* gen AMR2

use "all JOHN deaths.dta", clear 

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
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
loc_grand_name == "Mexico" | ///
loc_grand_name == "MS Zaandam" | ///
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
loc_grand_name == "Venezuela" 


drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "AMR2"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths AMR2.dta", replace











*****************************

* gen EMRO

use "all JOHN deaths.dta", clear 

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
loc_grand_name == "Yemen" 


drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "EMRO"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths EMRO.dta", replace








*****************************

* gen EURO

use "all JOHN deaths.dta", clear 

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
loc_grand_name == "Malta" | ///
loc_grand_name == "Moldova" | ///
loc_grand_name == "Monaco" | ///
loc_grand_name == "Montenegro" | ///
loc_grand_name == "Netherlands" | ///
loc_grand_name == "North Macedonia" | ///
loc_grand_name == "Norway" | ///
loc_grand_name == "Poland" | ///
loc_grand_name == "Portugal" | ///
loc_grand_name == "Romania" | ///
loc_grand_name == "Russia" | ///
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
loc_grand_name == "United Kingdom" | ///
loc_grand_name == "Uzbekistan"

drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "EURO"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths EURO.dta", replace









*****************************

* gen SEARO

use "all JOHN deaths.dta", clear 

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "Bhutan" | ///
loc_grand_name == "Burma" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Nepal" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand" | ///
loc_grand_name == "Timor-Leste" 


drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "SEARO"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths SEARO.dta", replace








*****************************

* gen WPRO

use "all JOHN deaths.dta", clear 

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "Brunei" | ///
loc_grand_name == "Cambodia" | ///
loc_grand_name == "China" | ///
loc_grand_name == "Fiji" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Kiribati" | ///
loc_grand_name == "Korea, South" | ///
loc_grand_name == "Laos" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "Marshall Islands" | ///
loc_grand_name == "Micronesia" | ///
loc_grand_name == "Mongolia" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Palau" | ///
loc_grand_name == "Papua New Guinea" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Samoa" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Solomon Islands" | ///
loc_grand_name == "Summer Olympics 2020" | ///
loc_grand_name == "Taiwan*" | ///
loc_grand_name == "Tonga" | ///
loc_grand_name == "Vanuatu" | ///
loc_grand_name == "Vietnam" 


drop loc_grand_name
 
collapse (sum) TotDeaMeRaA00S00 DayDeaMeRaA00S00, by(date)

label var TotDeaMeRaA00S00 "Total deaths raw A00 JOHN"

label var DayDeaMeRaA00S00 "Daily deaths raw A00 JOHN"

gen loc_grand_name = "WPRO"

order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN deaths WPRO.dta", replace













****************************************
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


gen counter = _n

reshape long v, i(counter) 

rename v TotCasMeRaA00S00

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

bysort loc_grand_name: gen DayCasMeRaA00S00 =  TotCasMeRaA00S00[_n] - TotCasMeRaA00S00[_n-1]

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"


* JOHN starts from 22 Jan 2020

gen date = date("22 Jan 2020", "DMY")

bysort loc_grand_name: replace date = date + _j - 1

format date %td

codebook date

drop counter _j

save "all JOHN cases.dta", replace










*****************************

* gen global sum

use "all JOHN cases.dta", clear 

collapse (sum) TotCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

gen DayCasMeRaA00S00 =  TotCasMeRaA00S00[_n] - TotCasMeRaA00S00[_n-1]

label var DayCasMeRaA00S00 "Daily deacasesths raw A00 JOHN"

gen loc_grand_name = " GLOBAL"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases GLOBAL.dta", replace









*****************************

* gen AFRO

use "all JOHN cases.dta", clear 

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
loc_grand_name == "Congo (Brazzaville)" | ///
loc_grand_name == "Congo (Kinshasa)" | ///
loc_grand_name == "Cote d'Ivoire" | ///
loc_grand_name == "Equatorial Guinea" | ///
loc_grand_name == "Eritrea" | ///
loc_grand_name == "Eswatini" | ///
loc_grand_name == "Ethiopia" | ///
loc_grand_name == "Gabon" | ///
loc_grand_name == "Gambia" | ///
loc_grand_name == "Ghana" | ///
loc_grand_name == "Guinea" | ///
loc_grand_name == "Guinea-Bissau" | ///
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
loc_grand_name == "Tanzania" | ///
loc_grand_name == "Togo" | ///
loc_grand_name == "Uganda" | ///
loc_grand_name == "Zambia" | ///
loc_grand_name == "Zimbabwe" 


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "AFRO"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases AFRO.dta", replace






*****************************

* gen AMRO

use "all JOHN cases.dta", clear 

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
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
loc_grand_name == "Mexico" | ///
loc_grand_name == "MS Zaandam" | ///
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
loc_grand_name == "US" | ///
loc_grand_name == "Venezuela" 


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "AMRO"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases AMRO.dta", replace



*****************************

* gen AMR1

use "all JOHN cases.dta", clear 

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "US" 



drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "AMR1"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases AMR1.dta", replace





*****************************

* gen AMR2

use "all JOHN cases.dta", clear 

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Bahamas" | ///
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
loc_grand_name == "Mexico" | ///
loc_grand_name == "MS Zaandam" | ///
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
loc_grand_name == "Venezuela" 


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "AMR2"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases AMR2.dta", replace











*****************************

* gen EMRO

use "all JOHN cases.dta", clear 

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
loc_grand_name == "Yemen" 


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "EMRO"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases EMRO.dta", replace









*****************************

* gen EURO

use "all JOHN cases.dta", clear 

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
loc_grand_name == "Malta" | ///
loc_grand_name == "Moldova" | ///
loc_grand_name == "Monaco" | ///
loc_grand_name == "Montenegro" | ///
loc_grand_name == "Netherlands" | ///
loc_grand_name == "North Macedonia" | ///
loc_grand_name == "Norway" | ///
loc_grand_name == "Poland" | ///
loc_grand_name == "Portugal" | ///
loc_grand_name == "Romania" | ///
loc_grand_name == "Russia" | ///
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
loc_grand_name == "United Kingdom" | ///
loc_grand_name == "Uzbekistan"


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "EURO"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases EURO.dta", replace







*****************************

* gen SEARO

use "all JOHN cases.dta", clear 

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "Bhutan" | ///
loc_grand_name == "Burma" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Nepal" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand" | ///
loc_grand_name == "Timor-Leste" 


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "SEARO"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases SEARO.dta", replace








*****************************

* gen WPRO

use "all JOHN cases.dta", clear 

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "Brunei" | ///
loc_grand_name == "Cambodia" | ///
loc_grand_name == "China" | ///
loc_grand_name == "Fiji" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Kiribati" | ///
loc_grand_name == "Korea, South" | ///
loc_grand_name == "Laos" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "Marshall Islands" | ///
loc_grand_name == "Micronesia" | ///
loc_grand_name == "Mongolia" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Palau" | ///
loc_grand_name == "Papua New Guinea" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Samoa" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Solomon Islands" | ///
loc_grand_name == "Summer Olympics 2020" | ///
loc_grand_name == "Taiwan*" | ///
loc_grand_name == "Tonga" | ///
loc_grand_name == "Vanuatu" | ///
loc_grand_name == "Vietnam" 


drop loc_grand_name
 
collapse (sum) TotCasMeRaA00S00 DayCasMeRaA00S00, by(date)

label var TotCasMeRaA00S00 "Total cases raw A00 JOHN"

label var DayCasMeRaA00S00 "Daily cases raw A00 JOHN"

gen loc_grand_name = "WPRO"

order loc_grand_name date DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN cases WPRO.dta", replace













****************************************
****************************************

* merge deaths and cases

local list GLOBAL AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list {

	use "JOHN deaths `region'.dta", clear 

	merge 1:1 date using "JOHN Cases `region'.dta"
	
	drop _merge

	save "JOHN `region'.dta", replace 

}
*





* append regions

use "JOHN GLOBAL.dta", clear 

local list AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list {

	append using "JOHN `region'.dta"
	
}
*


order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00 DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "JOHN GLOBAL and REGIONAL.dta", replace 




* gen cfr

gen DayCfrMeRaA00S00 = 100 * DayDeaMeRaA00S00 / DayCasMeRaA00S00

label var DayCfrMeRaA00S00 "Daily CFR raw JOHN"





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

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   


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



tsset, clear




*


* gen vars by location 

foreach var of varlist DayDeaMeRaA00S00 TotDeaMeRaA00S00 DayCasMeRaA00S00 TotCasMeRaA00S00 DayCfrMeRaA00S00 ///
DayDeMMeRaA00S00 DayCaMMeRaA00S00 DayCbDMeRaA00S00 DayDeaMeRaA00multip DayDeaMeSmA00S00 ///
DayCasMeSmA00S00 DayCfrMeSmA00S00 DayDeaMeSmA00multip {


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





order loc_grand_name date DayDeaMeRaA00S00 TotDeaMeRaA00S00 DayCasMeRaA00S00 TotCasMeRaA00S00

sort loc_grand_name date

qui compress

save "CovidVisualizedGlobal JOHN.dta", replace


***************************************

* graphs


grstyle init

grstyle color background white



*******************************

* regions separate


local list GLOBAL AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list {



	* daily deaths
	
	twoway ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(gray)) ///
	(line DayDeaMeSmA00S00`region' date, sort lwidth(thick) lcolor(red)) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Raw" 2 "Smoothed") size(small)) 
	
	qui graph save "graph `region' 1 COVID-19 daily deaths, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 1 COVID-19 daily deaths, `region', Johns Hopkins.pdf", replace
	
	
	
	
	
	* daily cases 
	
	twoway ///
	(line DayCasMeRaA00S00`region' date, sort lcolor(gray)) ///
	(line DayCasMeSmA00S00`region' date, sort lwidth(thick) lcolor(red)) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily cases) title("COVID-19 daily cases, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Raw" 2 "Smoothed") size(small)) 
	
	qui graph save "graph `region' 2 COVID-19 daily cases, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 2 COVID-19 daily cases, `region', Johns Hopkins.pdf", replace
	
	
	
	
	
	* total deaths
	
	twoway ///
	(line TotDeaMeRaA00S00`region' date, sort lcolor(black)) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) 
	
	qui graph save "graph `region' 3 COVID-19 total deaths, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 3 COVID-19 total deaths, `region', Johns Hopkins.pdf", replace
	
	
	
	
	
	* total cases 
	
	twoway ///
	(line TotCasMeRaA00S00`region' date, sort lcolor(black)) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Total cases) title("COVID-19 total cases, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) 
	
	qui graph save "graph `region' 4 COVID-19 total cases, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 4 COVID-19 total cases, `region', Johns Hopkins.pdf", replace
	
	
	
	
	
	* daily cfr 
	
	twoway ///
	(line DayCfrMeRaA00S00`region' date, sort lcolor(gray)) ///
	(line DayCfrMeSmA00S00`region' date, sort lwidth(thick) lcolor(red)) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily CFR) title("COVID-19 daily CFR, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Raw" 2 "Smoothed") size(small)) 
	
	qui graph save "graph `region' 5 COVID-19 daily CFR, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 5 COVID-19 daily CFR, `region', Johns Hopkins.pdf", replace
	
	
	
	
	
	* daily cfr after 2021
	
	twoway ///
	(line DayCfrMeRaA00S00`region' date, sort lcolor(gray)) ///
	(line DayCfrMeSmA00S00`region' date, sort lwidth(thick) lcolor(red)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily CFR) title("COVID-19 daily CFR, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	subtitle("after 2021-01-01", size(small)) ///
	legend(order(1 "Raw" 2 "Smoothed") size(small)) 
	
	qui graph save "graph `region' 6 COVID-19 daily CFR, `region', Johns Hopkins, 01dec2020 on.gph", replace
	qui graph export "graph `region' 6 COVID-19 daily CFR, `region', Johns Hopkins, 01dec2020 on.pdf", replace
	
	
	
	
	
	* visualize timing of deaths and cases peaks
	
	twoway ///
	(line DayCasMeRaA00S00`region' date, sort lcolor(blue)) ///
	(line DayDeaMeRaA00S00`region' date, sort lcolor(red)) ///
	(line DayDeaMeRaA00multip`region' date, sort lpattern(tight_dot) lcolor(red)) ///
	if date > td(01jan2020)  ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, raw, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
	legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled") rows(1)) ///
	subtitle("Daily deaths scaled (times means of cases by deaths) only for visualization", size(small))
	
	qui graph save "graph `region' 7 COVID-19 daily deaths and cases timing, raw, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 7 COVID-19 daily deaths and cases timing, raw, `region', Johns Hopkins.pdf", replace
	
	
	
	
	
	* visualize timing of deaths and cases peaks
	
	twoway ///
	(line DayCasMeSmA00S00`region' date, sort lcolor(blue)) ///
	(line DayDeaMeSmA00S00`region' date, sort lcolor(red)) ///
	(line DayDeaMeSmA00multip`region' date, sort lpattern(tight_dot) lcolor(red)) ///
	if date > td(01jan2020)  ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
	ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, smooth, `region', Johns Hopkins", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
	legend(order(1 "Daily cases" 2 "Daily deaths" 3 "Daily deaths scaled") rows(1)) ///
	subtitle("Daily deaths scaled (times means of cases by deaths) only for visualization", size(small))
	
	qui graph save "graph `region' 8 COVID-19 daily deaths and cases timing, smooth, `region', Johns Hopkins.gph", replace
	qui graph export "graph `region' 8 COVID-19 daily deaths and cases timing, smooth, `region'obal, Johns Hopkins.pdf", replace
	



}
*




*******************************

* regions together




* daily deaths, with GLOBAL

twoway ///
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) ///
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
(line DayDeaMeSmA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 1a COVID-19 daily deaths, regions together, Johns Hopkins.gph", replace
qui graph export "graph 1a COVID-19 daily deaths, regions together, Johns Hopkins.pdf", replace




* daily deaths, without GLOBAL

twoway ///
(line DayDeaMeSmA00S00AFRO date, sort lcolor(brown)) ///
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayDeaMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayDeaMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA00S00WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 1b COVID-19 daily deaths, regions together wo global, Johns Hopkins.gph", replace
qui graph export "graph 1b COVID-19 daily deaths, regions together wo global, Johns Hopkins.pdf", replace




* daily cases, with GLOBAL

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) ///
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayCasMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
(line DayCasMeSmA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 2a COVID-19 daily cases, regions together, Johns Hopkins.gph", replace
qui graph export "graph 2a COVID-19 daily cases, regions together, Johns Hopkins.pdf", replace




* daily cases, without GLOBAL

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lcolor(brown)) ///
(line DayCasMeSmA00S00AMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayCasMeSmA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayCasMeSmA00S00EMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases) title("COVID-19 daily cases, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 2b COVID-19 daily cases, regions together wo global, Johns Hopkins.gph", replace
qui graph export "graph 2b COVID-19 daily cases, regions together wo global, Johns Hopkins.pdf", replace





* total deaths, with GLOBAL

twoway ///
(line TotDeaMeRaA00S00AFRO date, sort lcolor(brown)) ///
(line TotDeaMeRaA00S00AMRO date, sort lcolor(red)) ///
(line TotDeaMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotDeaMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line TotDeaMeRaA00S00EMRO date, sort lcolor(gold)) ///
(line TotDeaMeRaA00S00EURO date, sort lcolor(green)) ///
(line TotDeaMeRaA00S00SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeRaA00S00WPRO date, sort lcolor(blue)) ///
(line TotDeaMeRaA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 3a COVID-19 total deaths, regions together, Johns Hopkins.gph", replace
qui graph export "graph 3a COVID-19 total deaths, regions together, Johns Hopkins.pdf", replace



* total deaths, without GLOBAL

twoway ///
(line TotDeaMeRaA00S00AFRO date, sort lcolor(brown)) ///
(line TotDeaMeRaA00S00AMRO date, sort lcolor(red)) ///
(line TotDeaMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotDeaMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line TotDeaMeRaA00S00EMRO date, sort lcolor(gold)) ///
(line TotDeaMeRaA00S00EURO date, sort lcolor(green)) ///
(line TotDeaMeRaA00S00SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeRaA00S00WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 3b COVID-19 total deaths, regions together wo global, Johns Hopkins.gph", replace
qui graph export "graph 3b COVID-19 total deaths, regions together wo global, Johns Hopkins.pdf", replace





* total cases, with GLOBAL

twoway ///
(line TotCasMeRaA00S00AFRO date, sort lcolor(brown)) ///
(line TotCasMeRaA00S00AMRO date, sort lcolor(red)) ///
(line TotCasMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotCasMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line TotCasMeRaA00S00EMRO date, sort lcolor(gold)) ///
(line TotCasMeRaA00S00EURO date, sort lcolor(green)) ///
(line TotCasMeRaA00S00SEARO date, sort lcolor(cyan)) ///
(line TotCasMeRaA00S00WPRO date, sort lcolor(blue)) ///
(line TotCasMeRaA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 4a COVID-19 total cases, regions together, Johns Hopkins.gph", replace
qui graph export "graph 4a COVID-19 total cases, regions together, Johns Hopkins.pdf", replace



* total cases, without GLOBAL

twoway ///
(line TotCasMeRaA00S00AFRO date, sort lcolor(brown)) ///
(line TotCasMeRaA00S00AMRO date, sort lcolor(red)) ///
(line TotCasMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line TotCasMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line TotCasMeRaA00S00EMRO date, sort lcolor(gold)) ///
(line TotCasMeRaA00S00EURO date, sort lcolor(green)) ///
(line TotCasMeRaA00S00SEARO date, sort lcolor(cyan)) ///
(line TotCasMeRaA00S00WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total cases) title("COVID-19 total cases, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO") size(small) rows (3)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 4b COVID-19 total cases, regions together wo global, Johns Hopkins.gph", replace
qui graph export "graph 4b COVID-19 total cases, regions together wo global, Johns Hopkins.pdf", replace





* daily cfr, with GLOBAL

twoway ///
(line DayCfrMeRaA00S00AFRO date, sort lcolor(brown)) ///
(line DayCfrMeRaA00S00AMRO date, sort lcolor(red)) ///
(line DayCfrMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayCfrMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayCfrMeRaA00S00EMRO date, sort lcolor(gold)) ///
(line DayCfrMeRaA00S00EURO date, sort lcolor(green)) ///
(line DayCfrMeRaA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCfrMeRaA00S00WPRO date, sort lcolor(blue)) ///
(line DayCfrMeRaA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily cfr, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 5a COVID-19 daily cfr, regions together, Johns Hopkins.gph", replace
qui graph export "graph 5a COVID-19 daily cfr, regions together, Johns Hopkins.pdf", replace




* daily cfr after 2021, with GLOBAL

twoway ///
(line DayCfrMeRaA00S00AFRO date, sort lcolor(brown)) ///
(line DayCfrMeRaA00S00AMRO date, sort lcolor(red)) ///
(line DayCfrMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash)) ///
(line DayCfrMeRaA00S00AMRO date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayCfrMeRaA00S00EMRO date, sort lcolor(gold)) ///
(line DayCfrMeRaA00S00EURO date, sort lcolor(green)) ///
(line DayCfrMeRaA00S00SEARO date, sort lcolor(cyan)) ///
(line DayCfrMeRaA00S00WPRO date, sort lcolor(blue)) ///
(line DayCfrMeRaA00S00GLOBAL date, sort lcolor(black) lwidth(thick)) ///
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily cfr, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "AMRCANUSA" 4 "AMRwoCANUSA" 5 "EMRO" 6 "EURO" 7 "SEARO" 8 "WPRO" 9 "GLOBAL") size(small) rows (3)) ///
subtitle("after 2021, with GLOBAL", size(small))

qui graph save "graph 6a COVID-19 daily cfr, regions together, Johns Hopkins.gph", replace
qui graph export "graph 6a COVID-19 daily cfr, regions together, Johns Hopkins.pdf", replace






* visualize timing of deaths and cases peaks, with GLOBAL

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lpattern(dash) lcolor(brown)) ///
(line DayDeaMeSmA00multipAFRO date, sort lcolor(brown)) ///
(line DayCasMeSmA00S00AMRO date, sort lpattern(dash) lcolor(red) lpattern(medthick)) ///
(line DayDeaMeSmA00multipAMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lpattern(dash) lcolor(red)) ///
(line DayDeaMeSmA00multipAMR1 date, sort lcolor(red) lpattern(dash)) ///
(line DayCasMeSmA00S00AMR2 date, sort lpattern(dash) lcolor(red)) ///
(line DayDeaMeSmA00multipAMR2 date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayCasMeSmA00S00EMRO date, sort lpattern(dash) lcolor(gold)) ///
(line DayDeaMeSmA00multipEMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lpattern(dash) lcolor(green)) ///
(line DayDeaMeSmA00multipEURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lpattern(dash) lcolor(cyan)) ///
(line DayDeaMeSmA00multipSEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lpattern(dash) lcolor(blue)) ///
(line DayDeaMeSmA00multipWPRO date, sort lcolor(blue)) ///
(line DayCasMeSmA00S00GLOBAL date, sort lpattern(dash) lcolor(black) lwidth(thick)) ///
(line DayDeaMeSmA00multipGLOBAL date, sort lcolor(black) lwidth(thick)) ///
if date > td(01jan2020)  ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, raw, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
legend(order(2 "AFRO" 4 "AMRO" 6 "AMR1" 8 "AMR2" 10 "EMRO" 12 "EURO" 14 "SEARO" 16 "WPRO" 18 "GLOBAL") rows(3)) ///
note("Daily deaths scaled (times means of cases by deaths) only for visualization" ///
"daily cases, solid curves; daily deaths scaled, dashed curves", size(small))

qui graph save "graph 8a COVID-19 daily deaths and cases timing, raw, WHO regions, Johns Hopkins.gph", replace
qui graph export "graph 8a COVID-19 daily deaths and cases timing, raw, WHO regions, Johns Hopkins.pdf", replace




* visualize timing of deaths and cases peaks, without GLOBAL

twoway ///
(line DayCasMeSmA00S00AFRO date, sort lpattern(dash) lcolor(brown)) ///
(line DayDeaMeSmA00multipAFRO date, sort lcolor(brown)) ///
(line DayCasMeSmA00S00AMRO date, sort lpattern(dash) lcolor(red) lpattern(medthick)) ///
(line DayDeaMeSmA00multipAMRO date, sort lcolor(red)) ///
(line DayCasMeSmA00S00AMR1 date, sort lpattern(dash) lcolor(red)) ///
(line DayDeaMeSmA00multipAMR1 date, sort lcolor(red) lpattern(dash)) ///
(line DayCasMeSmA00S00AMR2 date, sort lpattern(dash) lcolor(red)) ///
(line DayDeaMeSmA00multipAMR2 date, sort lcolor(red) lpattern(dash_3dot)) ///
(line DayCasMeSmA00S00EMRO date, sort lpattern(dash) lcolor(gold)) ///
(line DayDeaMeSmA00multipEMRO date, sort lcolor(gold)) ///
(line DayCasMeSmA00S00EURO date, sort lpattern(dash) lcolor(green)) ///
(line DayDeaMeSmA00multipEURO date, sort lcolor(green)) ///
(line DayCasMeSmA00S00SEARO date, sort lpattern(dash) lcolor(cyan)) ///
(line DayDeaMeSmA00multipSEARO date, sort lcolor(cyan)) ///
(line DayCasMeSmA00S00WPRO date, sort lpattern(dash) lcolor(blue)) ///
(line DayDeaMeSmA00multipWPRO date, sort lcolor(blue)) ///
if date > td(01jan2020)  ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily cases and scaled deaths) title("COVID-19 daily cases and deaths, raw, WHO regions, Johns Hopkins", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none)))  ///
legend(order(2 "AFRO" 4 "AMRO" 6 "AMR1" 8 "AMR2" 10 "EMRO" 12 "EURO" 14 "SEARO" 16 "WPRO") rows(3)) ///
note("Daily deaths scaled (times means of cases by deaths) only for visualization" ///
"daily cases, solid curves; daily deaths scaled, dashed curves", size(small))

qui graph save "graph 8b COVID-19 daily deaths and cases timing, raw, WHO regions wo GLOBAL, Johns Hopkins.gph", replace
qui graph export "graph 8b COVID-19 daily deaths and cases timing, raw, WHO regions wo GLOBAL, Johns Hopkins.pdf", replace





*





view "log CovidVisualizedGlobal JOHN.smcl"

log close

exit, clear





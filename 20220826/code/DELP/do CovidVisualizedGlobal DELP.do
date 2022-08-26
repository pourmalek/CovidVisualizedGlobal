
clear all

cd "$pathCovidVisualizedGlobal"

cd DELP

capture log close 

log using "log CovidVisualizedGlobal DELP.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal DELP.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************



																										 

di in red "DELPdate = " "$DELPdate"

capture shell rm -r "Global_V4_since100_$DELPdate.csv"

clear

copy https://raw.githubusercontent.com/COVIDAnalytics/website/master/data/predicted/Global_V4_since100_$DELPdate.csv Global_V4_since100_$DELPdate.csv

import delimited using "Global_V4_since100_$DELPdate.csv", clear varnames(1)

rename country loc_grand_name

save "DELP.dta", replace






*****************************

* gen global sum

use "DELP.dta", clear

keep if continent == "None"

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = " GLOBAL"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original


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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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






******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*





order date loc_grand_name	
sort date

qui compress
save "DELP GLOBAL.dta", replace














*****************************

* gen AFRO

use "DELP.dta", clear

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

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)


gen loc_grand_name = "AFRO"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

* gen daily vars and rename
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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP AFRO.dta", replace




















*****************************

* gen AMRO

use "DELP.dta", clear

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
loc_grand_name == "Paraguay" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "US" | ///
loc_grand_name == "Venezuela" 

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "AMRO"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP AMRO.dta", replace




*****************************

* gen AMR1

use "DELP.dta", clear

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "US" 

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "AMR1"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP AMR1.dta", replace





*****************************

* gen AMR2

use "DELP.dta", clear

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
loc_grand_name == "Paraguay" | ///
loc_grand_name == "Peru" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Venezuela" 

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "AMR2"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP AMR2.dta", replace












*****************************

* gen EMRO

use "DELP.dta", clear

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
loc_grand_name == "Tunisia" | ///
loc_grand_name == "United Arab Emirates" | ///
loc_grand_name == "Yemen" 

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "EMRO"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP EMRO.dta", replace















*****************************

* gen EURO

use "DELP.dta", clear

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
loc_grand_name == "Kosovo" | ///
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

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "EURO"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP EURO.dta", replace













*****************************

* gen SEARO

use "DELP.dta", clear

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "Bhutan" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Nepal" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand"  

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "SEARO"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00 


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
	tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP SEARO.dta", replace














*****************************

* gen WPRO

use "DELP.dta", clear

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "Cambodia" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Korea, South" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "Mongolia" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Papua New Guinea" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Vietnam" 

drop continent province loc_grand_name

collapse (sum) totaldetected-totaldetecteddeathsub, by(day)

gen loc_grand_name = "WPRO"


rename day date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2 date_original

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

sort date

gen DayDeaMeRaA01S00 =  TotDeaMeRaA01S00[_n] - TotDeaMeRaA01S00[_n-1]

gen DayDeaLoRaA01S00 =  TotDeaLoRaA01S00[_n] - TotDeaLoRaA01S00[_n-1]

gen DayDeaUpRaA01S00 =  TotDeaUpRaA01S00[_n] - TotDeaUpRaA01S00[_n-1]

gen DayCasMeRaA01S00 =  TotCasMeRaA01S00[_n] - TotCasMeRaA01S00[_n-1]

gen DayCasLoRaA01S00 =  TotCasLoRaA01S00[_n] - TotCasLoRaA01S00[_n-1]

gen DayCasUpRaA01S00 =  TotCasUpRaA01S00[_n] - TotCasUpRaA01S00[_n-1]


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
loc_grand_name date ///
TotDeaMeRaA01S00 TotDeaLoRaA01S00 TotDeaUpRaA01S00 ///
DayDeaMeRaA01S00 DayDeaLoRaA01S00 DayDeaUpRaA01S00 ///
TotCasMeRaA01S00 TotCasLoRaA01S00 TotCasUpRaA01S00 ///
DayCasMeRaA01S00 DayCasLoRaA01S00 DayCasUpRaA01S00 ///
DayActMeRaA01S00 DayHosMeRaA01S00 DayVenMeRaA01S00 TotHosMeRaA01S00


order ///
loc_grand_name date ///
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




******************
	
* smooth 

encode loc_grand_name, gen(loc_grand_name_encoded)

tsset loc_grand_name_encoded date, daily   

qui {
		tssmooth ma DayDeaMeRaA01S00_window = DayDeaMeRaA01S00 if DayDeaMeRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaMeSmA01S00 = DayDeaMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaMeSmA01S00 "Daily deaths smooth mean DELP"
	
	drop DayDeaMeRaA01S00_window
	
	
	tssmooth ma DayCasMeRaA01S00_window = DayCasMeRaA01S00 if DayCasMeRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasMeSmA01S00 = DayCasMeRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasMeSmA01S00 "Daily cases smooth mean DELP"
	
	drop DayCasMeRaA01S00_window
	
	
	
	tssmooth ma DayDeaLoRaA01S00_window = DayDeaLoRaA01S00 if DayDeaLoRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaLoSmA01S00 = DayDeaLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaLoSmA01S00 "Daily deaths smooth lower DELP"
	
	drop DayDeaLoRaA01S00_window
	
	
	tssmooth ma DayCasLoRaA01S00_window = DayCasLoRaA01S00 if DayCasLoRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasLoSmA01S00 = DayCasLoRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasLoSmA01S00 "Daily cases smooth lower DELP"
	
	drop DayCasLoRaA01S00_window
	
	
	
	tssmooth ma DayDeaUpRaA01S00_window = DayDeaUpRaA01S00 if DayDeaUpRaA01S00 >= 0, window(3 1 3) 
	
	tssmooth ma DayDeaUpSmA01S00 = DayDeaUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayDeaUpSmA01S00 "Daily deaths smooth upper DELP"
	
	drop DayDeaUpRaA01S00_window
	
	
	tssmooth ma DayCasUpRaA01S00_window = DayCasUpRaA01S00 if DayCasUpRaA01S00 >= 0, window(3 1 3)
	
	tssmooth ma DayCasUpSmA01S00 = DayCasUpRaA01S00_window, weights( 1 2 3 <4> 3 2 1) replace
	
	label var DayCasUpSmA01S00 "Daily cases smooth upper DELP"
	
	drop DayCasUpRaA01S00_window
}
*


order date loc_grand_name	
sort date


qui compress
save "DELP WPRO.dta", replace













******************

* append regions

use "DELP GLOBAL.dta", clear 

local list2 AFRO AMRO AMR1 AMR2 EMRO EURO SEARO WPRO

foreach region of local list2 {

	append using "DELP `region'.dta"
	
}
*






* gen vars by location 

foreach var of varlist ///
TotDeaMeRaA01S00	TotDeaLoRaA01S00	TotDeaUpRaA01S00	DayDeaMeRaA01S00	DayDeaLoRaA01S00	DayDeaUpRaA01S00 ///
TotCasMeRaA01S00	TotCasLoRaA01S00	TotCasUpRaA01S00	DayCasMeRaA01S00	DayCasLoRaA01S00	DayCasUpRaA01S00 ///
DayActMeRaA01S00	DayHosMeRaA01S00	DayVenMeRaA01S00	TotHosMeRaA01S00	DayCfrMeRaA01S00	DayCfrLoRaA01S00 ///
DayCfrUpRaA01S00	DayDeMMeRaA01S00	DayCaMMeRaA01S00	DayCbDMeRaA01S00	DayDMuMeRaA01S00 ///
DayDeaMeSmA01S00    DayCasMeSmA01S00	DayDeaLoSmA01S00    DayCasLoSmA01S00	DayDeaUpSmA01S00    DayCasUpSmA01S00 {


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

gen epoch_DELP = td($DELPepoch) // update release date
label var epoch_DELP "DELP Forecast start date"

foreach var in AFRO AMRO AMR1 AMR2 EMRO EURO GLOBAL SEARO WPRO {

	gen DayDeaFOREA01S00`var' = DayDeaMeRaA01S00`var'
	replace DayDeaFOREA01S00`var' = . if date < td($DELPepoch)
	label var DayDeaFOREA01S00`var' "Daily Forecasted Deaths Mean raw DELP `var'"
	
	gen DayCasFOREA01S00`var' = DayCasMeRaA01S00`var'
	replace DayCasFOREA01S00`var' = . if date < td($DELPepoch)
	label var DayCasFOREA01S00`var' "Daily Forecasted Cases Mean raw DELP `var'"

}
*




sort date loc_grand_name

qui compress

save "CovidVisualizedGlobal DELP.dta", replace





view "log CovidVisualizedGlobal DELP.smcl"

log close

exit, clear






clear all

cd "$pathCovidVisualizedGlobal"

cd IMPE

capture log close 

log using "log CovidVisualizedGlobal IMPE 1.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IMPE 1.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


di in red "IMPEdate = " "$IMPEdate"

* download and prepare estiamtes files

											
clear all


*****************************

* get IMPE estimates


di "$IMPEdate"

copy https://raw.githubusercontent.com/mrc-ide/global-lmic-reports/master/data/$IMPEdate.csv.zip $IMPEdate.csv.zip
unzipfile $IMPEdate.csv.zip, replace
erase $IMPEdate.csv.zip

 
******************************

* import csv file

import delimited "$IMPEdate.csv", clear varnames(1) // * Wait Note: large file size, takes a while ...

save "IMPE.dta", replace




* get renvars

net from  http://www.stata-journal.com/software/sj5-4

net describe dm88_1

net install dm88_1


*******************

* gen global sum

use "IMPE.dta", clear

collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = " GLOBAL"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE GLOBAL.dta", replace








*****************************

* gen AFRO

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Algeria" | ///
loc_grand_name == "Benin" | ///
loc_grand_name == "Botswana" | ///
loc_grand_name == "Burkina Faso" | ///
loc_grand_name == "Burundi" | ///
loc_grand_name == "Cabo Verde" | ///
loc_grand_name == "Cameroon" | ///
loc_grand_name == "Central African Republic" | ///
loc_grand_name == "Chad" | ///
loc_grand_name == "Comoros" | ///
loc_grand_name == "Cote d'Ivoire" | ///
loc_grand_name == "Democratic Republic of Congo" | ///
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
loc_grand_name == "Republic of the Congo" | ///
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


collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "AFRO"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE AFRO.dta", replace













*****************************

* gen AMRO

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Aruba" | ///
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
loc_grand_name == "Curacao" | ///
loc_grand_name == "Dominican Republic" | ///
loc_grand_name == "Ecuador" | ///
loc_grand_name == "El Salvador" | ///
loc_grand_name == "French Guiana" | ///
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
loc_grand_name == "St. Lucia" | ///
loc_grand_name == "St. Vincent and the Grenadines" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "United States" | ///
loc_grand_name == "Venezuela" 




collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "AMRO"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE AMRO.dta", replace




*****************************

* gen AMR1

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Canada" | ///
loc_grand_name == "United States" 




collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "AMR1"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE AMR1.dta", replace







*****************************

* gen AMR2

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Antigua and Barbuda" | ///
loc_grand_name == "Argentina" | ///
loc_grand_name == "Aruba" | ///
loc_grand_name == "Bahamas" | ///
loc_grand_name == "Barbados" | ///
loc_grand_name == "Belize" | ///
loc_grand_name == "Bolivia" | ///
loc_grand_name == "Brazil" | ///
loc_grand_name == "Chile" | ///
loc_grand_name == "Colombia" | ///
loc_grand_name == "Costa Rica" | ///
loc_grand_name == "Cuba" | ///
loc_grand_name == "Curacao" | ///
loc_grand_name == "Dominican Republic" | ///
loc_grand_name == "Ecuador" | ///
loc_grand_name == "El Salvador" | ///
loc_grand_name == "French Guiana" | ///
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
loc_grand_name == "St. Lucia" | ///
loc_grand_name == "St. Vincent and the Grenadines" | ///
loc_grand_name == "Suriname" | ///
loc_grand_name == "Trinidad and Tobago" | ///
loc_grand_name == "Uruguay" | ///
loc_grand_name == "Venezuela" 




collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "AMR2"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE AMR2.dta", replace


















*****************************

* gen EMRO

use "IMPE.dta", clear

rename country loc_grand_name

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
loc_grand_name == "State of Palestine" | ///
loc_grand_name == "Sudan" | ///
loc_grand_name == "Syria" | ///
loc_grand_name == "Tunisia" | ///
loc_grand_name == "United Arab Emirates" | ///
loc_grand_name == "Yemen" 





collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "EMRO"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE EMRO.dta", replace














*****************************

* gen EURO

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Albania" | ///
loc_grand_name == "Angola" | ///
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
loc_grand_name == "Kyrgyz Republic" | ///
loc_grand_name == "Latvia" | ///
loc_grand_name == "Lithuania" | ///
loc_grand_name == "Luxembourg" | ///
loc_grand_name == "Malta" | ///
loc_grand_name == "Moldova" | ///
loc_grand_name == "Montenegro" | ///
loc_grand_name == "Netherlands" | ///
loc_grand_name == "North Macedonia" | ///
loc_grand_name == "Norway" | ///
loc_grand_name == "Poland" | ///
loc_grand_name == "Portugal" | ///
loc_grand_name == "Romania" | ///
loc_grand_name == "Russia" | ///
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
loc_grand_name == "United Kingdom" | ///
loc_grand_name == "Uzbekistan" 





collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "EURO"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE EURO.dta", replace


















*****************************

* gen SEARO

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Bangladesh" | ///
loc_grand_name == "Bhutan" | ///
loc_grand_name == "India" | ///
loc_grand_name == "Indonesia" | ///
loc_grand_name == "Maldives" | ///
loc_grand_name == "Myanmar" | ///
loc_grand_name == "Nepal" | ///
loc_grand_name == "North Korea" | ///
loc_grand_name == "Sri Lanka" | ///
loc_grand_name == "Thailand" | ///
loc_grand_name == "Timor-Leste" 





collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "SEARO"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE SEARO.dta", replace














*****************************

* gen WPRO

use "IMPE.dta", clear

rename country loc_grand_name

keep if ///
loc_grand_name == "Australia" | ///
loc_grand_name == "Brunei Darussalam" | ///
loc_grand_name == "Cambodia" | ///
loc_grand_name == "China" | ///
loc_grand_name == "Fiji" | ///
loc_grand_name == "French Polynesia" | ///
loc_grand_name == "Guam" | ///
loc_grand_name == "Hong Kong" | ///
loc_grand_name == "Japan" | ///
loc_grand_name == "Kiribati" | ///
loc_grand_name == "Lao PDR" | ///
loc_grand_name == "Macao" | ///
loc_grand_name == "Malaysia" | ///
loc_grand_name == "Micronesia" | ///
loc_grand_name == "Mongolia" | ///
loc_grand_name == "New Caledonia" | ///
loc_grand_name == "New Zealand" | ///
loc_grand_name == "Papua New Guinea" | ///
loc_grand_name == "Philippines" | ///
loc_grand_name == "Samoa" | ///
loc_grand_name == "Singapore" | ///
loc_grand_name == "Solomon Islands" | ///
loc_grand_name == "South Korea" | ///
loc_grand_name == "Taiwan" | ///
loc_grand_name == "Tonga" | ///
loc_grand_name == "Vanuatu" | ///
loc_grand_name == "Vietnam" 





collapse (sum) y_025 y_25 y_median y_mean y_75 y_975, by(date compartment scenario) 



* gen date 

rename date date_original

gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2)
egen dateblock = concat(year month day)
drop year month day


* rename uncertainty limits

rename y_025	y_025_
rename y_25 	y_250_
rename y_median y_med_
rename y_mean 	y_mea_
rename y_75 	y_750_
rename y_975	y_975_


foreach var of varlist y_025-y_975 {
	ds `var'
	label variable `var' `r(varlist)'
}
*



* rename scenarios 

tab scenario 


/*
Scenarios:

S1  "Additional 50% Reduction"			"S1_Add_Half_Reduction"
S2  "Maintain Status Quo"				"S2_Maintain_Staus_Quo"
S3  "Relax Interventions 50%" 			"S3_Relax_Half_Intervention"

S4  "Surged Additional 50% Reduction"	"S4_Surged_Add_Half_Reduction"
S5  "Surged Maintain Status Quo"		"S5_Surged_Maintain_Staus_Quo"
S6  "Surged Relax Interventions 50%"	"S6_Surged_Relax_Half_Intervention"

With IMPE update 20211103 (2021-12-26_v9.csv.zip) released on 20211110., IMPE has new terms for their scenarios:

S1	Optimistic
S2	Maintain Status Quo
S3	Pessimistic

S4	Surged Optimistic
S5	Surged Maintain Status Quo
S6	Surged Pessimistic
*/


gen scenario_snail = ""
replace scenario_snail = "S1" if scenario == "Optimistic"
replace scenario_snail = "S2" if scenario == "Maintain Status Quo"
replace scenario_snail = "S3" if scenario == "Pessimistic"
replace scenario_snail = "S4" if scenario == "Surged Optimistic"
replace scenario_snail = "S5" if scenario == "Surged Maintain Status Quo"
replace scenario_snail = "S6" if scenario == "Surged Pessimistic"


gen underline = "_"
egen scenario_snail_dateblock = concat(scenario_snail underline dateblock)

drop date_original scenario

drop scenario_snail_dateblock 
  
drop y_250_ y_med_ y_750_
 

* Primary outcomes Total Deaths, Total infections, Daily Deaths, and Daily infections

replace compartment = "cumul_death" if compartment == "cumulative_deaths"
replace compartment = "cumul_infec" if compartment == "cumulative_infections"
replace compartment = "daily_death" if compartment == "deaths"
replace compartment = "daily_infec" if compartment == "infections"


* other outcomes

replace compartment = "icu___deman" if compartment == "ICU_demand" 			// Icd
replace compartment = "icu___incid" if compartment == "ICU_incidence"		// Ici
replace compartment = "reff_______" if compartment == "Reff"				// Ref
replace compartment = "rt_________" if compartment == "Rt"					// Rtt
replace compartment = "hospi_deman" if compartment == "hospital_demand"		// Hod
replace compartment = "hospi_incid" if compartment == "hospital_incidence"  // Hoi
replace compartment = "preval_____" if compartment == "prevalence"			// Pre



duplicates drop date compartment scenario, force

* reshape

egen compartment_scenario_snail = concat(compartment underline scenario_snail)	

drop compartment underline scenario_snail

tab compartment_scenario_snail

gen country = "WPRO"

reshape wide y_025_   y_mea_  y_975_, i(country dateblock) j(compartment_scenario_snail) string


*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 

	local first = substr("`v'", 7, 11) 
	local second = substr("`v'", 6, 1)
	local third  = substr("`v'", 1, 5)
	local fourth = substr("`v'", 19, 2)
	label var `v' "`first'`second'`third'`second'`fourth'"
} 
*



foreach v of varlist y_025_cumul_death_S1-y_975_rt__________S6 { 
	di `"`: var label `v''"' 
	local fifth `"`: var label `v''"'
	rename `v'   `fifth'
}
*


* gen date

gen year = substr(dateblock,1,4) 
gen month = substr(dateblock,5,2) 
gen day = substr(dateblock,7,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date



* 


* -renvars- somanyvars rather time consuming

foreach v of varlist cumul_death_y_025_S1-rt__________y_975_S6 { 

    qui renvars, presub(cumul_death_y_025_ TotDeaLoRa)
    qui renvars, presub(cumul_death_y_975_ TotDeaUpRa)
    qui renvars, presub(cumul_death_y_mea_ TotDeaMeRa)

	qui renvars, presub(daily_death_y_025_ DayDeaLoRa)
	qui renvars, presub(daily_death_y_975_ DayDeaUpRa)
	qui renvars, presub(daily_death_y_mea_ DayDeaMeRa)
	
    qui renvars, presub(cumul_infec_y_025_ TotINFLoRa)
    qui renvars, presub(cumul_infec_y_975_ TotINFUpRa)
    qui renvars, presub(cumul_infec_y_mea_ TotINFMeRa)
	
	qui renvars, presub(daily_infec_y_025_ DayINFLoRa)
	qui renvars, presub(daily_infec_y_975_ DayINFUpRa)
	qui renvars, presub(daily_infec_y_mea_ DayINFMeRa)
	
	* other outcomes
	
	qui renvars, presub(icu___deman_y_025_ DayIcdLoRa) // "ICU_demand" 
	qui renvars, presub(icu___deman_y_975_ DayIcdUpRa)
	qui renvars, presub(icu___deman_y_mea_ DayIcdMeRa)
	
	qui renvars, presub(icu___incid_y_025_ DayIciLoRa) // "ICU_incidence"
	qui renvars, presub(icu___incid_y_975_ DayIciUpRa)
	qui renvars, presub(icu___incid_y_mea_ DayIciMeRa)
	
	qui renvars, presub(reff________y_025_ DayRefLoRa) // "Reff"
	qui renvars, presub(reff________y_975_ DayRefUpRa)
	qui renvars, presub(reff________y_mea_ DayRefMeRa)
	
	qui renvars, presub(rt__________y_025_ DayRttLoRa) // "Rt"
	qui renvars, presub(rt__________y_975_ DayRttUpRa)
	qui renvars, presub(rt__________y_mea_ DayRttMeRa)
	
	qui renvars, presub(hospi_deman_y_025_ DayHodLoRa) // "hospital_demand"
	qui renvars, presub(hospi_deman_y_975_ DayHodUpRa)
	qui renvars, presub(hospi_deman_y_mea_ DayHodMeRa)
	
	qui renvars, presub(hospi_incid_y_025_ DayHoiLoRa) // "hospital_incidence"
	qui renvars, presub(hospi_incid_y_975_ DayHoiUpRa)
	qui renvars, presub(hospi_incid_y_mea_ DayHoiMeRa)
	
	qui renvars, presub(preval______y_025_ DayPreLoRa) // "prevalence"
	qui renvars, presub(preval______y_975_ DayPreUpRa)
	qui renvars, presub(preval______y_mea_ DayPreMeRa)
	
	qui renvars, postsub(S1 A03S01) 
	qui renvars, postsub(S2 A03S02) 
	qui renvars, postsub(S3 A03S03) 
	qui renvars, postsub(S4 A03S04) 
	qui renvars, postsub(S5 A03S05) 
	qui renvars, postsub(S6 A03S06) 
	
	* "Wait Note: renvars are working ..."
	
} 
*   



*

drop year month day date2 dateblock

order date  

label var DayINFLoRaA03S01 "Daily infections Lower A03 S01 "
label var DayINFLoRaA03S02 "Daily infections Lower A03 S02 "
label var DayINFLoRaA03S03 "Daily infections Lower A03 S03 "
label var DayINFLoRaA03S04 "Daily infections Lower A03 S04 "
label var DayINFLoRaA03S05 "Daily infections Lower A03 S05 "
label var DayINFLoRaA03S06 "Daily infections Lower A03 S06 "
label var DayINFMeRaA03S01 "Daily infections Mean A03 S01 "
label var DayINFMeRaA03S02 "Daily infections Mean A03 S02 "
label var DayINFMeRaA03S03 "Daily infections Mean A03 S03 "
label var DayINFMeRaA03S04 "Daily infections Mean A03 S04 "
label var DayINFMeRaA03S05 "Daily infections Mean A03 S05 "
label var DayINFMeRaA03S06 "Daily infections Mean A03 S06 "
label var DayINFUpRaA03S01 "Daily infections Upper A03 S01 "
label var DayINFUpRaA03S02 "Daily infections Upper A03 S02 "
label var DayINFUpRaA03S03 "Daily infections Upper A03 S03 "
label var DayINFUpRaA03S04 "Daily infections Upper A03 S04 "
label var DayINFUpRaA03S05 "Daily infections Upper A03 S05 "
label var DayINFUpRaA03S06 "Daily infections Upper A03 S06 "
label var DayDeaLoRaA03S01 "Daily Deaths Lower A03 S01 "
label var DayDeaLoRaA03S02 "Daily Deaths Lower A03 S02 "
label var DayDeaLoRaA03S03 "Daily Deaths Lower A03 S03 "
label var DayDeaLoRaA03S04 "Daily Deaths Lower A03 S04 "
label var DayDeaLoRaA03S05 "Daily Deaths Lower A03 S05 "
label var DayDeaLoRaA03S06 "Daily Deaths Lower A03 S06 "
label var DayDeaMeRaA03S01 "Daily Deaths Mean A03 S01 "
label var DayDeaMeRaA03S02 "Daily Deaths Mean A03 S02 "
label var DayDeaMeRaA03S03 "Daily Deaths Mean A03 S03 "
label var DayDeaMeRaA03S04 "Daily Deaths Mean A03 S04 "
label var DayDeaMeRaA03S05 "Daily Deaths Mean A03 S05 "
label var DayDeaMeRaA03S06 "Daily Deaths Mean A03 S06 "
label var DayDeaUpRaA03S01 "Daily Deaths Upper A03 S01 "
label var DayDeaUpRaA03S02 "Daily Deaths Upper A03 S02 "
label var DayDeaUpRaA03S03 "Daily Deaths Upper A03 S03 "
label var DayDeaUpRaA03S04 "Daily Deaths Upper A03 S04 "
label var DayDeaUpRaA03S05 "Daily Deaths Upper A03 S05 "
label var DayDeaUpRaA03S06 "Daily Deaths Upper A03 S06 "
label var TotINFLoRaA03S01 "Total infections Lower A03 S01 "
label var TotINFLoRaA03S02 "Total infections Lower A03 S02 "
label var TotINFLoRaA03S03 "Total infections Lower A03 S03 "
label var TotINFLoRaA03S04 "Total infections Lower A03 S04 "
label var TotINFLoRaA03S05 "Total infections Lower A03 S05 "
label var TotINFLoRaA03S06 "Total infections Lower A03 S06 "
label var TotINFMeRaA03S01 "Total infections Mean A03 S01 "
label var TotINFMeRaA03S02 "Total infections Mean A03 S02 "
label var TotINFMeRaA03S03 "Total infections Mean A03 S03 "
label var TotINFMeRaA03S04 "Total infections Mean A03 S04 "
label var TotINFMeRaA03S05 "Total infections Mean A03 S05 "
label var TotINFMeRaA03S06 "Total infections Mean A03 S06 "
label var TotINFUpRaA03S01 "Total infections Upper A03 S01 "
label var TotINFUpRaA03S02 "Total infections Upper A03 S02 "
label var TotINFUpRaA03S03 "Total infections Upper A03 S03 "
label var TotINFUpRaA03S04 "Total infections Upper A03 S04 "
label var TotINFUpRaA03S05 "Total infections Upper A03 S05 "
label var TotINFUpRaA03S06 "Total infections Upper A03 S06 "
label var TotDeaLoRaA03S01 "Total Deaths Lower A03 S01 "
label var TotDeaLoRaA03S02 "Total Deaths Lower A03 S02 "
label var TotDeaLoRaA03S03 "Total Deaths Lower A03 S03 "
label var TotDeaLoRaA03S04 "Total Deaths Lower A03 S04 "
label var TotDeaLoRaA03S05 "Total Deaths Lower A03 S05 "
label var TotDeaLoRaA03S06 "Total Deaths Lower A03 S06 "
label var TotDeaMeRaA03S01 "Total Deaths Mean A03 S01 "
label var TotDeaMeRaA03S02 "Total Deaths Mean A03 S02 "
label var TotDeaMeRaA03S03 "Total Deaths Mean A03 S03 "
label var TotDeaMeRaA03S04 "Total Deaths Mean A03 S04 "
label var TotDeaMeRaA03S05 "Total Deaths Mean A03 S05 "
label var TotDeaMeRaA03S06 "Total Deaths Mean A03 S06 "
label var TotDeaUpRaA03S01 "Total Deaths Upper A03 S01 "
label var TotDeaUpRaA03S02 "Total Deaths Upper A03 S02 "
label var TotDeaUpRaA03S03 "Total Deaths Upper A03 S03 "
label var TotDeaUpRaA03S04 "Total Deaths Upper A03 S04 "
label var TotDeaUpRaA03S05 "Total Deaths Upper A03 S05 "
label var TotDeaUpRaA03S06 "Total Deaths Upper A03 S06 "


* other outcomes

label var DayHodMeRaA03S01 "Daily hospital demand Mean A03 S01 "
label var DayHodLoRaA03S01 "Daily hospital demand Lower A03 S01 "
label var DayHodUpRaA03S01 "Daily hospital demand Upper A03 S01 "
label var DayHodMeRaA03S02 "Daily hospital demand Mean A03 S02 "
label var DayHodLoRaA03S02 "Daily hospital demand Lower A03 S02 "
label var DayHodUpRaA03S02 "Daily hospital demand Upper A03 S02 "
label var DayHodMeRaA03S03 "Daily hospital demand Mean A03 S03 "
label var DayHodLoRaA03S03 "Daily hospital demand Lower A03 S03 "
label var DayHodUpRaA03S03 "Daily hospital demand Upper A03 S03 "
label var DayHodMeRaA03S04 "Daily hospital demand Mean A03 S04 "
label var DayHodLoRaA03S04 "Daily hospital demand Lower A03 S04 "
label var DayHodUpRaA03S04 "Daily hospital demand Upper A03 S04 " 
label var DayHodMeRaA03S05 "Daily hospital demand Mean A03 S05 "
label var DayHodLoRaA03S05 "Daily hospital demand Lower A03 S05 "
label var DayHodUpRaA03S05 "Daily hospital demand Upper A03 S05 "
label var DayHodMeRaA03S06 "Daily hospital demand Mean A03 S06 "
label var DayHodLoRaA03S06 "Daily hospital demand Lower A03 S06 "
label var DayHodUpRaA03S06 "Daily hospital demand Upper A03 S06 "

label var DayHoiMeRaA03S01 "Daily hospital incidence Mean A03 S01 "
label var DayHoiLoRaA03S01 "Daily hospital incidence Lower A03 S01 "
label var DayHoiUpRaA03S01 "Daily hospital incidence Upper A03 S01 "
label var DayHoiMeRaA03S02 "Daily hospital incidence Mean A03 S02 "
label var DayHoiLoRaA03S02 "Daily hospital incidence Lower A03 S02 "
label var DayHoiUpRaA03S02 "Daily hospital incidence Upper A03 S02 "
label var DayHoiMeRaA03S03 "Daily hospital incidence Mean A03 S03 "
label var DayHoiLoRaA03S03 "Daily hospital incidence Lower A03 S03 "
label var DayHoiUpRaA03S03 "Daily hospital incidence Upper A03 S03 "
label var DayHoiMeRaA03S04 "Daily hospital incidence Mean A03 S04 "
label var DayHoiLoRaA03S04 "Daily hospital incidence Lower A03 S04 "
label var DayHoiUpRaA03S04 "Daily hospital incidence Upper A03 S04 "
label var DayHoiMeRaA03S05 "Daily hospital incidence Mean A03 S05 "
label var DayHoiLoRaA03S05 "Daily hospital incidence Lower A03 S05 "
label var DayHoiUpRaA03S05 "Daily hospital incidence Upper A03 S05 "
label var DayHoiMeRaA03S06 "Daily hospital incidence Mean A03 S06 "
label var DayHoiLoRaA03S06 "Daily hospital incidence Lower A03 S06 "
label var DayHoiUpRaA03S06 "Daily hospital incidence Upper A03 S06 "

label var DayIcdMeRaA03S01 "Daily ICU demand Mean A03 S01 "
label var DayIcdLoRaA03S01 "Daily ICU demand Lower A03 S01 "
label var DayIcdUpRaA03S01 "Daily ICU demand Upper A03 S01 "
label var DayIcdMeRaA03S02 "Daily ICU demand Mean A03 S02 "
label var DayIcdLoRaA03S02 "Daily ICU demand Lower A03 S02 "
label var DayIcdUpRaA03S02 "Daily ICU demand Upper A03 S02 "
label var DayIcdMeRaA03S03 "Daily ICU demand Mean A03 S03 "
label var DayIcdLoRaA03S03 "Daily ICU demand Lower A03 S03 "
label var DayIcdUpRaA03S03 "Daily ICU demand Upper A03 S03 "
label var DayIcdMeRaA03S04 "Daily ICU demand Mean A03 S04 "
label var DayIcdLoRaA03S04 "Daily ICU demand Lower A03 S04 "
label var DayIcdUpRaA03S04 "Daily ICU demand Upper A03 S04 "
label var DayIcdMeRaA03S05 "Daily ICU demand Mean A03 S05 "
label var DayIcdLoRaA03S05 "Daily ICU demand Lower A03 S05 "
label var DayIcdUpRaA03S05 "Daily ICU demand Upper A03 S05 "
label var DayIcdMeRaA03S06 "Daily ICU demand Mean A03 S06 "
label var DayIcdLoRaA03S06 "Daily ICU demand Lower A03 S06 "
label var DayIcdUpRaA03S06 "Daily ICU demand Upper A03 S06 "

label var DayIciMeRaA03S01 "Daily ICU incidence Mean A03 S01 "
label var DayIciLoRaA03S01 "Daily ICU incidence Lower A03 S01 "
label var DayIciUpRaA03S01 "Daily ICU incidence Upper A03 S01 "
label var DayIciMeRaA03S02 "Daily ICU incidence Mean A03 S02 "
label var DayIciLoRaA03S02 "Daily ICU incidence Lower A03 S02 "
label var DayIciUpRaA03S02 "Daily ICU incidence Upper A03 S02 "
label var DayIciMeRaA03S03 "Daily ICU incidence Mean A03 S03 "
label var DayIciLoRaA03S03 "Daily ICU incidence Lower A03 S03 "
label var DayIciUpRaA03S03 "Daily ICU incidence Upper A03 S03 "
label var DayIciMeRaA03S04 "Daily ICU incidence Mean A03 S04 "
label var DayIciLoRaA03S04 "Daily ICU incidence Lower A03 S04 "
label var DayIciUpRaA03S04 "Daily ICU incidence Upper A03 S04 "
label var DayIciMeRaA03S05 "Daily ICU incidence Mean A03 S05 "
label var DayIciLoRaA03S05 "Daily ICU incidence Lower A03 S05 "
label var DayIciUpRaA03S05 "Daily ICU incidence Upper A03 S05 "
label var DayIciMeRaA03S06 "Daily ICU incidence Mean A03 S06 "
label var DayIciLoRaA03S06 "Daily ICU incidence Lower A03 S06 "
label var DayIciUpRaA03S06 "Daily ICU incidence Upper A03 S06 "

label var DayPreMeRaA03S01 "Daily prevalence Mean A03 S01 "
label var DayPreLoRaA03S01 "Daily prevalence Lower A03 S01 "
label var DayPreUpRaA03S01 "Daily prevalence Upper A03 S01 "
label var DayPreMeRaA03S02 "Daily prevalence Mean A03 S02 "
label var DayPreLoRaA03S02 "Daily prevalence Lower A03 S02 "
label var DayPreUpRaA03S02 "Daily prevalence Upper A03 S02 "
label var DayPreMeRaA03S03 "Daily prevalence Mean A03 S03 "
label var DayPreLoRaA03S03 "Daily prevalence Lower A03 S03 "
label var DayPreUpRaA03S03 "Daily prevalence Upper A03 S03 "
label var DayPreMeRaA03S04 "Daily prevalence Mean A03 S04 "
label var DayPreLoRaA03S04 "Daily prevalence Lower A03 S04 "
label var DayPreUpRaA03S04 "Daily prevalence Upper A03 S04 "
label var DayPreMeRaA03S05 "Daily prevalence Mean A03 S05 "
label var DayPreLoRaA03S05 "Daily prevalence Lower A03 S05 "
label var DayPreUpRaA03S05 "Daily prevalence Upper A03 S05 "
label var DayPreMeRaA03S06 "Daily prevalence Mean A03 S06 "
label var DayPreLoRaA03S06 "Daily prevalence Lower A03 S06 "
label var DayPreUpRaA03S06 "Daily prevalence Upper A03 S06 "

label var DayRefMeRaA03S01 "Daily R effective Mean A03 S01 "
label var DayRefLoRaA03S01 "Daily R effective Lower A03 S01 "
label var DayRefUpRaA03S01 "Daily R effective Upper A03 S01 "
label var DayRefMeRaA03S02 "Daily R effective Mean A03 S02 "
label var DayRefLoRaA03S02 "Daily R effective Lower A03 S02 "
label var DayRefUpRaA03S02 "Daily R effective Upper A03 S02 "
label var DayRefMeRaA03S03 "Daily R effective Mean A03 S03 "
label var DayRefLoRaA03S03 "Daily R effective Lower A03 S03 "
label var DayRefUpRaA03S03 "Daily R effective Upper A03 S03 "
label var DayRefMeRaA03S04 "Daily R effective Mean A03 S04 "
label var DayRefLoRaA03S04 "Daily R effective Lower A03 S04 "
label var DayRefUpRaA03S04 "Daily R effective Upper A03 S04 "
label var DayRefMeRaA03S05 "Daily R effective Mean A03 S05 "
label var DayRefLoRaA03S05 "Daily R effective Lower A03 S05 "
label var DayRefUpRaA03S05 "Daily R effective Upper A03 S05 "
label var DayRefMeRaA03S06 "Daily R effective Mean A03 S06 "
label var DayRefLoRaA03S06 "Daily R effective Lower A03 S06 "
label var DayRefUpRaA03S06 "Daily R effective Upper A03 S06 "

label var DayRttMeRaA03S01 "Daily R t Mean A03 S01 "
label var DayRttLoRaA03S01 "Daily R t Lower A03 S01 "
label var DayRttUpRaA03S01 "Daily R t Upper A03 S01 "
label var DayRttMeRaA03S02 "Daily R t Mean A03 S02 "
label var DayRttLoRaA03S02 "Daily R t Lower A03 S02 "
label var DayRttUpRaA03S02 "Daily R t Upper A03 S02 "
label var DayRttMeRaA03S03 "Daily R t Mean A03 S03 "
label var DayRttLoRaA03S03 "Daily R t Lower A03 S03 "
label var DayRttUpRaA03S03 "Daily R t Upper A03 S03 "
label var DayRttMeRaA03S04 "Daily R t Mean A03 S04 "
label var DayRttLoRaA03S04 "Daily R t Lower A03 S04 "
label var DayRttUpRaA03S04 "Daily R t Upper A03 S04 "
label var DayRttMeRaA03S05 "Daily R t Mean A03 S05 "
label var DayRttLoRaA03S05 "Daily R t Lower A03 S05 "
label var DayRttUpRaA03S05 "Daily R t Upper A03 S05 "
label var DayRttMeRaA03S06 "Daily R t Mean A03 S06 "
label var DayRttLoRaA03S06 "Daily R t Lower A03 S06 "
label var DayRttUpRaA03S06 "Daily R t Upper A03 S06 "


rename country loc_grand_name



order ///
loc_grand_name date	///
TotDeaMeRaA03S01	TotDeaLoRaA03S01	TotDeaUpRaA03S01	///
TotDeaMeRaA03S02	TotDeaLoRaA03S02	TotDeaUpRaA03S02	///
TotDeaMeRaA03S03	TotDeaLoRaA03S03	TotDeaUpRaA03S03	///
TotDeaMeRaA03S04	TotDeaLoRaA03S04	TotDeaUpRaA03S04	///
TotDeaMeRaA03S05	TotDeaLoRaA03S05	TotDeaUpRaA03S05	///
TotDeaMeRaA03S06	TotDeaLoRaA03S06	TotDeaUpRaA03S06	///
DayDeaMeRaA03S01	DayDeaLoRaA03S01	DayDeaUpRaA03S01	///
DayDeaMeRaA03S02	DayDeaLoRaA03S02	DayDeaUpRaA03S02	///
DayDeaMeRaA03S03	DayDeaLoRaA03S03	DayDeaUpRaA03S03	///
DayDeaMeRaA03S04	DayDeaLoRaA03S04	DayDeaUpRaA03S04	///
DayDeaMeRaA03S05	DayDeaLoRaA03S05	DayDeaUpRaA03S05	///
DayDeaMeRaA03S06	DayDeaLoRaA03S06	DayDeaUpRaA03S06	///
TotINFMeRaA03S01	TotINFLoRaA03S01	TotINFUpRaA03S01	///
TotINFMeRaA03S02	TotINFLoRaA03S02	TotINFUpRaA03S02	///
TotINFMeRaA03S03	TotINFLoRaA03S03	TotINFUpRaA03S03	///
TotINFMeRaA03S04	TotINFLoRaA03S04	TotINFUpRaA03S04	///
TotINFMeRaA03S05	TotINFLoRaA03S05	TotINFUpRaA03S05	///
TotINFMeRaA03S06	TotINFLoRaA03S06	TotINFUpRaA03S06	///
DayINFMeRaA03S01	DayINFLoRaA03S01	DayINFUpRaA03S01	///
DayINFMeRaA03S02	DayINFLoRaA03S02	DayINFUpRaA03S02	///
DayINFMeRaA03S03	DayINFLoRaA03S03	DayINFUpRaA03S03	///
DayINFMeRaA03S04	DayINFLoRaA03S04	DayINFUpRaA03S04	///
DayINFMeRaA03S05	DayINFLoRaA03S05	DayINFUpRaA03S05	///
DayINFMeRaA03S06	DayINFLoRaA03S06	DayINFUpRaA03S06


 *
 
 
* gen IFR

gen DayIFRMeRaA03S01 = 100 * DayDeaMeRaA03S01 / DayINFMeRaA03S01 
gen DayIFRLoRaA03S01 = 100 * DayDeaLoRaA03S01 / DayINFLoRaA03S01 
gen DayIFRUpRaA03S01 = 100 * DayDeaUpRaA03S01 / DayINFUpRaA03S01 
gen DayIFRMeRaA03S02 = 100 * DayDeaMeRaA03S02 / DayINFMeRaA03S02 
gen DayIFRLoRaA03S02 = 100 * DayDeaLoRaA03S02 / DayINFLoRaA03S02 
gen DayIFRUpRaA03S02 = 100 * DayDeaUpRaA03S02 / DayINFUpRaA03S02 
gen DayIFRMeRaA03S03 = 100 * DayDeaMeRaA03S03 / DayINFMeRaA03S03 
gen DayIFRLoRaA03S03 = 100 * DayDeaLoRaA03S03 / DayINFLoRaA03S03 
gen DayIFRUpRaA03S03 = 100 * DayDeaUpRaA03S03 / DayINFUpRaA03S03 
gen DayIFRMeRaA03S04 = 100 * DayDeaMeRaA03S04 / DayINFMeRaA03S04 
gen DayIFRLoRaA03S04 = 100 * DayDeaLoRaA03S04 / DayINFLoRaA03S04 
gen DayIFRUpRaA03S04 = 100 * DayDeaUpRaA03S04 / DayINFUpRaA03S04 
gen DayIFRMeRaA03S05 = 100 * DayDeaMeRaA03S05 / DayINFMeRaA03S05 
gen DayIFRLoRaA03S05 = 100 * DayDeaLoRaA03S05 / DayINFLoRaA03S05 
gen DayIFRUpRaA03S05 = 100 * DayDeaUpRaA03S05 / DayINFUpRaA03S05 
gen DayIFRMeRaA03S06 = 100 * DayDeaMeRaA03S06 / DayINFMeRaA03S06 
gen DayIFRLoRaA03S06 = 100 * DayDeaLoRaA03S06 / DayINFLoRaA03S06 
gen DayIFRUpRaA03S06 = 100 * DayDeaUpRaA03S06 / DayINFUpRaA03S06 

label var DayIFRMeRaA03S01 "Daily IFR Mean A03 S01 "
label var DayIFRLoRaA03S01 "Daily IFR Lower A03 S01 "
label var DayIFRUpRaA03S01 "Daily IFR Upper A03 S01 "
label var DayIFRMeRaA03S02 "Daily IFR Mean A03 S02 "
label var DayIFRLoRaA03S02 "Daily IFR Lower A03 S02 "
label var DayIFRUpRaA03S02 "Daily IFR Upper A03 S02 "
label var DayIFRMeRaA03S03 "Daily IFR Mean A03 S03 "
label var DayIFRLoRaA03S03 "Daily IFR Lower A03 S03 "
label var DayIFRUpRaA03S03 "Daily IFR Upper A03 S03 "
label var DayIFRMeRaA03S04 "Daily IFR Mean A03 S04 "
label var DayIFRLoRaA03S04 "Daily IFR Lower A03 S04 "
label var DayIFRUpRaA03S04 "Daily IFR Upper A03 S04 "
label var DayIFRMeRaA03S05 "Daily IFR Mean A03 S05 "
label var DayIFRLoRaA03S05 "Daily IFR Lower A03 S05 "
label var DayIFRUpRaA03S05 "Daily IFR Upper A03 S05 "
label var DayIFRMeRaA03S06 "Daily IFR Mean A03 S06 "
label var DayIFRLoRaA03S06 "Daily IFR Lower A03 S06 "
label var DayIFRUpRaA03S06 "Daily IFR Upper A03 S06 "





* gen "Daily infections mean div by daily deaths mean IMPE DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeRaA03S02 
gen DayDeMMeRaA03S02 = r(mean)
label var DayDeMMeRaA03S02 "Daily deaths mean IMPE DayDeM"

summ DayINFMeRaA03S02 
gen DayCaMMeRaA03S02 = r(mean)
label var DayCaMMeRaA03S02 "Daily infections mean IMPE DayCaM"
                           
gen DayCbDMeRaA03S02 = DayCaMMeRaA03S02 / DayDeMMeRaA03S02
label var DayCbDMeRaA03S02 "Daily infections mean div by daily deaths mean IMPE DayCbD"
summ DayCbDMeRaA03S02
                                              
gen DayDMuMeRaA03S02 = DayDeaMeRaA03S02 * DayCbDMeRaA03S02
label var DayDMuMeRaA03S02 "Daily deaths scaled (times means of infections by deaths) IMPE"
summ DayDMuMeRaA03S02





sort date loc_grand_name

order date loc_grand_name

qui compress

save "IMPE WPRO.dta", replace














view "log CovidVisualizedGlobal IMPE 1.smcl"

log close

exit, clear




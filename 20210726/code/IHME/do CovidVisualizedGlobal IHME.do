
clear all

cd "$pathCovidVisualizedGlobal"

cd IHME

capture log close 

log using "log CovidVisualizedGlobal IHME.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IHME.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************



                                                                                                         ***************************
* To change update date, find and replace all, 2021-07-23 (old), with 2021-07-23 (new) <<--       <<<--- * change update date here *
                                                                                                         ***************************
																										 
clear 
 
*****************************

* get IHME estimates

copy https://ihmecovid19storage.blob.core.windows.net/latest/ihme-covid19.zip ihme-covid19.zip // as of 2021-07-23
// copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-07-23/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip



******************************

* import csv files

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)
save Reference_hospitalization_all_locs.dta, replace
	
import delimited using best_masks_hospitalization_all_locs.csv, clear varnames(1)
save Best_masks_hospitalization_all_locs.dta, replace
	
import delimited using worse_hospitalization_all_locs.csv, clear varnames(1)
save Worse_hospitalization_all_locs.dta, replace


******************************

* read scenario files


/*
Scenarios:

S1 Reference [Current projection]
S2 Best [Universal masks]
S3 Worse [Mandates easing]
*/


**********************

* S1 Reference

use "Reference_hospitalization_all_locs.dta", clear

keep if strpos(location_name, "Global")


* rename variables

* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S01
rename totdea_lower TotDeaLoRaA02S01
rename totdea_upper TotDeaUpRaA02S01
label var TotDeaMeRaA02S01 "Total Deaths Mean not smoothed IHME S1"
label var TotDeaLoRaA02S01 "Total Deaths Lower not smoothed IHME S1"
label var TotDeaUpRaA02S01 "Total Deaths Upper not smoothed IHME S1"

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S01
rename deaths_lower DayDeaLoRaA02S01
rename deaths_upper DayDeaUpRaA02S01
label var DayDeaMeRaA02S01 "Daily Deaths Mean not smoothed IHME S1"
label var DayDeaLoRaA02S01 "Daily Deaths Lower not smoothed IHME S1"
label var DayDeaUpRaA02S01 "Daily Deaths Upper not smoothed IHME S1"
	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S01
rename inf_cuml_lower TotINFLoRaA02S01
rename inf_cuml_upper TotINFUpRaA02S01
label var TotINFMeRaA02S01 "Total infections Mean not smoothed IHME S1"
label var TotINFLoRaA02S01 "Total infections Lower not smoothed IHME S1"
label var TotINFUpRaA02S01 "Total infections Upper not smoothed IHME S1"

* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S01
rename est_infections_lower DayINFLoRaA02S01
rename est_infections_upper DayINFUpRaA02S01
label var DayINFMeRaA02S01 "Daily infections Mean not smoothed IHME S1"
label var DayINFLoRaA02S01 "Daily infections Lower not smoothed IHME S1"
label var DayINFUpRaA02S01 "Daily infections Upper not smoothed IHME S1"

* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S01
rename totdea_lower_smoothed  TotDeaLoSmA02S01
rename totdea_upper_smoothed  TotDeaUpSmA02S01
label var TotDeaMeSmA02S01 "Total Deaths Mean smoothed IHME S1"
label var TotDeaLoSmA02S01 "Total Deaths Lower smoothed IHME S1"
label var TotDeaUpSmA02S01 "Total Deaths Upper smoothed IHME S1"

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S01    	
rename deaths_lower_smoothed DayDeaLoSmA02S01    	
rename deaths_upper_smoothed DayDeaUpSmA02S01  
label var DayDeaMeSmA02S01 "Daily Deaths Mean smoothed IHME S1"
label var DayDeaLoSmA02S01 "Daily Deaths Lower smoothed IHME S1"
label var DayDeaUpSmA02S01 "Daily Deaths Upper smoothed IHME S1"




* other outcomes 

/*
allbed_mean		Mean covid beds needed by day
allbed_lower	Lower uncertainty bound of covid beds needed by day
allbed_upper	Upper uncertainty bound of covid beds needed by day
icubed_mean		Mean ICU covid beds needed by day
icubed_lower	Lower uncertainty bound of ICU covid beds needed by day
icubed_upper	Upper uncertainty bound of ICU covid beds needed by day
invven_mean		Mean invasive ventilation needed by day
invven_lower	Lower uncertainty bound of invasive ventilation needed by day
invven_upper	Upper uncertainty bound of invasive ventilation needed by day
admis_mean		Mean hospital admissions by day
admis_lower		Lower uncertainty bound of hospital admissions by day
admis_upper		Upper uncertainty bound of hospital admissions by day
newicu_mean		Mean number of new people going to the ICU by day
newicu_lower	Lower uncertainty bound of the number of new people going to the ICU by day
newicu_upper	Upper uncertainty bound of the number of new people going to the ICU by day
bedover_mean	[covid all beds needed] - ([total bed capacity] - [average all bed usage]) (* has been retired by IHME)
bedover_lower	Lower uncertainty bound of bedover (above)
bedover_upper	Upper uncertainty bound of bedover (above)
icuover_mean	[covid ICU beds needed] - ([total ICU capacity] - [average ICU bed usage]) (* has been retired by IHME)
icuover_lower	Lower uncertainty bound of icuover (above)
icuover_upper	Upper uncertainty bound of icuover (above)

total_tests		Total tests

seroprev_mean
seroprev_lower
seroprev_upper  


***********************
* rename convention

allbed		Bed 	covid beds needed by day
icubed		Icu 	ICU covid beds needed by day
invven		Ven 	invasive ventilation needed by day
admis		Adm 	hospital admissions by day
newicu		Icn		number of new people going to the ICU by day
bedover		Beo		[covid all beds needed] - ([total bed capacity] - [average all bed usage]) (* has been retired by IHME)
icuover		Ico		[covid ICU beds needed] - ([total ICU capacity] - [average ICU bed usage]) (* has been retired by IHME)

total_tests		Tes	tests

seroprev_mean	Ser seroprevalence 

*/


rename allbed_mean		DayBedMeSmA02S01
rename allbed_lower		DayBedLoSmA02S01
rename allbed_upper		DayBedUpSmA02S01

label var DayBedMeSmA02S01 "Daily Beds needed Mean IHME S1"
label var DayBedLoSmA02S01 "Daily Beds needed Lower IHME S1"
label var DayBedUpSmA02S01 "Daily Beds needed Upper IHME S1"



rename icubed_mean		DayIcuMeSmA02S01
rename icubed_lower		DayIcuLoSmA02S01
rename icubed_upper		DayIcuUpSmA02S01

label var DayIcuMeSmA02S01 "Daily ICU beds needed Mean IHME S1"
label var DayIcuLoSmA02S01 "Daily ICU beds needed Lower IHME S1"
label var DayIcuUpSmA02S01 "Daily ICU beds needed Upper IHME S1"


/*
rename invven_mean		DayVenMeSmA02S01
rename invven_lower		DayVenLoSmA02S01
rename invven_upper		DayVenUpSmA02S01

label var DayVenMeSmA02S01 "Daily invasive Ventilation needed Mean IHME S1"
label var DayVenLoSmA02S01 "Daily invasive Ventilation needed Lower IHME S1"
label var DayVenUpSmA02S01 "Daily invasive Ventilation needed Upper IHME S1"
*/


rename admis_mean		DayAdmMeSmA02S01
rename admis_lower		DayAdmLoSmA02S01
rename admis_upper		DayAdmUpSmA02S01

label var DayAdmMeSmA02S01 "Daily hospital admissions Mean IHME S1"
label var DayAdmLoSmA02S01 "Daily hospital admissions Lower IHME S1"
label var DayAdmUpSmA02S01 "Daily hospital admissions Upper IHME S1"



rename newicu_mean		DayIcnMeSmA02S01
rename newicu_lower		DayIcnLoSmA02S01
rename newicu_upper		DayIcnUpSmA02S01

label var DayIcnMeSmA02S01 "Daily new people going to ICU Mean IHME S1"
label var DayIcnLoSmA02S01 "Daily new people going to ICU Lower IHME S1"
label var DayIcnUpSmA02S01 "Daily new people going to ICU Upper IHME S1"



rename total_tests TotTesMeSmA02S01

label var TotTesMeSmA02S01 "Total Tests Mean IHME S1"


/* using IHME's seroprev_mean in covir2 codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S01
rename seroprev_upper 		TotSerLoSmA02S01
rename seroprev_lower		TotSerUpSmA02S01

label var TotSerMeSmA02S01 "Total seroprevalence Mean IHME S1"
label var TotSerLoSmA02S01 "Total seroprevalence Lower IHME S1"
label var TotSerUpSmA02S01 "Total seroprevalence Upper IHME S1"
*/

save "Reference global.dta", replace







**********************

* S2 Best

use "Best_masks_hospitalization_all_locs.dta", clear

keep if strpos(location_name, "Global")


* rename variables


* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S02
rename totdea_lower TotDeaLoRaA02S02
rename totdea_upper TotDeaUpRaA02S02
label var TotDeaMeRaA02S02 "Total Deaths Mean not smoothed IHME S2"
label var TotDeaLoRaA02S02 "Total Deaths Lower not smoothed IHME S2"
label var TotDeaUpRaA02S02 "Total Deaths Upper not smoothed IHME S2"

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S02
rename deaths_lower DayDeaLoRaA02S02
rename deaths_upper DayDeaUpRaA02S02
label var DayDeaMeRaA02S02 "Daily Deaths Mean not smoothed IHME S2"
label var DayDeaLoRaA02S02 "Daily Deaths Lower not smoothed IHME S2"
label var DayDeaUpRaA02S02 "Daily Deaths Upper not smoothed IHME S2"
	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S02
rename inf_cuml_lower TotINFLoRaA02S02
rename inf_cuml_upper TotINFUpRaA02S02
label var TotINFMeRaA02S02 "Total infections Mean not smoothed IHME S2"
label var TotINFLoRaA02S02 "Total infections Lower not smoothed IHME S2"
label var TotINFUpRaA02S02 "Total infections Upper not smoothed IHME S2"

* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S02
rename est_infections_lower DayINFLoRaA02S02
rename est_infections_upper DayINFUpRaA02S02
label var DayINFMeRaA02S02 "Daily infections Mean not smoothed IHME S2"
label var DayINFLoRaA02S02 "Daily infections Lower not smoothed IHME S2"
label var DayINFUpRaA02S02 "Daily infections Upper not smoothed IHME S2"

* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S02
rename totdea_lower_smoothed  TotDeaLoSmA02S02
rename totdea_upper_smoothed  TotDeaUpSmA02S02
label var TotDeaMeSmA02S02 "Total Deaths Mean smoothed IHME S2"
label var TotDeaLoSmA02S02 "Total Deaths Lower smoothed IHME S2"
label var TotDeaUpSmA02S02 "Total Deaths Upper smoothed IHME S2"

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S02    	
rename deaths_lower_smoothed DayDeaLoSmA02S02    	
rename deaths_upper_smoothed DayDeaUpSmA02S02  
label var DayDeaMeSmA02S02 "Daily Deaths Mean smoothed IHME S2"
label var DayDeaLoSmA02S02 "Daily Deaths Lower smoothed IHME S2"
label var DayDeaUpSmA02S02 "Daily Deaths Upper smoothed IHME S2"




* other outcomes


rename total_tests TotTesMeSmA02S02

label var TotTesMeSmA02S02 "Total Tests Mean IHME S2"


/* using IHME's seroprev_mean in covir2 codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S02
rename seroprev_upper 		TotSerLoSmA02S02
rename seroprev_lower		TotSerUpSmA02S02

label var TotSerMeSmA02S02 "Total seroprevalence Mean IHME S2"
label var TotSerLoSmA02S02 "Total seroprevalence Lower IHME S2"
label var TotSerUpSmA02S02 "Total seroprevalence Upper IHME S2"
*/

save "Best global.dta", replace








**********************

* S3 Worse

use "Worse_hospitalization_all_locs.dta", clear

keep if strpos(location_name, "Global")



* Total Deaths not smoothed
rename totdea_mean  TotDeaMeRaA02S03
rename totdea_lower TotDeaLoRaA02S03
rename totdea_upper TotDeaUpRaA02S03
label var TotDeaMeRaA02S03 "Total Deaths Mean not smoothed IHME S3"
label var TotDeaLoRaA02S03 "Total Deaths Lower not smoothed IHME S3"
label var TotDeaUpRaA02S03 "Total Deaths Upper not smoothed IHME S3"

* Daily Deaths not smoothed
rename deaths_mean  DayDeaMeRaA02S03
rename deaths_lower DayDeaLoRaA02S03
rename deaths_upper DayDeaUpRaA02S03
label var DayDeaMeRaA02S03 "Daily Deaths Mean not smoothed IHME S3"
label var DayDeaLoRaA02S03 "Daily Deaths Lower not smoothed IHME S3"
label var DayDeaUpRaA02S03 "Daily Deaths Upper not smoothed IHME S3"
	
* Total infections not smoothed
rename inf_cuml_mean  TotINFMeRaA02S03
rename inf_cuml_lower TotINFLoRaA02S03
rename inf_cuml_upper TotINFUpRaA02S03
label var TotINFMeRaA02S03 "Total infections Mean not smoothed IHME S3"
label var TotINFLoRaA02S03 "Total infections Lower not smoothed IHME S3"
label var TotINFUpRaA02S03 "Total infections Upper not smoothed IHME S3"

* Daily infections not smoothed
rename est_infections_mean  DayINFMeRaA02S03
rename est_infections_lower DayINFLoRaA02S03
rename est_infections_upper DayINFUpRaA02S03
label var DayINFMeRaA02S03 "Daily infections Mean not smoothed IHME S3"
label var DayINFLoRaA02S03 "Daily infections Lower not smoothed IHME S3"
label var DayINFUpRaA02S03 "Daily infections Upper not smoothed IHME S3"

* Total Deaths smoothed
rename totdea_mean_smoothed   TotDeaMeSmA02S03
rename totdea_lower_smoothed  TotDeaLoSmA02S03
rename totdea_upper_smoothed  TotDeaUpSmA02S03
label var TotDeaMeSmA02S03 "Total Deaths Mean smoothed IHME S3"
label var TotDeaLoSmA02S03 "Total Deaths Lower smoothed IHME S3"
label var TotDeaUpSmA02S03 "Total Deaths Upper smoothed IHME S3"

* Daily Deaths smoothed
rename deaths_mean_smoothed  DayDeaMeSmA02S03    	
rename deaths_lower_smoothed DayDeaLoSmA02S03    	
rename deaths_upper_smoothed DayDeaUpSmA02S03  
label var DayDeaMeSmA02S03 "Daily Deaths Mean smoothed IHME S3"
label var DayDeaLoSmA02S03 "Daily Deaths Lower smoothed IHME S3"
label var DayDeaUpSmA02S03 "Daily Deaths Upper smoothed IHME S3"


* other outcomes

rename total_tests TotTesMeSmA02S03

label var TotTesMeSmA02S03 "Total Tests Mean IHME S3"


/* using IHME's seroprev_mean in covir2 codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S03
rename seroprev_upper 		TotSerLoSmA02S03
rename seroprev_lower		TotSerUpSmA02S03

label var TotSerMeSmA02S03 "Total seroprevalence Mean IHME S3"
label var TotSerLoSmA02S03 "Total seroprevalence Lower IHME S3"
label var TotSerUpSmA02S03 "Total seroprevalence Upper IHME S3"
*/


save "Worse global.dta", replace


 
 
 
 
**********************

 
* merge scenario files


use "Reference global.dta", clear
merge 1:1 location_name date using "Best global.dta"
drop _merge
merge 1:1 location_name date using "Worse global.dta"
drop _merge


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



rename location_name loc_grand_name

replace loc_grand_name = "global"




drop date_original v1 hosp_data_type deaths_data_type ///
mobility_data_type mobility_composite ///
confirmed_infections_data_type confirmed_infections est_infections_data_type ///
total_pop // seroprev_data_type

order deaths_mean_p100k_rate-est_infections_upper_p100k_rate, last


sort date

compress



* gen IFR

gen DayIFRMeRaA02S01 = 100 * DayDeaMeRaA02S01 / DayINFMeRaA02S01
gen DayIFRLoRaA02S01 = 100 * DayDeaLoRaA02S01 / DayINFLoRaA02S01
gen DayIFRUpRaA02S01 = 100 * DayDeaUpRaA02S01 / DayINFUpRaA02S01
gen DayIFRMeRaA02S02 = 100 * DayDeaMeRaA02S02 / DayINFMeRaA02S02
gen DayIFRLoRaA02S02 = 100 * DayDeaLoRaA02S02 / DayINFLoRaA02S02
gen DayIFRUpRaA02S02 = 100 * DayDeaUpRaA02S02 / DayINFUpRaA02S02
gen DayIFRMeRaA02S03 = 100 * DayDeaMeRaA02S03 / DayINFMeRaA02S03
gen DayIFRLoRaA02S03 = 100 * DayDeaLoRaA02S03 / DayINFLoRaA02S03
gen DayIFRUpRaA02S03 = 100 * DayDeaUpRaA02S03 / DayINFUpRaA02S03

label var DayIFRMeRaA02S01 "Daily IFR Mean Raw IHME S1" 
label var DayIFRLoRaA02S01 "Daily IFR Lower Raw IHME S1" 
label var DayIFRUpRaA02S01 "Daily IFR Upper Raw IHME S1" 
label var DayIFRMeRaA02S02 "Daily IFR Mean Raw IHME S2" 
label var DayIFRLoRaA02S02 "Daily IFR Lower Raw IHME S2" 
label var DayIFRUpRaA02S02 "Daily IFR Upper Raw IHME S2" 
label var DayIFRMeRaA02S03 "Daily IFR Mean Raw IHME S3" 
label var DayIFRLoRaA02S03 "Daily IFR Lower Raw IHME S3" 
label var DayIFRUpRaA02S03 "Daily IFR Upper Raw IHME S3" 



label var deaths_mean_p100k_rate "Daily deaths mean raw per 100k rate IHME"

label var deaths_lower_p100k_rate "Daily deaths lower raw per 100k rate IHME"

label var deaths_upper_p100k_rate "Daily deaths upper raw per 100k rate IHME"

label var totdea_mean_p100k_rate "Total deaths mean per raw 100k rate IHME"

label var totdea_lower_p100k_rate "Total deaths mean per raw 100k rate IHME"

label var totdea_upper_p100k_rate "Total deaths upper per raw 100k rate IHME"

label var deaths_mean_smoothed_p100k_rate "Daily deaths mean smoothed per 100k rate IHME"

label var deaths_lower_smoothed_p100k_rate "Daily deaths lower smoothed per 100k rate IHME"

label var deaths_upper_smoothed_p100k_rate "Daily deaths upper smoothed per 100k rate IHME"

label var totdea_mean_smoothed_p100k_rate "Total deaths mean smoothed per 100k rate IHME"

label var totdea_lower_smoothed_p100k_rate "Total deaths lower smoothed per 100k rate IHME"

label var totdea_upper_smoothed_p100k_rate "Total deaths upper smoothed per 100k rate IHME"

label var confirmed_infections_p100k_rate  "confirmed infections per 100k rate IHME"

label var est_infections_mean_p100k_rate "estimated infections mean per 100k rate IHME"

label var est_infections_lower_p100k_rate "estimated infections lower per 100k rate IHME"

label var est_infections_upper_p100k_rate "estimated infections upper per 100k rate IHME"



* gen "Daily infections mean div by daily deaths mean IHME DayCbD" for visulization of temporal relation of deaths and infections peaks 


summ DayDeaMeSmA02S01 
gen DayDeMMeSmA02S01 = r(mean)
label var DayDeMMeSmA02S01 "Daily deaths mean IHME DayDeM"

summ DayINFMeRaA02S01 
gen DayCaMMeRaA02S01 = r(mean)
label var DayCaMMeRaA02S01 "Daily infections mean IHME DayCaM"
                           
gen DayCbDMeRaA02S01 = DayCaMMeRaA02S01 / DayDeMMeSmA02S01
label var DayCbDMeRaA02S01 "Daily infections mean div by daily deaths mean IHME DayCbD"
summ DayCbDMeRaA02S01
                                              
gen DayDMuMeRaA02S01 = DayDeaMeRaA02S01 * DayCbDMeRaA02S01
label var DayDMuMeRaA02S01 "Daily deaths scaled (times means of infections by deaths) IHME"
summ DayDMuMeRaA02S01



***********************


* graphs


grstyle init

grstyle color background white


* daily deaths


* daily deaths, medain scenario = S1 	   
	   
twoway (rarea DayDeaLoSmA02S01 DayDeaUpSmA02S01 date, sort color(black*.2)) ///
(line DayDeaMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
	   
graph save "graph 1 COVID-19 daily deaths, reference scenario, global, IHME.gph", replace
graph export "graph 1 COVID-19 daily deaths, reference scenario, global, IHME.pdf", replace




* daily deaths, 3 scenarios  
  
twoway ///
(line DayDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeaMeSmA02S02 date, sort lcolor(green)) ///
(line DayDeaMeSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))

graph save "graph 2 COVID-19 daily deaths, global 3 scenarios, IHME.gph", replace
graph export "graph 2 COVID-19 daily deaths, global 3 scenarios, IHME.pdf", replace




* daily deaths, medain scenario = S1, CI
  
twoway ///
(line DayDeaMeSmA02S01 date, sort lcolor(black)) ///
(line DayDeaLoSmA02S01 date, sort lcolor(green)) ///
(line DayDeaUpSmA02S01 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 3 COVID-19 daily deaths, global median scenario CI, IHME.gph", replace
graph export "graph 3 COVID-19 daily deaths, global median scenario CI, IHME.pdf", replace




* daily deaths, best scenario = S2, CI
  
twoway ///
(line DayDeaMeSmA02S02 date, sort lcolor(black)) ///
(line DayDeaLoSmA02S02 date, sort lcolor(green)) ///
(line DayDeaUpSmA02S02 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, best scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 4 COVID-19 daily deaths, global best scenario CI, IHME.gph", replace
graph export "graph 4 COVID-19 daily deaths, global best scenario CI, IHME.pdf", replace




* daily deaths, worse scenario = S3, CI
  
twoway ///
(line DayDeaMeSmA02S03 date, sort lcolor(black)) ///
(line DayDeaLoSmA02S03 date, sort lcolor(green)) ///
(line DayDeaUpSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 5 COVID-19 daily deaths, global worse scenario CI, IHME.gph", replace
graph export "graph 5 COVID-19 daily deaths, global worse scenario CI, IHME.pdf", replace




* daily infections


* daily infections, medain scenario = S1 	   
	   
twoway (rarea DayINFLoRaA02S01 DayINFUpRaA02S01 date, sort color(black*.2)) ///
(line DayINFMeRaA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
	   
graph save "graph 6 COVID-19 daily infections, reference scenario, global, IHME.gph", replace
graph export "graph 6 COVID-19 daily infections, reference scenario, global, IHME.pdf", replace




* daily infections, 3 scenarios  
  
twoway ///
(line DayINFMeRaA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayINFMeRaA02S02 date, sort lcolor(green)) ///
(line DayINFMeRaA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))

graph save "graph 7 COVID-19 daily infections, global 3 scenarios, IHME.gph", replace
graph export "graph 7 COVID-19 daily infections, global 3 scenarios, IHME.pdf", replace




* daily infections, medain scenario = S1, CI
  
twoway ///
(line DayINFMeRaA02S01 date, sort lcolor(black)) ///
(line DayINFLoRaA02S01 date, sort lcolor(green)) ///
(line DayINFUpRaA02S01 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 8 COVID-19 daily infections, global median scenario CI, IHME.gph", replace
graph export "graph 8 COVID-19 daily infections, global median scenario CI, IHME.pdf", replace




* daily infections, best scenario = S2, CI 
  
twoway ///
(line DayINFMeRaA02S02 date, sort lcolor(black)) ///
(line DayINFLoRaA02S02 date, sort lcolor(green)) ///
(line DayINFUpRaA02S02 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, global, IHME, best scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 9 COVID-19 daily infections, global best scenario CI, IHME.gph", replace
graph export "graph 9 COVID-19 daily infections, global best scenario CI, IHME.pdf", replace




* daily infections, worse scenario = S3, CI
  
twoway ///
(line DayINFMeRaA02S03 date, sort lcolor(black)) ///
(line DayINFLoRaA02S03 date, sort lcolor(green)) ///
(line DayINFUpRaA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, global, IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 10 COVID-19 daily infections, global worse scenario CI, IHME.gph", replace
graph export "graph 10 COVID-19 daily infections, global worse scenario CI, IHME.pdf", replace




* total deaths


* total deaths, medain scenario = S1 	   
	   
twoway (rarea TotDeaLoSmA02S01 TotDeaUpSmA02S01 date, sort color(black*.2)) ///
(line TotDeaMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
	   
graph save "graph 11 COVID-19 total deaths, reference scenario, global, IHME.gph", replace
graph export "graph 11 COVID-19 total deaths, reference scenario, global, IHME.pdf", replace




* total deaths, 3 scenarios  
  
twoway ///
(line TotDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line TotDeaMeSmA02S02 date, sort lcolor(green)) ///
(line TotDeaMeSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))

graph save "graph 12 COVID-19 total deaths, global 3 scenarios, IHME.gph", replace
graph export "graph 12 COVID-19 total deaths, global 3 scenarios, IHME.pdf", replace




* total deaths, medain scenario = S1, CI
  
twoway ///
(line TotDeaMeSmA02S01 date, sort lcolor(black)) ///
(line TotDeaLoSmA02S01 date, sort lcolor(green)) ///
(line TotDeaUpSmA02S01 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 13 COVID-19 total deaths, global median scenario CI, IHME.gph", replace
graph export "graph 13 COVID-19 total deaths, global median scenario CI, IHME.pdf", replace




* total deaths, best scenario = S2, CI
  
twoway ///
(line TotDeaMeSmA02S02 date, sort lcolor(black)) ///
(line TotDeaLoSmA02S02 date, sort lcolor(green)) ///
(line TotDeaUpSmA02S02 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, IHME, best scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 14 COVID-19 total deaths, global best scenario CI, IHME.gph", replace
graph export "graph 14 COVID-19 total deaths, global best scenario CI, IHME.pdf", replace




* total deaths, worse scenario = S3, CI
  
twoway ///
(line TotDeaMeSmA02S03 date, sort lcolor(black)) ///
(line TotDeaLoSmA02S03 date, sort lcolor(green)) ///
(line TotDeaUpSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 15 COVID-19 total deaths, global worse scenario CI, IHME.gph", replace
graph export "graph 15 COVID-19 total deaths, global worse scenario CI, IHME.pdf", replace




* total infections


* total infections, medain scenario = S1 	   
	   
twoway (rarea TotINFLoRaA02S01 TotINFUpRaA02S01 date, sort color(black*.2)) ///
(line TotINFMeRaA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("COVID-19 total infections, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
	   
graph save "graph 16 COVID-19 total infections, reference scenario, global, IHME.gph", replace
graph export "graph 16 COVID-19 total infections, reference scenario, global, IHME.pdf", replace




* total infections, medain scenario = S1, CI
  
twoway ///
(line TotINFMeRaA02S01 date, sort lcolor(black)) ///
(line TotINFLoRaA02S01 date, sort lcolor(green)) ///
(line TotINFUpRaA02S01 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("COVID-19 total infections, global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 18 COVID-19 total infections, global median scenario CI, IHME.gph", replace
graph export "graph 18 COVID-19 total infections, global median scenario CI, IHME.pdf", replace




* total infections, best scenario = S2, CI, not available
 

* total infections, worse scenario = S3, CI, not available
  
  
  
* IFR


* daily IFR, 3 scenarios  
  
twoway ///
(line DayIFRMeRaA02S01 date, sort lcolor(black)) ///
(line DayIFRMeRaA02S02 date, sort lcolor(green)) ///
(line DayIFRMeRaA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily IFR) title("COVID-19 daily IFR, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))

graph save "graph 21 COVID-19 daily IFR, global 3 scenarios, IHME.gph", replace
graph export "graph 21 COVID-19 daily IFR, global 3 scenarios, IHME.pdf", replace




* other outcomes 


* daily beds needed, only in S1

twoway (rarea DayBedLoSmA02S01 DayBedUpSmA02S01 date, sort color(black*.2)) ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily beds needed) title("COVID-19 daily beds needed, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	

graph save "graph 22 COVID-19 daily beds needed, global 3 scenarios, IHME.gph", replace
graph export "graph 22 COVID-19 daily beds needed, global 3 scenarios, IHME.pdf", replace




* ICU beds needed, only in S1

twoway (rarea DayIcuLoSmA02S01 DayIcuUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(ICU beds needed) title("COVID-19 daily ICU beds needed, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
	   

graph save "graph 23 COVID-19 daily ICU beds needed, global 3 scenarios, IHME.gph", replace
graph export "graph 23 COVID-19 daily ICU beds needed, global 3 scenarios, IHME.pdf", replace



/*
* daily invasive ventilation needed, only in S1

twoway (rarea DayVenLoSmA02S01 DayVenUpSmA02S01 date, sort color(black*.2)) ///
(line DayVenMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily invasive ventilation needed) title("COVID-19 daily invasive ventilation global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	

graph save "graph 24 COVID-19 daily invasive ventilation needed, global 3 scenarios, IHME.gph", replace
graph export "graph 24 COVID-19 daily invasive ventilation needed, global 3 scenarios, IHME.pdf", replace
*/



* daily hospital admissions, only in S1

twoway (rarea DayAdmLoSmA02S01 DayAdmUpSmA02S01 date, sort color(black*.2)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily hospital admissions) title("COVID-19 daily hospital admissions global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
	   
graph save "graph 25 COVID-19 daily hospital admissions, global 3 scenarios, IHME.gph", replace
graph export "graph 26 COVID-19 daily hospital admissions, global 3 scenarios, IHME.pdf", replace




* daily new people going to ICU

twoway (rarea DayIcnLoSmA02S01 DayIcnUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcnMeSmA02S01 date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily new people going to ICU) title("COVID-19 daily new people to ICU global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	

graph save "graph 26 COVID-19 daily new people going to ICU, global 3 scenarios, IHME.gph", replace
graph export "graph 26 COVID-19 daily new people going to ICU, global 3 scenarios, IHME.pdf", replace




* total tests

twoway ///
(line TotTesMeSmA02S01 date, sort lcolor(black)) ///
(line TotTesMeSmA02S02 date, sort lcolor(green)) ///
(line TotTesMeSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total tests) title("COVID-19 total tests, global, IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))

graph save "graph 29 COVID-19 total tests, global 3 scenarios, IHME.gph", replace
graph export "graph 29 COVID-19 total tests, global 3 scenarios, IHME.pdf", replace



/* using IHME's seroprev_mean in covir2 codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

* seroprevalence

twoway ///
(line TotSerMeSmA02S01 date, sort lcolor(black)) ///
(line TotSerMeSmA02S02 date, sort lcolor(green)) ///
(line TotSerMeSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total seroprevalence) title("COVID-19 total seroprevalence, global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))

graph save "graph 30 COVID-19 total seroprevalence, global 3 scenarios, IHME.gph", replace
graph export "graph 30 COVID-19 total seroprevalence, global 3 scenarios, IHME.pdf", replace
*/



* daily hospital-related outcomes

twoway ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Bed" 2 "ICU" 3 "Adm" 4 "ICU new") rows(2))

graph save "graph 31 COVID-19 daily hospital-related outcomes, global median scenario, IHME.gph", replace
graph export "graph 31 COVID-19 daily hospital-related outcomes, global median scenario, IHME.pdf", replace




* daily hospital-related outcomes, wo beds needed 

twoway ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes global, IHME, median scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "ICU" 2 "Adm" 3 "ICU new") rows(1)) ///
subtitle("without beds needed", size(small))

graph save "graph 32 COVID-19 daily hospital-related outcomes, global median scenario, IHME, wo beds needed.gph", replace
graph export "graph 32 COVID-19 daily hospital-related outcomes, global median scenario, IHME, wo beds needed.pdf", replace




* rates

* daily deaths raw per 100k rate

twoway ///
(line deaths_mean_p100k_rate date, sort lcolor(black)) ///
(line deaths_lower_p100k_rate date, sort lcolor(green)) ///
(line deaths_upper_p100k_rate date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths per 100k rate) title("COVID-19 daily deaths raw per 100k rate, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 40 COVID-19 daily deaths raw per 100k rate, global, IHME.gph", replace
graph export "graph 40 COVID-19 daily deaths raw per 100k rate, global, IHME.pdf", replace




* daily deaths smoothed per 100k rate

twoway ///
(line deaths_mean_smoothed_p100k_rate date, sort lcolor(black)) ///
(line deaths_lower_smoothed_p100k_rate date, sort lcolor(green)) ///
(line deaths_upper_smoothed_p100k_rate date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths per 100k rate) title("COVID-19 daily deaths smoothed per 100k rate, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 41 COVID-19 daily deaths smoothed per 100k rate, global, IHME.gph", replace
graph export "graph 41 COVID-19 daily deaths smoothed per 100k rate, global, IHME.pdf", replace




* total deaths raw per 100k rate

twoway ///
(line totdea_mean_p100k_rate date, sort lcolor(black)) ///
(line totdea_lower_p100k_rate date, sort lcolor(green)) ///
(line totdea_upper_p100k_rate date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths per 100k rate) title("COVID-19 total deaths raw per 100k rate, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 42 COVID-19 total deaths raw per 100k rate, global, IHME.gph", replace
graph export "graph 42 COVID-19 total deaths raw per 100k rate, global, IHME.pdf", replace




* total deaths smoothed per 100k rate

twoway ///
(line totdea_mean_smoothed_p100k_rate date, sort lcolor(black)) ///
(line totdea_lower_smoothed_p100k_rate date, sort lcolor(green)) ///
(line totdea_upper_smoothed_p100k_rate date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths per 100k rate) title("COVID-19 total deaths smoothed per 100k rate, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 43 COVID-19 total deaths smoothed per 100k rate, global, IHME.gph", replace
graph export "graph 43 COVID-19 total deaths smoothed per 100k rate, global, IHME.pdf", replace




* estimated infections per 100k rate

twoway ///
(line est_infections_mean_p100k_rate date, sort lcolor(black)) ///
(line est_infections_lower_p100k_rate date, sort lcolor(green)) ///
(line est_infections_upper_p100k_rate date, sort lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Estimated infections per 100k rate) title("COVID-19 estimated infections per 100k rate, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

graph save "graph 44 COVID-19 estimated infections per 100k rate, global, IHME.gph", replace
graph export "graph 44 COVID-19 estimated infections per 100k rate, global, IHME.pdf", replace




* confirmed infections per 100k rate


twoway ///
(line confirmed_infections_p100k_rate date, sort lcolor(black)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(#19, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Confirmed infections per 100k rate) title("COVID-19 confirmed infections per 100k rate, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(off)

graph save "graph 44 COVID-19 confirmed per 100k rate, global, IHME.gph", replace
graph export "graph 44 COVID-19 confirmed per 100k rate, global, IHME.pdf", replace





* DayINF DayDea Dea_multip

twoway ///
(line DayINFMeRaA02S01 date, sort lcolor(blue)) ///
(line DayDeaMeRaA02S01 date, sort lcolor(red)) ///
(line DayDMuMeRaA02S01 date, sort lpattern(dot) lcolor(red)) ///
if date >= td(01jan2020) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections and deaths) title("COVID-19 daily infections and deaths, global, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(4)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily infections" 2 "Daily deaths" 3 "Daily deaths scaled for visualization") size(small)) ///
subtitle("Daily deaths, scaled = times (means of infections divided by deaths) for visualization only", size(small)) ///
note("Current scenario, mean estimate")

graph save "graph 45 COVID-19 daily deaths and infections global, IHME.gph", replace
qui graph export "graph 45 COVID-19 daily deaths and infections global, IHME.pdf", replace




****************

sort date loc_grand_name

order date loc_grand_name

qui compress

save "CovidVisualizedGlobal IHME.dta", replace












**************************************
**************************************


* compare update 20210723 with update 20210715

use "CovidVisualizedGlobal IHME.dta", clear // 20210723

keep date loc_grand_name DayDeaMeRaA02S01 TotDeaMeRaA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01 DayINFMeRaA02S01 TotINFMeRaA02S01

* add 20210723 to the end of varnames

local varlistlist20210723 DayDeaMeRaA02S01 TotDeaMeRaA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01 DayINFMeRaA02S01 TotINFMeRaA02S01

foreach l of local varlistlist20210723 {

rename `l' `l'U20210723

}
* 

sort date loc_grand_name

save "CovidVisualizedGlobal IHME 20210723.dta", replace




twoway ///
(line DayDeaMeSmA02S01U20210723 date, sort lcolor(black)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, reference scenario, update 20210723", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	



**************************************

* get update 20210715

copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-07-15/ihme-covid19.zip ihme-covid19.zip
unzipfile ihme-covid19.zip, replace
erase ihme-covid19.zip

import delimited using reference_hospitalization_all_locs.csv, clear varnames(1)

keep if strpos(location_name, "Global")


rename totdea_mean  TotDeaMeRaA02S01V04
label var TotDeaMeRaA02S01V04 "Total Deaths Mean not smoothed IHME S1"

rename deaths_mean  DayDeaMeRaA02S01V04
label var DayDeaMeRaA02S01V04 "Daily Deaths Mean not smoothed IHME S1"

rename inf_cuml_mean  TotINFMeRaA02S01V04
label var TotINFMeRaA02S01V04 "Total infections Mean not smoothed IHME S1"

rename est_infections_mean  DayINFMeRaA02S01V04
label var DayINFMeRaA02S01V04 "Daily infections Mean not smoothed IHME S1"

rename totdea_mean_smoothed   TotDeaMeSmA02S01V04
label var TotDeaMeSmA02S01V04 "Total Deaths Mean smoothed IHME S1"

rename deaths_mean_smoothed  DayDeaMeSmA02S01V04    	
label var DayDeaMeSmA02S01V04 "Daily Deaths Mean smoothed IHME S1"

rename location_name loc_grand_name

keep date loc_grand_name DayDeaMeRaA02S01 TotDeaMeRaA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01 DayINFMeRaA02S01 TotINFMeRaA02S01

* add 20210715 to the end of varnames

local varlistlist20210715 DayDeaMeRaA02S01 TotDeaMeRaA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01 DayINFMeRaA02S01 TotINFMeRaA02S01

foreach l of local varlistlist20210715 {

rename `l' `l'U20210715

}
* 

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2

replace loc_grand_name = "global"

sort date loc_grand_name

save "CovidVisualizedGlobal IHME 20210715.dta", replace



twoway ///
(line DayDeaMeSmA02S01U20210715 date, sort lcolor(black)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, global, IHME, reference scenario, update 20210715", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	



*****************

merge m:m date loc_grand_name using "CovidVisualizedGlobal IHME 20210723.dta"


local varlist DayDeaMeRaA02S01 TotDeaMeRaA02S01 DayDeaMeSmA02S01 TotDeaMeSmA02S01 DayINFMeRaA02S01 TotINFMeRaA02S01

gen DayDeaMeRaA02S01Udiff = DayDeaMeRaA02S01U20210715 - DayDeaMeRaA02S01U20210723
gen TotDeaMeRaA02S01Udiff = TotDeaMeRaA02S01U20210715 - TotDeaMeRaA02S01U20210723
gen DayDeaMeSmA02S01Udiff = DayDeaMeSmA02S01U20210715 - DayDeaMeSmA02S01U20210723
gen TotDeaMeSmA02S01Udiff = TotDeaMeSmA02S01U20210715 - TotDeaMeSmA02S01U20210723
gen DayINFMeRaA02S01Udiff = DayINFMeRaA02S01U20210715 - DayINFMeRaA02S01U20210723
gen TotINFMeRaA02S01Udiff = TotINFMeRaA02S01U20210715 - TotINFMeRaA02S01U20210723

label var DayDeaMeRaA02S01Udiff "DayDeaMeRaA02S01 diff of updates 20210715 20210723"
label var TotDeaMeRaA02S01Udiff "TotDeaMeRaA02S01 diff of updates 20210715 20210723"
label var DayDeaMeSmA02S01Udiff "DayDeaMeSmA02S01 diff of updates 20210715 20210723"
label var TotDeaMeSmA02S01Udiff "TotDeaMeSmA02S01 diff of updates 20210715 20210723"
label var DayINFMeRaA02S01Udiff "DayINFMeRaA02S01 diff of updates 20210715 20210723"
label var TotINFMeRaA02S01Udiff "TotINFMeRaA02S01 diff of updates 20210715 20210723"

codebook *Udiff



* daily deaths raw
	   
twoway ///
(line DayDeaMeRaA02S01U20210715 date, sort lcolor(red) lwidth(medium)) ///
(line DayDeaMeRaA02S01U20210723 date, sort lcolor(blue) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeaMeRaA02S01Udiff     date, sort lcolor(gold) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths raw, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "update 20210715" 2 "update 20210723" 3 "difference") rows(1)) ///
subtitle("C O M P A R I S O N of UPDATES 20210715 & 20210723")

graph save "graph A1 COVID-19 daily deaths raw, reference scenario, global, IHME.gph", replace
graph export "graph A1 COVID-19 daily deaths raw, reference scenario, global, IHME.pdf", replace





* daily deaths smooth
	   
twoway ///
(line DayDeaMeSmA02S01U20210715 date, sort lcolor(red) lwidth(medium)) ///
(line DayDeaMeSmA02S01U20210723 date, sort lcolor(blue) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeaMeSmA02S01Udiff     date, sort lcolor(gold) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths smooth, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "update 20210715" 2 "update 20210723" 3 "difference") rows(1)) ///
subtitle("C O M P A R I S O N of UPDATES 20210715 & 20210723")

graph save "graph A2 COVID-19 daily deaths smooth, reference scenario, global, IHME.gph", replace
graph export "graph A2 COVID-19 daily deaths smooth, reference scenario, global, IHME.pdf", replace







* daily infections
	   
twoway ///
(line DayINFMeRaA02S01U20210715 date, sort lcolor(red) lwidth(medium)) ///
(line DayINFMeRaA02S01U20210723 date, sort lcolor(blue) lwidth(vthick) lpattern(tight_dot)) ///
(line DayINFMeRaA02S01Udiff     date, sort lcolor(gold) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "update 20210715" 2 "update 20210723" 3 "difference") rows(1)) ///
subtitle("C O M P A R I S O N of UPDATES 20210715 & 20210723")

graph save "graph A3 COVID-19 daily infections, reference scenario, global, IHME.gph", replace
graph export "graph A3 COVID-19 daily infections, reference scenario, global, IHME.pdf", replace






* total deaths
	   
twoway ///
(line TotDeaMeRaA02S01U20210715 date, sort lcolor(red) lwidth(medium)) ///
(line TotDeaMeRaA02S01U20210723 date, sort lcolor(blue) lwidth(vthick) lpattern(tight_dot)) ///
(line TotDeaMeRaA02S01Udiff     date, sort lcolor(gold) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "update 20210715" 2 "update 20210723" 3 "difference") rows(1)) ///
subtitle("C O M P A R I S O N of UPDATES 20210715 & 20210723")

graph save "graph A4 COVID-19 total deaths, reference scenario, global, IHME.gph", replace
graph export "graph A4 COVID-19 total deaths, reference scenario, global, IHME.pdf", replace








* total infections
	   
twoway ///
(line TotINFMeRaA02S01U20210715 date, sort lcolor(red) lwidth(medium)) ///
(line TotINFMeRaA02S01U20210723 date, sort lcolor(blue) lwidth(vthick) lpattern(tight_dot)) ///
(line TotINFMeRaA02S01Udiff     date, sort lcolor(gold) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("COVID-19 total infections, global, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "update 20210715" 2 "update 20210723" 3 "difference") rows(1)) ///
subtitle("C O M P A R I S O N of UPDATES 20210715 & 20210723")

graph save "graph A5 COVID-19 total infections, reference scenario, global, IHME.gph", replace
graph export "graph A5 COVID-19 total infections, reference scenario, global, IHME.pdf", replace


















view "log CovidVisualizedGlobal IHME.smcl"

log close

exit, clear




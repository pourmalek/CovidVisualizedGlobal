
clear all

cd "$pathCovidVisualizedCountry"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME.smcl", replace

***************************************************************************
* This is "do CovidVisualizedCountry IHME.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the country level (CovidVisualizedCountry)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


                                                                                                         ***************************
* To change update date, find and replace all, 2021-07-30 (old), with 2021-07-30 (new) <<--       <<<--- * change update date here *
                                                                                                         ***************************
													 
* AND, note that: update release date = 2021-07-30, date in download URL = 2021-07-31
													 

clear 
 
*****************************

* get IHME estimates

// copy https://ihmecovid19storage.blob.core.windows.net/latest/ihme-covid19.zip ihme-covid19.zip // as of 2021-07-30
copy https://ihmecovid19storage.blob.core.windows.net/archive/2021-07-31/ihme-covid19.zip ihme-covid19.zip // as of 2021-08-08
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

keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

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


/* using IHME's seroprev_mean in these codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S01
rename seroprev_upper 		TotSerLoSmA02S01
rename seroprev_lower		TotSerUpSmA02S01

label var TotSerMeSmA02S01 "Total seroprevalence Mean IHME S1"
label var TotSerLoSmA02S01 "Total seroprevalence Lower IHME S1"
label var TotSerUpSmA02S01 "Total seroprevalence Upper IHME S1"
*/

save "Reference country.dta", replace







**********************

* S2 Best

use "Best_masks_hospitalization_all_locs.dta", clear

keep if location_name == "Canada" | ///
        location_name == "Alberta" | ///
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

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


/* using IHME's seroprev_mean in these codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S02
rename seroprev_upper 		TotSerLoSmA02S02
rename seroprev_lower		TotSerUpSmA02S02

label var TotSerMeSmA02S02 "Total seroprevalence Mean IHME S2"
label var TotSerLoSmA02S02 "Total seroprevalence Lower IHME S2"
label var TotSerUpSmA02S02 "Total seroprevalence Upper IHME S2"
*/

save "Best country.dta", replace








**********************

* S3 Worse

use "Worse_hospitalization_all_locs.dta", clear

keep if location_name == "Canada" | ///
        location_name == "Alberta" | ///
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 

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


/* using IHME's seroprev_mean in these codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S03
rename seroprev_upper 		TotSerLoSmA02S03
rename seroprev_lower		TotSerUpSmA02S03

label var TotSerMeSmA02S03 "Total seroprevalence Mean IHME S3"
label var TotSerLoSmA02S03 "Total seroprevalence Lower IHME S3"
label var TotSerUpSmA02S03 "Total seroprevalence Upper IHME S3"
*/


save "Worse country.dta", replace


 
 
 
 
**********************

 
* merge scenario files


use "Reference country.dta", clear
merge 1:1 location_name date using "Best country.dta"
drop _merge
merge 1:1 location_name date using "Worse country.dta"
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



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"




drop date_original v1 hosp_data_type deaths_data_type ///
mobility_data_type mobility_composite ///
confirmed_infections_data_type confirmed_infections est_infections_data_type ///
// total_pop // seroprev_data_type

order deaths_mean_p100k_rate-est_infections_upper_p100k_rate, last

order loc_grand_name provincestate date

sort loc_grand_name provincestate date



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



label var location_id "location id IHME"


label var deaths_reported_mean  "deaths reported mean IHME"
label var deaths_reported_lower "deaths reported lower IHME"
label var deaths_reported_upper "deaths reported upper IHME"
label var totdea_reported_mean  "total deaaths reported mean IHME"
label var totdea_reported_lower "total deaaths reported lower IHME"
label var totdea_reported_upper "total deaaths reported upper IHME"
/* label var deaths_reported_me_sm "deaths reported mean smoothed IHME"
label var deaths_reported_lo_sm "deaths reported lower smoothed IHME"
label var deaths_reported_up_sm "deaths reported upper smoothed IHME"
label var totdea_reported_me_sm "total deaaths reported mean smoothed IHME"
label var totdea_reported_lo_sm "total deaaths reported lower smoothed IHME"
label var totdea_reported_up_sm "total deaaths reported upper smoothed IHME" */
label var total_tests_data_type "total tests data type IHME"

label var total_pop "total population IHME"


/*label var dea_rep_me_rate "deaths reported mean rate IHME"
label var dea_rep_lo_rate "deaths reported lower rate IHME"
label var dea_rep_up_rate "deaths reported upper rate IHME"
label var totdea_rep_me_rate "total deaaths reported mean rate IHME"
label var totdea_rep_lo_rate "total deaaths reported lower rate IHME"
label var totdea_rep_up_rate "total deaaths reported upper rate IHME"*/



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



* shorten long varnames

rename deaths_reported_mean_smoothed  deaths_reported_me_sm

rename deaths_reported_lower_smoothed deaths_reported_lo_sm

rename deaths_reported_upper_smoothed deaths_reported_up_sm

rename totdea_reported_mean_smoothed  totdea_reported_me_sm

rename totdea_reported_lower_smoothed totdea_reported_lo_sm

rename totdea_reported_upper_smoothed totdea_reported_up_sm

rename deaths_mean_p100k_rate dea_me_rate

rename deaths_lower_p100k_rate dea_lo_rate

rename deaths_upper_p100k_rate dea_up_rate

rename totdea_mean_p100k_rate totdea_me_rate

rename totdea_lower_p100k_rate totdea_lo_rate

rename totdea_upper_p100k_rate totdea_up_rate

rename deaths_mean_smoothed_p100k_rate dea_me_sm_rate

rename deaths_lower_smoothed_p100k_rate dea_lo_sm_rate

rename deaths_upper_smoothed_p100k_rate dea_up_sm_rate

rename totdea_mean_smoothed_p100k_rate totdea_me_sm_rate

rename totdea_lower_smoothed_p100k_rate totdea_lo_sm_rate

rename totdea_upper_smoothed_p100k_rate totdea_up_sm_rate

rename confirmed_infections_p100k_rate conf_inf_rate 

rename est_infections_mean_p100k_rate est_inf_me_rate

rename est_infections_lower_p100k_rate est_inf_lo_rate

rename est_infections_upper_p100k_rate est_inf_up_rate

rename deaths_reported_mean_p100k_rate	dea_rep_me_rate

rename deaths_reported_lower_p100k_rate	dea_rep_lo_rate

rename deaths_reported_upper_p100k_rate	dea_rep_up_rate

rename totdea_reported_mean_p100k_rate	totdea_rep_me_rate

rename totdea_reported_lower_p100k_rate	totdea_rep_lo_rate

rename totdea_reported_upper_p100k_rate	totdea_rep_up_rate

rename deaths_reported_mean_smoothed_p1	dea_rep_me_sm_rate

rename deaths_reported_lower_smoothed_p	dea_rep_lo_sm_rate

rename deaths_reported_upper_smoothed_p	dea_rep_up_sm_rate

rename totdea_reported_mean_smoothed_p1	totdea_rep_me_sm_rate

rename totdea_reported_lower_smoothed_p	totdea_rep_lo_sm_rate

rename totdea_reported_upper_smoothed_p	totdea_rep_up_sm_rate

*




* gen vars by provincestate 

foreach var of varlist ///
DayBedMeSmA02S01	DayBedUpSmA02S01	DayBedLoSmA02S01	DayIcuMeSmA02S01	DayIcuUpSmA02S01	DayIcuLoSmA02S01	///
DayAdmMeSmA02S01	DayAdmUpSmA02S01	DayAdmLoSmA02S01	DayIcnMeSmA02S01	DayIcnUpSmA02S01	DayIcnLoSmA02S01	///
DayDeaMeRaA02S01	DayDeaLoRaA02S01	DayDeaUpRaA02S01	TotDeaMeRaA02S01	TotDeaLoRaA02S01	TotDeaUpRaA02S01	///
DayDeaMeSmA02S01	DayDeaLoSmA02S01	DayDeaUpSmA02S01	TotDeaMeSmA02S01	TotDeaLoSmA02S01	TotDeaUpSmA02S01	///
deaths_reported_mean	deaths_reported_lower	deaths_reported_upper	totdea_reported_mean	totdea_reported_lower	totdea_reported_upper	///
deaths_reported_me_sm	deaths_reported_lo_sm	deaths_reported_up_sm	totdea_reported_me_sm	totdea_reported_lo_sm	totdea_reported_up_sm	///
TotTesMeSmA02S01	DayINFMeRaA02S01	DayINFLoRaA02S01	DayINFUpRaA02S01	total_pop	///
TotINFMeRaA02S01	TotINFUpRaA02S01	TotINFLoRaA02S01	DayDeaMeRaA02S02	DayDeaLoRaA02S02	DayDeaUpRaA02S02	///
TotDeaMeRaA02S02	TotDeaLoRaA02S02	TotDeaUpRaA02S02	DayDeaMeSmA02S02	DayDeaLoSmA02S02	DayDeaUpSmA02S02	///
TotDeaMeSmA02S02	TotDeaLoSmA02S02	TotDeaUpSmA02S02	TotTesMeSmA02S02	DayINFMeRaA02S02	DayINFLoRaA02S02	///
DayINFUpRaA02S02	TotINFMeRaA02S02	TotINFUpRaA02S02	TotINFLoRaA02S02	DayDeaMeRaA02S03	DayDeaLoRaA02S03	///
DayDeaUpRaA02S03	TotDeaMeRaA02S03	TotDeaLoRaA02S03	TotDeaUpRaA02S03	DayDeaMeSmA02S03	DayDeaLoSmA02S03	///
DayDeaUpSmA02S03	TotDeaMeSmA02S03	TotDeaLoSmA02S03	TotDeaUpSmA02S03	TotTesMeSmA02S03	DayINFMeRaA02S03	///
DayINFLoRaA02S03	DayINFUpRaA02S03	TotINFMeRaA02S03	TotINFUpRaA02S03	TotINFLoRaA02S03	///
dea_me_rate	dea_lo_rate	dea_up_rate	totdea_me_rate	totdea_lo_rate	totdea_up_rate	dea_me_sm_rate	dea_lo_sm_rate	dea_up_sm_rate	///
totdea_me_sm_rate	totdea_lo_sm_rate	totdea_up_sm_rate dea_rep_me_rate dea_rep_lo_rate dea_rep_up_rate ///
totdea_rep_me_rate totdea_rep_lo_rate totdea_rep_up_rate dea_rep_me_sm_rate dea_rep_lo_sm_rate dea_rep_up_sm_rate ///
totdea_rep_me_sm_rate totdea_rep_lo_sm_rate totdea_rep_up_sm_rate ///
conf_inf_rate	est_inf_me_rate	est_inf_lo_rate	est_inf_up_rate	///
DayIFRMeRaA02S01	DayIFRLoRaA02S01	DayIFRUpRaA02S01	DayIFRMeRaA02S02	DayIFRLoRaA02S02	DayIFRUpRaA02S02	///
DayIFRMeRaA02S03	DayIFRLoRaA02S03	DayIFRUpRaA02S03	DayDeMMeSmA02S01	DayCaMMeRaA02S01	DayCbDMeRaA02S01	DayDMuMeRaA02S01 {

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

qui gen `var'XNS = `var'
qui replace `var'XNS = . if provincestate != "Nova Scotia"

qui gen `var'XON = `var'
qui replace `var'XON = . if provincestate != "Ontario"

qui gen `var'XQC = `var'
qui replace `var'XQC = . if provincestate != "Quebec"

qui gen `var'XSK = `var'
qui replace `var'XSK = . if provincestate != "Saskatchewan"


label var `var'XAB "`var' Alberta"
label var `var'XBC "`var' British Columbia"
label var `var'XMB "`var' Manitoba"
label var `var'XXX "`var' National"
label var `var'XNB "`var' New Brunswick"
label var `var'XNL "`var' Newfoundland and Labrador"
label var `var'XNS "`var' Nova Scotia"
label var `var'XON "`var' Ontario"
label var `var'XQC "`var' Quebec"
label var `var'XSK "`var' Saskatchewan"


                
}
*





qui compress

save "CovidVisualizedCountry IHME.dta", replace

















***********************


* graphs


grstyle init

grstyle color background white





*****************
* daily deaths, reference scenario = S1  (graph numbers starting with 11)


****
* 11 a daily deaths, national, all subnational, reference scenario = S1 

twoway ///
(line DayDeaMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeaMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeaMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeaMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayDeaMeSmA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayDeaMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayDeaMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayDeaMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayDeaMeSmA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayDeaMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 11 a COVID-19 daily deaths, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 11 a COVID-19 daily deaths, $country, subnational, IHME, reference scenario.pdf", replace




****
* 11 b daily deaths, subnational, most affected, reference scenario = S1 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayDeaMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeaMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeaMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeaMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayDeaMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayDeaMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 11 b COVID-19 daily deaths, $country, subnational, most affected, IHME, reference scenario.gph", replace
qui graph export "graph 11 b COVID-19 daily deaths, $country, subnational, most affected, IHME, reference scenario.pdf", replace




****
* 11 c daily deaths, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeaLoSmA02S01 DayDeaUpSmA02S01 date, sort color(green*.2)) ///
(line DayDeaMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 11 c COVID-19 daily deaths, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 11 c COVID-19 daily deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*




****
* 11 d daily death rate, national, all subnational, reference scenario = S1 

twoway ///
(line dea_me_sm_rateXAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line dea_me_sm_rateXBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line dea_me_sm_rateXMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line dea_me_sm_rateXNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line dea_me_sm_rateXNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line dea_me_sm_rateXNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line dea_me_sm_rateXON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line dea_me_sm_rateXQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line dea_me_sm_rateXSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line dea_me_sm_rateXXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.1fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle("Daily death rate in 100,000") title("COVID-19 daily death rate, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME, Daily death rate in 100,000 smoothed", size(small)) 

qui graph save "graph 11 d COVID-19 daily death rate, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 11 d COVID-19 daily death rate, $country, subnational, IHME, reference scenario.pdf", replace





*****************
* daily deaths, 3 scenarios


****
* 12 daily deaths, national, subnational, separate, 3 scenarios 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeaMeSmA02S02 date, sort lcolor(green)) ///
(line DayDeaMeSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) & provincestate == "`l'" ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) 

qui qui graph save "graph 12 COVID-19 daily deaths, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 12 COVID-19 daily deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*





*****************
* 13 daily deaths, national, subnational, separate, best scenario = S2

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeaLoSmA02S02 DayDeaUpSmA02S02 date, sort color(green*.2)) ///
(line DayDeaMeSmA02S02 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, `l', IHME, best scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 13 COVID-19 daily deaths, $country, `l', IHME, best scenario.gph", replace
qui qui graph export "graph 13 COVID-19 daily deaths, $country, `l', IHME, best scenario.pdf", replace

}
*






*****************
* 14 daily deaths, national, subnational, separate, worse scenario = S3

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeaLoSmA02S03 DayDeaUpSmA02S03 date, sort color(green*.2)) ///
(line DayDeaMeSmA02S03 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 14 COVID-19 daily deaths, $country, `l', IHME, worse scenario.gph", replace
qui qui graph export "graph 14 COVID-19 daily deaths, $country, `l', IHME, worse scenario.pdf", replace

}
*




*****************
* daily infections, reference scenario = S1  (graph numbers starting with 21)


****
* 21 a daily infections, national, all subnational, reference scenario = S1 

twoway ///
(line DayINFMeRaA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayINFMeRaA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayINFMeRaA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayINFMeRaA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayINFMeRaA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayINFMeRaA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayINFMeRaA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayINFMeRaA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayINFMeRaA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayINFMeRaA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 21 a COVID-19 daily infections, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 21 a COVID-19 daily infections, $country, subnational, IHME, reference scenario.pdf", replace




****
* 21 b daily infections, subnational, most affected, reference scenario = S1 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayINFMeRaA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayINFMeRaA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayINFMeRaA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayINFMeRaA02S01XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayINFMeRaA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayINFMeRaA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 21 b COVID-19 daily infections, $country, subnational, most affected, IHME, reference scenario.gph", replace
qui graph export "graph 21 b COVID-19 daily infections, $country, subnational, most affected, IHME, reference scenario.pdf", replace




****
* 21 c daily infections, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayINFLoRaA02S01 DayINFUpRaA02S01 date, sort color(green*.2)) ///
(line DayINFMeRaA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayINFMeRaA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 21 c COVID-19 daily infections, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 21 c COVID-19 daily infections, $country, `l', IHME, reference scenario.pdf", replace

}
*




*****************
* daily infections, 3 scenarios


****
* 22 daily infections, national, subnational, separate, 3 scenarios 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayINFMeRaA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayINFMeRaA02S02 date, sort lcolor(green)) ///
(line DayINFMeRaA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) & provincestate == "`l'" ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) 

qui qui graph save "graph 22 COVID-19 daily infections, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 22 COVID-19 daily infections, $country, `l', IHME, reference scenario.pdf", replace

}
*





*****************
* 23 daily infections, national, subnational, separate, best scenario = S2

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayINFLoRaA02S02 DayINFUpRaA02S02 date, sort color(green*.2)) ///
(line DayINFMeRaA02S02 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayINFMeRaA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, $country, `l', IHME, best scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 23 COVID-19 daily infections, $country, `l', IHME, best scenario.gph", replace
qui qui graph export "graph 23 COVID-19 daily infections, $country, `l', IHME, best scenario.pdf", replace

}
*






*****************
* 24 daily infections, national, subnational, separate, worse scenario = S3

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayINFLoRaA02S03 DayINFUpRaA02S03 date, sort color(green*.2)) ///
(line DayINFMeRaA02S03 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayINFMeRaA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("COVID-19 daily infections, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 24 COVID-19 daily infections, $country, `l', IHME, worse scenario.gph", replace
qui qui graph export "graph 24 COVID-19 daily infections, $country, `l', IHME, worse scenario.pdf", replace

}
*






*****************
* total deaths, reference scenario = S1  (graph numbers starting with 31)


****
* 31 a total deaths, national, all subnational, reference scenario = S1 

twoway ///
(line TotDeaMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotDeaMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotDeaMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotDeaMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line TotDeaMeSmA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line TotDeaMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line TotDeaMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line TotDeaMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line TotDeaMeSmA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line TotDeaMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 31 a COVID-19 total deaths, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 31 a COVID-19 total deaths, $country, subnational, IHME, reference scenario.pdf", replace




****
* 31 b total deaths, subnational, most affected, reference scenario = S1 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line TotDeaMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotDeaMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotDeaMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotDeaMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line TotDeaMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line TotDeaMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 31 b COVID-19 total deaths, $country, subnational, most affected, IHME, reference scenario.gph", replace
qui graph export "graph 31 b COVID-19 total deaths, $country, subnational, most affected, IHME, reference scenario.pdf", replace




****
* 31 c total deaths, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotDeaLoSmA02S01 TotDeaUpSmA02S01 date, sort color(green*.2)) ///
(line TotDeaMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 31 c COVID-19 total deaths, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 31 c COVID-19 total deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*




****
* 31 d total death rate, national, all subnational, reference scenario = S1 

twoway ///
(line totdea_me_rateXAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line totdea_me_rateXBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line totdea_me_rateXMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line totdea_me_rateXNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line totdea_me_rateXNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line totdea_me_rateXNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line totdea_me_rateXON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line totdea_me_rateXQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line totdea_me_rateXSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line totdea_me_rateXXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle("Total death rate in 100,000") title("COVID-19 total death rate, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 31 d COVID-19 total death rate, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 31 d COVID-19 total death rate, $country, subnational, IHME, reference scenario.pdf", replace




*****************
* total deaths, 3 scenarios


****
* 32 total deaths, national, subnational, separate, 3 scenarios 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line TotDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line TotDeaMeSmA02S02 date, sort lcolor(green)) ///
(line TotDeaMeSmA02S03 date, sort lcolor(red)) ///
if date >= td(01jan2020) & provincestate == "`l'" ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths) title("COVID-19 total deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) 

qui qui graph save "graph 32 COVID-19 total deaths, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 32 COVID-19 total deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*





*****************
* 33 total deaths, national, subnational, separate, best scenario = S2

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotDeaLoSmA02S02 TotDeaUpSmA02S02 date, sort color(green*.2)) ///
(line TotDeaMeSmA02S02 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(total deaths) title("COVID-19 total deaths, $country, `l', IHME, best scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 33 COVID-19 total deaths, $country, `l', IHME, best scenario.gph", replace
qui qui graph export "graph 33 COVID-19 total deaths, $country, `l', IHME, best scenario.pdf", replace

}
*






*****************
* 34 total deaths, national, subnational, separate, worse scenario = S3

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotDeaLoSmA02S03 TotDeaUpSmA02S03 date, sort color(green*.2)) ///
(line TotDeaMeSmA02S03 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(total deaths) title("COVID-19 total deaths, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 34 COVID-19 total deaths, $country, `l', IHME, worse scenario.gph", replace
qui qui graph export "graph 34 COVID-19 total deaths, $country, `l', IHME, worse scenario.pdf", replace

}
*






*****************
* total infections, reference scenario = S1  (graph numbers starting with 41)


****
* 41 a total infections, national, all subnational, reference scenario = S1 

twoway ///
(line TotINFMeRaA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotINFMeRaA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotINFMeRaA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotINFMeRaA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line TotINFMeRaA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line TotINFMeRaA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line TotINFMeRaA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line TotINFMeRaA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line TotINFMeRaA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line TotINFMeRaA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 41 a COVID-19 total infections, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 41 a COVID-19 total infections, $country, subnational, IHME, reference scenario.pdf", replace




****
* 41 b total infections, subnational, most affected, reference scenario = S1 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line TotINFMeRaA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line TotINFMeRaA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line TotINFMeRaA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line TotINFMeRaA02S01XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line TotINFMeRaA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line TotINFMeRaA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC" 6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 41 b COVID-19 total infections, $country, subnational, most affected, IHME, reference scenario.gph", replace
qui graph export "graph 41 b COVID-19 total infections, $country, subnational, most affected, IHME, reference scenario.pdf", replace




****
* 41 c total infections, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotINFLoRaA02S01 TotINFUpRaA02S01 date, sort color(green*.2)) ///
(line TotINFMeRaA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotINFMeRaA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("COVID-19 total infections, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui qui graph save "graph 41 c COVID-19 total infections, $country, `l', IHME, reference scenario.gph", replace
qui qui graph export "graph 41 c COVID-19 total infections, $country, `l', IHME, reference scenario.pdf", replace

}
*



* total infections, best scenario = S2, CI, not available
 

* total infections, worse scenario = S3, CI, not available






  

*****************
* daily IFR, reference scenario = S1  (graph numbers starting with 51)


****
* 51 a daily IFR, national, all subnational, reference scenario = S1 

twoway ///
(line DayIFRMeRaA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayIFRMeRaA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayIFRMeRaA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayIFRMeRaA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayIFRMeRaA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayIFRMeRaA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayIFRMeRaA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayIFRMeRaA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayIFRMeRaA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayIFRMeRaA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
if DayIFRMeRaA02S01XAB >= 0 ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily IFR) title("COVID-19 daily IFR, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 51 a COVID-19 daily IFR, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 51 a COVID-19 daily IFR, $country, subnational, IHME, reference scenario.pdf", replace




****
* 51 b daily IFR, subnational, most affected, reference scenario = S1 
* Alberta (AB), British Columbia (BC), Manitoba (MB), Ontario (ON), Quebec (QC)

twoway ///
(line DayIFRMeRaA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayIFRMeRaA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayIFRMeRaA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayIFRMeRaA02S01XON date, sort lwidth(medium) lcolor(red)) /// 4 "ON" red
(line DayIFRMeRaA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 5 "QC" black
(line DayIFRMeRaA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 6 "CAN" 
if DayIFRMeRaA02S01XAB >= 0 ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily IFR) title("COVID-19 daily IFR, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 4 "ON" 5 "QC"  6 "CAN") rows(1) size(small)) ///
subtitle("5 most affected provinces", size(small)) 

qui graph save "graph 51 b COVID-19 daily IFR, $country, subnational, most affected, IHME, reference scenario.gph", replace
qui graph export "graph 51 b COVID-19 daily IFR, $country, subnational, most affected, IHME, reference scenario.pdf", replace




****
* 51 c daily IFR, national, subnational, separate, 3 scenarios

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayIFRMeRaA02S01 date, sort lcolor(black)) ///
(line DayIFRMeRaA02S02 date, sort lcolor(green)) ///
(line DayIFRMeRaA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & DayIFRMeRaA02S01 >= 0 & DayIFRLoRaA02S01 >= 0 & DayIFRUpRaA02S01 >= 0, legend(off) ///	   
xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily IFR) title("COVID-19 daily IFR, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) 
  	   
qui qui graph save "graph 51 c COVID-19 daily IFR, $country, `l', IHME, 3 scenarios.gph", replace
qui qui graph export "graph 51 c COVID-19 daily IFR, $country, `l', IHME, 3 scenarios.pdf", replace

}
*







* other outcomes 


******
* 61 daily beds needed, only in S1

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayBedLoSmA02S01 DayBedUpSmA02S01 date, sort color(black*.2)) ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily beds needed) title("COVID-19 daily beds needed, $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	///
subtitle("Reference scenario (S1)", size(small))  

qui graph save "graph 61 COVID-19 daily beds needed, $country, `l', IHME, reference scenario", replace
qui graph export "graph 61 COVID-19 daily beds needed, $country, `l', IHME, reference scenario.pdf", replace

}
*




******
* 62 daily ICU beds needed, only in S1

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayIcuLoSmA02S01 DayIcuUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily beds needed) title("COVID-19 ICU beds needed, $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	///
subtitle("Reference scenario (S1)", size(small))  

qui graph save "graph 62 COVID-19 daily beds needed, $country, `l', IHME, reference scenario", replace
qui graph export "graph 62 COVID-19 daily beds needed, $country, `l', IHME, reference scenario.pdf", replace

}
*



/*

******
* 63 daily Invasive ventilation needed, only in S1

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayVenLoSmA02S01 DayVenUpSmA02S01 date, sort color(black*.2)) ///
(line DayVenMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily beds needed) title("COVID-19 invasive ventilation needed, $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	///
subtitle("Reference scenario (S1)", size(small))  

qui graph save "graph 63 COVID-19 daily invasive ventilation needed, $country, `l', IHME, reference scenario", replace
qui graph export "graph 63 COVID-19 daily invasive ventilation needed, $country, `l', IHME, reference scenario".pdf", replace

}
*
*/




* 64 daily hospital admissions, only in S1

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayAdmLoSmA02S01 DayAdmUpSmA02S01 date, sort color(black*.2)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily hospital admissions) title("COVID-19 daily hospital admissions, $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	///
subtitle("Reference scenario (S1)", size(small))  
	   
qui graph save "graph 64 COVID-19 daily hospital admissions, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 64 COVID-19 daily hospital admissions, $country, `l', IHME, reference scenario.pdf", replace

}
*






* 65 daily new people going to ICU

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayIcnLoSmA02S01 DayIcnUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcnMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily new people going to ICU) title("COVID-19 daily new people to ICU $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	///
subtitle("Reference scenario (S1)", size(small))  

qui graph save "graph 65 COVID-19 daily new people going to ICU, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 65 COVID-19 daily new people going to ICU, $country, `l', IHME, reference scenario.pdf", replace

}
*





* 66 total tests

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line TotTesMeSmA02S01 date, sort lcolor(black)) ///
(line TotTesMeSmA02S02 date, sort lcolor(green)) ///
(line TotTesMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total tests) title("COVID-19 total tests, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) 

qui graph save "graph 66 COVID-19 total tests, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 66 COVID-19 total tests, $country, `l', 3 scenarios, IHME.pdf", replace

}
*




* 67 daily hospital-related outcomes

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 hospital-rel. outcomes, $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "COVID beds needed" 2 "ICU COVID beds needed" 3 "Admissions" 4 "New people to ICU") rows(2)) ///
subtitle("Hospital-related outcomes, reference scenario (S1)", size(small))  

qui graph save "graph 67 COVID-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME.gph", replace
qui graph export "graph 67 COVID-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME.pdf", replace

}
*





* 68 daily hospital-related outcomes, wo beds needed 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
(line DayIcnMeSmA02S01 date, sort lcolor(blue)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("COVID-19 hospital-rel. outcomes, $country, `l', IHME, S1", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "ICU COVID beds needed" 2 "Admissions" 3 "New people to ICU") rows(1)) ///
subtitle("Hospital-related outcomes, without beds needed, reference scenario (S1)", size(small)) 

qui graph save "graph 68 COVID-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME, wo beds needed.gph", replace
qui graph export "graph 68 COVID-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME, wo beds needed.pdf", replace

}
*





* rates

* 70 daily deaths raw per 100k rate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line dea_me_rate date, sort lcolor(black)) /// deaths_mean_p100k_rate
(line dea_lo_rate date, sort lcolor(green)) /// deaths_lower_p100k_rate
(line dea_up_rate date, sort lcolor(red)) /// deaths_upper_p100k_rate
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths per 100k rate) title("COVID-19 daily deaths raw / 100k rate, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

qui graph save "graph 70 COVID-19 daily deaths raw per 100k rate, $country, `l', IHME.gph", replace
qui graph export "graph 70 COVID-19 daily deaths raw per 100k rate, $country, `l', IHME.pdf", replace

}
*





* 71 daily deaths smoothed per 100k rate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line dea_me_sm_rate date, sort lcolor(black)) /// deaths_mean_smoothed_p100k_rate
(line dea_lo_sm_rate date, sort lcolor(green)) /// deaths_lower_smoothed_p100k_rate
(line dea_up_sm_rate date, sort lcolor(red)) /// deaths_upper_smoothed_p100k_rate
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily deaths per 100k rate) title("COVID-19 daily deaths smoothed / 100k rate, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

qui graph save "graph 71 COVID-19 daily deaths smoothed per 100k rate, $country, `l', IHME.gph", replace
qui graph export "graph 71 COVID-19 daily deaths smoothed per 100k rate, $country, `l', IHME.pdf", replace

}
*





* 72 total deaths raw per 100k rate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line totdea_me_rate date, sort lcolor(black)) /// totdea_mean_p100k_rate
(line totdea_lo_rate date, sort lcolor(green)) /// totdea_lower_p100k_rate
(line totdea_up_rate date, sort lcolor(red)) /// totdea_upper_p100k_rate
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths per 100k rate) title("COVID-19 total deaths raw / 100k rate, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

qui graph save "graph 72 COVID-19 total deaths raw per 100k rate, $country, `l', IHME.gph", replace
qui graph export "graph 72 COVID-19 total deaths raw per 100k rate, $country, `l', IHME.pdf", replace

}
*





* 73 total deaths smoothed per 100k rate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line totdea_me_sm_rate date, sort lcolor(black)) /// totdea_mean_smoothed_p100k_rate
(line totdea_lo_sm_rate date, sort lcolor(green)) /// totdea_lower_smoothed_p100k_rate
(line totdea_up_sm_rate date, sort lcolor(red)) /// totdea_upper_smoothed_p100k_rate
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total deaths per 100k rate) title("COVID-19 total deaths smoothed / 100k rate, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))

qui graph save "graph 73 COVID-19 total deaths smoothed per 100k rate, $country, `l', IHME.gph", replace
qui graph export "graph 73 COVID-19 total deaths smoothed per 100k rate, $country, `l', IHME.pdf", replace

}
*





* 74 estimated infections per 100k rate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line est_inf_me_rate date, sort lcolor(black)) /// est_infections_mean_p100k_rate
(line est_inf_lo_rate date, sort lcolor(green)) /// est_infections_lower_p100k_rate
(line est_inf_up_rate date, sort lcolor(red)) /// est_infections_upper_p100k_rate
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Estimated infections per 100k rate) title("COVID-19 estimated infections / 100k rate, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1)) 

qui graph save "graph 74 COVID-19 estimated infections per 100k rate, $country, `l', IHME.gph", replace
qui graph export "graph 74 COVID-19 estimated infections per 100k rate, $country, `l', IHME.pdf", replace

}
*





* 75 confirmed infections per 100k rate

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line conf_inf_rate date, sort lcolor(black)) /// confirmed_infections_p100k_rate
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Confirmed infections per 100k rate) title("COVID-19 confirmed infections / 100k rate, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(off)

qui graph save "graph 75 COVID-19 confirmed per 100k rate, $country, `l', IHME.gph", replace
qui graph export "graph 75 COVID-19 confirmed per 100k rate, $country, `l', IHME.pdf", replace

}
*





* 76 DayINF DayDea Dea_multip

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayINFMeRaA02S01 date, sort lcolor(blue)) ///
(line DayDeaMeRaA02S01 date, sort lcolor(red)) ///
(line DayDMuMeRaA02S01 date, sort lpattern(dot) lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///
, xtitle(Date) xlabel(, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections and deaths) title("COVID-19 daily infections and deaths, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(4)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily infections" 2 "Daily deaths" 3 "Daily deaths scaled for visualization") size(small)) ///
subtitle("Daily deaths, scaled = times (means of infections divided by deaths) for visualization only", size(small)) ///
note("Reference scenario, mean estimate")

qui graph save "graph 76 COVID-19 daily deaths and infections $country, `l', IHME.gph", replace
qui graph export "graph 76 COVID-19 daily deaths and infections $country, `l', IHME.pdf", replace

}
*





****************


/*

population numbers used in death rates:

tab total_pop provincestate

Alberta				4,253,022
British Columbia	4,925,475
Manitoba			1,327,536
Nova Scotia			941,991.4
Ontario				14,200,000
Quebec				8,227,897
Saskatchewan		1,138,791
National			36,500,000

*/



view "log CovidVisualizedCountry IHME.smcl"

log close

exit, clear




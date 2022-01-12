
clear all

cd "$pathCovidVisualizedGlobal"

cd IHME

capture log close 

log using "log CovidVisualizedGlobal IHME 1.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IHME 1.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


* download and prepare estimates files

                                                                                                         ***************************
* To change update date, find and replace all, 2022-01-10 (old), with 2022-01-10 (new) <<--       <<<--- * change update date here *
                                                                                                         ***************************
																										 
clear 
 
*****************************

* get IHME estimates

* URLs as of  2022-01-10

/*
Data dictionary
Data release information sheet
Reference scenario 2020
Reference scenario 2021
80% mask use scenario 2020
80% mask use scenario 2021
Reduced vaccine hesitancy scenario 2020
Reduced vaccine hesitancy scenario 2021
Severe Omicron scenario 2020
Severe Omicron scenario 2021
Third vaccine dose scenario 2020
Third vaccine dose scenario 2021
Checksum (sha-256) 
*/

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_dictionary.csv data_dictionary.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/IHME_COVID_19_Data_Release_Information_Sheet.pdf IHME_COVID_19_Data_Release_Information_Sheet.pdf 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2020.csv data_download_file_reference_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2021.csv data_download_file_reference_2021.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2020.csv data_download_file_best_masks_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2021.csv data_download_file_best_masks_2021.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reduce_hesitancy_2020.csv data_download_file_reduce_hesitancy_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reduce_hesitancy_2021.csv data_download_file_reduce_hesitancy_2021.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_severe_omicron_2020.csv data_download_file_severe_omicron_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_severe_omicron_2021.csv data_download_file_severe_omicron_2021.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_third_dose_2020.csv data_download_file_third_dose_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_third_dose_2021.csv data_download_file_third_dose_2021.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/sha256sums.txt sha256sums.txt 






******************************

* import csv files


* my designation  variable name  var value   web site https://covid19.healthdata.org/global?view=daily-deaths&tab=trend

* scenario name = version_name = reference = Projection

import delimited using data_download_file_reference_2020.csv, clear varnames(1)
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
save data_download_file_reference_2021.dta, replace





* scenario name = version_name = best_masks = Masks
	
import delimited using data_download_file_best_masks_2020.csv, clear varnames(1)
save data_download_file_best_masks_2020.dta, replace

import delimited using data_download_file_best_masks_2021.csv, clear varnames(1)
save data_download_file_best_masks_2021.dta, replace


	
* scenario name = version_name = high_severity = Severe Omicron
	
import delimited using data_download_file_severe_omicron_2020.csv, clear varnames(1)
save data_download_file_severe_omicron_2020.dta, replace

import delimited using data_download_file_severe_omicron_2021.csv, clear varnames(1)
save data_download_file_severe_omicron_2021.dta, replace



* scenario name = version_name = reduced_hesitancy = Reduced hesitancy
	
import delimited using data_download_file_reduce_hesitancy_2020.csv, clear varnames(1)
save data_download_file_reduce_hesitancy_2020.dta, replace

import delimited using data_download_file_reduce_hesitancy_2021.csv, clear varnames(1)
save data_download_file_reduce_hesitancy_2021.dta, replace



* scenario name = version_name = booster = Third dose
	
import delimited using data_download_file_third_dose_2020.csv, clear varnames(1)
save data_download_file_third_dose_2020.dta, replace

import delimited using data_download_file_third_dose_2021.csv, clear varnames(1)
save data_download_file_third_dose_2021.dta, replace






******************************

* gen scenario dta files



* _reference_

use "data_download_file_reference_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2020.dta", replace 




use "data_download_file_reference_2021.dta", clear 


local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reference_2021.dta", replace 

append using "data_download_file_reference_2020.dta"

save "data_download_file_reference_2020_21.dta", replace

*



* _best_masks_

use "data_download_file_best_masks_2020.dta", clear

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_best_masks_2020.dta", replace



use "data_download_file_best_masks_2021.dta", clear

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_best_masks_2021.dta", replace

append using "data_download_file_best_masks_2020.dta"

save "data_download_file_best_masks_2020_21.dta", replace

*



* _severe_omicron_

use "data_download_file_severe_omicron_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_severe_omicron_2020.dta", replace 



use "data_download_file_severe_omicron_2021.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_severe_omicron_2021.dta", replace 

append using "data_download_file_severe_omicron_2020.dta"

save "data_download_file_severe_omicron_2020_21.dta", replace






* _reduce_hesitancy_

use "data_download_file_reduce_hesitancy_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reduce_hesitancy_2020.dta", replace 



use "data_download_file_reduce_hesitancy_2021.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_reduce_hesitancy_2021.dta", replace 

append using "data_download_file_reduce_hesitancy_2020.dta"

save "data_download_file_reduce_hesitancy_2020_21.dta", replace


*





* _third_dose_

use "data_download_file_third_dose_2020.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_third_dose_2020.dta", replace 



use "data_download_file_third_dose_2021.dta", clear 

local varlist reff_mean reff_lower reff_upper infection_fatality infection_detection infection_hospitalization

foreach v of local varlist {
	capture confirm numeric variable `v'
    if !_rc {
		di "`v'" " is numeric"
    }
    else {
		di "`v'" " contains string"
		replace `v' = "." if `v' == "Inf"
		destring `v', replace 
    }
}
*

save "data_download_file_third_dose_2021.dta", replace 

append using "data_download_file_third_dose_2020.dta"

save "data_download_file_third_dose_2020_21.dta", replace


*



******************************

* read scenario files


* scenarios


/*

Descending order of incidence of daily deaths GLOBAL
(1) High severity of Omicron
(2) Current projection
(3) Reduced vaccine hesitancy
(4) Third dose
(5) 80% mask use


Previous designation of three scenarios:

* S1 Reference
* S2 Best
* S3 Worse

*************************************************
*************************************************
** Current designation of five scenarios:      **
**                                             **
** * S1 Reference [Current projection]         **
** * S2 Best [80% mask use]                    **
** * S3 Worse [High severity of Omicron]       **
**                                             **
** * S4 Second best [Third dose]               **
** * S5 Third best [Reduced vaccine hesitancy] **
*************************************************
*************************************************

*/




* data_dictionary


/*

data_dictionary.csv

* Temp Note: Contents of this data_dictionary.csv of 2021-12-21 have not changed compared to those of 2021-11-19, for version_name | Scenario version (reference, worse, best_masks).

variable								description

version_name							Scenario version (reference, worse, best_masks)

inf_mean								Daily infections (mean estimate)
inf_upper								Daily infections (upper 95% confidence interval)
inf_lower								Daily infections (lower 95% confidence interval)
seir_cumulative_mean					Cumulative excess deaths (mean estimate)
seir_cumulative_lower					Cumulative excess deaths (lower 95% confidence interval)
seir_cumulative_upper					Cumulative excess deaths (upper 95% confidence interval)
inf_cuml_mean							Cumulative infections (mean estimate)
inf_cuml_lower							Cumulative infections (lower 95% confidence interval)
inf_cuml_upper							Cumulative infections (upper 95% confidence interval)
seir_daily_mean							Daily excess deaths (mean estimate)
seir_daily_lower						Daily excess deaths (lower 95% confidence interval)
seir_daily_upper						Daily excess deaths upper 95% confidence interval)
seir_daily_unscaled_mean				Daily reported deaths (mean estimate)
seir_daily_unscaled_lower				Daily reported deaths (lower 95% confidence interval)
seir_daily_unscaled_upper				Daily reported deaths upper 95% confidence interval)
seir_cumulative_unscaled_mean			Cumulative reported deaths (mean estimate)
seir_cumulative_unscaled_lower			Cumulative reported deaths (lower 95% confidence interval)
seir_cumulative_unscaled_upper			Cumulative reported deaths (upper 95% confidence interval)

reff_mean								R effective (mean estimate)
reff_lower								R effective (lower 95% confidence interval)
reff_upper								R effective (upper 95% confidence interval)


cumulative_cases						Cumulative cases (raw data)
cumulative_deaths						Cumulative deaths (raw data with excess mortality scalar applied)
cumulative_hospitalizations				Cumulative hospitalizations (raw data)
daily_deaths							Daily deaths (raw data with excess mortality scalar applied)
daily_infections						Daily infections (raw data)
cumulative_deaths_unscaled				Cumulative deaths (raw data without excess mortality scalar applied)
daily_deaths_unscaled					Daily deaths (raw data without excess mortality scalar applied)

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
infection_hospitalization				Infection hospitalization ratio



IDENTICAL ACROSS SCENARIOS:

date									Date of projection

location_name							Location name
location_id								Location ID code

population								Population size
mobility_mean							Percent change in mobility from baseline (mean)
mobility_obs							Indicator for whether mobility estimate comes from observed data (1) or modelled estimates (0)
testing_mean							Tests per 100,000 (mean estimate)
testing_lower							Tests per 100,000 (lower 95% confidence interval)
testing_upper							Tests per 100,000 (upper 95% confidence interval)
testing_obs								Indicator for whether testing estimate comes from observed data (1) or modelled estimates (0)
pneumonia_mean							Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location
pneumonia_obs							Indicator for whether pneumonia estimate comes from observed data (1) or modelled estimates (0)
mask_use_mean							Percent of population reporting always wearing a mask when leaving home
mask_use_obs							Indicator for whether mask estimate comes from observed data (1) or modelled estimates (0)
cumulative_all_vaccinated				Initially vaccinated (one dose of two doses)
cumulative_all_effectively_vaccinated	Effectively vaccinated (one and two dose with efficacy)
cumulative_all_fully_vaccinated			Fully vaccinated (one of one and†two†of two doses)
hospital_beds_mean						Daily COVID-19 hospital beds needed (mean estimate)
hospital_beds_upper						Daily COVID-19 hospital beds needed (upper 95% confidence interval)
hospital_beds_lower						Daily COVID-19 hospital beds needed (lower 95% confidence interval)
icu_beds_mean							Daily COVID-19 ICU beds needed (mean estimate)
icu_beds_upper							Daily COVID-19 ICU beds needed (upper 95% confidence interval)
icu_beds_lower							Daily COVID-19 ICU beds needed (lower 95% confidence interval)
admis_mean								Daily COVID-19 hospital admissions (mean estimate)
admis_upper								Daily COVID-19 hospital admissions (mean estimate)
admis_lower								Daily COVID-19 hospital admissions (mean estimate)
all_bed_capacity						Total number of beds that exist at a location
icu_bed_capacity						Total number of ICU beds that exist at a location


BY DEFINITION, THE FOLLOWING VARIABLES SHOULD NOT BE IDENTICAL ACROSS SCENARIOS:

mobility_mean

mask_use_mean

hospital_beds_mean
hospital_beds_upper
hospital_beds_lower
icu_beds_mean
icu_beds_upper
icu_beds_lower
admis_mean
admis_upper
admis_lower

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
infection_hospitalization				Infection hospitalization ratio

*/




**********************

* S1 Reference

use "data_download_file_reference_2020_21.dta", clear

rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S01
rename seir_cumulative_unscaled_lower TotDeaLoSmA02S01
rename seir_cumulative_unscaled_upper TotDeaUpSmA02S01
label var TotDeaMeSmA02S01 "Total Reported Deaths Mean smoothed IHME S1" // Cumulative reported deaths (mean estimate)
label var TotDeaLoSmA02S01 "Total Reported Deaths Lower smoothed IHME S1" // Cumulative reported deaths (lower 95% confidence interval)
label var TotDeaUpSmA02S01 "Total Reported Deaths Upper smoothed IHME S1" // Cumulative reported deaths (upper 95% confidence interval)

* Total Excess Deaths smoothed
rename seir_cumulative_mean  TotDeXMeSmA02S01
rename seir_cumulative_lower TotDeXLoSmA02S01
rename seir_cumulative_upper TotDeXUpSmA02S01
label var TotDeXMeSmA02S01 "Total Excess Deaths Mean smoothed IHME S1" // Cumulative excess deaths (mean estimate)
label var TotDeXLoSmA02S01 "Total Excess Deaths Lower smoothed IHME S1" // Cumulative excess deaths (lower 95% confidence interval)
label var TotDeXUpSmA02S01 "Total Excess Deaths Upper smoothed IHME S1" // Cumulative excess deaths (upper 95% confidence interval)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S01
rename seir_daily_unscaled_lower DayDeaLoSmA02S01
rename seir_daily_unscaled_upper DayDeaUpSmA02S01
label var DayDeaMeSmA02S01 "Daily Reported Deaths Mean smoothed IHME S1" // Daily reported deaths (mean estimate)
label var DayDeaLoSmA02S01 "Daily Reported Deaths Lower smoothed IHME S1" // Daily reported deaths (lower 95% confidence interval)
label var DayDeaUpSmA02S01 "Daily Reported Deaths Upper smoothed IHME S1" // Daily reported deaths upper 95% confidence interval)
	
* Daily Excess Deaths smoothed
rename seir_daily_mean  DayDeXMeSmA02S01
rename seir_daily_lower DayDeXLoSmA02S01
rename seir_daily_upper DayDeXUpSmA02S01
label var DayDeXMeSmA02S01 "Daily Excess Deaths Mean smoothed IHME S1" // Daily excess deaths (mean estimate)
label var DayDeXLoSmA02S01 "Daily Excess Deaths Lower smoothed IHME S1" // Daily excess deaths (lower 95% confidence interval)
label var DayDeXUpSmA02S01 "Daily Excess Deaths Upper smoothed IHME S1" // Daily excess deaths upper 95% confidence interval)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S01
rename inf_cuml_lower TotINFLoSmA02S01
rename inf_cuml_upper TotINFUpSmA02S01
label var TotINFMeSmA02S01 "Total infections Mean smoothed IHME S1" // Cumulative infections (mean estimate)
label var TotINFLoSmA02S01 "Total infections Lower smoothed IHME S1" // Cumulative infections (lower 95% confidence interval)
label var TotINFUpSmA02S01 "Total infections Upper smoothed IHME S1" // Cumulative infections (upper 95% confidence interval)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S01 // previously est_infections_mean
rename inf_lower DayINFLoSmA02S01 // previously est_infections_lower
rename inf_upper DayINFUpSmA02S01 // previously est_infections_upper
label var DayINFMeSmA02S01 "Daily infections Mean smoothed IHME S1" // Daily infections (mean estimate)
label var DayINFLoSmA02S01 "Daily infections Lower smoothed IHME S1" // Daily infections (lower 95% confidence interval)
label var DayINFUpSmA02S01 "Daily infections Upper smoothed IHME S1" // Daily infections (upper 95% confidence interval)





* other variables 

rename reff_mean reff_mean_A02S01
rename reff_lower reff_lower_A02S01
rename reff_upper reff_upper_A02S01
label var reff_mean "IHME R effective (mean estimate) S1"
label var reff_lower "IHME R effective (lower 95% confidence interval) S1"
label var reff_upper "IHME R effective (upper 95% confidence interval) S1"

rename cumulative_cases cumulative_cases_A02S01
rename cumulative_deaths cumulative_deaths_A02S01
rename cumulative_hospitalizations cumulative_hosp_A02S01
rename daily_deaths daily_deaths_A02S01
rename daily_infections daily_infections_A02S01
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S01
rename daily_deaths_unscaled dai_dea_unscaled_A02S01
label var cumulative_cases_A02S01 "IHME Cumulative cases (raw data) S1"
label var cumulative_deaths_A02S01 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S1"
label var cumulative_hosp_A02S01 "IHME Cumulative hospitalizations (raw data) S1"
label var daily_deaths_A02S01 "IHME Daily deaths (raw data with excess mortality scalar applied) S1"
label var daily_infections_A02S01 "IHME Daily infections (raw data)"
label var cumul_deaths_unscaled_A02S01 "IHME umulative deaths (raw data without excess mortality scalar applied) S1"
label var dai_dea_unscaled_A02S01 "IHME Daily deaths (raw data without excess mortality scalar applied) S1"

rename daily_infections dai_inf_A02S01
label var dai_inf_A02S01 "IHME Daily infections (raw data without excess mortality scalar applied)" // present in data, not present in data_dictionary.csv





* IDENTICAL ACROSS SCENARIOS:

label var population "IHME Population size"
label var mobility_obs "IHME Indicator for whether mobility estimate comes from observed data (1) or modelled estimates (0)"
label var testing_mean "IHME Tests per 100,000 (mean estimate)"
label var testing_lower "IHME Tests per 100,000 (lower 95% confidence interval)"
label var testing_upper "IHME Tests per 100,000 (upper 95% confidence interval)"
label var testing_obs "IHME Indicator for whether testing estimate comes from observed data (1) or modelled estimates (0)"
label var pneumonia_mean "IHME Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location"
label var pneumonia_obs "IHME Indicator for whether pneumonia estimate comes from observed data (1) or modelled estimates (0)"
label var mask_use_obs "IHME Indicator for whether mask estimate comes from observed data (1) or modelled estimates (0)"
label var cumulative_all_vaccinated	"IHME Initially vaccinated (one dose of two doses)"
label var cumulative_all_effectively_vacci "IHME Effectively vaccinated (one and two dose with efficacy)" // cumulative_all_effectively_vaccinated
label var cumulative_all_fully_vaccinated "IHME Fully vaccinated (one of one and†two†of two doses)"

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"


/*
BY DEFINITION, THE FOLLOWING VARIABLES SHOULD NOT BE IDENTICAL ACROSS SCENARIOS:

mobility_mean

mask_use_mean

hospital_beds_mean
hospital_beds_upper
hospital_beds_lower
icu_beds_mean
icu_beds_upper
icu_beds_lower
admis_mean
admis_upper
admis_lower

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
infection_hospitalization				Infection hospitalization ratio
*/


rename mobility_mean mobility_mean_A02S01
rename mask_use_mean mask_use_mean_A02S01
label var mobility_mean_A02S01 "IHME Percent change in mobility from baseline (mean)  S1"
label var mask_use_mean_A02S01 "IHME Percent of population reporting always wearing a mask when leaving home  S1"

rename hospital_beds_mean hospital_beds_mean_A02S01
rename hospital_beds_upper hospital_beds_upper_A02S01
rename hospital_beds_lower hospital_beds_lower_A02S01
rename icu_beds_mean icu_beds_mean_A02S01
rename icu_beds_upper icu_beds_upper_A02S01
rename icu_beds_lower icu_beds_lower_A02S01
rename admis_mean admis_mean_A02S01
rename admis_upper admis_upper_A02S01
rename admis_lower admis_lower_A02S01
label var hospital_beds_mean_A02S01 "IHME Daily COVID-19 hospital beds needed (mean estimate) S1"
label var hospital_beds_upper_A02S01 "IHME Daily COVID-19 hospital beds needed (upper 95% confidence interval) S1"
label var hospital_beds_lower_A02S01 "IHME Daily COVID-19 hospital beds needed (lower 95% confidence interval) S1"
label var icu_beds_mean_A02S01	"IHME Daily COVID-19 ICU beds needed (mean estimate) S1"
label var icu_beds_upper_A02S01 "IHME Daily COVID-19 ICU beds needed (upper 95% confidence interval) S1"
label var icu_beds_lower_A02S01 "IHME Daily COVID-19 ICU beds needed (lower 95% confidence interval) S1"
label var admis_mean_A02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"
label var admis_upper_A02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"
label var admis_lower_A02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"


rename infection_fatality infection_fatality_A02S01
rename infection_detection infection_detection_A02S01
rename infection_hospitalization infection_hospitalization_A02S01
label var infection_fatality_A02S01 "IHME Infection fatality ratio S1"
label var infection_detection_A02S01 "IHME Infection detection ratio S1"
label var infection_hospitalization_A02S01 "IHME Infection hospitalization ratio S1"






***********************
* rename convention  

/*

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

*

/*

no more allbed_* , hospital_beds_* instead 

rename allbed_mean		DayBedMeSmA02S01
rename allbed_lower		DayBedLoSmA02S01
rename allbed_upper		DayBedUpSmA02S01

label var DayBedMeSmA02S01 "Daily Beds needed Mean IHME S1"
label var DayBedLoSmA02S01 "Daily Beds needed Lower IHME S1"
label var DayBedUpSmA02S01 "Daily Beds needed Upper IHME S1"
*/


rename hospital_beds_mean_A02S01		DayBedMeSmA02S01
rename hospital_beds_upper_A02S01		DayBedLoSmA02S01
rename hospital_beds_lower_A02S01		DayBedUpSmA02S01

label var DayBedMeSmA02S01 "IHME Daily COVID-19 hospital beds needed (mean estimate) S1"
label var DayBedLoSmA02S01 "IHME Daily COVID-19 hospital beds needed (upper 95% confidence interval) S1"
label var DayBedUpSmA02S01 "IHME Daily COVID-19 hospital beds needed (lower 95% confidence interval) S1"

*

rename icu_beds_mean_A02S01			DayIcuMeSmA02S01
rename icu_beds_lower_A02S01		DayIcuLoSmA02S01
rename icu_beds_upper_A02S01		DayIcuUpSmA02S01

label var DayIcuMeSmA02S01"IHME Daily COVID-19 ICU beds needed (mean estimate) S1"
label var DayIcuLoSmA02S01 "IHME Daily COVID-19 ICU beds needed (upper 95% confidence interval) S1"
label var DayIcuUpSmA02S01 "IHME Daily COVID-19 ICU beds needed (lower 95% confidence interval) S1"


/*

no more invven_*

rename invven_mean		DayVenMeSmA02S01
rename invven_lower		DayVenLoSmA02S01
rename invven_upper		DayVenUpSmA02S01

label var DayVenMeSmA02S01 "Daily invasive Ventilation needed Mean IHME S1"
label var DayVenLoSmA02S01 "Daily invasive Ventilation needed Lower IHME S1"
label var DayVenUpSmA02S01 "Daily invasive Ventilation needed Upper IHME S1"
*/


rename admis_mean_A02S01		DayAdmMeSmA02S01
rename admis_lower_A02S01		DayAdmLoSmA02S01
rename admis_upper_A02S01		DayAdmUpSmA02S01

label var DayAdmMeSmA02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"
label var DayAdmLoSmA02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"
label var DayAdmUpSmA02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"


/*

no more newicu_*

rename newicu_mean		DayIcnMeSmA02S01
rename newicu_lower		DayIcnLoSmA02S01
rename newicu_upper		DayIcnUpSmA02S01

label var DayIcnMeSmA02S01 "Daily new people going to ICU Mean IHME S1"
label var DayIcnLoSmA02S01 "Daily new people going to ICU Lower IHME S1"
label var DayIcnUpSmA02S01 "Daily new people going to ICU Upper IHME S1"

*/



label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"




/* using IHME's seroprev_mean in covir2 codes is retired, 
after a number of on-and-offs of existence of this variable in released estimates files. 

rename seroprev_mean 		TotSerMeSmA02S01
rename seroprev_upper 		TotSerLoSmA02S01
rename seroprev_lower		TotSerUpSmA02S01

label var TotSerMeSmA02S01 "Total seroprevalence Mean IHME S1"
label var TotSerLoSmA02S01 "Total seroprevalence Lower IHME S1"
label var TotSerUpSmA02S01 "Total seroprevalence Upper IHME S1"
*/


order date location_name 

sort date location_name 

drop date_original version_name

save "Reference.dta", replace








**********************

* S2 Best

use "data_download_file_best_masks_2020_21.dta", clear


rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S02
rename seir_cumulative_unscaled_lower TotDeaLoSmA02S02
rename seir_cumulative_unscaled_upper TotDeaUpSmA02S02
label var TotDeaMeSmA02S02 "Total Reported Deaths Mean smoothed IHME S2" // Cumulative reported deaths (mean estimate)
label var TotDeaLoSmA02S02 "Total Reported Deaths Lower smoothed IHME S2" // Cumulative reported deaths (lower 95% confidence interval)
label var TotDeaUpSmA02S02 "Total Reported Deaths Upper smoothed IHME S2" // Cumulative reported deaths (upper 95% confidence interval)

* Total Excess Deaths smoothed
rename seir_cumulative_mean  TotDeXMeSmA02S02
rename seir_cumulative_lower TotDeXLoSmA02S02
rename seir_cumulative_upper TotDeXUpSmA02S02
label var TotDeXMeSmA02S02 "Total Excess Deaths Mean smoothed IHME S2" // Cumulative excess deaths (mean estimate)
label var TotDeXLoSmA02S02 "Total Excess Deaths Lower smoothed IHME S2" // Cumulative excess deaths (lower 95% confidence interval)
label var TotDeXUpSmA02S02 "Total Excess Deaths Upper smoothed IHME S2" // Cumulative excess deaths (upper 95% confidence interval)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S02
rename seir_daily_unscaled_lower DayDeaLoSmA02S02
rename seir_daily_unscaled_upper DayDeaUpSmA02S02
label var DayDeaMeSmA02S02 "Daily Reported Deaths Mean smoothed IHME S2" // Daily reported deaths (mean estimate)
label var DayDeaLoSmA02S02 "Daily Reported Deaths Lower smoothed IHME S2" // Daily reported deaths (lower 95% confidence interval)
label var DayDeaUpSmA02S02 "Daily Reported Deaths Upper smoothed IHME S2" // Daily reported deaths upper 95% confidence interval)
	
* Daily Excess Deaths smoothed
rename seir_daily_mean  DayDeXMeSmA02S02
rename seir_daily_lower DayDeXLoSmA02S02
rename seir_daily_upper DayDeXUpSmA02S02
label var DayDeXMeSmA02S02 "Daily Excess Deaths Mean smoothed IHME S2" // Daily excess deaths (mean estimate)
label var DayDeXLoSmA02S02 "Daily Excess Deaths Lower smoothed IHME S2" // Daily excess deaths (lower 95% confidence interval)
label var DayDeXUpSmA02S02 "Daily Excess Deaths Upper smoothed IHME S2" // Daily excess deaths upper 95% confidence interval)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S02
rename inf_cuml_lower TotINFLoSmA02S02
rename inf_cuml_upper TotINFUpSmA02S02
label var TotINFMeSmA02S02 "Total infections Mean smoothed IHME S2" // Cumulative infections (mean estimate)
label var TotINFLoSmA02S02 "Total infections Lower smoothed IHME S2" // Cumulative infections (lower 95% confidence interval)
label var TotINFUpSmA02S02 "Total infections Upper smoothed IHME S2" // Cumulative infections (upper 95% confidence interval)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S02 // previously est_infections_mean
rename inf_lower DayINFLoSmA02S02 // previously est_infections_lower
rename inf_upper DayINFUpSmA02S02 // previously est_infections_upper
label var DayINFMeSmA02S02 "Daily infections Mean smoothed IHME S2" // Daily infections (mean estimate)
label var DayINFLoSmA02S02 "Daily infections Lower smoothed IHME S2" // Daily infections (lower 95% confidence interval)
label var DayINFUpSmA02S02 "Daily infections Upper smoothed IHME S2" // Daily infections (upper 95% confidence interval)





* other variables 

rename reff_mean reff_mean_A02S02
rename reff_lower reff_lower_A02S02
rename reff_upper reff_upper_A02S02
label var reff_mean "IHME R effective (mean estimate) S2"
label var reff_lower "IHME R effective (lower 95% confidence interval) S2"
label var reff_upper "IHME R effective (upper 95% confidence interval) S2"

rename cumulative_cases cumulative_cases_A02S02
rename cumulative_deaths cumulative_deaths_A02S02
rename cumulative_hospitalizations cumulative_hosp_A02S02
rename daily_deaths daily_deaths_A02S02
rename daily_infections daily_infections_A02S02
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S02
rename daily_deaths_unscaled dai_dea_unscaled_A02S02
label var cumulative_cases_A02S02 "IHME Cumulative cases (raw data) S2"
label var cumulative_deaths_A02S02 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S2"
label var cumulative_hosp_A02S02 "IHME Cumulative hospitalizations (raw data) S2"
label var daily_deaths_A02S02 "IHME Daily deaths (raw data with excess mortality scalar applied) S2"
label var daily_infections_A02S02 "IHME Daily infections (raw data)"
label var cumul_deaths_unscaled_A02S02 "IHME umulative deaths (raw data without excess mortality scalar applied) S2"
label var dai_dea_unscaled_A02S02 "IHME Daily deaths (raw data without excess mortality scalar applied) S2"

rename daily_infections dai_inf_A02S02
label var dai_inf_A02S02 "IHME Daily infections (raw data without excess mortality scalar applied)" // present in data, not present in data_dictionary.csv





* IDENTICAL ACROSS SCENARIOS:

label var population "IHME Population size"
label var mobility_obs "IHME Indicator for whether mobility estimate comes from observed data (1) or modelled estimates (0)"
label var testing_mean "IHME Tests per 100,000 (mean estimate)"
label var testing_lower "IHME Tests per 100,000 (lower 95% confidence interval)"
label var testing_upper "IHME Tests per 100,000 (upper 95% confidence interval)"
label var testing_obs "IHME Indicator for whether testing estimate comes from observed data (1) or modelled estimates (0)"
label var pneumonia_mean "IHME Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location"
label var pneumonia_obs "IHME Indicator for whether pneumonia estimate comes from observed data (1) or modelled estimates (0)"
label var mask_use_obs "IHME Indicator for whether mask estimate comes from observed data (1) or modelled estimates (0)"
label var cumulative_all_vaccinated	"IHME Initially vaccinated (one dose of two doses)"
label var cumulative_all_effectively_vacci "IHME Effectively vaccinated (one and two dose with efficacy)" // cumulative_all_effectively_vaccinated
label var cumulative_all_fully_vaccinated "IHME Fully vaccinated (one of one and†two†of two doses)"

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"


/*
BY DEFINITION, THE FOLLOWING VARIABLES SHOULD NOT BE IDENTICAL ACROSS SCENARIOS:

mobility_mean

mask_use_mean

hospital_beds_mean
hospital_beds_upper
hospital_beds_lower
icu_beds_mean
icu_beds_upper
icu_beds_lower
admis_mean
admis_upper
admis_lower

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
infection_hospitalization				Infection hospitalization ratio
*/


rename mobility_mean mobility_mean_A02S02
rename mask_use_mean mask_use_mean_A02S02
label var mobility_mean_A02S02 "IHME Percent change in mobility from baseline (mean) S2"
label var mask_use_mean_A02S02 "IHME Percent of population reporting always wearing a mask when leaving home S2"

rename hospital_beds_mean hospital_beds_mean_A02S02
rename hospital_beds_upper hospital_beds_upper_A02S02
rename hospital_beds_lower hospital_beds_lower_A02S02
rename icu_beds_mean icu_beds_mean_A02S02
rename icu_beds_upper icu_beds_upper_A02S02
rename icu_beds_lower icu_beds_lower_A02S02
rename admis_mean admis_mean_A02S02
rename admis_upper admis_upper_A02S02
rename admis_lower admis_lower_A02S02
label var hospital_beds_mean_A02S02 "IHME Daily COVID-19 hospital beds needed (mean estimate) S2"
label var hospital_beds_upper_A02S02 "IHME Daily COVID-19 hospital beds needed (upper 95% confidence interval) S2"
label var hospital_beds_lower_A02S02 "IHME Daily COVID-19 hospital beds needed (lower 95% confidence interval) S2"
label var icu_beds_mean_A02S02	"IHME Daily COVID-19 ICU beds needed (mean estimate) S2"
label var icu_beds_upper_A02S02 "IHME Daily COVID-19 ICU beds needed (upper 95% confidence interval) S2"
label var icu_beds_lower_A02S02 "IHME Daily COVID-19 ICU beds needed (lower 95% confidence interval) S2"
label var admis_mean_A02S02 "IHME Daily COVID-19 hospital admissions (mean estimate) S2"
label var admis_upper_A02S02 "IHME Daily COVID-19 hospital admissions (mean estimate) S2"
label var admis_lower_A02S02 "IHME Daily COVID-19 hospital admissions (mean estimate) S2"


rename infection_fatality infection_fatality_A02S02
rename infection_detection infection_detection_A02S02
rename infection_hospitalization infection_hospitalization_A02S02
label var infection_fatality_A02S02 "IHME Infection fatality ratio S2"
label var infection_detection_A02S02 "IHME Infection detection ratio S2"
label var infection_hospitalization_A02S02 "IHME Infection hospitalization ratio S2"





*

rename hospital_beds_mean_A02S02		DayBedMeSmA02S02
rename hospital_beds_upper_A02S02		DayBedLoSmA02S02
rename hospital_beds_lower_A02S02		DayBedUpSmA02S02

label var DayBedMeSmA02S02 "IHME Daily COVID-19 hospital beds needed (mean estimate) S2"
label var DayBedLoSmA02S02 "IHME Daily COVID-19 hospital beds needed (upper 95% confidence interval) S2"
label var DayBedUpSmA02S02 "IHME Daily COVID-19 hospital beds needed (lower 95% confidence interval) S2"

*

rename icu_beds_mean_A02S02			DayIcuMeSmA02S02
rename icu_beds_lower_A02S02		DayIcuLoSmA02S02
rename icu_beds_upper_A02S02		DayIcuUpSmA02S02

label var DayIcuMeSmA02S02"IHME Daily COVID-19 ICU beds needed (mean estimate) S2"
label var DayIcuLoSmA02S02 "IHME Daily COVID-19 ICU beds needed (upper 95% confidence interval) S2"
label var DayIcuUpSmA02S02 "IHME Daily COVID-19 ICU beds needed (lower 95% confidence interval) S2"

*

rename admis_mean_A02S02		DayAdmMeSmA02S02
rename admis_lower_A02S02		DayAdmLoSmA02S02
rename admis_upper_A02S02		DayAdmUpSmA02S02

label var DayAdmMeSmA02S02 "IHME Daily COVID-19 hospital admissions (mean estimate) S2"
label var DayAdmLoSmA02S02 "IHME Daily COVID-19 hospital admissions (mean estimate) S2"
label var DayAdmUpSmA02S02 "IHME Daily COVID-19 hospital admissions (mean estimate) S2"

*

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02 
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"





order date location_name 

sort date location_name 

drop date_original version_name


save "Best.dta", replace








**********************

* S3 Worse

use "data_download_file_severe_omicron_2020_21.dta", clear



rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S03
rename seir_cumulative_unscaled_lower TotDeaLoSmA02S03
rename seir_cumulative_unscaled_upper TotDeaUpSmA02S03
label var TotDeaMeSmA02S03 "Total Reported Deaths Mean smoothed IHME S3" // Cumulative reported deaths (mean estimate)
label var TotDeaLoSmA02S03 "Total Reported Deaths Lower smoothed IHME S3" // Cumulative reported deaths (lower 95% confidence interval)
label var TotDeaUpSmA02S03 "Total Reported Deaths Upper smoothed IHME S3" // Cumulative reported deaths (upper 95% confidence interval)

* Total Excess Deaths smoothed
rename seir_cumulative_mean  TotDeXMeSmA02S03
rename seir_cumulative_lower TotDeXLoSmA02S03
rename seir_cumulative_upper TotDeXUpSmA02S03
label var TotDeXMeSmA02S03 "Total Excess Deaths Mean smoothed IHME S3" // Cumulative excess deaths (mean estimate)
label var TotDeXLoSmA02S03 "Total Excess Deaths Lower smoothed IHME S3" // Cumulative excess deaths (lower 95% confidence interval)
label var TotDeXUpSmA02S03 "Total Excess Deaths Upper smoothed IHME S3" // Cumulative excess deaths (upper 95% confidence interval)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S03
rename seir_daily_unscaled_lower DayDeaLoSmA02S03
rename seir_daily_unscaled_upper DayDeaUpSmA02S03
label var DayDeaMeSmA02S03 "Daily Reported Deaths Mean smoothed IHME S3" // Daily reported deaths (mean estimate)
label var DayDeaLoSmA02S03 "Daily Reported Deaths Lower smoothed IHME S3" // Daily reported deaths (lower 95% confidence interval)
label var DayDeaUpSmA02S03 "Daily Reported Deaths Upper smoothed IHME S3" // Daily reported deaths upper 95% confidence interval)
	
* Daily Excess Deaths smoothed
rename seir_daily_mean  DayDeXMeSmA02S03
rename seir_daily_lower DayDeXLoSmA02S03
rename seir_daily_upper DayDeXUpSmA02S03
label var DayDeXMeSmA02S03 "Daily Excess Deaths Mean smoothed IHME S3" // Daily excess deaths (mean estimate)
label var DayDeXLoSmA02S03 "Daily Excess Deaths Lower smoothed IHME S3" // Daily excess deaths (lower 95% confidence interval)
label var DayDeXUpSmA02S03 "Daily Excess Deaths Upper smoothed IHME S3" // Daily excess deaths upper 95% confidence interval)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S03
rename inf_cuml_lower TotINFLoSmA02S03
rename inf_cuml_upper TotINFUpSmA02S03
label var TotINFMeSmA02S03 "Total infections Mean smoothed IHME S3" // Cumulative infections (mean estimate)
label var TotINFLoSmA02S03 "Total infections Lower smoothed IHME S3" // Cumulative infections (lower 95% confidence interval)
label var TotINFUpSmA02S03 "Total infections Upper smoothed IHME S3" // Cumulative infections (upper 95% confidence interval)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S03 // previously est_infections_mean
rename inf_lower DayINFLoSmA02S03 // previously est_infections_lower
rename inf_upper DayINFUpSmA02S03 // previously est_infections_upper
label var DayINFMeSmA02S03 "Daily infections Mean smoothed IHME S3" // Daily infections (mean estimate)
label var DayINFLoSmA02S03 "Daily infections Lower smoothed IHME S3" // Daily infections (lower 95% confidence interval)
label var DayINFUpSmA02S03 "Daily infections Upper smoothed IHME S3" // Daily infections (upper 95% confidence interval)





* other variables 

rename reff_mean reff_mean_A02S03
rename reff_lower reff_lower_A02S03
rename reff_upper reff_upper_A02S03
label var reff_mean "IHME R effective (mean estimate) S3"
label var reff_lower "IHME R effective (lower 95% confidence interval) S3"
label var reff_upper "IHME R effective (upper 95% confidence interval) S3"

rename cumulative_cases cumulative_cases_A02S03
rename cumulative_deaths cumulative_deaths_A02S03
rename cumulative_hospitalizations cumulative_hosp_A02S03
rename daily_deaths daily_deaths_A02S03
rename daily_infections daily_infections_A02S03
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S03
rename daily_deaths_unscaled dai_dea_unscaled_A02S03
label var cumulative_cases_A02S03 "IHME Cumulative cases (raw data) S3"
label var cumulative_deaths_A02S03 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S3"
label var cumulative_hosp_A02S03 "IHME Cumulative hospitalizations (raw data) S3"
label var daily_deaths_A02S03 "IHME Daily deaths (raw data with excess mortality scalar applied) S3"
label var daily_infections_A02S03 "IHME Daily infections (raw data)"
label var cumul_deaths_unscaled_A02S03 "IHME umulative deaths (raw data without excess mortality scalar applied) S3"
label var dai_dea_unscaled_A02S03 "IHME Daily deaths (raw data without excess mortality scalar applied) S3"

rename daily_infections dai_inf_A02S03
label var dai_inf_A02S03 "IHME Daily infections (raw data without excess mortality scalar applied)" // present in data, not present in data_dictionary.csv





* IDENTICAL ACROSS SCENARIOS:

label var population "IHME Population size"
label var mobility_obs "IHME Indicator for whether mobility estimate comes from observed data (1) or modelled estimates (0)"
label var testing_mean "IHME Tests per 100,000 (mean estimate)"
label var testing_lower "IHME Tests per 100,000 (lower 95% confidence interval)"
label var testing_upper "IHME Tests per 100,000 (upper 95% confidence interval)"
label var testing_obs "IHME Indicator for whether testing estimate comes from observed data (1) or modelled estimates (0)"
label var pneumonia_mean "IHME Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location"
label var pneumonia_obs "IHME Indicator for whether pneumonia estimate comes from observed data (1) or modelled estimates (0)"
label var mask_use_obs "IHME Indicator for whether mask estimate comes from observed data (1) or modelled estimates (0)"
label var cumulative_all_vaccinated	"IHME Initially vaccinated (one dose of two doses)"
label var cumulative_all_effectively_vacci "IHME Effectively vaccinated (one and two dose with efficacy)" // cumulative_all_effectively_vaccinated
label var cumulative_all_fully_vaccinated "IHME Fully vaccinated (one of one and†two†of two doses)"

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"


/*
BY DEFINITION, THE FOLLOWING VARIABLES SHOULD NOT BE IDENTICAL ACROSS SCENARIOS:

mobility_mean

mask_use_mean

hospital_beds_mean
hospital_beds_upper
hospital_beds_lower
icu_beds_mean
icu_beds_upper
icu_beds_lower
admis_mean
admis_upper
admis_lower

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
infection_hospitalization				Infection hospitalization ratio
*/


rename mobility_mean mobility_mean_A02S03
rename mask_use_mean mask_use_mean_A02S03
label var mobility_mean_A02S03 "IHME Percent change in mobility from baseline (mean) S3"
label var mask_use_mean_A02S03 "IHME Percent of population reporting always wearing a mask when leaving home S3"

rename hospital_beds_mean hospital_beds_mean_A02S03
rename hospital_beds_upper hospital_beds_upper_A02S03
rename hospital_beds_lower hospital_beds_lower_A02S03
rename icu_beds_mean icu_beds_mean_A02S03
rename icu_beds_upper icu_beds_upper_A02S03
rename icu_beds_lower icu_beds_lower_A02S03
rename admis_mean admis_mean_A02S03
rename admis_upper admis_upper_A02S03
rename admis_lower admis_lower_A02S03
label var hospital_beds_mean_A02S03 "IHME Daily COVID-19 hospital beds needed (mean estimate) S3"
label var hospital_beds_upper_A02S03 "IHME Daily COVID-19 hospital beds needed (upper 95% confidence interval) S3"
label var hospital_beds_lower_A02S03 "IHME Daily COVID-19 hospital beds needed (lower 95% confidence interval) S3"
label var icu_beds_mean_A02S03	"IHME Daily COVID-19 ICU beds needed (mean estimate) S3"
label var icu_beds_upper_A02S03 "IHME Daily COVID-19 ICU beds needed (upper 95% confidence interval) S3"
label var icu_beds_lower_A02S03 "IHME Daily COVID-19 ICU beds needed (lower 95% confidence interval) S3"
label var admis_mean_A02S03 "IHME Daily COVID-19 hospital admissions (mean estimate) S3"
label var admis_upper_A02S03 "IHME Daily COVID-19 hospital admissions (mean estimate) S3"
label var admis_lower_A02S03 "IHME Daily COVID-19 hospital admissions (mean estimate) S3"


rename infection_fatality infection_fatality_A02S03
rename infection_detection infection_detection_A02S03
rename infection_hospitalization infection_hospitalization_A02S03
label var infection_fatality_A02S03 "IHME Infection fatality ratio S3"
label var infection_detection_A02S03 "IHME Infection detection ratio S3"
label var infection_hospitalization_A02S03 "IHME Infection hospitalization ratio S3"





*

rename hospital_beds_mean_A02S03		DayBedMeSmA02S03
rename hospital_beds_upper_A02S03		DayBedLoSmA02S03
rename hospital_beds_lower_A02S03		DayBedUpSmA02S03

label var DayBedMeSmA02S03 "IHME Daily COVID-19 hospital beds needed (mean estimate) S3"
label var DayBedLoSmA02S03 "IHME Daily COVID-19 hospital beds needed (upper 95% confidence interval) S3"
label var DayBedUpSmA02S03 "IHME Daily COVID-19 hospital beds needed (lower 95% confidence interval) S3"

*

rename icu_beds_mean_A02S03			DayIcuMeSmA02S03
rename icu_beds_lower_A02S03		DayIcuLoSmA02S03
rename icu_beds_upper_A02S03		DayIcuUpSmA02S03

label var DayIcuMeSmA02S03"IHME Daily COVID-19 ICU beds needed (mean estimate) S3"
label var DayIcuLoSmA02S03 "IHME Daily COVID-19 ICU beds needed (upper 95% confidence interval) S3"
label var DayIcuUpSmA02S03 "IHME Daily COVID-19 ICU beds needed (lower 95% confidence interval) S3"

*

rename admis_mean_A02S03		DayAdmMeSmA02S03
rename admis_lower_A02S03		DayAdmLoSmA02S03
rename admis_upper_A02S03		DayAdmUpSmA02S03

label var DayAdmMeSmA02S03 "IHME Daily COVID-19 hospital admissions (mean estimate) S3"
label var DayAdmLoSmA02S03 "IHME Daily COVID-19 hospital admissions (mean estimate) S3"
label var DayAdmUpSmA02S03 "IHME Daily COVID-19 hospital admissions (mean estimate) S3"

*

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02 
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"





order date location_name 

sort date location_name 

drop date_original version_name


save "Worse.dta", replace


 
 
 
 
 

**********************

* S4 Second best [Third dose] 

use "data_download_file_third_dose_2020_21.dta", clear



rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S04
rename seir_cumulative_unscaled_lower TotDeaLoSmA02S04
rename seir_cumulative_unscaled_upper TotDeaUpSmA02S04
label var TotDeaMeSmA02S04 "Total Reported Deaths Mean smoothed IHME S4" // Cumulative reported deaths (mean estimate)
label var TotDeaLoSmA02S04 "Total Reported Deaths Lower smoothed IHME S4" // Cumulative reported deaths (lower 95% confidence interval)
label var TotDeaUpSmA02S04 "Total Reported Deaths Upper smoothed IHME S4" // Cumulative reported deaths (upper 95% confidence interval)

* Total Excess Deaths smoothed
rename seir_cumulative_mean  TotDeXMeSmA02S04
rename seir_cumulative_lower TotDeXLoSmA02S04
rename seir_cumulative_upper TotDeXUpSmA02S04
label var TotDeXMeSmA02S04 "Total Excess Deaths Mean smoothed IHME S4" // Cumulative excess deaths (mean estimate)
label var TotDeXLoSmA02S04 "Total Excess Deaths Lower smoothed IHME S4" // Cumulative excess deaths (lower 95% confidence interval)
label var TotDeXUpSmA02S04 "Total Excess Deaths Upper smoothed IHME S4" // Cumulative excess deaths (upper 95% confidence interval)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S04
rename seir_daily_unscaled_lower DayDeaLoSmA02S04
rename seir_daily_unscaled_upper DayDeaUpSmA02S04
label var DayDeaMeSmA02S04 "Daily Reported Deaths Mean smoothed IHME S4" // Daily reported deaths (mean estimate)
label var DayDeaLoSmA02S04 "Daily Reported Deaths Lower smoothed IHME S4" // Daily reported deaths (lower 95% confidence interval)
label var DayDeaUpSmA02S04 "Daily Reported Deaths Upper smoothed IHME S4" // Daily reported deaths upper 95% confidence interval)
	
* Daily Excess Deaths smoothed
rename seir_daily_mean  DayDeXMeSmA02S04
rename seir_daily_lower DayDeXLoSmA02S04
rename seir_daily_upper DayDeXUpSmA02S04
label var DayDeXMeSmA02S04 "Daily Excess Deaths Mean smoothed IHME S4" // Daily excess deaths (mean estimate)
label var DayDeXLoSmA02S04 "Daily Excess Deaths Lower smoothed IHME S4" // Daily excess deaths (lower 95% confidence interval)
label var DayDeXUpSmA02S04 "Daily Excess Deaths Upper smoothed IHME S4" // Daily excess deaths upper 95% confidence interval)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S04
rename inf_cuml_lower TotINFLoSmA02S04
rename inf_cuml_upper TotINFUpSmA02S04
label var TotINFMeSmA02S04 "Total infections Mean smoothed IHME S4" // Cumulative infections (mean estimate)
label var TotINFLoSmA02S04 "Total infections Lower smoothed IHME S4" // Cumulative infections (lower 95% confidence interval)
label var TotINFUpSmA02S04 "Total infections Upper smoothed IHME S4" // Cumulative infections (upper 95% confidence interval)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S04 // previously est_infections_mean
rename inf_lower DayINFLoSmA02S04 // previously est_infections_lower
rename inf_upper DayINFUpSmA02S04 // previously est_infections_upper
label var DayINFMeSmA02S04 "Daily infections Mean smoothed IHME S4" // Daily infections (mean estimate)
label var DayINFLoSmA02S04 "Daily infections Lower smoothed IHME S4" // Daily infections (lower 95% confidence interval)
label var DayINFUpSmA02S04 "Daily infections Upper smoothed IHME S4" // Daily infections (upper 95% confidence interval)





* other variables 

rename reff_mean reff_mean_A02S04
rename reff_lower reff_lower_A02S04
rename reff_upper reff_upper_A02S04
label var reff_mean_A02S04 "IHME R effective (mean estimate) S4"
label var reff_lower_A02S04 "IHME R effective (lower 95% confidence interval) S4"
label var reff_upper_A02S04 "IHME R effective (upper 95% confidence interval) S4"

rename cumulative_cases cumulative_cases_A02S04
rename cumulative_deaths cumulative_deaths_A02S04
rename cumulative_hospitalizations cumulative_hosp_A02S04
rename daily_deaths daily_deaths_A02S04
rename daily_infections daily_infections_A02S04
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S04
rename daily_deaths_unscaled dai_dea_unscaled_A02S04
label var cumulative_cases_A02S04 "IHME Cumulative cases (raw data) S4"
label var cumulative_deaths_A02S04 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S4"
label var cumulative_hosp_A02S04 "IHME Cumulative hospitalizations (raw data) S4"
label var daily_deaths_A02S04 "IHME Daily deaths (raw data with excess mortality scalar applied) S4"
label var daily_infections_A02S04 "IHME Daily infections (raw data)"
label var cumul_deaths_unscaled_A02S04 "IHME umulative deaths (raw data without excess mortality scalar applied) S4"
label var dai_dea_unscaled_A02S04 "IHME Daily deaths (raw data without excess mortality scalar applied) S4"






* IDENTICAL ACROSS SCENARIOS:

label var population "IHME Population size"
label var mobility_obs "IHME Indicator for whether mobility estimate comes from observed data (1) or modelled estimates (0)"
label var testing_mean "IHME Tests per 100,000 (mean estimate)"
label var testing_lower "IHME Tests per 100,000 (lower 95% confidence interval)"
label var testing_upper "IHME Tests per 100,000 (upper 95% confidence interval)"
label var testing_obs "IHME Indicator for whether testing estimate comes from observed data (1) or modelled estimates (0)"
label var pneumonia_mean "IHME Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location"
label var pneumonia_obs "IHME Indicator for whether pneumonia estimate comes from observed data (1) or modelled estimates (0)"
label var mask_use_obs "IHME Indicator for whether mask estimate comes from observed data (1) or modelled estimates (0)"
rename cumulative_all_vaccinated cumul_vax
rename cumulative_all_effectively_vacci cumul_effective_vax
rename cumulative_all_fully_vaccinated cumul_fully_vax
label var cumul_vax	"IHME Initially vaccinated (one dose of two doses)"
label var cumul_effective_vax "IHME Effectively vaccinated (one and two dose with efficacy)" // cumulative_all_effectively_vaccinated
label var cumul_fully_vax "IHME Fully vaccinated (one of one and†two†of two doses)"

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"


/*
BY DEFINITION, THE FOLLOWING VARIABLES SHOULD NOT BE IDENTICAL ACROSS SCENARIOS:

mobility_mean

mask_use_mean

hospital_beds_mean
hospital_beds_upper
hospital_beds_lower
icu_beds_mean
icu_beds_upper
icu_beds_lower
admis_mean
admis_upper
admis_lower

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
inf_hosp				Infection hospitalization ratio
*/


rename mobility_mean mobility_mean_A02S04
rename mask_use_mean mask_use_mean_A02S04
label var mobility_mean_A02S04 "IHME Percent change in mobility from baseline (mean) S4"
label var mask_use_mean_A02S04 "IHME Percent of population reporting always wearing a mask when leaving home S4"

rename hospital_beds_mean hospital_beds_mean_A02S04
rename hospital_beds_upper hospital_beds_upper_A02S04
rename hospital_beds_lower hospital_beds_lower_A02S04
rename icu_beds_mean icu_beds_mean_A02S04
rename icu_beds_upper icu_beds_upper_A02S04
rename icu_beds_lower icu_beds_lower_A02S04
rename admis_mean admis_mean_A02S04
rename admis_upper admis_upper_A02S04
rename admis_lower admis_lower_A02S04
label var hospital_beds_mean_A02S04 "IHME Daily C-19 hospital beds needed (mean estimate) S4"
label var hospital_beds_upper_A02S04 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S4"
label var hospital_beds_lower_A02S04 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S4"
label var icu_beds_mean_A02S04	"IHME Daily C-19 ICU beds needed (mean estimate) S4"
label var icu_beds_upper_A02S04 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S4"
label var icu_beds_lower_A02S04 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S4"
label var admis_mean_A02S04 "IHME Daily C-19 hospital admissions (mean estimate) S4"
label var admis_upper_A02S04 "IHME Daily C-19 hospital admissions (mean estimate) S4"
label var admis_lower_A02S04 "IHME Daily C-19 hospital admissions (mean estimate) S4"


rename infection_fatality infection_fatality_A02S04
rename infection_detection infection_detection_A02S04
rename infection_hospitalization inf_hosp_A02S04
label var infection_fatality_A02S04 "IHME Infection fatality ratio S4"
label var infection_detection_A02S04 "IHME Infection detection ratio S4"
label var inf_hosp_A02S04 "IHME Infection hospitalization ratio S4"





*

rename hospital_beds_mean_A02S04		DayBedMeSmA02S04
rename hospital_beds_upper_A02S04		DayBedLoSmA02S04
rename hospital_beds_lower_A02S04		DayBedUpSmA02S04

label var DayBedMeSmA02S04 "IHME Daily C-19 hospital beds needed (mean estimate) S4"
label var DayBedLoSmA02S04 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S4"
label var DayBedUpSmA02S04 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S4"

*

rename icu_beds_mean_A02S04			DayIcuMeSmA02S04
rename icu_beds_lower_A02S04		DayIcuLoSmA02S04
rename icu_beds_upper_A02S04		DayIcuUpSmA02S04

label var DayIcuMeSmA02S04"IHME Daily C-19 ICU beds needed (mean estimate) S4"
label var DayIcuLoSmA02S04 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S4"
label var DayIcuUpSmA02S04 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S4"

*

rename admis_mean_A02S04		DayAdmMeSmA02S04
rename admis_lower_A02S04		DayAdmLoSmA02S04
rename admis_upper_A02S04		DayAdmUpSmA02S04

label var DayAdmMeSmA02S04 "IHME Daily C-19 hospital admissions (mean estimate) S4"
label var DayAdmLoSmA02S04 "IHME Daily C-19 hospital admissions (mean estimate) S4"
label var DayAdmUpSmA02S04 "IHME Daily C-19 hospital admissions (mean estimate) S4"

*

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02 
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"





order date location_name 

sort date location_name 

drop date_original version_name


save "2nd best is 3rd dose.dta", replace

 
 
 
 
 
 
 

**********************

* S5 Third best [Reduced vaccine hesitancy]

use "data_download_file_reduce_hesitancy_2020_21.dta", clear



rename date date_original
gen year = substr(date_original,1,4) 
gen month = substr(date_original,6,2) 
gen day = substr(date_original,9,2) 
egen date2 = concat(day month year)
gen date = date(date2, "DMY", 2050)
format date %tdDDMonCCYY
codebook date
drop year month day date2



* rename variables

* Total Reported Deaths smoothed
rename seir_cumulative_unscaled_mean  TotDeaMeSmA02S05
rename seir_cumulative_unscaled_lower TotDeaLoSmA02S05
rename seir_cumulative_unscaled_upper TotDeaUpSmA02S05
label var TotDeaMeSmA02S05 "Total Reported Deaths Mean smoothed IHME S5" // Cumulative reported deaths (mean estimate)
label var TotDeaLoSmA02S05 "Total Reported Deaths Lower smoothed IHME S5" // Cumulative reported deaths (lower 95% confidence interval)
label var TotDeaUpSmA02S05 "Total Reported Deaths Upper smoothed IHME S5" // Cumulative reported deaths (upper 95% confidence interval)

* Total Excess Deaths smoothed
rename seir_cumulative_mean  TotDeXMeSmA02S05
rename seir_cumulative_lower TotDeXLoSmA02S05
rename seir_cumulative_upper TotDeXUpSmA02S05
label var TotDeXMeSmA02S05 "Total Excess Deaths Mean smoothed IHME S5" // Cumulative excess deaths (mean estimate)
label var TotDeXLoSmA02S05 "Total Excess Deaths Lower smoothed IHME S5" // Cumulative excess deaths (lower 95% confidence interval)
label var TotDeXUpSmA02S05 "Total Excess Deaths Upper smoothed IHME S5" // Cumulative excess deaths (upper 95% confidence interval)

* Daily Reported Deaths smoothed
rename seir_daily_unscaled_mean  DayDeaMeSmA02S05
rename seir_daily_unscaled_lower DayDeaLoSmA02S05
rename seir_daily_unscaled_upper DayDeaUpSmA02S05
label var DayDeaMeSmA02S05 "Daily Reported Deaths Mean smoothed IHME S5" // Daily reported deaths (mean estimate)
label var DayDeaLoSmA02S05 "Daily Reported Deaths Lower smoothed IHME S5" // Daily reported deaths (lower 95% confidence interval)
label var DayDeaUpSmA02S05 "Daily Reported Deaths Upper smoothed IHME S5" // Daily reported deaths upper 95% confidence interval)
	
* Daily Excess Deaths smoothed
rename seir_daily_mean  DayDeXMeSmA02S05
rename seir_daily_lower DayDeXLoSmA02S05
rename seir_daily_upper DayDeXUpSmA02S05
label var DayDeXMeSmA02S05 "Daily Excess Deaths Mean smoothed IHME S5" // Daily excess deaths (mean estimate)
label var DayDeXLoSmA02S05 "Daily Excess Deaths Lower smoothed IHME S5" // Daily excess deaths (lower 95% confidence interval)
label var DayDeXUpSmA02S05 "Daily Excess Deaths Upper smoothed IHME S5" // Daily excess deaths upper 95% confidence interval)
		
* Total infections smoothed
rename inf_cuml_mean  TotINFMeSmA02S05
rename inf_cuml_lower TotINFLoSmA02S05
rename inf_cuml_upper TotINFUpSmA02S05
label var TotINFMeSmA02S05 "Total infections Mean smoothed IHME S5" // Cumulative infections (mean estimate)
label var TotINFLoSmA02S05 "Total infections Lower smoothed IHME S5" // Cumulative infections (lower 95% confidence interval)
label var TotINFUpSmA02S05 "Total infections Upper smoothed IHME S5" // Cumulative infections (upper 95% confidence interval)

* Daily infections smoothed
rename inf_mean  DayINFMeSmA02S05 // previously est_infections_mean
rename inf_lower DayINFLoSmA02S05 // previously est_infections_lower
rename inf_upper DayINFUpSmA02S05 // previously est_infections_upper
label var DayINFMeSmA02S05 "Daily infections Mean smoothed IHME S5" // Daily infections (mean estimate)
label var DayINFLoSmA02S05 "Daily infections Lower smoothed IHME S5" // Daily infections (lower 95% confidence interval)
label var DayINFUpSmA02S05 "Daily infections Upper smoothed IHME S5" // Daily infections (upper 95% confidence interval)





* other variables 

rename reff_mean reff_mean_A02S05
rename reff_lower reff_lower_A02S05
rename reff_upper reff_upper_A02S05
label var reff_mean_A02S05 "IHME R effective (mean estimate) S5"
label var reff_lower_A02S05 "IHME R effective (lower 95% confidence interval) S5"
label var reff_upper_A02S05 "IHME R effective (upper 95% confidence interval) S5"

rename cumulative_cases cumulative_cases_A02S05
rename cumulative_deaths cumulative_deaths_A02S05
rename cumulative_hospitalizations cumulative_hosp_A02S05
rename daily_deaths daily_deaths_A02S05
rename daily_infections daily_infections_A02S05
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S05
rename daily_deaths_unscaled dai_dea_unscaled_A02S05
label var cumulative_cases_A02S05 "IHME Cumulative cases (raw data) S5"
label var cumulative_deaths_A02S05 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S5"
label var cumulative_hosp_A02S05 "IHME Cumulative hospitalizations (raw data) S5"
label var daily_deaths_A02S05 "IHME Daily deaths (raw data with excess mortality scalar applied) S5"
label var daily_infections_A02S05 "IHME Daily infections (raw data)"
label var cumul_deaths_unscaled_A02S05 "IHME umulative deaths (raw data without excess mortality scalar applied) S5"
label var dai_dea_unscaled_A02S05 "IHME Daily deaths (raw data without excess mortality scalar applied) S5"






* IDENTICAL ACROSS SCENARIOS:

label var population "IHME Population size"
label var mobility_obs "IHME Indicator for whether mobility estimate comes from observed data (1) or modelled estimates (0)"
label var testing_mean "IHME Tests per 100,000 (mean estimate)"
label var testing_lower "IHME Tests per 100,000 (lower 95% confidence interval)"
label var testing_upper "IHME Tests per 100,000 (upper 95% confidence interval)"
label var testing_obs "IHME Indicator for whether testing estimate comes from observed data (1) or modelled estimates (0)"
label var pneumonia_mean "IHME Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location"
label var pneumonia_obs "IHME Indicator for whether pneumonia estimate comes from observed data (1) or modelled estimates (0)"
label var mask_use_obs "IHME Indicator for whether mask estimate comes from observed data (1) or modelled estimates (0)"
rename cumulative_all_vaccinated cumul_vax
rename cumulative_all_effectively_vacci cumul_effective_vax
rename cumulative_all_fully_vaccinated cumul_fully_vax
label var cumul_vax	"IHME Initially vaccinated (one dose of two doses)"
label var cumul_effective_vax "IHME Effectively vaccinated (one and two dose with efficacy)" // cumulative_all_effectively_vaccinated
label var cumul_fully_vax "IHME Fully vaccinated (one of one and†two†of two doses)"

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"


/*
BY DEFINITION, THE FOLLOWING VARIABLES SHOULD NOT BE IDENTICAL ACROSS SCENARIOS:

mobility_mean

mask_use_mean

hospital_beds_mean
hospital_beds_upper
hospital_beds_lower
icu_beds_mean
icu_beds_upper
icu_beds_lower
admis_mean
admis_upper
admis_lower

infection_fatality						Infection fatality ratio
infection_detection						Infection detection ratio
inf_hosp				Infection hospitalization ratio
*/


rename mobility_mean mobility_mean_A02S05
rename mask_use_mean mask_use_mean_A02S05
label var mobility_mean_A02S05 "IHME Percent change in mobility from baseline (mean) S5"
label var mask_use_mean_A02S05 "IHME Percent of population reporting always wearing a mask when leaving home S5"

rename hospital_beds_mean hospital_beds_mean_A02S05
rename hospital_beds_upper hospital_beds_upper_A02S05
rename hospital_beds_lower hospital_beds_lower_A02S05
rename icu_beds_mean icu_beds_mean_A02S05
rename icu_beds_upper icu_beds_upper_A02S05
rename icu_beds_lower icu_beds_lower_A02S05
rename admis_mean admis_mean_A02S05
rename admis_upper admis_upper_A02S05
rename admis_lower admis_lower_A02S05
label var hospital_beds_mean_A02S05 "IHME Daily C-19 hospital beds needed (mean estimate) S5"
label var hospital_beds_upper_A02S05 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S5"
label var hospital_beds_lower_A02S05 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S5"
label var icu_beds_mean_A02S05	"IHME Daily C-19 ICU beds needed (mean estimate) S5"
label var icu_beds_upper_A02S05 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S5"
label var icu_beds_lower_A02S05 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S5"
label var admis_mean_A02S05 "IHME Daily C-19 hospital admissions (mean estimate) S5"
label var admis_upper_A02S05 "IHME Daily C-19 hospital admissions (mean estimate) S5"
label var admis_lower_A02S05 "IHME Daily C-19 hospital admissions (mean estimate) S5"


rename infection_fatality infection_fatality_A02S05
rename infection_detection infection_detection_A02S05
rename infection_hospitalization inf_hosp_A02S05
label var infection_fatality_A02S05 "IHME Infection fatality ratio S5"
label var infection_detection_A02S05 "IHME Infection detection ratio S5"
label var inf_hosp_A02S05 "IHME Infection hospitalization ratio S5"





*

rename hospital_beds_mean_A02S05		DayBedMeSmA02S05
rename hospital_beds_upper_A02S05		DayBedLoSmA02S05
rename hospital_beds_lower_A02S05		DayBedUpSmA02S05

label var DayBedMeSmA02S05 "IHME Daily C-19 hospital beds needed (mean estimate) S5"
label var DayBedLoSmA02S05 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S5"
label var DayBedUpSmA02S05 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S5"

*

rename icu_beds_mean_A02S05			DayIcuMeSmA02S05
rename icu_beds_lower_A02S05		DayIcuLoSmA02S05
rename icu_beds_upper_A02S05		DayIcuUpSmA02S05

label var DayIcuMeSmA02S05"IHME Daily C-19 ICU beds needed (mean estimate) S5"
label var DayIcuLoSmA02S05 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S5"
label var DayIcuUpSmA02S05 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S5"

*

rename admis_mean_A02S05		DayAdmMeSmA02S05
rename admis_lower_A02S05		DayAdmLoSmA02S05
rename admis_upper_A02S05		DayAdmUpSmA02S05

label var DayAdmMeSmA02S05 "IHME Daily C-19 hospital admissions (mean estimate) S5"
label var DayAdmLoSmA02S05 "IHME Daily C-19 hospital admissions (mean estimate) S5"
label var DayAdmUpSmA02S05 "IHME Daily C-19 hospital admissions (mean estimate) S5"

*

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02 
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"





order date location_name 

sort date location_name 

drop date_original version_name


save "3rd best is Reduced vaccine hesitancy.dta", replace

 
 
  
 
 
 
**********************

 
* merge scenario files


use "Reference.dta", clear
merge 1:1 date location_name location_id using "Best.dta"
drop _merge
merge 1:1 date location_name location_id using "Worse.dta"
drop _merge
merge 1:1 date location_name location_id using "2nd best is 3rd dose.dta"
drop _merge
merge 1:1 date location_name location_id using "3rd best is Reduced vaccine hesitancy.dta"
drop _merge


rename location_name loc_grand_name



* gen "Daily infections mean div by daily deaths mean IHME DayCbD" for visulization of temporal relation of deaths and infections peaks 

summ DayDeaMeSmA02S01 
gen DayDeMMeSmA02S01 = r(mean)
label var DayDeMMeSmA02S01 "Daily deaths mean IHME DayDeM"
  
summ DayINFMeSmA02S01 
gen DayCaMMeSmA02S01 = r(mean)
label var DayCaMMeSmA02S01 "Daily infections mean IHME DayCaM"
                           
gen DayCbDMeSmA02S01 = DayCaMMeSmA02S01 / DayDeMMeSmA02S01
label var DayCbDMeSmA02S01 "Daily infections mean div by daily deaths mean IHME DayCbD"
summ DayCbDMeSmA02S01
                                              
gen DayDMuMeSmA02S01 = DayDeaMeSmA02S01 * DayCbDMeSmA02S01
label var DayDMuMeSmA02S01 "Daily deaths scaled (times means of infections by deaths) IHME"
summ DayDMuMeSmA02S01



* gen percent vaccinated 

gen cumulative_all_vaccin_pct = 100 * (cumulative_all_vaccinated / population)
label var cumulative_all_vaccin_pct "% population IHME Initially vaccinated (one dose of two doses)"

gen cumul_all_effect_vacci_pct = 100 * (cumulative_all_effectively_vacci / population)
label var cumul_all_effect_vacci_pct "% population IHME Effectively vaccinated (one and two dose with efficacy)"

gen cumul_all_fully_vacci_pct = 100 * (cumulative_all_fully_vaccinated / population)
label var cumul_all_fully_vacci_pct "% population IHME Fully vaccinated (one of one and two of two doses)"



* gen daily vaccinated number 

sort loc_grand_name date

bysort loc_grand_name: gen daily_all_vaccinated = cumulative_all_vaccinated[_n] - cumulative_all_vaccinated[_n-1]
label var daily_all_vaccinated "Daily population IHME Initially vaccinated (one dose of two doses)"
bysort loc_grand_name: gen daily_all_effectively_vacci = cumulative_all_effectively_vacci[_n] - cumulative_all_effectively_vacci[_n-1]
label var daily_all_effectively_vacci "Daily population IHME Effectively vaccinated (one and two dose with efficacy)"
bysort loc_grand_name: gen daily_all_fully_vaccinated = cumulative_all_fully_vaccinated[_n] - cumulative_all_fully_vaccinated[_n-1]
label var daily_all_fully_vaccinated "Daily population IHME Fully vaccinated (one of one and two of two doses)"




* gen daily vaccinated percent

sort loc_grand_name date

bysort loc_grand_name: gen daily_all_vaccin_pct = cumulative_all_vaccin_pct[_n] - cumulative_all_vaccin_pct[_n-1]
label var daily_all_vaccin_pct "% Daily population IHME Initially vaccinated (one dose of two doses)"
bysort loc_grand_name: gen daily_all_effect_vacci_pct = cumul_all_effect_vacci_pct[_n] - cumul_all_effect_vacci_pct[_n-1]
label var daily_all_effect_vacci_pct "% Daily population IHME Effectively vaccinated (one and two dose with efficacy)"
bysort loc_grand_name: gen daily_all_fully_vacci_pct = cumul_all_fully_vacci_pct[_n] - cumul_all_fully_vacci_pct[_n-1]
label var daily_all_fully_vacci_pct "% Daily population IHME Fully vaccinated (one of one and two of two doses)"



qui compress

save "IHME.dta", replace





view "log CovidVisualizedGlobal IHME 1.smcl"

log close

exit, clear




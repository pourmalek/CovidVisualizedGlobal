
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


di in red "IHMEdate = " "$IHMEdate"

* download and prepare estimates files

																					 
clear 
 
*****************************

* get IHME estimates


copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2020.csv data_download_file_reference_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2021.csv data_download_file_reference_2021.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2022.csv data_download_file_reference_2022.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2020.csv data_download_file_best_masks_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2021.csv data_download_file_best_masks_2021.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2022.csv data_download_file_best_masks_2022.csv 

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_third_dose_2020.csv data_download_file_third_dose_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_third_dose_2021.csv data_download_file_third_dose_2021.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_third_dose_2022.csv data_download_file_third_dose_2022.csv 







******************************

* import csv files



* scenario name = version_name = reference = Projection

import delimited using data_download_file_reference_2020.csv, clear varnames(1)
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
save data_download_file_reference_2021.dta, replace

import delimited using data_download_file_reference_2022.csv, clear varnames(1)
save data_download_file_reference_2022.dta, replace




* scenario name = version_name = best_masks = Masks
	
import delimited using data_download_file_best_masks_2020.csv, clear varnames(1)
save data_download_file_best_masks_2020.dta, replace

import delimited using data_download_file_best_masks_2021.csv, clear varnames(1)
save data_download_file_best_masks_2021.dta, replace

import delimited using data_download_file_best_masks_2022.csv, clear varnames(1)
save data_download_file_best_masks_2022.dta, replace



	


* scenario name = version_name = booster = Third dose
	
import delimited using data_download_file_third_dose_2020.csv, clear varnames(1)
save data_download_file_third_dose_2020.dta, replace

import delimited using data_download_file_third_dose_2021.csv, clear varnames(1)
save data_download_file_third_dose_2021.dta, replace

import delimited using data_download_file_third_dose_2022.csv, clear varnames(1)
save data_download_file_third_dose_2022.dta, replace





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





use "data_download_file_reference_2022.dta", clear 

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

save "data_download_file_reference_2022.dta", replace 




use "data_download_file_reference_2020.dta", clear 

append using "data_download_file_reference_2021.dta"

append using "data_download_file_reference_2022.dta"

save "data_download_file_reference.dta", replace

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




use "data_download_file_best_masks_2022.dta", clear

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

save "data_download_file_best_masks_2022.dta", replace




use "data_download_file_best_masks_2020.dta", clear

append using "data_download_file_best_masks_2021.dta"

append using "data_download_file_best_masks_2022.dta"

save "data_download_file_best_masks.dta", replace

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




use "data_download_file_third_dose_2022.dta", clear 

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

save "data_download_file_third_dose_2022.dta", replace 





use "data_download_file_third_dose_2020.dta", clear 

append using "data_download_file_third_dose_2021.dta"

append using "data_download_file_third_dose_2022.dta"

save "data_download_file_third_dose.dta", replace


*



******************************

* read scenario files


* scenarios




**********************

* S1 Reference

use "data_download_file_reference.dta", clear

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
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S01
rename daily_deaths_unscaled dai_dea_unscaled_A02S01
label var cumulative_cases_A02S01 "IHME Cumulative cases (raw data) S1"
label var cumulative_deaths_A02S01 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S1"
label var cumulative_hosp_A02S01 "IHME Cumulative hospitalizations (raw data) S1"
label var daily_deaths_A02S01 "IHME Daily deaths (raw data with excess mortality scalar applied) S1"
label var cumul_deaths_unscaled_A02S01 "IHME umulative deaths (raw data without excess mortality scalar applied) S1"
label var dai_dea_unscaled_A02S01 "IHME Daily deaths (raw data without excess mortality scalar applied) S1"






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
label var cumulative_all_effectively_vacci "IHME Effectively vaccinated (one and two dose with efficacy)" 
label var cumulative_all_fully_vaccinated "IHME Fully vaccinated (one of one and two of two doses)"
rename cumulative_all_vaccinated cumul_vax
rename cumulative_all_effectively_vacci cumul_effective_vax
rename cumulative_all_fully_vaccinated cumul_fully_vax

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"



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



rename admis_mean_A02S01		DayAdmMeSmA02S01
rename admis_lower_A02S01		DayAdmLoSmA02S01
rename admis_upper_A02S01		DayAdmUpSmA02S01

label var DayAdmMeSmA02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"
label var DayAdmLoSmA02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"
label var DayAdmUpSmA02S01 "IHME Daily COVID-19 hospital admissions (mean estimate) S1"





label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"





order date location_name 

sort date location_name 

drop date_original version_name

save "Reference.dta", replace








**********************

* S2 Best

use "data_download_file_best_masks.dta", clear


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
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S02
rename daily_deaths_unscaled dai_dea_unscaled_A02S02
label var cumulative_cases_A02S02 "IHME Cumulative cases (raw data) S2"
label var cumulative_deaths_A02S02 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S2"
label var cumulative_hosp_A02S02 "IHME Cumulative hospitalizations (raw data) S2"
label var daily_deaths_A02S02 "IHME Daily deaths (raw data with excess mortality scalar applied) S2"
label var cumul_deaths_unscaled_A02S02 "IHME umulative deaths (raw data without excess mortality scalar applied) S2"
label var dai_dea_unscaled_A02S02 "IHME Daily deaths (raw data without excess mortality scalar applied) S2"






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
label var cumulative_all_fully_vaccinated "IHME Fully vaccinated (one of one and two of two doses)"
rename cumulative_all_vaccinated cumul_vax
rename cumulative_all_effectively_vacci cumul_effective_vax
rename cumulative_all_fully_vaccinated cumul_fully_vax

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"



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

* S3 Third dose

use "data_download_file_third_dose.dta", clear



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
label var reff_mean_A02S03 "IHME R effective (mean estimate) S3"
label var reff_lower_A02S03 "IHME R effective (lower 95% confidence interval) S3"
label var reff_upper_A02S03 "IHME R effective (upper 95% confidence interval) S3"

rename cumulative_cases cumulative_cases_A02S03
rename cumulative_deaths cumulative_deaths_A02S03
rename cumulative_hospitalizations cumulative_hosp_A02S03
rename daily_deaths daily_deaths_A02S03
rename cumulative_deaths_unscaled cumul_deaths_unscaled_A02S03
rename daily_deaths_unscaled dai_dea_unscaled_A02S03
label var cumulative_cases_A02S03 "IHME Cumulative cases (raw data) S3"
label var cumulative_deaths_A02S03 "IHME Cumulative deaths (raw data with excess mortality scalar applied) S3"
label var cumulative_hosp_A02S03 "IHME Cumulative hospitalizations (raw data) S3"
label var daily_deaths_A02S03 "IHME Daily deaths (raw data with excess mortality scalar applied) S3"
label var cumul_deaths_unscaled_A02S03 "IHME umulative deaths (raw data without excess mortality scalar applied) S3"
label var dai_dea_unscaled_A02S03 "IHME Daily deaths (raw data without excess mortality scalar applied) S3"






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
label var cumulative_all_effectively_vacci "IHME Effectively vaccinated (one and two dose with efficacy)" 
label var cumulative_all_fully_vaccinated "IHME Fully vaccinated (one of one and two of two doses)"
rename cumulative_all_vaccinated cumul_vax
rename cumulative_all_effectively_vacci cumul_effective_vax
rename cumulative_all_fully_vaccinated cumul_fully_vax
label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"



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
label var hospital_beds_mean_A02S03 "IHME Daily C-19 hospital beds needed (mean estimate) S3"
label var hospital_beds_upper_A02S03 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S3"
label var hospital_beds_lower_A02S03 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S3"
label var icu_beds_mean_A02S03	"IHME Daily C-19 ICU beds needed (mean estimate) S3"
label var icu_beds_upper_A02S03 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S3"
label var icu_beds_lower_A02S03 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S3"
label var admis_mean_A02S03 "IHME Daily C-19 hospital admissions (mean estimate) S3"
label var admis_upper_A02S03 "IHME Daily C-19 hospital admissions (mean estimate) S3"
label var admis_lower_A02S03 "IHME Daily C-19 hospital admissions (mean estimate) S3"


rename infection_fatality infection_fatality_A02S03
rename infection_detection infection_detection_A02S03
rename infection_hospitalization inf_hosp_A02S03
label var infection_fatality_A02S03 "IHME Infection fatality ratio S3"
label var infection_detection_A02S03 "IHME Infection detection ratio S3"
label var inf_hosp_A02S03 "IHME Infection hospitalization ratio S3"





*

rename hospital_beds_mean_A02S03		DayBedMeSmA02S03
rename hospital_beds_upper_A02S03		DayBedLoSmA02S03
rename hospital_beds_lower_A02S03		DayBedUpSmA02S03

label var DayBedMeSmA02S03 "IHME Daily C-19 hospital beds needed (mean estimate) S3"
label var DayBedLoSmA02S03 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S3"
label var DayBedUpSmA02S03 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S3"

*

rename icu_beds_mean_A02S03			DayIcuMeSmA02S03
rename icu_beds_lower_A02S03		DayIcuLoSmA02S03
rename icu_beds_upper_A02S03		DayIcuUpSmA02S03

label var DayIcuMeSmA02S03"IHME Daily C-19 ICU beds needed (mean estimate) S3"
label var DayIcuLoSmA02S03 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S3"
label var DayIcuUpSmA02S03 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S3"

*

rename admis_mean_A02S03		DayAdmMeSmA02S03
rename admis_lower_A02S03		DayAdmLoSmA02S03
rename admis_upper_A02S03		DayAdmUpSmA02S03

label var DayAdmMeSmA02S03 "IHME Daily C-19 hospital admissions (mean estimate) S3"
label var DayAdmLoSmA02S03 "IHME Daily C-19 hospital admissions (mean estimate) S3"
label var DayAdmUpSmA02S03 "IHME Daily C-19 hospital admissions (mean estimate) S3"

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


save "Third dose.dta", replace

 
 
 
 
 
 
 

 
  
 
 
 
**********************

 
* merge scenario files


use "Reference.dta", clear
merge 1:1 date location_name location_id using "Best.dta"
drop _merge
merge 1:1 date location_name location_id using "Third dose.dta"
drop _merge



rename location_name loc_grand_name









qui compress

save "IHME.dta", replace





view "log CovidVisualizedGlobal IHME 1.smcl"

log close

exit, clear



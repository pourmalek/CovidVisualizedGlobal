
clear all

cd "$pathCovidVisualizedCountry"

cd IHME

capture log close 

log using "log CovidVisualizedCountry IHME.smcl", replace

***************************************************************************
* This is "do CovidVisualizedCountry IHME.do"

* Project: Combine and visualize international periodically updating 
* estimates of C-19 at the country level (CovidVisualizedCountry)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


                                                                                                         ***************************
* To change update date, find and replace all, 2021-11-19 (old), with 2021-11-19 (new) <<--       <<<--- * change update date here *
                                                                                                         ***************************


																								 
clear 
 
*****************************

* get IHME estimates

* URLs as of  2021-11-19

copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2020.csv data_download_file_reference_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_reference_2021.csv data_download_file_reference_2021.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2020.csv data_download_file_best_masks_2020.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_best_masks_2021.csv data_download_file_best_masks_2021.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_worse_2020.csv data_download_file_worse_2020.csv
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_download_file_worse_2021.csv data_download_file_worse_2021.csv
copy https://ihmecovid19storage.blob.core.windows.net/latest/data_dictionary.csv data_dictionary.csv 
copy https://ihmecovid19storage.blob.core.windows.net/latest/IHME_COVID_19_Data_Release_Information_Sheet.pdf IHME_COVID_19_Data_Release_Information_Sheet.pdf 
copy https://ihmecovid19storage.blob.core.windows.net/latest/sha256sums.txt sha256sums.txt

******************************

* import csv files



import delimited using data_download_file_reference_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2020.dta, replace

import delimited using data_download_file_reference_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_reference_2021.dta, replace



	
import delimited using data_download_file_best_masks_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_best_masks_2020.dta, replace

import delimited using data_download_file_best_masks_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_best_masks_2021.dta, replace

	
	
import delimited using data_download_file_worse_2020.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_worse_2020.dta, replace

import delimited using data_download_file_worse_2021.csv, clear varnames(1)
keep if location_name == "$country" | ///
        location_name == "Alberta" | /// provincestate names for "$country"
        location_name == "British Columbia" | ///
        location_name == "Manitoba" | ///
        location_name == "Nova Scotia" | ///
        location_name == "Ontario" | ///
        location_name == "Quebec" | ///
        location_name == "Saskatchewan" 
save data_download_file_worse_2021.dta, replace



******************************

* gen scenario dta files


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

use "data_download_file_worse_2020.dta", clear 

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

save "data_download_file_worse_2020.dta", replace 



use "data_download_file_worse_2021.dta", clear 

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

save "data_download_file_worse_2021.dta", replace 

append using "data_download_file_worse_2020.dta"

save "data_download_file_worse_2020_21.dta", replace




******************************

* read scenario files


/*
Scenarios:

S1 Reference [Current projection] version_name = "reference"
S2 Best [Universal masks]         version_name = "best_masks"
S3 Worse [Mandates easing]		  version_name = "worse"
*/



/*

data_dictionary.csv

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
infection_hospitalization 				Infection hospitalization ratio // inf_hosp



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
cumulative_all_vaccinated				Initially vaccinated (one dose of two doses) // cumul_vax
cumulative_all_effectively_vaccinated	Effectively vaccinated (one and two dose with efficacy) // cumul_effective_vax
cumulative_all_fully_vaccinated			Fully vaccinated (one of one and†two†of two doses) // cumul_fully_vax
hospital_beds_mean						Daily C-19 hospital beds needed (mean estimate)
hospital_beds_upper						Daily C-19 hospital beds needed (upper 95% confidence interval)
hospital_beds_lower						Daily C-19 hospital beds needed (lower 95% confidence interval)
icu_beds_mean							Daily C-19 ICU beds needed (mean estimate)
icu_beds_upper							Daily C-19 ICU beds needed (upper 95% confidence interval)
icu_beds_lower							Daily C-19 ICU beds needed (lower 95% confidence interval)
admis_mean								Daily C-19 hospital admissions (mean estimate)
admis_upper								Daily C-19 hospital admissions (mean estimate)
admis_lower								Daily C-19 hospital admissions (mean estimate)
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
infection_hospitalization				Infection hospitalization ratio // inf_hosp

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
label var reff_mean_A02S01 "IHME R effective (mean estimate) S1"
label var reff_lower_A02S01 "IHME R effective (lower 95% confidence interval) S1"
label var reff_upper_A02S01 "IHME R effective (upper 95% confidence interval) S1"

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
label var hospital_beds_mean_A02S01 "IHME Daily C-19 hospital beds needed (mean estimate) S1"
label var hospital_beds_upper_A02S01 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S1"
label var hospital_beds_lower_A02S01 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S1"
label var icu_beds_mean_A02S01	"IHME Daily C-19 ICU beds needed (mean estimate) S1"
label var icu_beds_upper_A02S01 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S1"
label var icu_beds_lower_A02S01 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S1"
label var admis_mean_A02S01 "IHME Daily C-19 hospital admissions (mean estimate) S1"
label var admis_upper_A02S01 "IHME Daily C-19 hospital admissions (mean estimate) S1"
label var admis_lower_A02S01 "IHME Daily C-19 hospital admissions (mean estimate) S1"


rename infection_fatality infection_fatality_A02S01
rename infection_detection infection_detection_A02S01
rename infection_hospitalization inf_hosp_A02S01
label var infection_fatality_A02S01 "IHME Infection fatality ratio S1"
label var infection_detection_A02S01 "IHME Infection detection ratio S1"
label var inf_hosp_A02S01 "IHME Infection hospitalization ratio S1"






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

label var DayBedMeSmA02S01 "IHME Daily C-19 hospital beds needed (mean estimate) S1"
label var DayBedLoSmA02S01 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S1"
label var DayBedUpSmA02S01 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S1"

*

rename icu_beds_mean_A02S01			DayIcuMeSmA02S01
rename icu_beds_lower_A02S01		DayIcuLoSmA02S01
rename icu_beds_upper_A02S01		DayIcuUpSmA02S01

label var DayIcuMeSmA02S01 "IHME Daily C-19 ICU beds needed (mean estimate) S1"
label var DayIcuLoSmA02S01 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S1"
label var DayIcuUpSmA02S01 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S1"


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

label var DayAdmMeSmA02S01 "IHME Daily C-19 hospital admissions (mean estimate) S1"
label var DayAdmLoSmA02S01 "IHME Daily C-19 hospital admissions (mean estimate) S1"
label var DayAdmUpSmA02S01 "IHME Daily C-19 hospital admissions (mean estimate) S1"


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

drop location_id date_original version_name

save "Reference country.dta", replace








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
label var reff_mean_A02S02 "IHME R effective (mean estimate) S2"
label var reff_lower_A02S02 "IHME R effective (lower 95% confidence interval) S2"
label var reff_upper_A02S02 "IHME R effective (upper 95% confidence interval) S2"

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
label var hospital_beds_mean_A02S02 "IHME Daily C-19 hospital beds needed (mean estimate) S2"
label var hospital_beds_upper_A02S02 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S2"
label var hospital_beds_lower_A02S02 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S2"
label var icu_beds_mean_A02S02	"IHME Daily C-19 ICU beds needed (mean estimate) S2"
label var icu_beds_upper_A02S02 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S2"
label var icu_beds_lower_A02S02 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S2"
label var admis_mean_A02S02 "IHME Daily C-19 hospital admissions (mean estimate) S2"
label var admis_upper_A02S02 "IHME Daily C-19 hospital admissions (mean estimate) S2"
label var admis_lower_A02S02 "IHME Daily C-19 hospital admissions (mean estimate) S2"


rename infection_fatality infection_fatality_A02S02
rename infection_detection infection_detection_A02S02
rename infection_hospitalization inf_hosp_A02S02
label var infection_fatality_A02S02 "IHME Infection fatality ratio S2"
label var infection_detection_A02S02 "IHME Infection detection ratio S2"
label var inf_hosp_A02S02 "IHME Infection hospitalization ratio S2"





*

rename hospital_beds_mean_A02S02		DayBedMeSmA02S02
rename hospital_beds_upper_A02S02		DayBedLoSmA02S02
rename hospital_beds_lower_A02S02		DayBedUpSmA02S02

label var DayBedMeSmA02S02 "IHME Daily C-19 hospital beds needed (mean estimate) S2"
label var DayBedLoSmA02S02 "IHME Daily C-19 hospital beds needed (upper 95% confidence interval) S2"
label var DayBedUpSmA02S02 "IHME Daily C-19 hospital beds needed (lower 95% confidence interval) S2"

*

rename icu_beds_mean_A02S02			DayIcuMeSmA02S02
rename icu_beds_lower_A02S02		DayIcuLoSmA02S02
rename icu_beds_upper_A02S02		DayIcuUpSmA02S02

label var DayIcuMeSmA02S02"IHME Daily C-19 ICU beds needed (mean estimate) S2"
label var DayIcuLoSmA02S02 "IHME Daily C-19 ICU beds needed (upper 95% confidence interval) S2"
label var DayIcuUpSmA02S02 "IHME Daily C-19 ICU beds needed (lower 95% confidence interval) S2"

*

rename admis_mean_A02S02		DayAdmMeSmA02S02
rename admis_lower_A02S02		DayAdmLoSmA02S02
rename admis_upper_A02S02		DayAdmUpSmA02S02

label var DayAdmMeSmA02S02 "IHME Daily C-19 hospital admissions (mean estimate) S2"
label var DayAdmLoSmA02S02 "IHME Daily C-19 hospital admissions (mean estimate) S2"
label var DayAdmUpSmA02S02 "IHME Daily C-19 hospital admissions (mean estimate) S2"

*

label var all_bed_capacity "IHME Total number of beds that exist at a location"
label var icu_bed_capacity "IHME Total number of ICU beds that exist at a location"

rename all_bed_capacity DayBEDMeSmA02
label var DayBEDMeSmA02 "IHME Total number of beds that exist at a location"

rename icu_bed_capacity DayICUMeSmA02 
label var DayICUMeSmA02 "IHME Total number of ICU beds that exist at a location"





order date location_name 

sort date location_name 

drop location_id date_original version_name


save "Best country.dta", replace








**********************

* S3 Worse

use "data_download_file_worse_2020_21.dta", clear



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

drop location_id date_original version_name


save "Worse country.dta", replace


 
 
 
 
**********************

 
* merge scenario files


use "Reference country.dta", clear
merge 1:1 location_name date using "Best country.dta"
drop _merge
merge 1:1 location_name date using "Worse country.dta"
drop _merge



rename location_name provincestate

gen loc_grand_name = "$country"

replace provincestate = " National" if provincestate == "$country"



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

gen cumul_vax_pct = 100 * (cumul_vax / population)
label var cumul_vax_pct "% population IHME Initially vaccinated (one dose of two doses)"

gen cumul_effective_vax_pct = 100 * (cumul_effective_vax / population)
label var cumul_effective_vax_pct "% population IHME Effectively vaccinated (one and two dose with efficacy)"

gen cumul_fully_vax_pct = 100 * (cumul_fully_vax / population)
label var cumul_fully_vax_pct "% population IHME Fully vaccinated (one of one and two of two doses)"

*





* gen vars by provincestate 

foreach var of varlist ///
DayINFMeSmA02S01 DayINFUpSmA02S01 DayINFLoSmA02S01 TotDeXMeSmA02S01 ///
TotDeXLoSmA02S01 TotDeXUpSmA02S01 TotINFMeSmA02S01 TotINFLoSmA02S01	///
TotINFUpSmA02S01 DayDeXMeSmA02S01 DayDeXLoSmA02S01 DayDeXUpSmA02S01	///
DayDeaMeSmA02S01 DayDeaLoSmA02S01 DayDeaUpSmA02S01 TotDeaMeSmA02S01 ///
TotDeaLoSmA02S01 TotDeaUpSmA02S01 reff_mean_A02S01 reff_lower_A02S01 ///
reff_upper_A02S01 cumulative_cases_A02S01 cumulative_deaths_A02S01 ///
cumulative_hosp_A02S01 daily_deaths_A02S01 daily_infections_A02S01 ///
cumul_deaths_unscaled_A02S01 dai_dea_unscaled_A02S01 ///
population mobility_mean_A02S01 mobility_obs testing_mean testing_lower testing_upper ///
testing_obs pneumonia_mean pneumonia_obs mask_use_mean_A02S01 mask_use_obs ///
cumul_vax cumul_effective_vax cumul_fully_vax ///
DayBedMeSmA02S01 DayBedLoSmA02S01 DayBedUpSmA02S01 ///
DayIcuMeSmA02S01 DayIcuUpSmA02S01 DayIcuLoSmA02S01 ///
DayAdmMeSmA02S01 DayAdmUpSmA02S01 DayAdmLoSmA02S01 ///
DayBEDMeSmA02 DayICUMeSmA02 infection_fatality_A02S01 ///
infection_detection_A02S01 inf_hosp_A02S01 DayINFMeSmA02S02	///
DayINFUpSmA02S02 DayINFLoSmA02S02 TotDeXMeSmA02S02 TotDeXLoSmA02S02 ///
TotDeXUpSmA02S02 TotINFMeSmA02S02 TotINFLoSmA02S02 TotINFUpSmA02S02 ///
DayDeXMeSmA02S02 DayDeXLoSmA02S02 DayDeXUpSmA02S02 DayDeaMeSmA02S02 ///
DayDeaLoSmA02S02 DayDeaUpSmA02S02 TotDeaMeSmA02S02 TotDeaLoSmA02S02 ///
TotDeaUpSmA02S02 reff_mean_A02S02 reff_lower_A02S02 reff_upper_A02S02 ///
cumulative_cases_A02S02 cumulative_deaths_A02S02 cumulative_hosp_A02S02	///
daily_deaths_A02S02 daily_infections_A02S02 cumul_deaths_unscaled_A02S02 ///
dai_dea_unscaled_A02S02 mobility_mean_A02S02 ///
mask_use_mean_A02S02 DayBedMeSmA02S02 DayBedLoSmA02S02 ///
DayBedUpSmA02S02 DayIcuMeSmA02S02 DayIcuUpSmA02S02 DayIcuLoSmA02S02 ///
DayAdmMeSmA02S02 DayAdmUpSmA02S02 DayAdmLoSmA02S02 /// 
infection_fatality_A02S02 infection_detection_A02S02 inf_hosp_A02S02 ///
DayINFMeSmA02S03 DayINFUpSmA02S03 DayINFLoSmA02S03 TotDeXMeSmA02S03 ///
TotDeXLoSmA02S03 TotDeXUpSmA02S03 TotINFMeSmA02S03 TotINFLoSmA02S03 ///
TotINFUpSmA02S03 DayDeXMeSmA02S03 DayDeXLoSmA02S03 DayDeXUpSmA02S03 ///
DayDeaMeSmA02S03 DayDeaLoSmA02S03 DayDeaUpSmA02S03 TotDeaMeSmA02S03 ///
TotDeaLoSmA02S03 TotDeaUpSmA02S03 reff_mean_A02S03 reff_lower_A02S03 ///
reff_upper_A02S03 cumulative_cases_A02S03 cumulative_deaths_A02S03 ///
cumulative_hosp_A02S03 daily_deaths_A02S03 daily_infections_A02S03 /// 
cumul_deaths_unscaled_A02S03 dai_dea_unscaled_A02S03 ///
mobility_mean_A02S03 mask_use_mean_A02S03 DayBedMeSmA02S03 ///
DayBedLoSmA02S03 DayBedUpSmA02S03 DayIcuMeSmA02S03 DayIcuUpSmA02S03 ///
DayIcuLoSmA02S03 DayAdmMeSmA02S03 DayAdmUpSmA02S03 DayAdmLoSmA02S03 ///
infection_fatality_A02S03 infection_detection_A02S03 inf_hosp_A02S03 ///
DayDeMMeSmA02S01 DayCaMMeSmA02S01 DayCbDMeSmA02S01 DayDMuMeSmA02S01 ///
cumul_vax_pct cumul_effective_vax_pct cumul_fully_vax_pct {

	 
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



*

qui compress

save "CovidVisualizedCountry IHME.dta", replace


***********************


* graphs


grstyle init

grstyle color background white


***************
* daily deaths 
***************



******
* 11a daily reported deaths, national, all subnational, reference scenario = S1 

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
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 11a C-19 daily reported deaths, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 11a C-19 daily reported deaths, $country, subnational, IHME, reference scenario.pdf", replace



******
* 11b daily reported deaths, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeaLoSmA02S01 DayDeaUpSmA02S01 date, sort color(green*.2)) ///
(line DayDeaMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui graph save "graph 11b C-19 daily reported deaths, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 11b C-19 daily reported deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*



******
* 12a daily excess deaths, national, all subnational, reference scenario = S1 

twoway ///
(line DayDeXMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeXMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeXMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeXMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayDeXMeSmA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayDeXMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayDeXMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayDeXMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayDeXMeSmA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayDeXMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily excess deaths) title("C-19 daily excess deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 12a C-19 daily excess deaths, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 12a C-19 daily excess deaths, $country, subnational, IHME, reference scenario.pdf", replace



******
* 12b daily excess deaths, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeXLoSmA02S01 DayDeXUpSmA02S01 date, sort color(green*.2)) ///
(line DayDeXMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily excess deaths) title("C-19 daily excess deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui graph save "graph 12b C-19 daily excess deaths, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 12b C-19 daily excess deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*




******
* 13a daily reported & excess deaths, reference scenario = S1 	   

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayDeaMeSmA02S01 date, sort lcolor(black)) ///	
(line DayDeXMeSmA02S01 date, sort lcolor(red)) ///
if provincestate == "`l'" & DayDeaMeSmA02S01 != . ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported & excess deaths) title("C-19 daily reported & excess, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reported deaths" 2 "Excess deaths") rows(1)) yscale(titlegap(2))

qui graph save "graph 11b C-19 daily reported deaths, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 11b C-19 daily reported deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*





******
* 14a daily reported deaths, 3 scenarios  

levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line DayDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeaMeSmA02S02 date, sort lcolor(green)) ///
(line DayDeaMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Better" 3 "Worse") rows(1))

qui graph save "graph 14a C-19 daily reported deaths, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 14a C-19 daily reported deaths, $country, `l' 3 scenarios, IHME.pdf", replace

}
*





******
* 14b daily excess deaths, 3 scenarios  

levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line DayDeXMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeXMeSmA02S02 date, sort lcolor(green)) ///
(line DayDeXMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily excess deaths) title("C-19 daily excess deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Better" 3 "Worse") rows(1))

qui graph save "graph 14b C-19 daily excess deaths, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 14b C-19 daily excess deaths, $country, `l' 3 scenarios, IHME.pdf", replace

}
*




******
* 14c daily reported & excess deaths, 3 scenarios  
  
levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line DayDeaMeSmA02S02 date, sort lcolor(green)) ///
(line DayDeaMeSmA02S03 date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeXMeSmA02S02 date, sort lcolor(green) lpattern(dash)) ///
(line DayDeXMeSmA02S03 date, sort lcolor(red) lpattern(dash)) ///
(line DayDeXMeSmA02S01 date, sort lcolor(black) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported & excess deaths) title("C-19 daily reported & excess deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference" ) rows(1)) yscale(titlegap(2)) ///
note("Excess deaths: dashed curves")

qui graph save "graph 14c C-19 daily reported & excess deaths, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 14c C-19 daily reported & excess deaths, $country, `l', scenarios, IHME.pdf", replace

}
*



******
* 15a daily reported deaths, reference scenario = S1, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayDeaLoSmA02S01 date, sort lcolor(green)) ///
(line DayDeaUpSmA02S01 date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 15a C-19 daily deaths, $country, `l', reference scenario CI, IHME.gph", replace
qui graph export "graph 15a C-19 daily deaths, $country, `l', reference scenario CI, IHME.pdf", replace

}
*





******
* 15b daily reported deaths, better scenario = S2, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayDeaLoSmA02S02 date, sort lcolor(green)) ///
(line DayDeaUpSmA02S02 date, sort lcolor(red)) ///
(line DayDeaMeSmA02S02 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, $country, `l', IHME, better scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 15b C-19 daily deaths, $country, `l', better scenario CI, IHME.gph", replace
qui graph export "graph 15b C-19 daily deaths, $country, `l', better scenario CI, IHME.pdf", replace

}
*
  
  
  

******
* 15c daily reported deaths, worse scenario = S3, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayDeaLoSmA02S03 date, sort lcolor(green)) ///
(line DayDeaUpSmA02S03 date, sort lcolor(red)) ///
(line DayDeaMeSmA02S03 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily reported deaths) title("C-19 daily reported deaths, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 15c C-19 daily deaths, $country, `l', worse scenario CI, IHME.gph", replace
qui graph export "graph 15c C-19 daily deaths, $country, `l', worse scenario CI, IHME.pdf", replace

}
*
    
  
  

*******************
* daily infections
*******************


******
* 21a daily infections, national, all subnational, reference scenario = S1 

twoway ///
(line DayINFMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayINFMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayINFMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayINFMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayINFMeSmA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayINFMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayINFMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayINFMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayINFMeSmA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayINFMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("C-19 daily infections, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 21a C-19 daily infections, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 21a C-19 daily infections, $country, subnational, IHME, reference scenario.pdf", replace



******
* 21b daily infections, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayINFLoSmA02S01 DayINFUpSmA02S01 date, sort color(green*.2)) ///
(line DayINFMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayINFMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("C-19 daily infections, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui graph save "graph 21b C-19 daily infections, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 21b C-19 daily infections, $country, `l', IHME, reference scenario.pdf", replace

}
*




******
* 22a daily infections, 3 scenarios  

levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line DayINFMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayINFMeSmA02S02 date, sort lcolor(green)) ///
(line DayINFMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("C-19 daily infections, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Better" 3 "Worse") rows(1))

qui graph save "graph 22a C-19 daily infections, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 22a C-19 daily infections, $country, `l' 3 scenarios, IHME.pdf", replace

}
*





******
* 23a daily infections, reference scenario = S1, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayINFLoSmA02S01 date, sort lcolor(green)) ///
(line DayINFUpSmA02S01 date, sort lcolor(red)) ///
(line DayINFMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("C-19 daily infections, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 23a C-19 daily infections, $country, `l', reference scenario CI, IHME.gph", replace
qui graph export "graph 23a C-19 daily infections, $country, `l', reference scenario CI, IHME.pdf", replace

}
*





******
* 23b daily infections, better scenario = S2, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayINFLoSmA02S02 date, sort lcolor(green)) ///
(line DayINFUpSmA02S02 date, sort lcolor(red)) ///
(line DayINFMeSmA02S02 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("C-19 daily infections, $country, `l', IHME, better scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 23b C-19 daily infections, $country, `l', better scenario CI, IHME.gph", replace
qui graph export "graph 23b C-19 daily infections, $country, `l', better scenario CI, IHME.pdf", replace

}
*
  
  
  

******
* 23c daily infections, worse scenario = S3, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayINFLoSmA02S03 date, sort lcolor(green)) ///
(line DayINFUpSmA02S03 date, sort lcolor(red)) ///
(line DayINFMeSmA02S03 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections) title("C-19 daily infections, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 23c C-19 daily infections, $country, `l', worse scenario CI, IHME.gph", replace
qui graph export "graph 23c C-19 daily infections, $country, `l', worse scenario CI, IHME.pdf", replace

}
*
    
  
  



***************
* total deaths 
***************



******
* 31a total reported deaths, national, all subnational, reference scenario = S1 

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
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total reported deaths) title("C-19 total reported deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 31a C-19 total reported deaths, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 31a C-19 total reported deaths, $country, subnational, IHME, reference scenario.pdf", replace



******
* 31b total reported deaths, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea TotDeaLoSmA02S01 TotDeaUpSmA02S01 date, sort color(green*.2)) ///
(line TotDeaMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported deaths) title("C-19 total reported deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui graph save "graph 31b C-19 total reported deaths, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 31b C-19 total reported deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*



******
* 32a total excess deaths, national, all subnational, reference scenario = S1 

twoway ///
(line DayDeXMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayDeXMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayDeXMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayDeXMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayDeXMeSmA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayDeXMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayDeXMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayDeXMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayDeXMeSmA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayDeXMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total excess deaths) title("C-19 total excess deaths, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 32a C-19 total excess deaths, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 32a C-19 total excess deaths, $country, subnational, IHME, reference scenario.pdf", replace



******
* 32b total excess deaths, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayDeXLoSmA02S01 DayDeXUpSmA02S01 date, sort color(green*.2)) ///
(line DayDeXMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & TotDeaMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total excess deaths) title("C-19 total excess deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui graph save "graph 32b C-19 total excess deaths, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 32b C-19 total excess deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*




******
* 33a total reported & excess deaths, reference scenario = S1 	   

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line TotDeaMeSmA02S01 date, sort lcolor(black)) ///	
(line DayDeXMeSmA02S01 date, sort lcolor(red)) ///
if provincestate == "`l'" & TotDeaMeSmA02S01 != . ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported & excess deaths) title("C-19 total reported & excess, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reported deaths" 2 "Excess deaths") rows(1)) yscale(titlegap(2))

qui graph save "graph 31b C-19 total reported deaths, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 31b C-19 total reported deaths, $country, `l', IHME, reference scenario.pdf", replace

}
*





******
* 34a total reported deaths, 3 scenarios  

levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line TotDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line TotDeaMeSmA02S02 date, sort lcolor(green)) ///
(line TotDeaMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported deaths) title("C-19 total reported deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Better" 3 "Worse") rows(1))

qui graph save "graph 34a C-19 total reported deaths, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 34a C-19 total reported deaths, $country, `l' 3 scenarios, IHME.pdf", replace

}
*





******
* 34b total excess deaths, 3 scenarios  

levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line DayDeXMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeXMeSmA02S02 date, sort lcolor(green)) ///
(line DayDeXMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total excess deaths) title("C-19 total excess deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Better" 3 "Worse") rows(1))

qui graph save "graph 34b C-19 total excess deaths, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 34b C-19 total excess deaths, $country, `l' 3 scenarios, IHME.pdf", replace

}
*




******
* 34c total reported & excess deaths, 3 scenarios  
  
levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line TotDeaMeSmA02S02 date, sort lcolor(green)) ///
(line TotDeaMeSmA02S03 date, sort lcolor(red)) ///
(line TotDeaMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayDeXMeSmA02S02 date, sort lcolor(green) lpattern(dash)) ///
(line DayDeXMeSmA02S03 date, sort lcolor(red) lpattern(dash)) ///
(line DayDeXMeSmA02S01 date, sort lcolor(black) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported & excess deaths) title("C-19 total reported & excess deaths, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference" ) rows(1)) yscale(titlegap(2)) ///
note("Excess deaths: dashed curves")

qui graph save "graph 34c C-19 total reported & excess deaths, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 34c C-19 total reported & excess deaths, $country, `l', scenarios, IHME.pdf", replace

}
*



******
* 35a total reported deaths, reference scenario = S1, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line TotDeaLoSmA02S01 date, sort lcolor(green)) ///
(line TotDeaUpSmA02S01 date, sort lcolor(red)) ///
(line TotDeaMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported deaths) title("C-19 total reported deaths, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 35a C-19 total deaths, $country, `l', reference scenario CI, IHME.gph", replace
qui graph export "graph 35a C-19 total deaths, $country, `l', reference scenario CI, IHME.pdf", replace

}
*





******
* 35b total reported deaths, better scenario = S2, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line TotDeaLoSmA02S02 date, sort lcolor(green)) ///
(line TotDeaUpSmA02S02 date, sort lcolor(red)) ///
(line TotDeaMeSmA02S02 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported deaths) title("C-19 total reported deaths, $country, `l', IHME, better scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 35b C-19 total deaths, $country, `l', better scenario CI, IHME.gph", replace
qui graph export "graph 35b C-19 total deaths, $country, `l', better scenario CI, IHME.pdf", replace

}
*
  
  
  

******
* 35c total reported deaths, worse scenario = S3, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line TotDeaLoSmA02S03 date, sort lcolor(green)) ///
(line TotDeaUpSmA02S03 date, sort lcolor(red)) ///
(line TotDeaMeSmA02S03 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total reported deaths) title("C-19 total reported deaths, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 35c C-19 total deaths, $country, `l', worse scenario CI, IHME.gph", replace
qui graph export "graph 35c C-19 total deaths, $country, `l', worse scenario CI, IHME.pdf", replace

}
*
    
  
  

*******************
* total infections
*******************


******
* 41a total infections, national, all subnational, reference scenario = S1 

twoway ///
(line DayINFMeSmA02S01XAB date, sort lwidth(medium) lcolor(cyan)) /// 1 "AB" cyan
(line DayINFMeSmA02S01XBC date, sort lwidth(medium) lcolor(blue)) /// 2 "BC" blue
(line DayINFMeSmA02S01XMB date, sort lwidth(medium) lcolor(lime)) /// 3 "MB" lime
(line DayINFMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 4 "NS" magenta
(line DayINFMeSmA02S01XNL date, sort lwidth(medium) lcolor(gray)) /// 5 "NL"
(line DayINFMeSmA02S01XNS date, sort lwidth(medium) lcolor(magenta)) /// 6 "NS" magenta
(line DayINFMeSmA02S01XON date, sort lwidth(medium) lcolor(red)) /// 7 "ON" red
(line DayINFMeSmA02S01XQC date, sort lwidth(medium) lcolor(black)) /// 8 "QC" black
(line DayINFMeSmA02S01XSK date, sort lwidth(medium) lcolor(orange)) /// 9 "SK" orange
(line DayINFMeSmA02S01XXX date, sort lwidth(thick) lcolor(gray)) /// 10 "CAN" 
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("C-19 total infections, $country, IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AB" 2 "BC" 3 "MB" 5 "NL" 6 "NS" 7 "ON" 8 "QC" 9 "SK" 10 "CAN") rows(2) size(small)) ///
subtitle("All provinces avilable in IHME", size(small)) 

qui graph save "graph 41a C-19 total infections, $country, subnational, IHME, reference scenario.gph", replace
qui graph export "graph 41a C-19 total infections, $country, subnational, IHME, reference scenario.pdf", replace



******
* 41b total infections, national, subnational, separate, reference scenario = S1 

levelsof provincestate, local(levels)

foreach l of local levels {

twoway (rarea DayINFLoSmA02S01 DayINFUpSmA02S01 date, sort color(green*.2)) ///
(line DayINFMeSmA02S01 date, sort lcolor(green)) ///
if provincestate == "`l'" & DayINFMeSmA02S01 != ., legend(off) ///	   
xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("C-19 total infections, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
subtitle("with confidence limits", size(small))	
  	   
qui graph save "graph 41b C-19 total infections, $country, `l', IHME, reference scenario.gph", replace
qui graph export "graph 41b C-19 total infections, $country, `l', IHME, reference scenario.pdf", replace

}
*




******
* 42a total infections, 3 scenarios  

levelsof provincestate, local(levels)

foreach l of local levels {
  
twoway ///
(line DayINFMeSmA02S01 date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
(line DayINFMeSmA02S02 date, sort lcolor(green)) ///
(line DayINFMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("C-19 total infections, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Reference" 2 "Better" 3 "Worse") rows(1))

qui graph save "graph 42a C-19 total infections, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 42a C-19 total infections, $country, `l' 3 scenarios, IHME.pdf", replace

}
*





******
* 43a total infections, reference scenario = S1, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayINFLoSmA02S01 date, sort lcolor(green)) ///
(line DayINFUpSmA02S01 date, sort lcolor(red)) ///
(line DayINFMeSmA02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("C-19 total infections, $country, `l', IHME, reference scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 43a C-19 total infections, $country, `l', reference scenario CI, IHME.gph", replace
qui graph export "graph 43a C-19 total infections, $country, `l', reference scenario CI, IHME.pdf", replace

}
*





******
* 43b total infections, better scenario = S2, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayINFLoSmA02S02 date, sort lcolor(green)) ///
(line DayINFUpSmA02S02 date, sort lcolor(red)) ///
(line DayINFMeSmA02S02 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("C-19 total infections, $country, `l', IHME, better scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 43b C-19 total infections, $country, `l', better scenario CI, IHME.gph", replace
qui graph export "graph 43b C-19 total infections, $country, `l', better scenario CI, IHME.pdf", replace

}
*
  
  
  

******
* 43c total infections, worse scenario = S3, CI
  
levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayINFLoSmA02S03 date, sort lcolor(green)) ///
(line DayINFUpSmA02S03 date, sort lcolor(red)) ///
(line DayINFMeSmA02S03 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Total infections) title("C-19 total infections, $country, `l', IHME, worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Lower" 2 "Upper" 3 "Mean") rows(1))

qui graph save "graph 43c C-19 total infections, $country, `l', worse scenario CI, IHME.gph", replace
qui graph export "graph 43c C-19 total infections, $country, `l', worse scenario CI, IHME.pdf", replace

}
*
    
  
  


  
****************
* IDR, IHR, IFR
****************


*****
* 51a daily Infection fatality ratio, 3 scenarios  


levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line infection_fatality_A02S02 date, sort lcolor(green)) ///
(line infection_fatality_A02S03 date, sort lcolor(red)) ///
(line infection_fatality_A02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.3fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily Infection Fatality Ratio) title("C-19 daily IFR, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1))

qui graph save "graph 51a C-19 daily IFR, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 51a C-19 daily IFR, $country, `l', scenarios, IHME.pdf", replace

}
*


*****
* 51b daily Infection detection ratio, 3 scenarios  
  
levelsof provincestate, local(levels)

foreach l of local levels {
 
twoway ///
(line infection_detection_A02S02 date, sort lcolor(green)) ///
(line infection_detection_A02S03 date, sort lcolor(red)) ///
(line infection_detection_A02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily Infection Detection Ratio) title("C-19 daily IDR, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1))

qui graph save "graph 51b C-19 daily IDR, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 51b C-19 daily IDR, $country, `l', 3 scenarios, IHME.pdf", replace

}
*


*****
* 51c daily Infection hospitalization ratio, 3 scenarios  
  
levelsof provincestate, local(levels)

foreach l of local levels {
   
twoway ///
(line inf_hosp_A02S02 date, sort lcolor(green)) ///
(line inf_hosp_A02S03 date, sort lcolor(red)) ///
(line inf_hosp_A02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily Infection hospitalization ratio) title("C-19 daily IHR, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1))

qui graph save "graph 51c C-19 daily IHR, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 51c C-19 daily IHR, $country, `l', 3 scenarios, IHME.pdf", replace

}
*


*****
* 51d daily Infection outcomes ratios, reference scenario 
    
levelsof provincestate, local(levels)

foreach l of local levels {
   
twoway ///
(line infection_detection_A02S01 date, sort lcolor(green)) ///
(line inf_hosp_A02S01 date, sort lcolor(black)) ///
(line infection_fatality_A02S01 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection-outcome ratios) title("C-19 infection-outcome ratios, $country, `l' IHME, Ref. scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2))

qui graph save "graph 51d C-19 daily Infection outcomes ratios, $country, `l' reference scenario, IHME.gph", replace
qui graph export "graph 51d C-19 daily Infection outcomes ratios, $country, `l' reference scenario, IHME.pdf", replace

}
*



*****
* 51e daily Infection outcomes ratios, better scenario 
    
levelsof provincestate, local(levels)

foreach l of local levels {
   
twoway ///
(line infection_detection_A02S02 date, sort lcolor(green)) ///
(line inf_hosp_A02S02 date, sort lcolor(black)) ///
(line infection_fatality_A02S02 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection-outcome ratios) title("C-19 infection-outcome ratios, $country, `l' IHME, Better scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2))

qui graph save "graph 51e C-19 daily Infection outcomes ratios, $country, `l' better scenario, IHME.gph", replace
qui graph export "graph 51e C-19 daily Infection outcomes ratios, $country, `l' better scenario, IHME.pdf", replace

}
*




*****
* 51f daily Infection outcomes ratios, worse scenario 
    
levelsof provincestate, local(levels)

foreach l of local levels {
   
twoway ///
(line infection_detection_A02S03 date, sort lcolor(green)) ///
(line inf_hosp_A02S03 date, sort lcolor(black)) ///
(line infection_fatality_A02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection-outcome ratios) title("C-19 infection-outcome ratios, $country, `l', IHME, Worse scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2))

qui graph save "graph 51f C-19 daily Infection outcomes ratios, $country, `l' worse scenario, IHME.gph", replace
qui graph export "graph 51f C-19 daily Infection outcomes ratios, $country, `l' worse scenario, IHME.pdf", replace

}
*




*****
* 51g daily Infection outcomes ratios, 3 scenarios 
    
levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway ///
(line infection_detection_A02S01 date, sort lcolor(green)) ///
(line inf_hosp_A02S01 date, sort lcolor(black)) ///
(line infection_fatality_A02S01 date, sort lcolor(red)) ///
(line infection_detection_A02S02 date, sort lcolor(green) lpattern(dash)) ///
(line inf_hosp_A02S02 date, sort lcolor(black) lpattern(dash)) ///
(line infection_fatality_A02S02 date, sort lcolor(red) lpattern(dash)) ///
(line infection_detection_A02S03 date, sort lcolor(green) lpattern(dash)) ///
(line inf_hosp_A02S03 date, sort lcolor(black) lpattern(dash)) ///
(line infection_fatality_A02S03 date, sort lcolor(red) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infection-outcome ratios) title("C-19 daily infection-outcome ratios, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2)) ///
note("Better and worse scenarios: dashed curves")

qui graph save "graph 51g C-19 daily Infection outcomes ratios, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 51g C-19 daily Infection outcomes ratios, $country, `l', 3 scenarios, IHME.pdf", replace

}
*




**************************

* other outcomes 


*****
* 61a daily beds needed, 3 scenarios

levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway (rarea DayBedLoSmA02S01 DayBedUpSmA02S01 date, sort color(black*.2)) ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
(line DayBedMeSmA02S02 date, sort lcolor(green)) ///
(line DayBedMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily beds needed) title("C-19 daily beds needed, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) ///
note("Note: Values in the 3 scenarios are identical.")

qui graph save "graph 61a C-19 daily beds needed, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 61a C-19 daily beds needed, $country, `l', 3 scenarios, IHME.pdf", replace

}
*


*****
* 61b daily beds needed, 3 scenarios, with all_bed_capacity

levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway (rarea DayBedLoSmA02S01 DayBedUpSmA02S01 date, sort color(black*.2)) ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
(line DayBedMeSmA02S02 date, sort lcolor(green)) ///
(line DayBedMeSmA02S03 date, sort lcolor(red)) ///
(line DayBEDMeSmA02 date, sort lcolor(blue) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily beds needed) title("C-19 daily beds needed, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Reference" 3 "Better" 4 "Worse" 5 "All bed capacity") rows(2)) ///
note("Note: Values in the 3 scenarios are identical.") ///
subtitle("All bed capacity: Total number of beds that exist at a location", size(small))

qui graph save "graph 61b C-19 daily beds needed, $country, `l', 3 scenarios, IHME all_bed_capacity.gph", replace
qui graph export "graph 61b C-19 daily beds needed, $country, `l', 3 scenarios, IHME all_bed_capacity.pdf", replace

}
*



*****
* 62a ICU beds needed, 3 scenarios

levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway (rarea DayIcuLoSmA02S01 DayIcuUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S02 date, sort lcolor(green)) ///
(line DayIcuMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(ICU beds needed) title("C-19 daily ICU beds needed, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) ///
note("Note: Values in the 3 scenarios are identical.")
	   
qui graph save "graph 62a C-19 daily ICU beds needed,$country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 62a C-19 daily ICU beds needed, $country, `l', 3 scenarios, IHME.pdf", replace

}
*




*****
* 62b ICU beds needed, 3 scenarios, with icu_bed_capacity

levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway (rarea DayIcuLoSmA02S01 DayIcuUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S02 date, sort lcolor(green)) ///
(line DayIcuMeSmA02S03 date, sort lcolor(red)) ///
(line DayICUMeSmA02 date, sort lcolor(blue) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(ICU beds needed) title("C-19 daily ICU beds needed, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Reference" 3 "Better" 4 "Worse" 5 "ICU bed capacity") rows(2)) ///
note("Note: Values in the 3 scenarios are identical.") ///
subtitle("ICU bed capacity: Total number of ICU beds that exist at a location", size(small))

qui graph save "graph 62b C-19 daily ICU beds needed, $country, `l', 3 scenarios, IHME icu_bed_capacity.gph", replace
qui graph export "graph 62b C-19 daily ICU beds needed, $country, `l', 3 scenarios, IHME icu_bed_capacity.pdf", replace

}
*



*****
* 63a daily hospital admissions, 3 scenarios

levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway (rarea DayAdmLoSmA02S01 DayAdmUpSmA02S01 date, sort color(black*.2)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(black)) ///
(line DayAdmMeSmA02S02 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S02 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily hospital admissions) title("C-19 daily hospital admissions $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) ///
note("Note: Values in the 3 scenarios are identical.")
	   
qui graph save "graph 63a C-19 daily hospital admissions, $country, `l' 3 scenarios, IHME.gph", replace
qui graph export "graph 63a C-19 daily hospital admissions, $country, `l' 3 scenarios, IHME.pdf", replace

}
*



*****
* 64a daily ICU beds needed

levelsof provincestate, local(levels)

foreach l of local levels {
     
twoway (rarea DayIcuLoSmA02S01 DayIcuUpSmA02S01 date, sort color(black*.2)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S02 date, sort lcolor(green)) ///
(line DayIcuMeSmA02S03 date, sort lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily ICU beds needed) title("C-19 daily ICU beds needed, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) ///
note("Note: Values in the 3 scenarios are identical.")

qui graph save "graph 64a C-19 daily ICU beds needed, $country, `l', 3 scenarios, IHME.gph", replace
qui graph export "graph 64a C-19 ICU beds needed, $country, `l', 3 scenarios, IHME.pdf", replace

}
*




*****
* 65a Tests per 100,000

levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway (rarea testing_lower testing_upper date, sort color(black*.2)) ///
(line testing_mean date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Tests per 100K) title("C-19 tests per 100K, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	

qui graph save "graph 29 C-19 Tests per 100,000, $country, `l', IHME.gph", replace
qui graph export "graph 29 C-19 Tests per 100,000, $country, `l', IHME.pdf", replace

}
*



*****
* 66a daily hospital-related outcomes

levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("C-19 daily hospital-related outcomes, $country, `l', IHME, Ref. scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Bed" 2 "ICU" 3 "Admission") rows(1)) yscale(titlegap(4))

qui graph save "graph 66a C-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME.gph", replace
qui graph export "graph 66a C-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME.pdf", replace

}
*



*****
* 66b daily hospital-related outcomes, with all_bed_capacity ICU_bed_capacity

levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayBedMeSmA02S01 date, sort lcolor(black)) ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
(line DayBEDMeSmA02 date, sort lcolor(blue) lpattern(dash)) ///
(line DayICUMeSmA02 date, sort lcolor(cyan) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("C-19 daily hospital-related outcomes, $country, `l', IHME, Ref. scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Bed" 2 "ICU" 3 "Admission" 4 "All bed capacity" 5 "ICU bed capacity") rows(2)) yscale(titlegap(4))

qui graph save "graph 66b C-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME all_bed_capacity.gph", replace
qui graph export "graph 66b C-19 daily hospital-related outcomes, $country, `l',reference scenario, IHME all_bed_capacity.pdf", replace

}
*



*****
* 67a daily hospital-related outcomes, wo beds needed 

levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line DayIcuMeSmA02S01 date, sort lcolor(green)) ///
(line DayAdmMeSmA02S01 date, sort lcolor(yellow)) ///
(line DayICUMeSmA02 date, sort lcolor(cyan) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily outcomes) title("C-19 daily hospital-related outcomes, $country, `l', IHME, Ref. scenario", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "ICU" 2 "Admission" 3 "ICU bed capacity") rows(1)) ///
subtitle("without beds needed", size(small)) yscale(titlegap(4))

qui graph save "graph 67a C-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME, wo beds needed.gph", replace
qui graph export "graph 67a C-19 daily hospital-related outcomes, $country, `l', reference scenario, IHME, wo beds needed.pdf", replace

}
*



*****
* 68a daily % change in mobility, CI

levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line mobility_mean_A02S02 date, sort lcolor(green)) ///
(line mobility_mean_A02S03 date, sort lcolor(red)) ///
(line mobility_mean_A02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily % change in mobility from baseline) title("C-19 daily % change in mobility, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1)) 

qui graph save "graph 68a C-19 daily mobility, $country, `l', IHME, 3 scenarios.gph", replace
qui graph export "graph 68a C-19 daily mobility, $country, `l', IHME, 3 scenarios.pdf", replace

}
*



*****
* 69a daily mask_use Percent of population reporting always wearing a mask when leaving home

levelsof provincestate, local(levels)

foreach l of local levels {
    
twoway ///
(line mask_use_mean_A02S02 date, sort lcolor(green)) ///
(line mask_use_mean_A02S03 date, sort lcolor(red)) ///
(line mask_use_mean_A02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily mask use) title("C-19 daily mask use, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1)) ///
subtitle(Proportion of population reporting always wearing a mask when leaving home, size(small))

qui graph save "graph 69a C-19 daily mask_use, $country, `l', IHME, 3 scenarios.gph", replace
qui graph export "graph 69a C-19 daily mask_use, $country, `l', IHME, 3 scenarios.pdf", replace

}
*



*****
* 70a daily pneumonia_mean Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths by location

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line pneumonia_mean date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily ratio of pneumonia deaths) title("Daily ratio of pneumonia deaths, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
subtitle(Ratio of pneumonia deaths in a given week to the average weekly pneumonia deaths, size(small))

qui graph save "graph 70a C-19 daily ratio of pneumonia deaths, $country, `l', IHME.gph", replace
qui graph export "graph 70a C-19 daily ratio of pneumonia deaths, $country, `l', IHME.pdf", replace

}
*




*****
* 71a cumulative vaccinated

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line cumul_vax date, sort lcolor(black)) ///
(line cumul_effective_vax date, sort lcolor(blue)) ///
(line cumul_fully_vax date, sort lcolor(green)) ///
if provincestate == "`l'" & date >= td(01dec2020) ///	   
, xtitle(Date) xlabel(#13, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Cumulative vaccinated) title("C-19 cumulative vaccinated, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Vaccinated" 2 "Effectively vaccinated" 3 "Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small)) yscale(titlegap(4))

qui graph save "graph 71a C-19 cumulative vaccinated, $country, `l', IHME.gph", replace
qui graph export "graph 71a C-19 cumulative vaccinated, $country, `l', IHME.pdf", replace

}
*




*****
* 71b percent cumulative vaccinated

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line cumul_vax_pct date, sort lcolor(black)) ///
(line cumul_effective_vax_pct date, sort lcolor(blue)) ///
(line cumul_fully_vax_pct date, sort lcolor(green)) ///
if provincestate == "`l'" & date >= td(01dec2020) ///	   
, xtitle(Date) xlabel(#13, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(% Cumulative vaccinated) title("C-19, % cumulative vaccinated, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "% Vaccinated" 2 "% Effectively vaccinated" 3 "% Fully vaccinated") rows(1)) ///
note("Vaccinated: Initially vaccinated (one dose of two doses)" ///
"Effectively vaccinated: one and two dose with efficacy" ///
"Fully vaccinated: one of one and two of two doses", size(small)) yscale(titlegap(4))

qui graph save "graph 71b C-19 percent cumulative vaccinated, $country, `l' IHME.gph", replace
qui graph export "graph 71b C-19 percent cumulative vaccinated, $country, `l' IHME.pdf", replace

}
*





*****
* 72a R effective, all time

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(rarea reff_lower_A02S01 reff_upper_A02S01 date, sort color(black*.2)) ///
(line reff_mean_A02S02 date, sort lcolor(green)) ///
(line reff_mean_A02S03 date, sort lcolor(red)) ///
(line reff_mean_A02S01 date, sort lcolor(black)) ///
if provincestate == "`l'" & date >= td(01dec2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(R effective) title("C-19 R effective, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(2 "Better" 4 "Worse" 2 "Reference" ) rows(1)) 

qui graph save "graph 72a C-19 R effective, $country, `l', IHME, 3 scenarios.gph", replace
qui graph export "graph 72a C-19 R effective, $country, `l', IHME, 3 scenarios.pdf", replace

}
*




*****
* 72b R effective, 01jun2021 on

levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line reff_mean_A02S02 date, sort lcolor(green) lwidth(thick)) ///
(line reff_mean_A02S03 date, sort lcolor(red) lwidth(thick)) ///
(line reff_lower_A02S03 date, sort lcolor(red*.5) lpattern(dash)) ///
(line reff_upper_A02S03 date, sort lcolor(red*.5) lpattern(dash)) ///
(line reff_mean_A02S01 date, sort lcolor(black) lwidth(thick)) ///
(line reff_lower_A02S01 date, sort lcolor(black*.5) lpattern(dash)) ///
(line reff_upper_A02S01 date, sort lcolor(black*.5) lpattern(dash)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.1fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
ytitle(R effective) title("C-19 R effective, $country, `l', IHME, 3 scenarios", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "Better" 2 "Worse" 5 "Reference") rows(1)) ///
note(Uncertainty limits: dashed curves)

qui graph save "graph 72b C-19 R effective, $country, `l', IHME, 3 scenarios 01jun2021 on.gph", replace
qui graph export "graph 72b C-19 R effective, $country, `l', IHME, 3 scenarios 01jun2021 on.pdf", replace

}
*



*****
* 80 DayINF DayDea Dea_multip


levelsof provincestate, local(levels)

foreach l of local levels {

twoway ///
(line DayINFMeSmA02S01 date, sort lcolor(blue)) ///
(line DayDeaMeSmA02S01 date, sort lcolor(red)) ///
(line DayDMuMeSmA02S01 date, sort lpattern(dot) lcolor(red)) ///
if provincestate == "`l'" & date >= td(01jan2020) ///	   
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
ytitle(Daily infections and deaths) title("C-19 daily infections & deaths, $country, `l', IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(4)) legend(region(lcolor(none)))  ///
legend(order(1 "Daily infections" 2 "Daily deaths" 3 "Daily deaths scaled for visualization") size(small)) ///
subtitle("Daily deaths, scaled = times (means of infections divided by deaths) for visualization only", size(small)) ///
note("Current scenario, mean estimate")

qui graph save "graph 80 C-19 daily deaths and infections, $country, `l', IHME.gph", replace
qui graph export "graph 80 C-19 daily deaths and infections, $country, `l', IHME.pdf", replace

}
*





view "log CovidVisualizedCountry IHME.smcl"

log close

exit, clear




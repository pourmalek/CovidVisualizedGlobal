globalcovid

## Variable name structure

Estimates of (1) Daily Deaths, (2) Total Deaths, (3) Daily Cases (incident or prevalent), and (4) Total Cases (incident) from component studies, are the primary outcome variables of interest in this review. Hospital-related and other outcomes from component studies are the secondary outcome variables.

Primary variables were taken from component studies. Secondary variables were calculated in this review. In order to facilitate data management, the primary variables were `-rename-`d or `-renvar-`ed using the variables from component studies according to following conventions. The same set of conventions were adhered to in naming all outcome variables. 

As described below through an example, primary variable names have 7 parts, each part denoting one piece of info about the variable. 

All the variables have descriptive var `-label-`s that show what the variable stores. 

`Stata` commands are displayed as `-command-` and `Stata` non-command syntax as -syntax-.
<br/><br/>

### Variable names

<br/><br/>


#### Primary outcome variable names:


Example:

TotDeaMeRaA01S00V03

1234567890123456789

-varname- has 19 positions. 


Tot...Dea...Me....Ra.....A01.....S00......V03

1-3...4-6...7-8...9-10...11-13...14-16..17-19
<br/><br/>

* Positions 1-3: Tot or Day: Total (cumulative) or Daily 

* Positions 4-6: Dea, Cas, or Act: Dea for Deaths, Cas for incident Cases, or Act for Active cases (for primary outcomes; for secondary outcomes see below)

* Positions 7-8: Me, Lo, or Up: Mean, Lower, or Upper (uncertainty bound)

* Positions 9-10: Ra or Sm: Raw (not smoothed) or Smoothed

* Positions 11-13: A00 to A05: Component study number (see details below)

* Positions 14-16 S??: Scenario number within component study (see details below)

* Positions 17-19: V??: Version of the model in component study (see details below)


Version of the model in component study is the only part that is fixed within each component study in this review , within each update. That is not the case within [longitudinal](https://github.com/pourmalek/globalcovid/tree/main/longitudinal) assessment.


The example primary variable name, TotDeaMeRaA01S00V03, denotes Total Deaths, mean, raw, DELPHI, single scenario, model version 3. 

<br/><br/>

#### Secondary outcome variable names:

* Positions 4-6 in variable name can be, for instance,  *Act*, that means *Active cases* [in study *DELP*]

* Positions 4-6: meaning [study]

* Act: Active cases [DELP]									
* Adm: Admissions (hospital admissions by day) [IHME]				
* Bed: Bed need (covid beds needed by day) [IHME]					
* Beo: Bed over ( [covid all beds needed] - ([total bed capacity] - [average all bed usage]) ) [IHME] (Retired)
* Hod: Hospital Demand [IMPE]									
* Hos: Hospitalized [DELP]										
* Hoi: Hospital incidence [IMPE]									
* Icd: ICU Demand [IMPE]										
* Ici: ICU incidence [IMPE]									
* Icn: ICU new (number of new people going to the ICU by day) [IHME]		
* Ico: ICU over ( [covid ICU beds needed] - ([total ICU capacity] - [average ICU bed usage]) ) [IHME] (Retired)
* Icu: ICU need (ICU covid beds needed by day) [IHME]					
* Pre: Prevalence [IMPE]										
* Ref: R effective [IMPE]										
* Rtt : R t [IMPE]											
* Ser: Seroprevalence (seroprevalence) [IHME]						
* Tes: Tests (total tests) [IHME]							
* Ven: Ventilated [DELP]									
* Ven: Vent need (invasive Ventilation needed by day) [IHME]


Example: The -varname- DayIcdMeRaA03S01V07 carries -varlabel- "Daily ICU demand Mean A03 S01 V07". It is the daily ICU demand, mean estimate, in study A03 (IMPE), scenario 1, model version 7. 

<br/><br/>
						
#### Secondary variable names:

Secondary variables have 2 subtypes: (1) store a calculated daily CFR, (2) store values created for visualization of temporal succession of daily cases and daily deaths peaks.


_(1) store a calculated daily CFR_

* Positions 4-6 read as CFR. 

Example:

DayCfrMeRaA00S00V00 "Daily CFR JOHN"


_(2) store values created for visualization of temporal succession of daily cases and daily deaths peaks_

* CaM: (Cases Mean) "Daily Cases Mean"
* CbD (Cases by Deaths) "Daily cases mean div by daily deaths mean" 
* DeM: (Deaths Mean) "Daily Deaths Mean"

* DayDea_multip_ "Daily deaths scaled (times means of cases by deaths) only for visualization" This one is an exceptional deviation from the overarching nomenclature rules. 


<br/><br/>

#### Component study number:


A00 JOHN Johns Hopkins

A01 DELP DELPHI (Differential Equations Leads to Predictions of Hospitalizations and Infections)

A02 IHME Institute for Health Metrics and Evaluation

A03 IMPE Imperial College

A04 LANL Los Alamos National Laboratory

A05 SRIV Srivastava
	 
<br/><br/>


### References for component studies


**A00 JOHN**
Johns Hopkins University. Coronavirus resource center. https://coronavirus.jhu.edu/map.html
<br/><br/>
**A01 DELP** 
COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology https://www.covidanalytics.io/projections
<br/><br/>
**A02 IHME** 
Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid
<br/><br/>
**A03 IMPE** 
MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports
<br/><br/>
**A04 LANL** 
Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org
<br/><br/>
**A05 SRIV**
University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19
<br/><br/>


### Scenario number within component study


[Names within brackets assigned by this review study.]

* **A00 JOHN**
* S00 = [Not Applicable]
<br/><br/>
* **A01 DELP** 
* S00 = [Single scenario]
<br/><br/>
* **A02 IHME** 
* S01 = Reference scenario [Status Quo] 
* S02 = Best scenario (Universal masks) [Best]
* S03 = Worse scenario (Mandates easing) [Worst] 
<br/><br/>
* **A03 IMPE** 
* S01 = Additional 50% Reduction [Best]	
* S02 = Current level of interventions [Reference] 			
* S03 = Relax Interventions 50% [Worst]
* S04 = Surged Additional 50% Reduction [Best, Surged]
* S05 = Surged Maintain Status Quo [Reference, Surged] 	
* S06 = Surged Relax Interventions 50% [Worst, Surged]	
<br/><br/>
* **A04 LANL** 
* S00 = [Single scenario]
<br/><br/>
* **A05 SRIV**
* S00 = [current]
<br/><br/>


### Recent Versions of the model in component study 


* A00 JOHN = V00 [Version Not Applicable; updates daily]

* A01 DELP = V03

* A02 IHME = V03

* A03 IMPE = V07	

* A04 LANL = V02

* A05 SRIV = V00 [Version Not Mentioned; or could not be located]


<br/><br/>
Note: Johns Hopkins, obviously not an "estimation study", is used as a benchmark gauge of the *under-reported* so-called "Ground Truth". 


<br/><br/>

* All codes are copyrighted by the author under Apache License 2.0.

* See [`LICENSE`](https://github.com/pourmalek/globalcovid/blob/main/LICENSE)

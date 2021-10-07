# CovidVisualizedGlobal 

## ! If you are in a rush, look at the graphs in the [_latest Situation report_](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/situation%20reports/09%20Global%20COVID-19%20epidemic%20models%20situation%20report%20No%2009%20–%202021-10-01.pdf).

For a streamlined view of this repository, see: https://pourmalek.github.io/CovidVisualizedGlobal/

<br/><br/>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
[![DOI](https://zenodo.org/badge/357850528.svg)](https://zenodo.org/badge/latestdoi/357850528)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/5199/badge)](https://bestpractices.coreinfrastructure.org/projects/5199)


### Combine and visualize international periodically updated estimates of COVID-19 pandemic 

### <div align="center"> at the global level 🌍 
  

  
*****************************
  
## TOC

### [I. SELECTED GRAPHS FROM LATEST UPTAKE](https://github.com/pourmalek/CovidVisualizedGlobal#i-selected-graphs-from-latest-uptake-1)

### [II. METHODS AND RESULTS OF THIS WORK](https://github.com/pourmalek/CovidVisualizedGlobal#ii-methods-and-results-of-this-work-1)

### [III. INNER WORKS OF THIS REPOSITORY](https://github.com/pourmalek/CovidVisualizedGlobal#iii-inner-works-of-this-repository-1)

### [IV. SELECTED GRAPHS FROM PREVIOUS UPTAKES](https://github.com/pourmalek/CovidVisualizedGlobal#iv-selected-graphs-from-previous-uptakes-1)
  
*****************************

  
#### :eyes: SEE the graphs, code, and data of periodical updates of COVID-19 pandemic models’ estimates: 
  
#### by models: [Delphi](https://covidanalytics.io/projections), [IHME](https://covid19.healthdata.org/canada?view=daily-deaths&tab=trend), [Imperial college](https://github.com/mrc-ide/global-lmic-reports/blob/master/CAN/2021-06-18/index.pdf), [Los Alamos](https://covid-19.bsvgateway.org), and [Srivastava](https://scc-usc.github.io/ReCOVER-COVID-19/#/), 
  
#### for daily (and total) [deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#1-daily-deaths-reference-scenarios-all-time), [cases or infections](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#4-daily-cases-or-infections-reference-scenarios-all-time), and [hospitalizations](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#7-hospital-related-outcomes-all-time),
   
#### or for countries via code adjustment, e.g., [Afghanistan](https://github.com/pourmalek/covir2/tree/main/ADAPTATIONS_EXAMPLES/Afghanistan_%2020210625/20210625), [Pakistan](https://github.com/pourmalek/covir2/tree/main/ADAPTATIONS_EXAMPLES/Pakistan_20210704)

   

********************************************************************************************************************************************
********************************************************************************************************************************************
* Project: Combine and visualize international periodically updated estimates of COVID-19 pandemic at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek (pourmalek_farshad at yahoo dot com) 
  
  [![ORCIDID](https://user-images.githubusercontent.com/30849720/127926326-89321742-cb08-4c18-bbdd-9b0c12e4ab2f.png)](https://orcid.org/0000-0002-2134-0771) || [`PubMed`](https://pubmed.ncbi.nlm.nih.gov/?term=Pourmalek+F&sort=pubdate&size=200)  ||  [![global_reach](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/sandbox/global_reach.png?raw=true)](https://profiles.impactstory.org/u/0000-0002-2134-0771/achievements) [`Global Reach Top 10%`](https://profiles.impactstory.org/u/0000-0002-2134-0771/achievements)  || [UBC SPPH](https://www.spph.ubc.ca/person/farshad-pourmalek/) || [UW IHME](http://www.healthdata.org/about/farshad-pourmalek) || [YouCheck](https://youcheck.ca)  
* Time (initial): 2021-04-14
********************************************************************************************************************************************
********************************************************************************************************************************************

  <br/><br/>
  
Under review pre-print for this project: 
 
 https://europepmc.org/article/PPR/PPR377517
   
 [Pourmalek F. CovidVisualized: Visualized compilation of international updating models’ estimates of COVID-19 pandemic at global and country levels. Research Square; 2021. DOI: 10.21203/rs.3.rs-768714/v1.](https://www.researchsquare.com/article/rs-768714/v1)

 [PDF](https://github.com/pourmalek/covir2/blob/main/journal%20articles%2C%20this%20work/Pourmalek%20F%20-%20CovidVisualized-%20Visualized%20compilation%20of%20international%20updating%20models’%20estimates%20of%20COVID-19%20pandemic%20at%20global%20and%20country%20levels%20-%20PREPRINT%20%20Research%20Square%2020210802.pdf)

 <br/><br/>
 
 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
 
### Related repositories:

THREE “CovidVisualized” repositories, use a common template and logic for visualization of the results of estimates of FIVE international and periodically updated COVID-19 pandemic models for the future of the epidemic:

[`CovidVisualizedGlobal`]( https://github.com/pourmalek/CovidVisualizedGlobal) for the [`GLOBAL`](https://github.com/pourmalek/CovidVisualizedGlobal#covidvisualizedglobal) level

[`CovidVisualizedCountry`](https://github.com/pourmalek/CovidVisualizedCountry) for countries with subnational estimates: [`CANADA`](https://github.com/pourmalek/CovidVisualizedCountry#covidvisualizedcountry)

[`covir2`](https://github.com/pourmalek/covir2) for countries without subnational estimates: [`IRAN`](https://github.com/pourmalek/covir2#covir2)

These results in these three repositories get periodically updated. 

The codes in these repositories can be adapted for use for any country or region in the world. 
 
* For a sample application of “covir2” to a country without subnational estimates see [`Afghanistan`](https://github.com/pourmalek/covir2/blob/main/ADAPTATIONS_EXAMPLES/Afghanistan_%2020210625/20210625/README.md), [`Pakistan`](https://github.com/pourmalek/covir2/tree/main/ADAPTATIONS_EXAMPLES/Pakistan_20210704)
 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   


<br/><br/>  
  
  



********************************************************************************************************************************************

********************************************************************************************************************************************
  
********************************************************************************************************************************************
  
********************************************************************************************************************************************

## I. SELECTED GRAPHS FROM LATEST UPTAKE

********************************************************************************************************************************************
********************************************************************************************************************************************

### LATEST UPTAKE: uptake [`20211001`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211001)
 
### DELP 20210930, **_IHME 20211001_**, IMPE 20210924, LANL 20210926, SRIV 20210930

  <br/><br/>


# :eyes: SEE: The - S I X T H - G L O B A L - W A V E - in [Global COVID-19 epidemic models situation report No 09 – 2021-10-01](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/situation%20reports/09%20Global%20COVID-19%20epidemic%20models%20situation%20report%20No%2009%20–%202021-10-01.pdf)  

  
****
  
## Abbreviations used in graphs:  
  
(See [Methods and Results](https://github.com/pourmalek/CovidVisualizedGlobal#ii-methods-and-results-of-this-work-1) for full details.)

**DELP**: DELPHI. Differential Equations Lead to Predictions of Hospitalizations and Infections. COVID-19 pandemic model named DELPHI developed by Massachusetts Institute of Technology, Cambridge
  
**IHME**: Institute for Health Metrics and Evaluation. COVID-19 pandemic model by developed Institute for Health Metrics and Evaluation, Seattle
  
**IMPE**: Imperial. COVID-19 pandemic model developed by Imperial College, London
  
**JOHN**: Johns Hopkins. Coronavirus resource center, Johns Hopkins University, Baltimore
  
**LANL**: Los Alamos National Laboratories. COVID-19 pandemic model developed by Los Alamos National Laboratories, Los Alamos
  
**SRIV**: Srivastava, Ajitesh. COVID-19 pandemic model developed by Ajitesh Srivastava, University of Southern California, Los Angeles
  
  
****  
  
****

****

  
  
#### Logical order of graphs:

(1) Outcomes: Daily deaths, Daily cases or infections, Hospital-related outcomes, Daily deaths estimated to reported ratio, Daily cases or infections estimated to reported cases ratio. Followed by extra outcomes estimated by IHME and added starting from uptake 20210916, i.e., Daily Infection-outcome ratios, Daily mobility, Daily mask use, and (Percent) cumulative vaccinated. 

(2) Calendar time of estimates coverage: All-time, followed by 2021. To view the whole epidemic trajectory and further focus on the near future.

(3) Scenarios: Reference scenarios, followed by alternative scenarios. To examine the main or reference (aka. status quo) scenario and alternative (better and worse) scenarios. 

(4) Five models: Different models within each graph (for which model estimates update release dates are maximally synchronized), plus official reports of the country to WHO (curated by Johns Hopkins University) as the under-reported benchmark for trends. To examine how heterogeneity in methods used by different models results in heterogeneous results for the same outcome (same time-place-person aggregated units)

****
****
  
#### List of graphs (with links)
  
(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#1-daily-deaths-reference-scenarios-all-time)
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#2-daily-deaths-reference-scenarios-2021)  
  
(2b) [Daily deaths, reference scenarios, 2021, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#2b-daily-deaths-reference-scenarios-2021-with-ihme-excess-deaths)
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#3-daily-deaths-3-scenarios-2021)

(3b) [Daily deaths, 3 scenarios, 2021, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#3b-daily-deaths-3-scenarios-2021-ihme)

(3c) [Daily deaths, 3 scenarios, 2021, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#3c-daily-deaths-3-scenarios-2021-impe)

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#4-daily-cases-or-infections-reference-scenarios-all-time)

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#5-daily-cases-or-infections-reference-scenarios-2021)

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#6-daily-cases-or-infections-3-scenarios-2021)

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#7-hospital-related-outcomes-all-time)

(7b) [Hospital-related outcomes, all time, with IHME All bed capacity and ICU bed capacity](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#7b-hospital-related-outcomes-all-time-with-ihme-all-bed-capacity-and-icu-bed-capacity)

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#8-hospital-related-outcomes-2021-without-ihme-bed-need-and-impe-hospital-demand)

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#9-daily-deaths-estimated-to-reported-reference-scenarios-2021)

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#10-daily-cases-or-infections-estimated-to-reported-cases-reference-scenarios-2021)

(11) [Daily Infection outcomes ratios, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#11-daily-infection-outcomes-ratios-3-scenarios-all-time-ihme)

(12) [Daily mobility, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#12-daily-mobility-3-scenarios-all-time-ihme)

(13) [Daily mask use, 3 scenarios, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#13-daily-mask-use-3-scenarios-ihme)
  
(14) [Percent cumulative vaccinated, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/README.md#14-percent-cumulative-vaccinated-ihme)
  
****
****
  
  
  
****

### (1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2011a%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737339-cf7304e5-8885-42d9-97bc-6f65ebcd75a9.png)

****

### (2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2012a%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737350-8ad64318-c63b-4e43-addf-5a1f5e813b81.png)

****

### (2b) [Daily deaths, reference scenarios, 2021, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2012b%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737409-f9702b5d-a6c8-4f9f-b7ca-5d3184195851.png)

****

### (3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737419-52d71156-92cf-4bda-ab47-49477fc35959.png)

****

### (3b) [Daily deaths, 3 scenarios, 2021, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737458-7ecc93a3-0e4a-410f-9891-1d5d52e4ba1d.png)

****

### (4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737497-14db9229-480e-4d1a-b9c2-77bd8dcc9f57.png)

****

### (5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737627-1ce75c2f-8354-4442-ad04-a5aca963e7db.png)

****

### (6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737640-1ca22a7c-27a0-41ac-9ea0-6752a8dfeebc.png)

****

### (7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737656-2496a3a4-90a3-4a4f-a99d-07019b655938.png)

****

### (7b) [Hospital-related outcomes, all time, with IHME All bed capacity and ICU bed capacity](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2061b%20COVID-19%20hospital-related%20outcomes%20with%20bed%20capcity.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737667-72aeb526-f739-4426-bb32-20c7b06bde78.png)

****

### (8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2062b%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%20ICU%20bed%20capcity.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737674-39d4572b-4472-4137-8a07-d133b51774c5.png)

****

### (9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737712-8f587408-e6e6-42ad-ac4e-c1f26d3976f0.png)

****

### (10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737730-0ff24fa0-9d80-412c-a29b-3372e2ee2f2d.png)

****

### (11) [Daily Infection outcomes ratios, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2091%20COVID-19%20daily%20Infection%20outcomes%20ratios%2C%20global%203%20scenarios%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737744-7b2d5b18-b457-4a1d-8a08-8eba68a0da09.png)

****

### (12) [Daily mobility, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2092%20COVID-19%20daily%20mobility%2C%20global%2C%203%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737775-aec7cec8-64ba-4a5d-911b-640028a51d27.png)

****

### (13) [Daily mask use, 3 scenarios, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2093%20COVID-19%20daily%20mask_use%2C%20global%2C%203%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737934-3b3dca5d-db9d-4f11-9818-e4596bba95e0.png)

****

### (14) [Percent cumulative vaccinated, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20211001/output/merge/graph%2094%20COVID-19%20percent%20cumulative%20vaccinated%2C%20global.pdf)

![image](https://user-images.githubusercontent.com/30849720/135737943-138ec8ab-55c5-403d-b4c6-632592560774.png)

****



********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************


## II. METHODS AND RESULTS OF THIS WORK
  
<br/><br/>
  
### Addendum to rules for performing uptakes in this repository, 20211008:

Considering the recent deviations of IMPE and IHME from their regularly scheduled updates, omission of IMPE models’ previous updates except for the latest couple of updates, and the retirement of LANL model on 20210926, the following changes are made, effective as of 20211008.

(1) Every Friday, a new uptake will be performed. 

(2) Any model updates older than two weeks on the uptake date will not be included in the new uptake. 

As such, the last LANL update of 20210926 will no longer be used after the uptake 20211008.
  
 <br/><br/>
 
 * 
  
Pre-print for this project: 
 
[Farshad Pourmalek. CovidVisualized: Visualized compilation of international updating models’ estimates of COVID-19 pandemic at global and country levels, 02 August 2021, PREPRINT (Version 1) available at Research Square [https://doi.org/10.21203/rs.3.rs-768714/v1]](https://www.researchsquare.com/article/rs-768714/v1)

[PDF](https://github.com/pourmalek/covir2/blob/main/journal%20articles%2C%20this%20work/Pourmalek%20F%20-%20CovidVisualized-%20Visualized%20compilation%20of%20international%20updating%20models’%20estimates%20of%20COVID-19%20pandemic%20at%20global%20and%20country%20levels%20-%20PREPRINT%20%20Research%20Square%2020210802.pdf)

<br/><br/> 

 
********************************************************************************************************************************************
 
 
**CovidVisualized: Visualized compilation of international updated models’ estimates of COVID-19 pandemic at global and country levels**

Farshad Pourmalek, MD PhD

<br/><br/>

 
**SUMMARY**

**Objectives**: To identify international and periodically updated models of the COVID-19 pandemic, compile and visualize their estimation results at the global and country levels, and periodically update the compilations. When one or more models predict an increase in daily cases or infections and deaths in the next one to three months, technical advisors to the national and subnational decision-makers can consider this early alarm for assessment and suggestion of augmentation of preventive measures and interventions. 

**Methods and Results**: Five international and periodically updated models of the COVID-19 pandemic were identified, created by: (1) Massachusetts Institute of Technology, Cambridge, (2) Institute for Health Metrics and Evaluation, Seattle, (3) Imperial College, London, (4) Los Alamos National Laboratories, Los Alamos, and (5) University of Southern California, Los Angeles. Estimates of these five identified models were gathered, combined, and graphed at global and two country levels. Canada and Iran were chosen as countries with and without subnational estimates, respectively. Compilations of results are periodically updated. Three Github repositories were created that contain the codes and results, i.e., “CovidVisualizedGlobal” for the global level, “CovidVisualizedCountry” for a country with subnational estimates – Canada, and “covir2” for a country without subnational estimates – Iran.

**Keywords**: COVID-19, pandemic, epidemic, models, visualization, global, Canada, Iran



<br/><br/>

**BACKGROUND**

**Objectives and rationale**: The objectives are to identify international and periodically updated models of the COVID-19 pandemic, compile and visualize their estimations’ results at the global and country levels, and periodically update the compilations. The ultimate objective is to provide an early warning system for technical advisors to the decision-makers. When the predictions of one or more models show an increase in daily cases or infections, hospitalizations, or deaths in the next one to three months, technical advisors to the national and subnational decision-makers may consider assessing the situation and suggesting augmentation of non-pharmacologic preventive interventions and vaccinations. In doing so, the strengths and weaknesses of individual models need to be considered and those of this work. Models’ estimates demonstrate the trajectory of COVID-19 deaths, cases or infections, and hospital-related outcomes in one to three months into the future.  



<br/><br/>

**METHODS**

**Eligibility criteria**: The criteria for inclusion of target COVID-19 pandemic models were (1) an international model scope and (2) periodic updates. “International model” denotes a model that estimates COVID-19 cases or infections and deaths for all countries of the world, with global-level estimates that equate the sum of the national-level estimates. “Periodically updated” denotes a model with a record of periodically updated estimates since its first release, with continued updates in 2021. 

**Finding the eligible models**: The eligible models were found within the literature search of a previous publication, “Rapid review of COVID-19 epidemic estimation studies for Iran” [1]. The results were verified by comparison with models found in a recently published study on “Predictive performance of international COVID-19 mortality forecasting models” [2]. While non-updated or one-time models can be contemporaneously usable, their results would not sustain up-to-dateness in the long run, especially with the emergence of new variants of concern and various degrees of uncertainties in the progression of vaccination coverage.  


 
 
<br/><br/>
 
**RESULTS**

Results are described under the following items: (1) The five identified models / studies, (2) The CovidVisualized repositories created in this work, (3) Data management, and (4) Periodical uptakes.
<br/><br/>
 
**(1) The five identified models / studies**
 
Five international and periodically updated models of the COVID-19 pandemic were identified: (1) DELPHI , Massachusetts Institute of Technology, Cambridge (abbreviation used in this work: DELP) [3], (2) Institute for Health Metrics and Evaluation, Seattle (IHME) [4], (3) Imperial College, London (IMPE) [5], (4) Los Alamos National Laboratories, Los Alamos (LANL) [6], (5) University of Southern California, Los Angeles, by Srivastava, Ajitesh (SRIV) [7]. Official reports of countries to World Health Organization, curated by Johns Hopkins University Coronavirus resource center (JOHN) [8], were also used for comparison. 


<br/><br/>
 
(1) DELP  
  
. DELP = DELPHI: Differential Equations Lead to Predictions of Hospitalizations and Infections  
. Citation: COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology. https://www.covidanalytics.io/projections  
. Study website: https://www.covidanalytics.io/projections  
. Estimates web site: https://www.covidanalytics.io/projections, down the page, link that reads, "Download Most Recent Predictions"  
. License: https://github.com/COVIDAnalytics/DELPHI/blob/master/LICENSE  
. Institution: Operations Research Center, Massachusetts Institute of Technology, Cambridge  
. Among articles: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7883965/ , https://www.medrxiv.org/content/10.1101/2020.06.23.20138693v1, https://www.covidanalytics.io/DELPHI_documentation_pdf  
. Periodically updated: Yes   
. Periodical updates accessible: Yes
<br/><br/>
  
(2) IHME
  
. IHME = Institute for Health Metrics and Evaluation  
. Citation: Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid  
. Study web site: http://www.healthdata.org/covid  
. Estimates web site: http://www.healthdata.org/covid/data-downloads  
. License: http://www.healthdata.org/about/terms-and-conditions  
. Institution: IHME, University of Washington, Seattle   
. Among articles: https://www.nature.com/articles/s41591-020-1132-9  
. Periodically updated: Yes  
. Periodical updates accessible: Yes  
<br/><br/>
  
(3) IMPE  
  
. IMPE = Imperial College  
. Citation: MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports/  
. Study web site: https://mrc-ide.github.io/global-lmic-reports/  
. Estimates web site: https://github.com/mrc-ide/global-lmic-reports/tree/master/data  
. License: https://github.com/mrc-ide/global-lmic-reports  
. Institution: Imperial College, London  
. Among articles: https://science.sciencemag.org/content/369/6502/413  
. Periodically updated: Yes  
### . Periodical updates accessible: Yes, up to 20210823, No, from 20210824
<br/><br/>
  
(4) LANL  
  
. LANL = Los Alamos National Laboratories  
. Citation: Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org  
. Study web site: https://covid-19.bsvgateway.org  
. Estimates web site: https://covid-19.bsvgateway.org, Model Outputs, Global  
. License: https://covid-19.bsvgateway.org  
. Institution: Los Alamos National Laboratories, Los Alamos  
. Among documents: https://covid-19.bsvgateway.org/static/COFFEE-methodology.pdf  
. Periodically updated: Yes  
. Periodical updates accessible: Yes  
<br/><br/>
  
(5) SRIV  
  
. SRIV = Srivastava, Ajitesh  
. Citation: University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19  
. Study web site: https://scc-usc.github.io/ReCOVER-COVID-19/  
. Estimates web site: https://github.com/scc-usc/ReCOVER-COVID-19/tree/master/results/historical_forecasts  
. License: https://github.com/scc-usc/ReCOVER-COVID-19/blob/master/LICENSE  
. Institution: University of Southern California, Los Angeles  
. Among articles: https://arxiv.org/abs/2007.05180  
. Periodically updated: Yes  
. Periodical updates accessible: Yes  
<br/><br/>
  
(0) JOHN  
  
. JOHN = Johns Hopkins University. Coronavirus resource center. https://coronavirus.jhu.edu  
. Not a target study, but a benchmark for comparison.  
. Citation: "COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University"  
. Study web site: https://coronavirus.jhu.edu  
. Estimates web site: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series , "COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University"  
. License: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series  
. Institution: Johns Hopkins University, Baltimore  
. Among articles: [Dong E, Du H, Gardner L. An interactive web-based dashboard to track COVID-19 in real time. Lancet Infect Dis. 2020 May;20(5):533-534. doi: 10.1016/S1473-3099(20)30120-1. Epub 2020 Feb 19.](https://pubmed.ncbi.nlm.nih.gov/32087114/) 
. Periodically updated: Yes   
. Periodical updates accessible: Yes  
 
 
<br/><br/>

The COVID-19 pandemic model by Youyang Gu [9] and the model by University of California, Los Angeles model [10] could not be categorized as international and periodically updated models. The COVID-19 International Modelling Consortium (CoMo Consortium) model, created by researchers at the University of Oxford and Cornell University [11], and CovidSim (COVID Simulation) model, developed by researchers at Imperial College, London [12], provide templates for researchers to model the future of epidemic trajectory at national and subnational levels of their choice, through adjusting the model inputs and setting the time horizon into future for the estimations. Unlike the five international and periodically updated models mentioned above, the latter two models are not intended for periodic updates by their original creators. The CoMo Consortium has engaged some countries, including Iran, but not Canada. There is no evidence of either model being used on a periodically updated basis in Iran or Canada.

 
<br/><br/>
 
**(2) The CovidVisualized repositories created in this work**
 
GitHub (https://github.com) is used for sharing the codes and data. Global and country levels were chosen for demonstration of results. For the national level, one country with and one country without subnational estimates – Canada and Iran, respectively – were chosen based on personal bonds. 

Four of the five identified models share codes and estimates updates via GitHub repositories, and the IHME estimates are released on IHME’s website [4]. Three Github repositories were created for this project: “CovidVisualizedGlobal” [13] for the global level, “CovidVisualizedCountry” [14] for Canada, and “covir2” [15] for Iran. These are referred to as CovidVisualized GitHub repositories hereon. The “covir2” repository was created as “COVID Iran Review number 2” in March 2021, as an update after a first-iteration review was published [1]. The idea and work were further developed toward applicability to any location in the world, with case application for the global level, Canada, and Iran. 

GitHub repositories allow others to view and/or download, scrutinize, and verify the integrity of the codes and data. It is also possible to minimally modify the codes to recreate similar repositories for any other country that reports COVID-19 cases and deaths to World Health Organization. Such use of the codes and data in GitHub is free of charge and bound to the pertinent licenses. 
 

<br/><br/>
*************************************************
#### The three GitHub repositories created in this project are:
.
**CovidVisualizedGlobal**, COVID-19 pandemic estimates at the global level [13] 
https://github.com/pourmalek/CovidVisualizedGlobal               
.
**CovidVisualizedCountry**, COVID-19 pandemic estimates at the country level: Canada [14] 
https://github.com/pourmalek/CovidVisualizedCountry               
.
**covir2**, COVID-19 pandemic estimates at the country level: Iran [15] 
https://github.com/pourmalek/covir2                               
************************************************* 
<br/><br/>
 
 
**(3) Data management**

**[Data management template](https://github.com/pourmalek/covir2/blob/main/Variable%20name%20structure.md)**: A data management template was created for assigning comparable variable names to various outcomes from different models. Comparable and common variable names consist of generic parts (positions in the variable name) denoting the following items: (1) daily or total, (2) deaths, cases or infections, or other outcomes, (3) mean estimate, or lower, or upper uncertainty limit, (4) raw or smoothed estimate, (5) each of the five individual models, and (6) scenarios within each model. This template is described in detail in [“variable name structure”](https://github.com/pourmalek/covir2/blob/main/Variable%20name%20structure.md) in the CovidVisualized GitHub repositories [16]. Stata SE 14.2 (Stata Statistical Software. StataCorp. College Station, Texas) was used to write and run the codes on macOS Big Sur, and test run on Microsoft Windows 10. 

**Data management**: Data acquisition, management, and graphing were performed via Stata codes. Stata codes download the models’ output files from their respective websites, edit them according to the data management template, store each model’s estimates in a single file, and create graphs for all outcomes produced by each model. Then, the models’ single data files are compiled into a single final file, and graphs for all common outcomes are created for this compilation of all models. These graphs are shown on the pages of the three CovidVisualized GitHub repositories [13-15] and in periodical [Situation Reports](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/situation%20reports) created with each uptake. 
 
_Outcome types_: Besides (1) daily deaths, (2) daily incident cases or infections, (3) total deaths, and (4) total cases or infections, other outcomes estimated by one or more individual models include prevalence, active or prevalent cases, recovered cases, hospital admissions, regular beds needed, ICU (Intensive Care Unit) beds needed, ventilated cases, seroprevalence, and effective reproduction number. All outcome types were graphed. 

_Secondary variables_: Secondary variables are created in this work using the primary variables released by the individual models. They include case fatality rate (CFR), infection fatality rate (IFR), cases per deaths, ratio of estimated to reported deaths, and ratio of estimated to reported cases. CFR and IFR have only a daily version, and the other secondary variables have both daily and total (cumulative) versions. 

_Uncertainty, scenarios, variants, and vaccines_: For each model and for each outcome, both the point (mean) estimates and the interval estimates (95% uncertainty limits) were graphed where available. Similarly, both the “reference” scenario (aka status quo) and alternative scenarios (i.e., “better” and “worse” scenarios) were graphed for models with more than one scenario (i.e., IHME and IMPE). Assumptions about and empirical inputs from distributions of variants and vaccination coverages across space and time have been progressively included in models and scenarios of IHME and IMPE. 

_Subnational estimates_: The DELP and IHME models provide subnational-level estimates for countries reporting national and subnational level COVID-19 outcomes. Graphs were created for national and subnational-level locations (i.e., provinces in Canada) available in DELP and IHME model outputs. 
<br/><br/>
 
 
**(4) Periodical uptakes**

A [set of conventions](https://github.com/pourmalek/covir2/blob/main/setup/README.md) were created for the periodic uptake of the models’ estimates updates. The two models with the least frequency of periodic updates of estimates are IHME and IMPE, updated almost weekly and bi-weekly, respectively. With the release of each update of either of these two models, the whole set of the five included models are updated in all the three CovidVisualized GitHub repositories. The most recent update of each model is used. These updates of CovidVisualized repositories are labelled as “uptakes” to differentiate them from models’ estimates updates. These [conventions for periodical uptakes](https://github.com/pourmalek/covir2/blob/main/setup/README.md) are described in detail in the CovidVisualized GitHub repositories [17]. R software via RStudio 1.4 (Integrated Development for R. RStudio. PBC, Boston, Massachusetts) was used for semi-automatization of the uptakes’ execution. Estimates of the LANL model get updated about every 3-4 days, and DELP and SRIV models get updated daily. Uptaking the models’ estimates updates with every update of these latter three models is not expected to depict a much more informative profile of the epidemic’s trajectory in future, when compared against the current convention for uptakes. The IHME, IMPE, and SRIV models provide estimates for about three months into the future with each update release, the DELP model for about two months, and the LANL model for about one month.  

 
With each uptake, a directory is created in the root of the main branch of each of the three CovidVisualized repositories and named with the uptake date (e.g., 20210730). Uptakes are also created retrospectively, compiling the results of the previous updates of the models’ results. Available uptakes for Iran and the global level have been created going back to April 2021 and for Canada to June 2021. Under each dated uptake directory, there are two directories for “code” and for “output”. Under each, there are located directories with the abbreviated name of the models. For example, “DELP” directories under “code” store the Stata code files (.do), and those under “output” contain the outputs from executing the codes: the single data file for model estimates (in. dta and .csv formats), Stata log file (.smcl), and the graphs in PDF format. The directory “master” contains the master Stata do-file which executes all the other do-files, and the directory “merge” (under “code”) contains the code for creating the single final merged file of all models. The directory “merge” (under “output”) stores the created single final merged file of all compiled models, as well as the graphs that contain all the models. Selected graphs that contain all the models are visible on the root page of each uptake directory and are also stacked in reverse chronological order on the main page of each repository. With each uptake, selected graphs of estimated outcomes are added at the start of the main page for each repository. [Situation Reports](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/situation%20reports) are created and shared with national and subnational health authorities - - WHO for the global level (CovidVisualizedGlobal).  
  
  
Similar work: The [“covidcompare”](https://covidcompare.io) tool [18] provides graph visualization of the latest estimates of daily and total deaths from international and periodically updated COVID-19 models for countries of the world and US states, along with historical forecasts and model performance, based on IHME’s “Predictive performance of international COVID-19 mortality forecasting models” [2]. 

 <br/><br/>
 
**LIMITATIONS, STRENGTHS, AND FURTHER DIRECTIONS**
<br/><br/>
 
**Limitations**: Limitations of this work include the programming languages, automatization of uptakes, and choice of the website for presentation of the results. 
 
Stata programming language constitutes about 99% of the codes. Whereas Stata is a commercial software package, using non-commercial packages such as R and/or Python can increase the accessibility and adaptability of the codes for other researchers. Further use of R and/or Python can also make the uptakes almost fully automatized. Some health researchers may not be familiar with GitHub and GIT programming. Therefore, additional use of a dedicated website that is more visible to and accessible for the target audience can increase the reach and effect of this work. 
 
Strengths and weaknesses of individual international and periodically updated COVID-19 pandemic models are not mentioned here, but they have been discussed elsewhere [1-2].
<br/><br/>

**Strengths**: Strengths of this work include usability for informing technical advisors to the decision-makers, adaptability for use in other countries, and automatized data acquisition.
 
_Tested usability for informing technical advisors to the decision-makers at the country level_: Results of the GitHub repository “covir2” [15] were used to present the predictions of the five international and periodically updated models of COVID-19 pandemic about the possibility, timing, slope, height, and drivers of a potential fifth wave of the epidemic in Iran. This presentation was done using the results of the covir2 repository along with the results of an e-mail survey of more than 40 epidemiologists and public health specialists. The predictions and results were presented and described in a live online session for three Deputy Ministers of Health and six epidemiologists selected by Iran’s Ministry of Health and Medical Education (MOHME). Periodical [situation reports](https://github.com/pourmalek/covir2/tree/main/situation%20reports) based on each uptake are also shared with MOHME. 

_Adaptability of the codes for use in other countries or regions in the world_: The codes available in GitHub repositories “CovidVisualizedCountry” [14] and “covir2” [15] can be slightly modified by any researcher to be used for countries with and without subnational estimates respectively (See examples for [United States](https://github.com/pourmalek/CovidVisualizedCountry/tree/main/ADAPTATIONS_EXAMPLES), [Afghanistan](https://github.com/pourmalek/covir2/tree/main/ADAPTATIONS_EXAMPLES), and [Pakistan](https://github.com/pourmalek/covir2/tree/main/ADAPTATIONS_EXAMPLES)). “CovidVisualizedCountry” can be adjusted for use for any type of regionalization of the countries of the world, e.g., World Health Organization regions. 

_Automatized data acquisition_: The Stata codes in these repositories automatically download the estimates’ data files from the five included models once executed. There is no additional need for users to locate, download, and edit the estimates’ data of individual models before running the codes. This automatic data acquisition further enhances computational reproducibility – “obtaining consistent results using the same input data; computational steps, methods, and code; and conditions of analysis” [19].
 <br/><br/>
 
**Further research**: Further directions include using the “ensemble” method to statistically combine models’ estimates, and retrospective assessment of models’ predictive performance. In ensemble methods, individual models are evaluated for minimum requirements of quality and reporting. They are statistically combined using specific relative weights for each model, where the weights reflect the comparative accuracy of each model. Such ensemble methods are used by European Centre for Disease Prevention and Control [20] and US COVID-19 Forecast Hub [21]. The ensemble models have been empirically shown to be more accurate than any of the individual models used in the ensemble method [22]. Retrospective assessment of models’ predictive performance includes using statistical and graphical methods to estimate and visualize the accuracy of models’ estimations [2]. 

 
<br/><br/>
  
  
  

<br/><br/>
  
******************************************************************************************************************************************  
  
**DELERATIONS**  
    
  
**Ethics approval and consent to participate**

All the used and produced data are at non-individual and aggregate level; publicly available on the Internet; and under pertinent licenses and copyrights for non-commercial use, reproduction, and distribution for scientific research, provided that the conditions mentioned in their respective licenses and copyrights are met, as provided in [23]. Therefore, no ethics approval or consent to participate were applicable.  
  
  
**Consent for publication**

Not applicable.
  

**Availability of data and materials**

The data described in this Data note can be freely and openly accessed on (1) GitHub repository “CovidVisualizedGlobal” under (http://doi.org/10.5281/zenodo.5019030) [13], (2) GitHub repository “CovidVisualizedCountry” under (http://doi.org/10.5281/zenodo.5019482) [14], and (3) GitHub repository “covir2” under (http://doi.org/10.5281/zenodo.5020797) [15]. See references [13-15] for details and links to the data.  

  
**Competing interests**

The author worked as a [post-graduate research fellow in Institute for Health Metrics and Evaluation](http://www.healthdata.org/about/farshad-pourmalek) from 2009 to 2011 and continues voluntary collaboration as a Global Burden of Disease study collaborator without employment or financial relation. The author declares that he has no competing interests.  
  
  
**Funding**

There were no sources of funding for this research.  

******************************************************************************************************************************************  
    
  
  
  
 
**References**

1. Pourmalek F, Rezaei Hemami M, Janani L, Moradi-Lakeh M. Rapid review of COVID-19 epidemic estimation studies for Iran. BMC Public Health. 2021 Feb 1;21(1):257. doi: 10.1186/s12889-021-10183-3.
 
2. Friedman J, Liu P, Troeger CE, Carter A, Reiner RC Jr, et al. Predictive performance of international COVID-19 mortality forecasting models. Nat Commun. 2021 May 10;12(1):2609. doi: 10.1038/s41467-021-22457-w.
 
3. COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology. https://www.covidanalytics.io/projections and https://github.com/COVIDAnalytics/website/tree/master/data/predicted 
 
4. Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid/ and http://www.healthdata.org/covid/data-downloads
 
5. MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports/ and https://github.com/mrc-ide/global-lmic-reports/tree/master/data 
 
6. Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org 
 
7. Srivastava, Ajitesh. University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19 and https://github.com/scc-usc/ReCOVER-COVID-19/tree/master/results/historical_forecasts
 
8. Johns Hopkins University. Coronavirus resource center. https://coronavirus.jhu.edu/map.html and https://github.com/CSSEGISandData/COVID-19 
 
9. Gu, Youyang. COVID-19 Projections Using Machine Learning. https://covid19-projections.com and https://github.com/youyanggu/covid19_projections 
 
10. Statistical Machine Learning Lab, Computer Science Department, University of California, Los Angeles. Combating COVID-19. https://covid19.uclaml.org/info.html and https://github.com/uclaml/ucla-covid19-forecasts/tree/master/current_projection 
 
11. The COVID-19 International Modelling Consortium (CoMo Consortium), University of Oxford and Cornell University. https://www.medsci.ox.ac.uk/news/como-consortium-the-covid-19-pandemic-modelling-in-context and https://github.com/ocelhay/como 
 
12. MRC Centre for Global Infectious Disease Analysis, Imperial College London. CovidSim. COVID-19 Scenario Analysis Tool. https://covidsim.org/v5.20210727/?place=ca and https://covidsim.org/v5.20210727/?place=ir 
 
13. Pourmalek, F. GitHub repository “CovidVisualizedGlobal”: Combine and visualize international periodically updated estimates of COVID-19 pandemic at the global level. Version 1.1, Released June 23, 2021. http://doi.org/10.5281/zenodo.5019030 https://github.com/pourmalek/CovidVisualizedGlobal 
 
14. Pourmalek, F. GitHub repository “CovidVisualizedCountry”: Combine and visualize international periodically updated estimates of COVID-19 pandemic at the country level, countries with subnational level estimates: Canada, national level, provinces, and territories. Version 1.1, Released June 23, 2021. http://doi.org/10.5281/zenodo.5019482 https://github.com/pourmalek/CovidVisualizedCountry 
 
15. Pourmalek, F. GitHub repository “covir2”: Combine and visualize international periodically updated estimates of COVID-19 pandemic at the country level, countries without subnational level estimates: Iran. Version 2.2, Released June 23, 2021. http://doi.org/10.5281/zenodo.5020797 https://github.com/pourmalek/covir2 
 
16. Pourmalek, F. “covir2”: Combine and visualize international periodically updated estimates of COVID-19 at the country level: Iran. Version 2.2, Released June 23, 2021. Variable name structure. http://doi.org/10.5281/zenodo.5020797 https://github.com/pourmalek/covir2/blob/main/Variable%20name%20structure.md 
 
17. Pourmalek, F. “covir2”: Combine and visualize international periodically updated estimates of COVID-19 at the country level: Iran. Version 2.2, Released June 23, 2021. Setup. http://doi.org/10.5281/zenodo.5020797 https://github.com/pourmalek/covir2/tree/main/setup 
 
18. Friedman J, Liu P, Akre S. The covidcompare tool. https://covidcompare.io/about 
 
19. National Academies of Sciences, Engineering, and Medicine. Reproducibility and Replicability in Science. Washington, DC: The National Academies Press. 2019. https://doi.org/10.17226/25303 
 
20. European Centre for Disease Prevention and Control. European Covid-19 Forecast Hub. https://covid19forecasthub.eu/background.html and https://github.com/epiforecasts/covid19-forecast-hub-europe 
 
21. COVID-19 Forecast Hub. https://covid19forecasthub.org/doc/ensemble and https://github.com/reichlab/covid19-forecast-hub Accessed 23 June 2021.
 
22. Cramer EY, Ray EL, Lopez VK, Bracher J, Brennen A, et al. Evaluation of individual and ensemble probabilistic forecasts of COVID-19 mortality in the US. medRxiv preprint. Posted February 05, 2021. https://www.medrxiv.org/content/10.1101/2021.02.03.21250974v1 
 
23. Pourmalek, F. GitHub repository “covir2”: Combine and visualize international periodically updated estimates of COVID-19 at the country level, countries without subnational level estimates: Iran. Version 2.2, Released June 23, 2021. Licenses / Copyrights of data and/or graphs used in this repository. http://doi.org/10.5281/zenodo.5020797 https://github.com/pourmalek/covir2#licenses--copyrights-of-data-and--or-graphs-used-in-this-repository Accessed 23 June 2021.


********************************************************************************************************************************************
********************************************************************************************************************************************  
********************************************************************************************************************************************
********************************************************************************************************************************************
  
  

## III. INNER WORKS OF THIS REPOSITORY 

The Stata _codes_ can be executed on local machines:

Run in Stata "Users/local-user-name/Downloads/CovidVisualizedGlobal/20210709/code/master/do country master.do" on your local machine after the directory /CovidVisualizedGlobal/ is downloaded into and is located in the root of /Downloads/ folder of your local machine, for uptake 20210709; and other instances of 202YMMDD for other uptake dates. 

Preproduced _outputs_ are stored for each uptake, e.g., [`20210709`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/), in folder [`output`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output), for each component study, i.e., [`DELP`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/DELP), [`IHME`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/IHME), [`IMPE`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/IMPE), [`LANL`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/LANL), and [`SRIV`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/SRIV), plus [`JOHN`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/JOHN) as benchmark. Combined results are stored in [`merge`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/output/merge). All merged graphs for each uptake are accessible via main page of each uptake date, e.g., https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709/ and the link is placed in front of **Merged graphs of uptake 20210709** [here](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210709/graphs%20merge%2020210709.pdf)
  
*********

  
[`Variable name structure`](https://github.com/pourmalek/covir2/blob/main/Variable%20name%20structure.md) describes the template for models’ output data management used in this repository. 


[`Rule for uptakes`](https://github.com/pourmalek/covir2/blob/main/setup/README.md) describes the rule for periodical uptakes used in this repository. 
 
  
[`Bugs and issues`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/Bugs%20and%20issues.md) describes how to report bugs and issues. 
  

[`Troubleshooting`](https://github.com/pourmalek/covir2/blob/main/Troubleshooting.md) describes possible difficulties in running the Stata codes on your computer after the repository has been downloaded to your local machine.  
  

 ****
 
Troubleshooting: 
 
On 20210824, the Imperial College COVID-19 model/study removed their "old fits" – all previously released updates from day 1 up to and including IMPE update 20210719. 

This means the Imperial College COVID-19 model/study is no more a periodically updated study with ACCESSIBLE updates – short of early retirement of the study. The predictive performance of the Imperial College model is no longer assessable. 

Several thousand lines of codes that used their previously released updates will not work. 

The remedy for CovidVisualized repositories (https://github.com/pourmalek/covir2 for Iran, https://github.com/pourmalek/CovidVisualizedCountry for Canada, and https://github.com/pourmalek/CovidVisualizedGlobal for the global level) is to comment out the command line reading csv data from https://github.com/mrc-ide/global-lmic-reports/tree/master/data. 


<br/><br/> 

 
* To -comment out-, 

For https://github.com/pourmalek/CovidVisualizedGlobal,

In files:

/Users/username/Downloads/CovidVisualizedGlobal-main/20210727/code/master

/Users/username/Downloads/CovidVisualizedGlobal-main/20210806/code/master/do do CovidVisualizedGlobal master.do, downloaded to your local machine,

where 20210806 denotes uptake 20210806 in this repository that uses IMPE update 20210719, or earlier uptake here that use earlier updates of IMPE,

in line 124, that currently reads as:

do "$pathCovidVisualizedGlobal/IMPE/do CovidVisualizedGlobal IMPE.do" 

double forward slashes // have been put at the beginning of the line, so that it reads as:

// do "$pathCovidVisualizedGlobal/IMPE/do CovidVisualizedGlobal IMPE.do" 

save the do file and then run the file.
  
* However, the previously stored results, such as data in "CovidVisualizedGlobal-main/20210401/output/merge/CovidVisualizedGlobal merge.dta", and graphs stored in "CovidVisualizedGlobal-main/20210401/output/merge/asterisk.pdf" and "CovidVisualizedGlobal-main/20210401/output/IMPE/asterisk.pdf" preserve a copy of previously accessed the Imperial College COVID-19 model/study removed updates.  
 
<br/><br/> 

* For rerunning the codes without access to the previous IMPE updates, two modifications are needed. 

(1) Commenting out in master.do file, the line that runs the do file for IMPE, like the line 130 shown below in https://github.com/pourmalek/covir2/blob/main/ADAPTATIONS_EXAMPLES/Japan_20210506/code/master/do%20country%20master.do

// do "$pathcovir2/IMPE/do country IMPE.do"

(2) Omitting the lines in merge.do file the lines that used IMPE variables, like the merge.do file for Japan_20210506 that is adapted to run without access to the previous IMPE updates:

https://github.com/pourmalek/covir2/blob/main/ADAPTATIONS_EXAMPLES/Japan_20210506/code/merge/do%20country%20merge.do
 

<br/><br/>   
****  
  
********

 
### Scenario number within component study

_Component studies (the international periodically updated models) and their scenarios_ are mentioned below.  

[Names within brackets assigned by this project.]

#### A00 JOHN
* S00 = [Not Applicable]
<br/><br/>

#### A01 DELP
* S00 = [Single scenario]
<br/><br/>

#### A02 IHME
* S01 = Reference scenario [Status Quo] 
* S02 = Best scenario (Universal masks) [Best]
* S03 = Worse scenario (Mandates easing) [Worst] 
<br/><br/>

#### A03 IMPE
* S01 = Additional 50% Reduction [Best]	
* S02 = Current level of interventions [Reference] 			
* S03 = Relax Interventions 50% [Worst]
  
  . additional alternate scenarios:
* S04 = Surged Additional 50% Reduction [Best, Surged]
* S05 = Surged Maintain Status Quo [Reference, Surged] 	
* S06 = Surged Relax Interventions 50% [Worst, Surged]	
<br/><br/>

#### A04 LANL
* S00 = [Single scenario]
<br/><br/>

#### A05 SRIV
* S00 = [current]
* Note: SRIV has 3 sets of scenrios; [see](https://github.com/scc-usc/ReCOVER-COVID-19)
<br/><br/>



### uptakes in this repository, since April 2021 


**_bold italic fonts_** show the uptake was triggered by either IHME or IMPE. 

.

(uptake number) uptake date: study update date, study update date

. 

  
  
(44) uptake [`20211001`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211001): 
DELP 20210930, **_IHME 20211001_**, IMPE 20210924, LANL 20210926, SRIV 20210930 

(43) uptake [`20210928`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210928): 
DELP 20210927, IHME 20210923, **_IMPE 20210924_**, LANL 20210926, SRIV 20210928 
  
(42) uptake [`20210923`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210923): 
DELP 20210923, **_IHME 20210923_**, IMPE 20210909, LANL 20210919, SRIV 20210923   
  
(41) uptake [`20210920`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210920): 
DELP 20210920, IHME 20210916, **_IMPE 20210909_**, LANL 20210919, SRIV 20210920 
  
(40) uptake [`20210916`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210916): 
DELP 20210916, **_IHME 20210916_**, IMPE 20210825, LANL 20210912, SRIV 20210916 
  
(39) uptake [`20210910`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210910): 
DELP 20210910, **_IHME 20210910_**, IMPE 20210825, LANL 20210905, SRIV 20210910 
  
(38) uptake [`20210902`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210902): 
DELP 20210902, **_IHME 20210902_**, IMPE 20210825, LANL 20210829, SRIV 20210902  

(37) uptake [`20210901`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210901): 
DELP 20210901, IHME 20210826, **_IMPE 20210825_**, LANL 20210829, SRIV 20210901
  
(36) uptake [`20210826`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210826): 
DELP 20210826, **_IHME 20210826_**, IMPE 20210819, LANL 20210822, SRIV 20210826 
  
(35) uptake [`20210824`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210824): 
DELP 20210824, IHME 20210819, **_IMPE 20210819_**, LANL 20210822, SRIV 20210824 
  
(34) uptake [`20210819`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210819): 
DELP 20210819, **_IHME 20210819_**, IMPE 20210806, LANL 20210815, SRIV 20210819 
  
(33) uptake [`20210813`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210813): 
DELP 20210813, IHME 20210806, **_IMPE 20210806_**, LANL 20210808, SRIV 20210813  
  
(32) uptake [`20210806`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210806): 
DELP 20210806, **_IHME 20210806_**, IMPE 20210719, LANL 20210801, SRIV 20210801   
  
(31) uptake [`20210730`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210730): 
DELP 20210730, **_IHME 20210730_**, IMPE 20210719, LANL 20210725, SRIV 20210730  
  
(30) uptake [`20210727`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210727): 
DELP 20210726, IHME 20210723 version 2, **_IMPE 20210719_**, LANL 20210725, SRIV 20210727
  
(29) uptake [`20210726`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210723): 
DELP 20210726, **_IHME 20210723 version 2_**, IMPE 20210709, LANL 20210718, SRIV 20210726
 
. 20210726: IHME estimates for global level in update 20210723 and in update 20210715 WERE identical UPON FIRST RELEASE OF update 20210723, with numerical value difference of zero. As of 20210726, update 20210723 has been replaced by IHME and is not identical with update 20210715. 

(28) uptake [`20210723`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210723): DELP 20210723, **_IHME 20210723_**, IMPE 20210709, LANL 20210718, SRIV 20210723    
  
(27) uptake [`20210715`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210715): DELP 20210715, **_IHME 20210715_**, IMPE 20210709, LANL 20210711, SRIV 20210715    
  
(26) uptake [`20210714`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210714): DELP 20210714, IHME 20210702, **_IMPE 20210709_**, LANL 20210711, SRIV 20210714   
  
(25) uptake [`20210709`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210709): DELP 20210708, IHME 20210702, **_IMPE 20210702_**, LANL 20210704, SRIV 20210709  
  
(24) uptake [`20210704`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210704): DELP 20210704, IHME 20210702, **_IMPE 20210626_**, LANL 20210704, SRIV 20210704   

(23) uptake [`20210703`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210703): DELP 20210703, **_IHME 20210702_**, IMPE 20210618, LANL 20210627, SRIV 20210703  
  
(22) uptake [`20210625`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210625): DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624   
  
(21) uptake [`20210624`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210624): DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624    
  
(20) uptake [`20210618`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210618): DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(19) uptake [`20210611`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210611): DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611  

(18) uptake [`20210610`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210610): DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(17) uptake [`20210605`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210605): DELP 20210604, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(16) uptake [`20210604`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210604): DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(15) uptake [`20210603`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210603): DELP 20210603, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(14) uptake [`20210528`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210528): DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(13) uptake [`20210522`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210522): DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522

(12) uptake [`20210521`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210521): DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521

(11) uptake [`20210516`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210516): DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(10) uptake [`20210515`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210515): DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(09) uptake [`20210514`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210514): DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514 

(08) uptake [`20210506`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210506): DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506 

(07) uptake [`20210424`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210424): DELP 20210424, IHME 20210423, **_IMPE 20210424_**, LANL 20210421, SRIV 20210424 

(06) uptake [`20210423`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210423): DELP 20210423, **_IHME 20210423_**, IMPE 2010417, LANL 20210421, SRIV 20210423

(05) uptake [`20210417`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210417): DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(04) uptake [`20210416`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210416): DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(03) uptake [`20210409`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210409): DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(02) uptake [`20210406`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210406): DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406 

(01) uptake [`20210401`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210401): DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401 


********************************************************************************************************************************************
********************************************************************************************************************************************

## IV. SELECTED GRAPHS FROM PREVIOUS UPTAKES
  
### Selected graphs from previous uptakes are stored in another web page: [RESULTS, PREVIOUS UPTAKES](https://github.com/pourmalek/covir2/tree/main/RESULTS%2C%20PREVIOUS%20UPTAKES), _links to which are also provided below:_
  
### List of graphs 
  
[(1) Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#1-daily-deaths-reference-scenarios-all-time)

[(2) Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#2-daily-deaths-reference-scenarios-2021)
  
[(3) Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#3-daily-deaths-3-scenarios-2011)
  
[(3b) Daily deaths, 3 scenarios, 2021, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#3b-daily-deaths-3-scenarios-2021-ihme)

[(3c) Daily deaths, 3 scenarios, 2021, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#3c-daily-deaths-3-scenarios-2021-impe)
  
[(4) Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#4-daily-cases-or-infections-reference-scenarios-all-time)
  
[(5) Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#5-daily-cases-or-infections-reference-scenarios-2021)
  
[(6) Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#6-daily-cases-or-infections-3-scenarios-2011)
  
[(7) Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#7-hospital-related-outcomes-all-time)
  
[(8) Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#8-hospital-related-outcomes-2021-without-ihme-bed-need-and-impe-hospital-demand)
  
[(9) Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#9-daily-deaths-estimated-to-reported-reference-scenarios-2021)
  
[(10) Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#10-daily-cases-or-infections-estimated-to-reported-cases-reference-scenarios-2021)
  
.  
 
[(11) Daily Infection-outcome ratios, 3 scenarios, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#11-daily-infection-outcomes-ratios-global-3-scenarios-all-time-ihme)

[(12) Daily mobility, scenarios IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#12-daily-mobility-global-3-scenarios-all-time-ihme)

[(13) Daily mask use, 3 scenarios, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#13-daily-mask_use-global-3-scenarios-ihme)

[(14) Percent cumulative vaccinated, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS,%20PREVIOUS%20UPTAKES/README.md#14-percent-cumulative-vaccinated-ihme)

****
  
  
  
  
  







  
  
  
  
  
  








****

<br/><br/>

 
********************************************************************************************************************************************
********************************************************************************************************************************************
 
 
## Licenses / Copyrights of data and / or graphs used in this repository:
  
All the data and / or graphs used in this repository are at non-individual and aggregate level, publicly available on the Internet, and under pertinent licenses and copyrights for non-commercial use, reproduction, and distribution for scientific research, provided that the conditions mentioned in the respective licenses and copyrights are met, as referred to below. 

.

(1) ABBREVIATED NAME IN THIS REPOSITORY: **DELP**

CITATION: COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology. https://www.covidanalytics.io/projections and https://github.com/COVIDAnalytics/website/tree/master/data/predicted

SOURCE REPOSITORY: https://github.com/COVIDAnalytics/DELPHI

SOURCE REPOSITORY LICENCE: https://github.com/COVIDAnalytics/website/blob/master/LICENSE

.

(2) ABBREVIATED NAME IN THIS REPOSITORY: **IHME**

CITATION: Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid/ and http://www.healthdata.org/covid/data-downloads

SOURCE REPOSITORY: http://www.healthdata.org/covid/data-downloads

SOURCE REPOSITORY LICENCE: http://www.healthdata.org/about/terms-and-conditions

.

(3) ABBREVIATED NAME IN THIS REPOSITORY: **IMPE**

CITATION: MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports/ and https://github.com/mrc-ide/global-lmic-reports/tree/master/data

SOURCE REPOSITORY: https://github.com/mrc-ide/global-lmic-reports/tree/master/data

SOURCE REPOSITORY LICENCE: https://mrc-ide.github.io/global-lmic-reports/

.

(4) ABBREVIATED NAME IN THIS REPOSITORY: **LANL**

CITATION: Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org

SOURCE REPOSITORY: https://covid-19.bsvgateway.org

SOURCE REPOSITORY LICENCE: https://covid-19.bsvgateway.org
  
.

(5) ABBREVIATED NAME IN THIS REPOSITORY: **SRIV**

CITATION: Srivastava, Ajitesh. University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19 and https://github.com/scc-usc/ReCOVER-COVID-19/tree/master/results/historical_forecasts

SOURCE REPOSITORY: https://github.com/scc-usc/ReCOVER-COVID-19/tree/master/results/historical_forecasts

SOURCE REPOSITORY LICENCE: https://github.com/scc-usc/ReCOVER-COVID-19/blob/master/LICENSE

.

(6) ABBREVIATED NAME IN THIS REPOSITORY: **JOHN**

CITATION: "COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University" https://coronavirus. jhu.edu/map.html and https://github.com/CSSEGISandData/COVID-19

SOURCE REPOSITORY: https://github.com/CSSEGISandData/COVID-19

SOURCE REPOSITORY LICENCE: https://github.com/CSSEGISandData/COVID-19

.

(7) ABBREVIATED NAME IN THIS REPOSITORY: **covidcompare**

CITATION: Friedman J, Liu P, Akre S. The covidcompare tool. https://covidcompare.io/about

SOURCE REPOSITORY: https://covidcompare.io/

SOURCE REPOSITORY LICENCE: https://covidcompare.io/about

.


********************************************************************************************************************************************
********************************************************************************************************************************************

## License, DOI, and suggested Citation of this reposirory 
  
* All codes are copyrighted by the author under Apache License 2.0.
  
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)   

* See [`LICENSE`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/LICENSE)

<br/><br/>
  
  
[![DOI](https://zenodo.org/badge/357850528.svg)](https://zenodo.org/badge/latestdoi/357850528)


[`DOI`](https://zenodo.org/record/5019030#.YNNftS295O0)  
  
<br/><br/>
  
  
Pourmalek, F. GitHub repository “CovidVisualizedGlobal”: Combine and visualize international periodically updating estimates of COVID-19 pandemic at the global level. Version 1.1, Released June 23, 2021. http://doi.org/10.5281/zenodo.5019030 , https://github.com/pourmalek/CovidVisualizedGlobal 
  
  

# CovidVisualizedGlobal 

## ! THE MOST RECENT WEEKLY SITUATION REPORT, EVERY MONDAY MORNING, [HERE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/situation%20reports/22%20Global%20and%20regional%20COVID-19%20epidemic%20models%20situation%20report%20No%2022%20–%202022-01-04.pdf).


<br/><br/>



***********************************************************************************************************************************************************
***********************************************************************************************************************************************************

## The Omicron variant has been included only in IHME model, as of 2021-12-21. 

The IHME model has included the Omicron variant. IHME Detected Infections vs. All Infections: "Probably detected infections at the global level will be **_three times_** that previous peak that we saw for delta." https://www.healthdata.org/covid/video/insights-ihmes-latest-covid-19-model-run

Scenarios of IHME model as of update 20211221:

* S01 = Current projection [Status Quo, Reference scenario]         
* S02 = 80% mask use [Best scenario]                    
* S03 = High severity of Omicron [Worse scenario]       
* S04 = Third dose of vaccine [Second best scenario]               
* S05 = Reduced vaccine hesitancy [Third best scenario] 

The Imperial model has not included the Omicron variant as of their 2021-12-05 update (latest update available on 2021-12-17). Sources: "COMBINED Situation Report for COVID-19 2021-12-05" (https://github.com/mrc-ide/global-lmic-reports/blob/master/combined_reports.pdf) "This report adjusts for
the Delta variant, with the variant become dominant over the period: 2021-09-13 to 2021-11-12."

Imperial College on Omicron: Neil Ferguson, et al. Imperial College COVID-19 response team. Report 49: Growth, population distribution and immune escape of Omicron in England. 16 December 2021. https://www.imperial.ac.uk/media/imperial-college/medicine/mrc-gida/2021-12-16-COVID19-Report-49.pdf

The DELPHI model (https://covidanalytics.io/projections) and the SRIV model (https://scc-usc.github.io/ReCOVER-COVID-19/) do not mention inclusion of alpha. 

<br/><br/>

***********************************************************************************************************************************************************
***********************************************************************************************************************************************************

## The Omicron variant, Farshad Pourmalek's take, 2021-12-15:

## Given all available evidence so far, Omicron will most probably leave more cases, hospitalizations, and even deaths compared to previous waves, due to exponential growth – even with counterfactual scenarios of full lockdowns and highest coverages 3 doses of mRNA vaccines. Percent fatality and hospitalization lower than delta, but absolute numbers, higher. 

## Most politicians and half-politician-half-scientists repeat the same negligent mistakes with every new variant of concern. Refractory to treatment.

Farshad Pourmalek, December 15, 2021 

<br/><br/>

************************************************************************************************************************************************************
************************************************************************************************************************************************************



<br/><br/>

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
[![DOI](https://zenodo.org/badge/357850528.svg)](https://zenodo.org/badge/latestdoi/357850528)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/5199/badge)](https://bestpractices.coreinfrastructure.org/projects/5199)


### Combine and visualize international periodically updated estimates of COVID-19 pandemic 

### <div align="center"> at the GLOBAL level 🌍 
  
## <div align="center"> and for SIX WHO REGIONS 
  
### <div align="center"> [`GLOBAL`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/RESULTS%20GLOBAL)
### <div align="center"> [`Regions together`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/RESULTS%20Regions%20together)
  
### <div align="center"> [`African Region (AFR)`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS%20African%20region/README.md) [`Americas Region (AMR)`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS%20Americas%20region/README.md) [`Eastern Mediterranean Region (EMR)`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS%20Eastern%20Mediterranean%20region/README.md) [`European Region (EUR)`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS%20European%20region/README.md) [`South-East Asian Region (SEAR)`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS%20South-East%20Asian%20region/README.md) [`Western Pacific Region (WPR)`](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/RESULTS%20Western%20Pacific%20region/README.md)  
  
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

[`CovidVisualizedGlobal`]( https://github.com/pourmalek/CovidVisualizedGlobal) for the [`GLOBAL`](https://github.com/pourmalek/CovidVisualizedGlobal#covidvisualizedglobal) level and six world [`REGIONS`](https://github.com/pourmalek/CovidVisualizedGlobal#-african-region-afr-americas-region-amr-eastern-mediterranean-region-emr-european-region-eur-south-east-asian-region-sear-western-pacific-region-wpr)

[`CovidVisualizedCountry`](https://github.com/pourmalek/CovidVisualizedCountry) for countries with subnational estimates: [`CANADA`](https://github.com/pourmalek/CovidVisualizedCountry#covidvisualizedcountry) and its [`provinces`](https://github.com/pourmalek/CovidVisualizedCountry/blob/main/README.md#-alberta-british-columbia-manitoba-new-brunswick-newfoundland-and-labrador-nova-scotia-ontario-quebec-saskatchewan)
  
[`covir2`](https://github.com/pourmalek/covir2) for countries without subnational estimates: [`IRAN`](https://github.com/pourmalek/covir2#covir2)

The results in these three repositories get periodically updated. 

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

### LATEST UPTAKE: uptake [`20220104`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20220104)
 
**_DELP 20220104_**, IHME 20211221, **_IMPE 20211213_**, **_SRIV 20220104_**
  
  <br/><br/>


# :eyes: SEE: See the predictions of the GLOBAL and REGIONAL COVID-19 pandemic trajectory, in: [Global COVID-19 epidemic models situation report No 22 – 2022-01-04](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/situation%20reports/22%20Global%20and%20regional%20COVID-19%20epidemic%20models%20situation%20report%20No%2022%20–%202022-01-04.pdf)  

  
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
  
#### List of graphs 
  
(1)   Daily deaths, reference scenarios, all time
  
(2)   Daily deaths, reference scenarios, 2021
  
(2b)  Daily deaths, reference scenarios, with IHME excess deaths, 2021
  
(3)   Daily deaths, 3 scenarios, 2011
  
(3b)  Daily deaths, 3 scenarios, 2021, IHME
  
(3b2) Daily deaths, 5 scenarios, 2021, IHME
  
(3c)  Daily deaths, 3 scenarios, 2021, IMPE
  
(4)   Daily cases, reference scenarios, all time
  
(5)   Daily cases, reference scenarios, 2021
  
(6)   Daily cases, 3 scenarios, 2011
  
(6a)  Daily cases or infections, 5 scenarios, IHME 2021
  
(6b)  Daily cases, 2011
  
(6c)  Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021
  
(7)   Hospital-related outcomes, all time
  
(7b)  Hospital-related outcomes, all time, with IHME All bed capacity and ICU bed capacity
  
(8)   Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand
  
(9)   Daily deaths estimated to reported, reference scenarios, 2021
  
(10)  Daily cases estimated to reported, reference scenarios, 2021
  
(11)  Daily Infection outcomes ratios, 3 scenarios, all time, IHME
  
(11b) Daily Infection -detection and -hospitalizations ratios, 3 scenarios, all time, IHME
  
(12)  Daily mobility, 3 scenarios, all time, IHME
  
(13)  Daily mask use, 3 scenarios, IHME
  
(14)  Cumulative vaccinated percent, IHME


 
***************************************************************************************************************************************

### Summary of Predictions

#### (A) IHME, Reference scenario, estimated DAILY INFECTIONS:

OUTCOME TYPE: Estimated daily infections include both asymptomatic and symptomatic cases, both undetected and detected cases, and all the mild, moderate, and severe cases. Number of daily infections are, by definition, more than the detected symptomatic cases. 

RISE TIME: Number of estimated daily infections rise first at the Global level, AFRO, and EURO (in mid- to late November 2021), followed by AMRO, SEARO, and EMRO (in December 2021), and in WPRO (in February 2022). 

PEAK TIME: In AFRO, estimated daily infections peak in December 2021; in EURO an at the Global level in January 2022, In AMRO and EMRO in late January to early February 2022, and in SEARO and WPRO in early to mid-February 2022. Peak times are about (plus or minus) two weeks accurate.  


Table 1 - Peak values and dates of estimated daily infections by location

![image](https://user-images.githubusercontent.com/30849720/147418405-9d3b6834-22de-4dc2-ac76-9fb653602af7.png)


PEAK VALUE: Number of estimated daily infections might reach 38 million at the Global level, 12 million in SEARO, 8 million in EURO, 7 million in AMRO and in AFRO, 5 million in EMRO, and 1 million in WPRO.

SURPASS EXPECTED: Numbers of estimated daily infections in this wave are expected to surpass the highest numbers from the previous waves in EURO (by a factor of about 6); AFRO and AMRO (each by a factor of about 4); at the Global level (by a factor of about 3); EMRO (by a factor of about 2.5), in WPRO (by a factor of about 2), and in SEARO (by a factor of about 1.2).


#### (B) IHME, Reference scenario, estimated DAILY DEATHS:

Estimated daily deaths are not expected to surpass those seen in previous wases at the global and regional levels. 

Among the regions, the highest numbers of estimated daily deaths are expected be seen in EURO (about > 5,000 in late January 2022), and in AMRO (about 3,000 in early February 2022). At the Global level, the number of estimated daily deaths are expected to peak at about > 9,000 at late January to early February 2022. 



***************************************************************************************************************************************
  
#### uptake [`20220104`]
  
#### Note on exclusion of extremely implausible values from the graphs:

In **DELP update 20220104**, Global daily deaths start from about 800,000 around 2021-10-01 and come down toward plausible values around 2021-10-22. Similar issue in WHO regions and in Daily Cases. Such values compress down the curves of other models in daily deaths graphs. As such, the implausible values are regarded as missing here. 

#### The SRIV update 20220104 has very high estimates of deaths and cases. 

<br/><br/>


### Inclusion of the Omicron variant in models, as of 20220104:


### Scenarios of IHME model as of update 20211221:

* S01 = Current projection [Status Quo, Reference scenario]         
* S02 = 80% mask use [Best scenario]                    
* S03 = High severity of Omicron [Worse scenario]       
* S04 = Third dose of vaccine [Second best scenario]               
* S05 = Reduced vaccine hesitancy [Third best scenario] 

<br/><br/>

**IHME** Detected Infections vs. All Infections. "Probably detected infections at the global level will be **_three times_** that previous peak that we saw for delta." Source: [`IHME COVID-19 Model Insights Blog`](https://www.healthdata.org/covid/video/insights-ihmes-latest-covid-19-model-run)

<br/><br/>


**IMPE** has included the Omicron variant in their model, as explained here: https://mrc-ide.github.io/global-lmic-reports/News.html

"For certain countries the impact of the Delta variant is now included in the model. Timings for the delta variant are derived from [`CoVariants`](https://github.com/hodcroftlab/covariants). For more information see updates to the model [`parameters and methods`](https://mrc-ide.github.io/global-lmic-reports/parameters.html) page.


**DELP** does not readily mentioned inclusion of Omicron in their model. However, their estimated cases show unprecedented increase. 

**SRIV** does not readily mentioned inclusion of Omicron in their model, except, “Caution: Expect unreliable forecasts due to under-reporting around holidays and uncertainty in the prevalence of the Omicron variant.” However, their estimated cases show unprecedented increase. 

<br/><br/>

*  
  
  
****
****

### Selected graphs - Global

****

(1) Global [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2011a%20COVID-19%20daily%20deaths%2C%20GLOBAL%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148435423-67f5f9f6-5d86-407c-b252-9d81ab677ed0.png)

****

(2) Global [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2012a%20COVID-19%20daily%20deaths%2C%20GLOBAL%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148435526-6b04f555-cf60-44ad-8438-c1846998abf0.png)

****

(2b) Global [Daily deaths, reference scenarios, 2021 on, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2012b%20COVID-19%20daily%20deaths%2C%20GLOBAL%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148435622-ce5de915-cabc-448d-952f-fb79d36abd02.png)

****

(3) Global [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2014%20COVID-19%20daily%20deaths%2C%20GLOBAL%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148435781-0572bf04-3f5e-4b16-93f8-4a81fc19a3a9.png)

****

(3b) Global [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2016%20COVID-19%20daily%20deaths%2C%20GLOBAL%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148586455-38ba3f32-19a7-4b80-85b6-64203cd7e3c0.png)

****

(3c) Global [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2018%20COVID-19%20daily%20deaths%2C%20GLOBAL%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148586567-3b73790b-dc5b-45b0-9423-c822362131b8.png)

****

(4) Global [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2021%20COVID-19%20daily%20cases%2C%20GLOBAL%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148396881-744f3d27-8f6c-4303-b983-7722d46c12f4.png)

****

(5) Global [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2022%20COVID-19%20daily%20cases%2C%20GLOBAL%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148586717-81a08f6b-c188-4acb-9840-d74f035c4c13.png)

****

(6) Global [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2024%20COVID-19%20daily%20cases%2C%20GLOBAL%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148587185-02ae475f-93a9-453a-a63f-ea2d8643736b.png)

****

(6b) Global [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2022b%20COVID-19%20daily%20cases%2C%20GLOBAL%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148587303-dbe3a3de-ba3f-4926-a6ed-65899f2afa15.png)

****

(6c) Global [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20GLOBAL%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400019-c1b18de3-edd5-4234-b331-14f24097936b.png)

****

(7) Global [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400130-41e9e81a-ccb7-426c-85db-8c42705b3768.png)

****

(8) Global [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400236-dee669b7-0521-4fc6-9346-5303668b2e4c.png)

****

(9) Global [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20GLOBAL%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148436107-002d5be6-b236-4081-b842-0452aa3a889f.png)

****

(11) Global [Daily Infection outcomes ratios, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2091%20COVID-19%20daily%20Infection%20outcomes%20ratios%2C%20GLOBAL%203%20scenarios%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400535-7817fd27-c610-4564-843a-fb38a895f224.png)

****

(11b) Global [Daily Infection -detection and -hospitalizations ratios, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2091b%20COVID-19%20daily%20Infection%20outcomes%20ratios%2C%20GLOBAL%203%20scenarios%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400694-f36b6d1b-d2e0-4e6e-8466-a376941859ff.png)

****

(12) Global [Daily mobility, 3 scenarios, all time, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2092%20COVID-19%20daily%20mobility%2C%20GLOBAL%2C%203%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400871-78db0248-528c-406a-8c40-46e2926dd219.png)

****

(13) Global [Daily mask use, 3 scenarios, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2093%20COVID-19%20daily%20mask_use%2C%20GLOBAL%2C%203%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148400988-ee45dadc-4694-42cc-a670-0f6b6cf53938.png)

****

(14) Global [Percent cumulative vaccinated, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20GLOBAL%2094%20COVID-19%20cumulative%20vaccinated%20percent%2C%20GLOBAL%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148401126-30153c4a-5ea9-4887-a0e6-bc7ca9aa5210.png)

****


*


****
****

### Selected graphs - Regions together


****

(0a) Regions together [Daily deaths, with GLOBAL, JOHN](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201a1%20JOHN%20COVID-19%20daily%20deaths%2C%20regions%20together%2C%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/148587652-9436ed0d-3b63-4a18-bdb0-a39bc9f1ae99.png)

****

(0b) Regions together [Daily deaths, without GLOBAL, JOHN](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201a2%20JOHN%20COVID-19%20daily%20deaths%2C%20regions%20together%2C%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/148587729-3d9c2ed7-e940-4efb-b9ee-71fa232098a9.png)

****

(1) Regions together [Daily deaths, with GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201a1%20COVID-19%20daily%20deaths%2C%20regions%20together%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588072-0ec24b8b-c72f-44ba-ae34-f5a01ebab856.png)

****

(2) Regions together [Daily deaths, without GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201b1%20COVID-19%20daily%20deaths%2C%20regions%20together%20wo%20global%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588143-8abebde8-5ee1-4940-8311-43c5a7d3d050.png)

****

(3) Regions together [Daily deaths, with GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201a2%20COVID-19%20daily%20deaths%2C%20regions%20together%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588256-e32410e3-26e6-48b0-94b3-d1bf62173c61.png)

****

(4) Regions together [Daily deaths, without GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201b2%20COVID-19%20daily%20deaths%2C%20regions%20together%20wo%20global%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588324-8d3a4185-7830-46d0-8b77-97505fe37435.png)

****

(5) Regions together [Daily excess deaths, with GLOBAL, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201%202%20a1%20COVID-19%20daily%20excess%20deaths%2C%20regions%20together%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588626-e1812f5d-f764-49eb-a69f-c7c633deb08f.png)

****

(6) Regions together [Daily excess deaths, without GLOBAL, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%201%202%20a1%20COVID-19%20daily%20excess%20deaths%2C%20regions%20together%20%20wo%20global%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589481-8b69e6a5-21dd-4b3a-ad2b-09039a7d106b.png)

****

(00a) Regions together [Daily cases, with GLOBAL, JOHN](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202a1%20JOHN%20COVID-19%20daily%20cases%2C%20regions%20together%2C%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588800-f6a60447-f22c-4ca3-860d-15f2c1937597.png)

****

(00b) Regions together [Daily cases, without GLOBAL, JOHN](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202a2%20JOHN%20COVID-19%20daily%20cases%2C%20regions%20together%2C%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588876-3359a53f-ade9-4348-8c00-db001f6d95bc.png)

****
(00c) Regions together [Daily cases, without GLOBAL, JOHN, Recent](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202a3%20JOHN%20COVID-19%20daily%20cases%2C%20regions%20together%2C%20JOHN%20recent.pdf)

![image](https://user-images.githubusercontent.com/30849720/148588955-aa7a7d4e-c352-469b-829a-34f1b80ab21e.png)

****

(7) Regions together [Daily infections, with GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202a1%20COVID-19%20daily%20infections%2C%20regions%20together%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589060-8f197bb2-5e49-4e4e-9253-365504ce5ace.png)

****

(8) Regions together [Daily infections, without GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202b1%20COVID-19%20daily%20infections%2C%20regions%20together%20wo%20global%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589134-0a6ffcb0-2b9b-4029-8070-87eb45d9a632.png)

****

(9) Regions together [Daily cases, with GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202a2%20COVID-19%20daily%20cases%2C%20regions%20together%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589213-3141dc0c-be22-4e39-aa91-734891bfd3c1.png)

****

(10) Regions together [Daily cases, without GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%202b2%20COVID-19%20daily%20cases%2C%20regions%20together%20wo%20global%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589305-38749ffa-134f-4d36-a9ab-eeca95d4cdb1.png)

****

(11) Regions together [Total deaths, with GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%203a1%20COVID-19%20total%20deaths%2C%20regions%20together%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589597-4d205c87-3893-4828-9959-79d4a46583bf.png)

****

(12) Regions together [Total deaths, without GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%203b1%20COVID-19%20total%20deaths%2C%20regions%20together%20wo%20global%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589749-898ead9f-89ad-4c10-ba8c-20dcff9ebe00.png)

****

(13) Regions together [Total deaths, with GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%203a2%20COVID-19%20total%20deaths%2C%20regions%20together%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589836-4ce72ccc-d45f-4ac9-a57f-7cc2dc7461fc.png)

****

(14) Regions together [Total deaths, without GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%203b2%20COVID-19%20total%20deaths%2C%20regions%20together%20wo%20global%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589924-7287e252-e2a2-4244-b9bb-82801b797503.png)

****

(15) Regions together [Total excess deaths, with GLOBAL, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%203%202%20a1%20COVID-19%20total%20excess%20deaths%2C%20regions%20together%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148589998-e231ca47-a4c3-498b-babe-4bf33d2e5315.png)

****

(16) Regions together [Total excess deaths, without GLOBAL, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%203%202%20a1%20COVID-19%20total%20excess%20deaths%2C%20regions%20together%20wo%20global%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148590062-87915367-939d-424e-bd1f-8d2c597fe6c5.png)

****

(17) Regions together [Total infections, with GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%204a1%20COVID-19%20total%20infections%2C%20regions%20together%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148591073-08dc52f2-b39e-4ff7-a709-aa0000bf11ee.png)

****

(18) Regions together [Total infections, without GLOBAL, IHME, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%204b1%20COVID-19%20total%20infections%2C%20regions%20together%20wo%20global%2C%20IHME%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148591163-70d61258-a1f8-4a5b-9761-f3b6476f0746.png)

****

(19) Regions together [Total cases, with GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%204a2%20COVID-19%20total%20cases%2C%20regions%20together%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148591232-88a5b517-adff-4f04-b623-c01a3d88e96f.png)

****

(20) Regions together [Total cases, without GLOBAL, DELP, SRIV](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%204b2%20COVID-19%20total%20cases%2C%20regions%20together%20wo%20global%2C%20DELP%2C%20SRIV.pdf)

![image](https://user-images.githubusercontent.com/30849720/148592074-fb5436bf-5412-489d-8574-c7c9435ff30a.png)

****


*


****
****

### Selected graphs - African region (AFRO)

****

(1) African region [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2011a%20COVID-19%20daily%20deaths%2C%20AFRO%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148464727-4ec0176e-be9f-4943-a0fc-99afc818ae35.png)

****

(2) African region [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2012a%20COVID-19%20daily%20deaths%2C%20AFRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148464798-8e1e9273-bfcd-477f-8bf6-b2e8fbb8a364.png)

****

(2b) African region [Daily deaths, reference scenarios, 2021 on, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2012b%20COVID-19%20daily%20deaths%2C%20AFRO%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148465114-dc94db0a-b84c-451a-9689-3634b92a35ee.png)

****

(3) African region [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2014%20COVID-19%20daily%20deaths%2C%20AFRO%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148465177-dae9df34-c11d-4a55-9d5e-84534688d377.png)

****

(3b) African region [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2016%20COVID-19%20daily%20deaths%2C%20AFRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148601404-15fa296c-ce3f-45ff-9618-2b5de4744e9f.png)

****

(3c) African region [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2018%20COVID-19%20daily%20deaths%2C%20AFRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148601482-61c83e16-7604-43a4-a6cc-61d05ecc4833.png)

****

(4) African region [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2021%20COVID-19%20daily%20cases%2C%20AFRO%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148466506-344cf20f-dfc1-49b0-8eca-bbb352cd615f.png)

****

(5) African region [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2022%20COVID-19%20daily%20cases%2C%20AFRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148466562-6d81fd89-0d16-4097-bce8-25e06f13c6e0.png)

****

(6) African region [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2024%20COVID-19%20daily%20cases%2C%20AFRO%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148601643-6d0d81d8-eb6d-4fea-8668-3d3bec88c61e.png)

****

(6b) African region [Daily cases, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2022b%20COVID-19%20daily%20cases%2C%20AFRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148601717-f3cd598c-2187-43b6-919c-93b01c968049.png)

****

(6c) African region [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20AFRO%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148467179-04b3cbf9-9282-4f5d-86b9-14669fa6df87.png)

****

(7) African region [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148467247-163cf979-7d64-4737-8603-216b44b7bc5e.png)

****

(8) African region [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148467377-26d9d9ae-0d55-44be-82e4-588bf2fec220.png)

****

(9) African region [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AFRO%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20AFRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148601900-c0d0e8aa-1b9f-4ebf-a068-f4383a58aab2.png)

****


*


****
****

### Selected graphs – Americas region (AMRO)

****

(1) Americas region [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2011a%20COVID-19%20daily%20deaths%2C%20AMRO%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148601995-ccacd9eb-edcf-40d9-bbcb-cd0695e3cc27.png)

****

(2) Americas region [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2012a%20COVID-19%20daily%20deaths%2C%20AMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148602055-06b8a7b6-f42e-4607-89ce-f38b57113b8b.png)

****

(2b) Americas region [Daily deaths, reference scenarios, 2021, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2012b%20COVID-19%20daily%20deaths%2C%20AMRO%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148602117-c60d32cb-12db-4e90-a82d-84ed3b2c6849.png)

****

(3) Americas region [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2014%20COVID-19%20daily%20deaths%2C%20AMRO%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148602188-9b59c3cd-ffb1-42b5-bbef-83ef9dc9123d.png)

****

(3b) Americas region [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2016%20COVID-19%20daily%20deaths%2C%20AMRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148602263-b436bb60-557d-43da-8c56-ad841c502eed.png)

****

(3c) Americas region [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2018%20COVID-19%20daily%20deaths%2C%20AMRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148602358-234bc723-4f0e-4e05-bac8-69d48c98723a.png)

****

(4) Americas region [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2021%20COVID-19%20daily%20cases%2C%20AMRO%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604156-d6295b57-5099-413c-858f-45a8da31b4cd.png)

****

(5) Americas region [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2022%20COVID-19%20daily%20cases%2C%20AMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604226-e60d7ee5-f4e4-4516-850e-a0de54a7a326.png)

****

(6) Americas region [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2024%20COVID-19%20daily%20cases%2C%20AMRO%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604301-182ef094-b681-4a6a-9f24-9e6bc6e9b464.png)

****

(6b) Americas region [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2022b%20COVID-19%20daily%20cases%2C%20AMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604388-90152818-1ed5-41ea-b1ef-ffe28eb21e47.png)

****

(6c) Americas region [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20AMRO%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604497-21329a71-d688-4d0a-89e0-d35dcc8a3d07.png)

****

(7) Americas region [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604586-5813a86a-201f-441c-b98f-36d5cc079366.png)

****

(8) Americas region [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604669-ed85a391-e748-4eb1-b4ea-61b483c7815a.png)

****

(9) Americas region [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMRO%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20AMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148604746-280eef06-e9a8-4922-a581-fdd8cabc5e93.png)

****


*

****
****

### Selected graphs – Americas region, Canada and United States (AMR1)

****

(1) Americas region, Canada and United States [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2011a%20COVID-19%20daily%20deaths%2C%20AMR1%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148606957-532bc67b-6aea-4dd7-8aab-30afded849ed.png)

****

(2) Americas region, Canada and United States [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2012a%20COVID-19%20daily%20deaths%2C%20AMR1%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607069-04cfee66-f151-4c35-8324-490888fe7c80.png)

****

(2b) Americas region, Canada and United States [Daily deaths, reference scenarios, 2021, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2012b%20COVID-19%20daily%20deaths%2C%20AMR1%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607180-61fde488-7d19-4960-b796-df096e81e003.png)

****

(3) Americas region, Canada and United States [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2014%20COVID-19%20daily%20deaths%2C%20AMR1%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607267-8692868c-0982-42aa-b4d2-c798f1f137da.png)

****

(3b) Americas region, Canada and United States [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2016%20COVID-19%20daily%20deaths%2C%20AMR1%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607349-87261d49-0526-48be-8b24-4c350908ac5f.png)

****

(3c) Americas region, Canada and United States [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2018%20COVID-19%20daily%20deaths%2C%20AMR1%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607422-bec23673-5f0a-4452-9436-dc428ac0896e.png)

****

(4) Americas region, Canada and United States [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2021%20COVID-19%20daily%20cases%2C%20AMR1%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607503-9fb73f28-2509-43dd-896f-b7b1fa8760e6.png)

****

(5) Americas region, Canada and United States [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2022%20COVID-19%20daily%20cases%2C%20AMR1%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607596-c49a0d18-71eb-42f7-bc4c-047f0c267fd7.png)

****

(6) Americas region, Canada and United States [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2024%20COVID-19%20daily%20cases%2C%20AMR1%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607648-84cc13ed-a603-49a7-86df-fb29d58cead5.png)

****

(6b) Americas region, Canada and United States [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2022b%20COVID-19%20daily%20cases%2C%20AMR1%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607865-0886b573-207f-4a39-9ad7-9542b2c93c57.png)

****

(6c) Americas region, Canada and United States [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20AMR1%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148607945-9f90e68b-dfb1-41b7-b5bb-089f23cb64fc.png)

****

(7) Americas region, Canada and United States [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148608016-046a84d0-f3d5-4a5b-a0ca-a61a0075b8c6.png)

****

(8) Americas region, Canada and United States [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148608080-fdd9cc88-9370-421f-9000-f1c5e31b814b.png)

****

(9) Americas region, Canada and United States [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR1%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20AMR1%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148608336-a0d48ece-252e-41eb-9d9d-47f870ca3602.png)

****

*

****
****

### Selected graphs – Americas region, without Canada and United States (AMR2)

****

(1) Americas region, without Canada and United States [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2011a%20COVID-19%20daily%20deaths%2C%20AMR2%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148609314-785701e9-e96d-4a49-9313-7315dce6fa8c.png)

****

(2) Americas region, without Canada and United States [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2012a%20COVID-19%20daily%20deaths%2C%20AMR2%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148610523-ad277264-5d89-4c65-8909-e080203d911b.png)

****

(2b) Americas region, without Canada and United States [Daily deaths, reference scenarios, 2021, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2012b%20COVID-19%20daily%20deaths%2C%20AMR2%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148612524-8a9dc8c2-5d1e-48c6-a75b-b5a24bb43113.png)

****

(3) Americas region, without Canada and United States [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2014%20COVID-19%20daily%20deaths%2C%20AMR2%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148612596-9b0a6106-f7f5-4325-8dc8-2542028cb7e6.png)

****

(3b) Americas region, without Canada and United States [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2016%20COVID-19%20daily%20deaths%2C%20AMR2%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613263-574ddc2f-7fab-4fa5-ad63-3e2b37a8fe3d.png)

****

(3c) Americas region, without Canada and United States [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2018%20COVID-19%20daily%20deaths%2C%20AMR2%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613332-7b0574f5-f664-43f2-b1ac-b3cb55cd4c16.png)

****

(4) Americas region, without Canada and United States [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2021%20COVID-19%20daily%20cases%2C%20AMR2%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613429-6fe304a8-74e6-48be-9f3b-581a49acd697.png)

****

(5) Americas region, without Canada and United States [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2022%20COVID-19%20daily%20cases%2C%20AMR2%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613531-78cc4e8e-588a-48b3-806d-1cc7036279fc.png)

****

(6) Americas region, without Canada and United States [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2024%20COVID-19%20daily%20cases%2C%20AMR2%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613653-eb1b2d5f-06e3-49e8-be51-9255aa748779.png)

****

(6b) Americas region, without Canada and United States [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2022b%20COVID-19%20daily%20cases%2C%20AMR2%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613732-3e8115ff-7e1b-4d34-b03f-1e2da471e3f4.png)

****

(6c) Americas region, without Canada and United States [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20AMR2%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613794-45090e55-ed9c-4157-8adb-1d41df5f2736.png)

****

(7) Americas region, without Canada and United States [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148613946-cec70ed3-9870-4896-bfc1-089f3fe8796e.png)

****

(8) Americas region, without Canada and United States [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614015-00f40a92-f0be-4950-9e2f-9c6ed86e8455.png)

****

(9) Americas region, without Canada and United States [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20AMR2%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20AMR2%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614051-9e77f9e4-4596-4a00-9c6f-cf7e8c43734f.png)

****

*

****
****

### Selected graphs – Eastern Mediterranean region (EMRO)

****

(1) Eastern Mediterranean region [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2011a%20COVID-19%20daily%20deaths%2C%20EMRO%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614197-e82cdd11-b207-437f-9a64-d1acb0415fef.png)

****

(2) Eastern Mediterranean region [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2012a%20COVID-19%20daily%20deaths%2C%20EMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614247-9e4cd14f-440a-400b-92c4-5f9b1c7d95da.png)

****

(2b) Eastern Mediterranean region [Daily deaths, reference scenarios, 2021 on, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2012b%20COVID-19%20daily%20deaths%2C%20EMRO%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614327-46696fa2-75f8-442c-a34f-5e4b2618bb06.png)

****

(3) Eastern Mediterranean region [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2014%20COVID-19%20daily%20deaths%2C%20EMRO%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614926-73b1a5ef-172f-4868-b66f-028b9a03adaa.png)

****

(3b) Eastern Mediterranean region [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2016%20COVID-19%20daily%20deaths%2C%20EMRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148614967-7e52370d-e153-43eb-a9db-667c1c866a7b.png)

****

(3c) Eastern Mediterranean region [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2018%20COVID-19%20daily%20deaths%2C%20EMRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615011-8f0a791d-1bfe-49eb-8ae0-f86970f5070d.png)

****

(4) Eastern Mediterranean region [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2021%20COVID-19%20daily%20cases%2C%20EMRO%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615079-70daa9f5-bacb-4ef5-9442-fcef63cde991.png)

****

(5) Eastern Mediterranean region [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2022%20COVID-19%20daily%20cases%2C%20EMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615119-854b236a-cc3a-4762-9be2-6b74d4a9d218.png)

****

(6) Eastern Mediterranean region [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2024%20COVID-19%20daily%20cases%2C%20EMRO%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615192-cd502963-6839-49e6-9dc0-f3533ebb5556.png)

****

(6b) Eastern Mediterranean region [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2022b%20COVID-19%20daily%20cases%2C%20EMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615251-1da9fc42-0b71-4632-99c0-06b22ff59841.png)

****

(6c) Eastern Mediterranean region [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20EMRO%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615319-cd2c3cf6-13d5-459c-b031-0ac01dfefe8b.png)

****

(7) Eastern Mediterranean region [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615369-6ff61602-2ce8-4dde-8517-ab8fe28ba5df.png)

****

(8) Eastern Mediterranean region [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615434-749cccf1-5fc5-4644-b140-56fe9238e84b.png)

****

(9) Eastern Mediterranean region [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EMRO%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20EMRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615487-4010d2ec-9829-4db9-bd20-53f5286efc72.png)

****


*


****
****

### Selected graphs – European region (EURO)

****

(1) European region [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2011a%20COVID-19%20daily%20deaths%2C%20EURO%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615677-3a1f62cd-f139-4a0c-8462-1955bc76f9fb.png)

****

(2) European region [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2012a%20COVID-19%20daily%20deaths%2C%20EURO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615738-693d0039-b7b2-4891-9cfa-866de071f634.png)

****

(2b) European region [Daily deaths, reference scenarios, 2021 on, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2012b%20COVID-19%20daily%20deaths%2C%20EURO%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615804-c0d06d0e-2db9-4f41-9a67-7859aa84bb92.png)

****

(3) European region [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2014%20COVID-19%20daily%20deaths%2C%20EURO%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615915-2e062111-a4e5-4a0c-814b-03427b06cb13.png)

****

(3b) European region [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2016%20COVID-19%20daily%20deaths%2C%20EURO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148615981-36ee5203-43fa-4430-8d8c-b123c25adf4f.png)

****

(3c) European region [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2018%20COVID-19%20daily%20deaths%2C%20EURO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616035-cd2d5bfa-f497-47eb-ba33-330bdffde893.png)

****

(4) European region [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2021%20COVID-19%20daily%20cases%2C%20EURO%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616080-e352f7ba-931c-49ec-b98e-879711ceac63.png)

****

(5) European region [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2022%20COVID-19%20daily%20cases%2C%20EURO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616131-d5e31b39-b8e8-4c57-8aef-137eb98414ea.png)

****

(6) European region [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2024%20COVID-19%20daily%20cases%2C%20EURO%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616259-dcf013c0-5344-4cf4-9fe5-560fac15ede6.png)

****

(6b) European region [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2022b%20COVID-19%20daily%20cases%2C%20EURO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616303-83f5b854-0703-4f14-a612-c4a620fc4e5f.png)

****

(6c) European region [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20EURO%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616352-520402fb-99ea-4dee-b365-26a8a00c0236.png)

****

(7) European region [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616404-db19947c-9a82-403f-bd6e-bf731cab1810.png)

****

(8) European region [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616450-f63ff77e-faaf-4a17-8e88-5dfa1811b929.png)

****

(9) European region [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20EURO%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20EURO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616501-b977d80b-ed29-4f50-86fd-3c3b86519442.png)

****


*


****
****

### Selected graphs – South-East Asian region (SEARO)

****

(1) South-East Asian region [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2011a%20COVID-19%20daily%20deaths%2C%20SEARO%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616596-487e440e-57ed-4632-97d4-59bd3b1e51ab.png)

****

(2) South-East Asian region [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2012a%20COVID-19%20daily%20deaths%2C%20SEARO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616654-fa08f2c8-13e8-49e1-922b-5a7fdea3e053.png)

****

(2b) South-East Asian region [Daily deaths, reference scenarios, 2021 on, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2012b%20COVID-19%20daily%20deaths%2C%20SEARO%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616723-43e0b710-759b-4438-addb-43dfa5a9db2f.png)

****

(3) South-East Asian region [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2014%20COVID-19%20daily%20deaths%2C%20SEARO%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616828-bf28ba80-cae4-4391-81c7-d19640a4bce3.png)

****

(3b) South-East Asian region [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2016%20COVID-19%20daily%20deaths%2C%20SEARO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616903-207e53b4-c8a8-4759-b7d6-2f65c529ecba.png)

****

(3c) South-East Asian region [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2018%20COVID-19%20daily%20deaths%2C%20SEARO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148616949-78642db5-7486-4458-adb6-feabaef70f61.png)

****

(4) South-East Asian region [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2021%20COVID-19%20daily%20cases%2C%20SEARO%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617002-ac6d706d-ad6d-4edc-80e8-f4e2296bbc03.png)

****

(5) South-East Asian region [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2022%20COVID-19%20daily%20cases%2C%20SEARO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617050-651a20fc-3118-4534-8b66-af3ea1655279.png)

****

(6) South-East Asian region [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2024%20COVID-19%20daily%20cases%2C%20SEARO%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617101-7518fa0f-fff2-4173-862c-fd8a4b4ff300.png)

****

(6b) South-East Asian region [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2022b%20COVID-19%20daily%20cases%2C%20SEARO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617137-fdb742f3-0c3d-4cf3-acca-11358ecf2554.png)

****

(6c) South-East Asian region [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20SEARO%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617183-2ae38a97-5893-42c6-99a4-ee43f6f57a82.png)

****

(7) South-East Asian region [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617229-1c5eea5f-8c45-4977-af1c-e241e5a0ccc1.png)

****

(8) South-East Asian region [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617267-1edf2783-1e4f-415b-a755-a3653f4133e0.png)

****

(9) South-East Asian region [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20SEARO%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20SEARO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617324-3f286b4e-43f2-472d-b6df-c5ab03003614.png)

****


*


****
****

### Selected graphs – Western Pacific region (WPRO)

****

(1) Western Pacific region [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2011a%20COVID-19%20daily%20deaths%2C%20WPRO%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617399-594798cb-7a2f-47af-882b-6e6d92afc999.png)

****

(2) Western Pacific region [Daily deaths, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2012a%20COVID-19%20daily%20deaths%2C%20WPRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617454-c81e15f1-40de-4e90-80d9-69b166c94b1d.png)

****

(2b) Western Pacific region [Daily deaths, reference scenarios, 2021 on, with IHME excess deaths](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2012b%20COVID-19%20daily%20deaths%2C%20WPRO%2C%20reference%20scenarios%2C%202021%20with%20IHME%20excess%20deaths.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617498-5a581b45-258c-4c4f-9edb-74783ccbe9c2.png)

****

(3) Western Pacific region [Daily deaths, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2014%20COVID-19%20daily%20deaths%2C%20WPRO%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617551-7d8f71a2-1464-46e5-9170-e73758440dbe.png)

****

(3b) Western Pacific region [Daily deaths, 3 scenarios, 2021 on, IHME](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2016%20COVID-19%20daily%20deaths%2C%20WPRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IHME.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617608-e7d977dc-07c3-49b3-9204-4016b701aa85.png)

****

(3c) Western Pacific region [Daily deaths, 3 scenarios, 2021 on, IMPE](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2018%20COVID-19%20daily%20deaths%2C%20WPRO%2C%203%20scenarios%2C%20uncertainty%2C%202021%2C%20IMPE.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617672-85b571ba-ff16-407c-884a-176849f63859.png)

****

(4) Western Pacific region [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2021%20COVID-19%20daily%20cases%2C%20WPRO%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617721-0d97dd20-004c-41d4-b60d-cde54ef1cbec.png)

****

(5) Western Pacific region [Daily cases or infections, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2022%20COVID-19%20daily%20cases%2C%20WPRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617846-66fc2770-b823-4864-820e-67500ca66901.png)

****

(6) Western Pacific region [Daily cases or infections, 3 scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2024%20COVID-19%20daily%20cases%2C%20WPRO%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617900-27ce0bbb-f8fc-424c-b124-c6c694768393.png)

****

(6b) Western Pacific region [Daily cases, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2022b%20COVID-19%20daily%20cases%2C%20WPRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617932-cd679d9c-66a8-4cfc-8d4d-86182c6fbf0b.png)

****

(6c) Western Pacific region [Daily estimated infections IHME IMPE to reported cases JOHN, main scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2026%20C19%20daily%20estimated%20infections%20to%20reported%20cases%2C%20WPRO%2C%20reference%20scenarios%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148617980-be1af137-d9d1-40a1-b827-a1245b206558.png)

****

(7) Western Pacific region [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2061a%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148618031-b66dc21b-d408-4e77-b016-2b69201329d1.png)

****

(8) Western Pacific region [Hospital-related outcomes, 2021 on, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2062a%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/148618081-130d3534-8da4-4378-bc3d-1dacc9fc40d7.png)

****

(9) Western Pacific region [Daily deaths estimated to reported, reference scenarios, 2021 on](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20220104/output/merge/graph%20WPRO%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20WPRO%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/148618129-5c8d58fa-6581-47d5-99a4-476bdaa8fc55.png)

****
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
. Estimates web site: https://mrcdata.dide.ic.ac.uk/global-lmic-reports/ (new), https://github.com/mrc-ide/global-lmic-reports/tree/master/data (old) 
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
  
On 20210824, the Imperial College COVID-19 model/study removed their "old fits" from https://github.com/mrc-ide/global-lmic-reports/tree/master/data (old), but they are accessible on https://mrcdata.dide.ic.ac.uk/global-lmic-reports/ (new). Stata codes are updated accordingly to use estimates files from the latter site.

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
Scenarios of IHME model as of update 20211221:

* S01 = Current projection [Status Quo, Reference scenario]         
* S02 = 80% mask use [Best scenario]                    
* S03 = High severity of Omicron [Worse scenario]       
* S04 = Third dose of vaccine [Second best scenario]               
* S05 = Reduced vaccine hesitancy [Third best scenario] 

Scenarios of IHME model before update 20211221:
 
* S01 = Reference scenario [Status Quo] 
* S02 = Best scenario (Universal masks) [Best]
* S03 = Worse scenario (Mandates easing) [Worst] 
<br/><br/>

#### A03 IMPE
* S01 = Additional 50% Reduction [Best], renamed "Optimistic" with IMPE update 20211103 (2021-11-03_v9.csv.zip) released on 20211110
* S02 = Current level of interventions [Reference] 			
* S03 = Relax Interventions 50% [Worst], renamed "Pessimistic" with IMPE update 20211103 (2021-11-03_v9.csv.zip) released on 20211110
  
  . additional alternate scenarios:
* S04 = Surged Additional 50% Reduction [Best, Surged], renamed "Surged Optimistic"
* S05 = Surged Maintain Status Quo [Reference, Surged] 	
* S06 = Surged Relax Interventions 50% [Worst, Surged], renamed "Surged Pessimistic" 	
<br/><br/>

#### A04 LANL
* S00 = [Single scenario]
<br/><br/>

#### A05 SRIV
* S00 = [current]
* Note: SRIV has 3 sets of scenrios; [see](https://github.com/scc-usc/ReCOVER-COVID-19)
<br/><br/>



### uptakes in this repository, since April 2021 


**_bold italic fonts_** show the uptake was triggered by either IHME or IMPE (before 20211008), or the model updates that are new in this uptake (20211008 and afterwards). 

.

(uptake number) uptake date: study update date, study update date

. 

  
  
(57) uptake [`20220104`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20220104): 
**_DELP 20220104_**, IHME 20211221, **_IMPE 20211213_**, **_SRIV 20220104_**
  
(56) uptake [`20211221`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211221): 
**_DELP 20211222_**, **_IHME 20211221_**, IMPE 20211205, **_SRIV 20211219_** 
  
(55) uptake [`20211217`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211217): 
**_DELP 20211216_**, IHME 2021119, **_IMPE 20211205_**, **_SRIV 20211217_**  
  
(54) uptake [`20211210`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211210): 
**_DELP 20211210_**, IHME 2021119, IMPE 20211129, **_SRIV 20211210_**  
  
(53) uptake [`20211203`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211203): 
**_DELP 20211203_**, IHME 20211119, **_IMPE 20211129_**, **_SRIV 20211203_**
  
(52) uptake [`20211126`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211126): 
**_DELP 20211123_**, IHME 20211119, IMPE 20211115, **_SRIV 20211126_**
  
(51) uptake [`20211119`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211119): 
**_DELP 20211119_**, **_IHME 20211119_**, **_IMPE 20211115_**, **_SRIV 20211119_**
  
(50) uptake [`20211112`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211112): 
**_DELP 20211112_**, IHME 20211104, **_IMPE 20211103_**, **_SRIV 20211112_**
  
(49) uptake [`20211105`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211105): 
 **_DELP 20211105_**, **_IHME 20211104_**, **_IMPE 20211027_**, **_SRIV 20211105_**
 
(48) uptake [`20211029`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211029): 
**_DELP 20211029_**, IHME 20211021, **_IMPE 20211021_**, **_SRIV 20211029_**
  
(47) uptake [`20211022`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211022): 
**_DELP 20211019_**, **_IHME 20211021_**, IMPE 20211006, **_SRIV 20211017_**
  
(46) uptake [`20211015`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211015): 
**_DELP 20211015_**, **_IHME 20211015_**, **_IMPE 20211006_**, **_SRIV 20211015_**
  
(45) uptake [`20211008`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20211008): 
**_DELP 20211008_**, IHME 20211001, IMPE 20210924, LANL 20210926, **_SRIV 20211008_**
  
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

(03) uptake [`20210409`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210409): DELP 20210408, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(02) uptake [`20210406`](https://github.com/pourmalek/CovidVisualizedGlobal/tree/main/20210406): DELP 20210401, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406 

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
  
  

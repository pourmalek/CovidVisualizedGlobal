# CovidVisualizedGlobal 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 
[![DOI](https://zenodo.org/badge/357850528.svg)](https://zenodo.org/badge/latestdoi/357850528)


### Combine and visualize international periodically updating estimates of COVID-19 

### <div align="center"> at the global level 🌍 
  


********************************************************************************************************************************************
********************************************************************************************************************************************
* Project: Combine and visualize international periodically updating estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek (pourmalek_farshad at yahoo dot com)   [![Orcid](https://info.orcid.org/wp-content/uploads/2019/11/orcid_16x16.png)](https://orcid.org/0000-0002-2134-0771)    [`PubMed`](https://pubmed.ncbi.nlm.nih.gov/?term=Pourmalek+F&sort=pubdate&size=200)
* Time (initial): 2021-04-14
********************************************************************************************************************************************
********************************************************************************************************************************************

  <br/><br/>

 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ 
 
### Related repositories:

THREE “CovidVisualized” repositories, use a common template and logic for visualization of the results of estimates of FIVE international and periodically updating COVID-19 models for the future of the epidemic:

[`CovidVisualizedGlobal`]( https://github.com/pourmalek/CovidVisualizedGlobal) for the [`GLOBAL`](https://github.com/pourmalek/CovidVisualizedGlobal#covidvisualizedglobal) level

[`CovidVisualizedCountry`](https://github.com/pourmalek/CovidVisualizedCountry) for countries with subnational estimates: [`CANADA`](https://github.com/pourmalek/CovidVisualizedCountry#covidvisualizedcountry)

[`covir2`](https://github.com/pourmalek/covir2) for countries without subnational estimates: [`IRAN`](https://github.com/pourmalek/covir2#covir2)

These results are periodically updated. 

The codes in these repositories can be adapted for use for any country or region in the world. 
 
* For a sample application of “covir2” to a country without subnational estimates see [`Afghanistan`](https://github.com/pourmalek/covir2/blob/main/ADAPTATIONS_EXAMPLES/Afghanistan_%2020210625/20210625/README.md)
 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++   


<br/><br/>  
  
  
  
********************************************************************************************************************************************  
  *
## Notice: Nomenclature CORRECTION is being applied: 
  
### IHME and IMPE estimate INFECTIONS (not CASES). 
  
#### Their Case Fatality Ratio (CFR) -> Infection Fatality ratio (IFR).

  *
********************************************************************************************************************************************   
  

### TOC

[I. SELCTED GRAPHS FROM LATEST UPTAKE](https://github.com/pourmalek/CovidVisualizedGlobal#i-selcted-graphs-from-latest-uptake)

[II. METHODS AND RESULTS OF THIS WORK](https://github.com/pourmalek/CovidVisualizedGlobal#ii-methods-and-results-of-this-work)

[III. INNER WORKS OF THIS REPOSITORY](https://github.com/pourmalek/CovidVisualizedGlobal#iii-inner-works-of-this-repository)

[IV. SELCTED GRAPHS FROM PREVIOUS UPTAKES](https://github.com/pourmalek/CovidVisualizedGlobal#iv-selcted-graphs-from-previous-uptakes)

********************************************************************************************************************************************

********************************************************************************************************************************************
  
********************************************************************************************************************************************
  
********************************************************************************************************************************************

## I. SELCTED GRAPHS FROM LATEST UPTAKE

********************************************************************************************************************************************
********************************************************************************************************************************************

#### LATEST UPTAKE: uptake 20210618

#### DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618
  
****

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677174-0c80cf80-d196-11eb-8e4a-1cb5225206db.png)

****

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677199-25898080-d196-11eb-855f-42ecdd9847d0.png)

****

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677212-40f48b80-d196-11eb-8734-618510061f97.png)

****

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677240-5f5a8700-d196-11eb-9abb-f7e8ce316bac.png)

****

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677265-7ef1af80-d196-11eb-8d17-65fed3f0ffdf.png)

****

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677295-9b8de780-d196-11eb-9b15-64cf48ca69fb.png)

****

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677316-b52f2f00-d196-11eb-9ec1-65999913447a.png)

****

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677339-d001a380-d196-11eb-9eaf-3b5219da8201.png)

****

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677374-eb6cae80-d196-11eb-8569-25ab67c5ad12.png)

****

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677425-06d7b980-d197-11eb-8f53-e5578fa104f8.png)




********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************


## II. METHODS AND RESULTS OF THIS WORK
<br/><br/>


**SUMMARY**
  
Five international and periodically updating models of COVID-19 pandemic are identified and the results of their estimates are gathered, combined, and graphs for the progression of the pandemic at the global level. Periodical releases of these studies’ estimates undergo processing and visualization in this repository. A longitudinal visualization component is also present.   
<br/><br/>

  
**BACKGROUND**

The idea put to work here is to combine and visualize international periodically updating studies / models of COVID-19 pandemic, for the global level. The end result being sharable codes and outputs, for estimates files and graphs, for individual studies, and for combination of them, and repeat the process periodically. 
<br/><br/>
  
**METHODS**

Eligibility for target (component) studies (models) of COVID-19 pandemic, are set as those that (1) provide estimates for at least one of the four outcomes of interests, i.e., daily deaths, daily incident cases, cumulative (total) deaths, and cumulative (total) incident cases, (2) at the global level, (3) as sum of estimates at the country level, (4) periodically updating into 2021, (5) provide a list of input data and their sources, and (6) provide explanation on methods of using input data and generation of model outputs. 

Target studies were found via hand search using google. After “Additional file 1 of Rapid review of COVID-19 epidemic estimation studies for Iran”, Page 39, [here](https://s3-eu-west-1.amazonaws.com/pstorage-npg-968563215/26271814/12889_2021_10183_MOESM1_ESM.docx)

Methods generally follow, with alterations, this article: Pourmalek F, Rezaei Hemami M, Janani L, Moradi-Lakeh M. Rapid review of COVID-19 epidemic estimation studies for Iran. BMC Public Health. 2021 Feb 1;21(1):257. doi: 10.1186/s12889-021-10183-3. https://bmcpublichealth.biomedcentral.com/articles/10.1186/s12889-021-10183-3
<br/><br/>

**RESULTS**
<br/><br/>


**RESULTS, (A) Studies:**
<br/><br/>

Five studies (models) meeting the eligibility criteria: DELP, IHME, IMPE, LANL, SRIV, details below. Results of estimates for each study are stored in Stata data files and graphs. Results for combination of all five studies’ estimates are also are stored in data files and combined graphs. 
<br/><br/>

(1) DELP  
. DELP = DELPHI: Differential Equations Lead to Predictions of Hospitalizations and Infections  
. Citation: COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology. https://www.covidanalytics.io/projections  
. Study website: https://www.covidanalytics.io/projections  
. Estimates web site: https://www.covidanalytics.io/projections, down the page, link that reads, "Download Most Recent Predictions"  
. License: https://github.com/COVIDAnalytics/DELPHI/blob/master/LICENSE  
. Institution: Operations Research Center, Massachusetts Institute of Technology, Cambridge  
. Among articles: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7883965/ , https://www.medrxiv.org/content/10.1101/2020.06.23.20138693v1, https://www.covidanalytics.io/DELPHI_documentation_pdf  
. Periodically updating: Yes   
. Periodical updates accessible: No  
  
(2) IHME
. IHME = Institute for Health Metrics and Evaluation  
. Citation: Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid  
. Study web site: http://www.healthdata.org/covid  
. Estimates web site: http://www.healthdata.org/covid/data-downloads  
. License: http://www.healthdata.org/about/terms-and-conditions  
. Institution: IHME, University of Washington, Seattle   
. Among articles: https://www.nature.com/articles/s41591-020-1132-9  
. Periodically updating: Yes  
. Periodical updates accessible: Yes  
  
(3) IMPE  
. IMPE = Imperial College  
. Citation: MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports/  
. Study web site: https://mrc-ide.github.io/global-lmic-reports/  
. Estimates web site: https://github.com/mrc-ide/global-lmic-reports/tree/master/data  
. License: https://github.com/mrc-ide/global-lmic-reports  
. Institution: Imperial College, London  
. Among articles: https://science.sciencemag.org/content/369/6502/413  
. Periodically updating: Yes  
. Periodical updates accessible: Yes  
  
(4) LANL  
. LANL = Los Alamos National Laboratories  
. Citation: Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org  
. Study web site: https://covid-19.bsvgateway.org  
. Estimates web site: https://covid-19.bsvgateway.org, Model Outputs, Global  
. License: https://covid-19.bsvgateway.org  
. Institution: Los Alamos National Laboratories, Los Alamos  
. Among documents: https://covid-19.bsvgateway.org/static/COFFEE-methodology.pdf  
. Periodically updating: Yes  
. Periodical updates accessible: Yes  
  
(5) SRIV  
. SRIV = Srivastava, Ajitesh  
. Citation: University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19  
. Study web site: https://scc-usc.github.io/ReCOVER-COVID-19/  
. Estimates web site: https://github.com/scc-usc/ReCOVER-COVID-19/tree/master/results/historical_forecasts  
. License: https://github.com/scc-usc/ReCOVER-COVID-19/blob/master/LICENSE  
. Institution: University of Southern California, Los Angeles  
. Among articles: https://arxiv.org/abs/2007.05180  
. Periodically updating: Yes  
. Periodical updates accessible: Yes  
  
(0) JOHN  
. JOHN = Johns Hopkins University. Coronavirus resource center. https://coronavirus.jhu.edu  
. Not a target study, but a benchmark for comparison.  
. Citation: "COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University"  
. Study web site: https://coronavirus.jhu.edu  
. Estimates web site: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series , "COVID-19 Data Repository by the Center for Systems Science and Engineering (CSSE) at Johns Hopkins University"  
. License: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series  
. Institution: Johns Hopkins University, Baltimore  
. Among articles: Dong E, Du H, Gardner L. An interactive web-based dashboard to track COVID-19 in real time. Lancet Infect Dis. 2020 May;20(5):533-534. doi: 10.1016/S1473-3099(20)30120-1. Epub 2020 Feb 19.  
. Periodically updating: Yes   
. Periodical updates accessible: Yes  
<br/><br/>

  
**RESULTS, (B) Periodical updates of component studies:** 
<br/><br/>

Periodical updates of component studies are performed here according to release of new estimates updates by the two studies with less frequent estimates updates releases, i.e., IHME and IMPE. LANL updates every 3-4 days, SRIV every day, and DELP updates frequency is not discoverable to me. With each update release by IHME or IMPE, the whole set of five studies’ estimates updates are processed (updated here) and the results are stored in a directory named after the calendar date on which update was performed. 
<br/><br/>
  
**RESULTS, (C) Longitudinal visualization of component studies’ estimates updates:**

Within each study, estimates for any given person-place-time unit – that is any specific outcome (e.g., daily deaths), any given location (e.g., the global level), and given calendar time period (e.g., May 2021) – might vary (in terms of height and trajectory of outcome estimates), across consecutive releases of updated estimates. Analysis of such variations should – based on my understanding – reflect that the largest proportion of variance originates from the use of new data input to the model. This is true across all-time variations. Other sources of variation include input of new data types to the model, and less frequently, major and minor updates in the modeling process, that are known as “model version”, and are quite distinct from “model estimates updates”. Based on such variation of model estimates updates for any given person-place-time unit, looking at the estimates of the same person-place-time unit across consecutive model estimates updates of any given model might be expected to provide additional insight about how model estimates evolve along with progression of the pandemic. This leads to longitudinal view of component studies’ estimates updates: e.g., look at IHME estimates for daily global deaths for May 2021 across consecutive IHME estimates releases. Timing of longitudinal visualization is set for the end of each calendar month, to minimize the role of calendar time as source of the above-described variation. 
<br/><br/>

**LIMITATIONS**
<br/><br/>

The search for target studies is not performed in a replicable method. A systematic review might reveal more target studies that meet the eligibility criteria. Software codes use a propriety software package. Use of  R or Phyton are preferable in terms of user accessibility. 

<br/><br/>
  
**FUTURE DIRECTIONS AND COLLABOATIONS** 
<br/><br/>

The idea of this work originated from looking at estimates for COVID-19 epidemic in one location, Iran, in repository covir2. Then I thought about creating a template that can be used for any location and its sub-locations – from global level, to regional (e.g., continents, WHO regions, GBD regions, etc.), national, and subnational levels (where available). Also thought about a visualization hub, that creates (combined results and) graphs for all locations for which COVID-19 estimates are available via the international periodically updating models. For writing the code, I lack the knowledge and experience with Python to do the job. I am looking for suggestions, collaboration, and help; please e-mail me (pourmalek_farshad@yahoo.com)
<br/><br/>

********************************************************************************************************************************************
********************************************************************************************************************************************

## III. INNER WORKS OF THIS REPOSITORY 

The Stata _codes_ can be executed on local machines:

Run in Stata "Users|local-user-name|Downloads|GlobalCovidCombineVisualizeCombineVisualize-main|20210428|code|master|do GlobalCovidCombineVisualizeCombineVisualizemaster.do" on local machine after the directory |GlobalCovidCombineVisualizeCombineVisualize-main| is downloaded into and is located in the root of |Downloads| folder of your local machine, for update 20210428; and later instances of 202YMMDD for later updates.  

Preproduced _outputs_ are stored for each update, e.g., [`20210428`](https://github.com/pourmalek/ GlobalCovidCombineVisualizeCombineVisualize /tree/main/20210428), in folder [`output`](https://github.com/pourmalek/ GlobalCovidCombineVisualizeCombineVisualize /tree/main/20210428/output), for each component study, i.e. [`DELP`](https://github.com/pourmalek/ GlobalCovidCombineVisualizeCombineVisualize /tree/main/20210428/output/DELP), [`IHME`](https://github.com/pourmalek/GlobalCovidCombineVisualize/tree/main/20210428/output/IHME), [`IMPE`](https://github.com/pourmalek/ GlobalCovidCombineVisualizeCombineVisualize /tree/main/20210428/output/IMPE), [`LANL`](https://github.com/pourmalek/GlobalCovidCombineVisualize/tree/main/20210428/output/LANL), and [`SRIV`](https://github.com/pourmalek/GlobalCovidCombineVisualize/tree/main/20210428/output/SRIV), plus [`JOHN`](https://github.com/pourmalek/GlobalCovidCombineVisualize/tree/main/20210428/output/JOHN) as benchmark. Combined results stored in [`merge`](https://github.com/pourmalek/GlobalCovidCombineVisualize/tree/main/20210428/output/merge). 

[`longitudinal`](https://github.com/pourmalek/GlobalCovidCombineVisualize/tree/main/longitudinal) assessment of models will be added later. 

Selected _graphs_ are shown below. 

_Component studies and their scenarios_ are mentioned below after the selected _graphs_.

[`Variable name structure`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/Variable%20name%20structure.md)

[`Troubleshooting`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/Troubleshooting.md)



### Scenario number within component study


[Names within brackets assigned by this review study.]

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
* S04 = Surged Additional 50% Reduction [Best, Surged]
* S05 = Surged Maintain Status Quo [Reference, Surged] 	
* S06 = Surged Relax Interventions 50% [Worst, Surged]	
<br/><br/>

#### A04 LANL
* S00 = [Single scenario]
<br/><br/>

#### A05 SRIV
* S00 = [current]
* Note: SRIV has 3 sets of scenrios, here (add). 
<br/><br/>



### uptakes in this repository, since April 2021 


**bold fonts** show the uptake was triggered by IHME or IMPE. 

.

(uptake number) uptake date: study update date, study update date

.
  
  
(20) uptake 20210618: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(19) uptake 20210611: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611  

(18) uptake 20210610: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(17) uptake 20210605: DELP 20210603, IHME 20210604, **I_MPE 20210604_**, LANL 20210602, SRIV 20210604

(16) uptake 20210604: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(15) uptake 20210603: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(14) uptake 20210528: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(13) uptake 20210522: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522

(12) uptake 20210521: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521

(11) uptake 20210516: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(10) uptake 20210515: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(9) uptake 20210514: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514 

(8) uptake 20210506: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506 

(7) uptake 20210424: DELP 20210424, IHME 20210422, **_IMPE 20210424_**, LANL 20210421, SRIV 20210424 

(6) uptake 20210422: DELP N20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(5) uptake 20210417: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(4) uptake 20210416: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(3) uptake 20210409: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(2) uptake 20210406: DELP 20210406, IHME 20210401, **_IMPE 20210406-**, LANL 20210404, SRIV 20210406 

(1) uptake 20210401: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401 


********************************************************************************************************************************************
********************************************************************************************************************************************

## IV. SELCTED GRAPHS FROM PREVIOUS UPTAKES
  
  
[(1) Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal#1-daily-deaths-reference-scenarios-all-time)

[(2) Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal#2-daily-deaths-reference-scenarios-2021)
  
[(3) Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal#3-daily-deaths-3-scenarios-2011)
  
[(4) Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal#4-daily-cases-reference-scenarios-all-time)
  
[(5) Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal#5-daily-cases-reference-scenarios-2021)
  
[(6) Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal#6-daily-cases-3-scenarios-2011)
  
[(7) Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal#7-hospital-related-outcomes-all-time)
  
[(8) Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal#8-hospital-related-outcomes-2021-without-ihme-bed-need-and-impe-hospital-demand)
  
[(9) Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal#9-daily-deaths-estimated-to-reported-reference-scenarios-2021)
  
[(10) Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal#10-daily-cases-estimated-to-reported-reference-scenarios-2021)

****

### (1) Daily deaths, reference scenarios, all time
  
  
*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677174-0c80cf80-d196-11eb-8e4a-1cb5225206db.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510054-c53de780-cfb9-11eb-8d3c-be9e20bbd999.png)
  
*  

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122498938-d6c8c480-cfa4-11eb-888d-7d91a78af068.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122492591-e8a56a00-cf9a-11eb-9840-8f84f14bf8f5.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122488687-d7f0f600-cf92-11eb-80b4-136c0cd532fc.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486196-6b272d00-cf8d-11eb-820a-b94de6c5fd97.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484101-d4587180-cf88-11eb-9dbb-3ac0a0571bdb.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481588-c8b67c00-cf83-11eb-9d4f-175bcdfe89be.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479381-d7029900-cf7f-11eb-9cda-c3875ccca879.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122454667-7dd73d00-cf60-11eb-82ff-6bef332db504.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122445486-74e16e00-cf56-11eb-9cc6-f13df56a0c8b.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122415230-97ff2400-cf3c-11eb-94c4-ae2c04efab0d.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122407364-6edb9500-cf36-11eb-960b-7e593161b298.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122336511-d7545300-cef1-11eb-8322-a03d8fd92091.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122319861-15437e00-ced6-11eb-8a15-f03907282a71.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122314572-48354400-cecd-11eb-97df-246e0c137cc1.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311658-8891c380-cec7-11eb-866c-0ad20b110643.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122308768-de636d00-cec1-11eb-8c92-5fe7c7a652e5.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291023-3477e680-cea9-11eb-837c-c00761d1600e.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122281149-cc240780-ce9e-11eb-93e9-27dcdbd8e5dc.png)

*











****

### (2) Daily deaths, reference scenarios, 2021


  
*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677199-25898080-d196-11eb-855f-42ecdd9847d0.png)

*  
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510109-dd156b80-cfb9-11eb-8e67-04b31a5ce1b7.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122498993-f102a280-cfa4-11eb-9280-59c854f89283.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122492651-0246b180-cf9b-11eb-9c2b-acce65124f69.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122488843-31592500-cf93-11eb-85fc-ced736c784f8.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486243-842fde00-cf8d-11eb-9743-639024ce3d82.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484156-ecc88c00-cf88-11eb-9830-8273ba664206.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481646-e4ba1d80-cf83-11eb-9f4c-b6465accb18d.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479447-f3063a80-cf7f-11eb-9b0c-30c0a8aea2fa.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122454813-99dade80-cf60-11eb-8f30-2db111855079.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122445612-90e50f80-cf56-11eb-8c46-85f1308ef432.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122415354-b1a06b80-cf3c-11eb-87b7-00d03a450b58.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122407493-861a8280-cf36-11eb-979a-38f76b723bb4.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122336625-feab2000-cef1-11eb-89ea-eff185414512.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122319940-3dcb7800-ced6-11eb-8fd7-da71ba191811.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122315729-7f0c5980-cecf-11eb-84f5-91ffe857c317.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311706-a2cba180-cec7-11eb-81c3-af6a4572d927.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122308812-f804b480-cec1-11eb-9093-17ce21507813.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291107-4c4f6a80-cea9-11eb-927d-78acaa3cfd81.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122281259-eb229980-ce9e-11eb-8146-f247ff4210f2.png)

*












****

### (3) Daily deaths, 3 scenarios, 2011

  
  
*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677212-40f48b80-d196-11eb-8734-618510061f97.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510162-f8807680-cfb9-11eb-9f43-ccdb1d98d834.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499054-0bd51700-cfa5-11eb-85b9-8efbefe7832f.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122492714-1db1bc80-cf9b-11eb-9475-ac33b25fee6c.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122488885-4d5cc680-cf93-11eb-8670-39ba68736e0b.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486296-a1fd4300-cf8d-11eb-9ce7-c6216bf70490.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484214-04a01000-cf89-11eb-90d5-a0ff14353298.png)
  
*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481686-ff8c9200-cf83-11eb-9e5e-64d1498fcfb5.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479518-0fa27280-cf80-11eb-9e9c-b2cd110c4271.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122454965-bd058e00-cf60-11eb-97d9-abc8d64ba07c.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122445724-ab1eed80-cf56-11eb-93ba-bd45ae6dc7a5.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122415480-d09efd80-cf3c-11eb-9261-80ae3c3f52a3.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122407621-9f233380-cf36-11eb-87a0-31369f970067.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122336709-1e424880-cef2-11eb-9386-d145905c62aa.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321097-30af8880-ced8-11eb-925e-614512dff696.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122315816-9fd4af00-cecf-11eb-80c7-e2dc8e010aac.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311774-c0990680-cec7-11eb-899a-d98844875c07.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122308864-15398300-cec2-11eb-8136-7357a7dadd65.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291189-65581b80-cea9-11eb-9083-bd4461087edd.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122281776-8287ec80-ce9f-11eb-810f-29ee294eefbd.png)

*














****

### (4) Daily cases, reference scenarios, all time
  
  

*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677240-5f5a8700-d196-11eb-9abb-f7e8ce316bac.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510247-19e16280-cfba-11eb-9963-47c2c83b76a8.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499101-25765e80-cfa5-11eb-98a9-5f5620fe9744.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122492761-37eb9a80-cf9b-11eb-940f-10ef6d269d69.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122488929-682f3b00-cf93-11eb-9b8e-ca1cd07ebd00.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486339-b9d4c700-cf8d-11eb-8de5-b10c244813c0.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484269-1f728480-cf89-11eb-9866-d2ec659810fe.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481732-19c67000-cf84-11eb-8c39-302405cf3bb1.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479570-29dc5080-cf80-11eb-95dd-91f72cd46311.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122455061-d9092f80-cf60-11eb-9b20-d8bfed87aaff.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122445852-d3a6e780-cf56-11eb-9ed9-80aef9a1dea5.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122415613-ec0a0880-cf3c-11eb-832d-1eb3fea6a1ea.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122407757-b95d1180-cf36-11eb-8b28-25fdf151c24e.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122336980-83963980-cef2-11eb-9be9-2f9ddb575093.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321256-6d7b7f80-ced8-11eb-884b-c95acbe6b0ed.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122315871-bbd85080-cecf-11eb-99e1-68bc53e973c5.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311817-d9a1b780-cec7-11eb-8d28-125a14220e8c.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122308917-300bf780-cec2-11eb-8766-fb69f37fdc5f.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291276-7f91f980-cea9-11eb-8543-7fb5da8eb7fe.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/122281865-9df2f780-ce9f-11eb-9b98-dd4edcd51a18.png)

*















****

### (5) Daily cases, reference scenarios, 2021
  
  

*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677265-7ef1af80-d196-11eb-8d17-65fed3f0ffdf.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510282-31b8e680-cfba-11eb-9d30-69beaee867a5.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499152-3f17a600-cfa5-11eb-827b-bf2cc139d101.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122495969-d4b03700-cf9f-11eb-8e9c-1c6f98eb5fbd.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122488987-8432dc80-cf93-11eb-960c-e8e388bb6c90.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486382-d2dd7800-cf8d-11eb-945c-ba55fbdfd474.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484326-3c0ebc80-cf89-11eb-9b78-984ca58cd97f.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481785-32cf2100-cf84-11eb-9c14-af53070d9ec5.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479622-42e50180-cf80-11eb-84cc-c0047dd15b81.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122455932-cc390b80-cf61-11eb-8b32-95340c1f3b55.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122446084-1e286400-cf57-11eb-83fa-879a7b2f59e3.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122415745-080daa00-cf3d-11eb-89c4-f643b7236520.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122407901-d0036880-cf36-11eb-882e-7d7a103b075f.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122337051-9dd01780-cef2-11eb-9d91-0056158f51bb.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321336-8b48e480-ced8-11eb-93ae-2143ea9d2178.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122315927-d4e10180-cecf-11eb-8d99-543cbf0de1ef.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311854-f0480e80-cec7-11eb-8a36-7ad928d69d20.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122308977-4c0f9900-cec2-11eb-9453-60e6a920acdd.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291358-97697d80-cea9-11eb-8a4e-b60999e148b1.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(5) [Daily cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122281964-b8c56c00-ce9f-11eb-8538-104db21ae32f.png)

*















****

### (6) Daily cases, 3 scenarios, 2011
  
  

*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677295-9b8de780-d196-11eb-9b15-64cf48ca69fb.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510376-54e39600-cfba-11eb-98b8-4146b762091c.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499199-56569380-cfa5-11eb-90c1-d1442baaca8e.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122496022-f14c6f00-cf9f-11eb-866b-8bb3d0dcdecc.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122489068-ad536d00-cf93-11eb-80cf-a049db22d336.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486430-eb4d9280-cf8d-11eb-88a0-e5369fc27188.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484384-56e13100-cf89-11eb-86de-d6a704ac8bb5.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481919-74f86280-cf84-11eb-99a0-5c5702f593f6.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479694-5bedb280-cf80-11eb-9b17-b3860ac36b8a.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122456023-e7a41680-cf61-11eb-9840-315c50d8af53.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122446191-3a2c0580-cf57-11eb-9670-98653c3d23d0.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122415900-2378b500-cf3d-11eb-9f14-d97ba56f98e5.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122408039-ec070a00-cf36-11eb-892f-bc6c8760e7cd.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122337112-bc361300-cef2-11eb-87ea-2867b91afefd.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321389-a582c280-ced8-11eb-88d2-7b02561486ef.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122315981-ed511c00-cecf-11eb-895f-40ec036f11b2.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311899-0950bf80-cec8-11eb-9955-5b3bf39fc323.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122309027-647fb380-cec2-11eb-8ce4-374ce8b2b2e6.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291450-af410180-cea9-11eb-9bbc-0792cbca0be0.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/122282085-ddb9df00-ce9f-11eb-9451-39a5bba14d83.png)

*















****

### (7) Hospital-related outcomes, all time
  
  

*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677316-b52f2f00-d196-11eb-9ec1-65999913447a.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510433-72186480-cfba-11eb-860c-db40eaf7c016.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499260-6ff7db00-cfa5-11eb-992f-29cf4e5693de.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122496088-0923f300-cfa0-11eb-9fbb-f8e7710d4628.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122489126-c825e180-cf93-11eb-81a0-9493d5d0b9de.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486482-015b5300-cf8e-11eb-97cc-afedcd97e3d8.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484423-6fe9e200-cf89-11eb-9911-77c2e3352d84.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122481986-90636d80-cf84-11eb-8dc0-6c00c57bb4de.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479754-76279080-cf80-11eb-9810-06c6aa1aabde.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122477429-8b9abb80-cf7c-11eb-9ef8-cbb9e4b78651.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122446271-54fe7a00-cf57-11eb-9a18-dc86c133f6c5.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122416013-3c816600-cf3d-11eb-95e6-dcce78bd37b7.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122408159-0345f780-cf37-11eb-9a6f-e420e92a6b7f.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122337177-d66ff100-cef2-11eb-888c-03d7020b77be.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321454-c0553700-ced8-11eb-8497-9cb314fa8e07.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122316053-078afa00-ced0-11eb-806d-67a8c944276b.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122311964-24233400-cec8-11eb-9e9b-f8cb8beff93f.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122309093-837e4580-cec2-11eb-90e9-de9bc41d0f8b.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291532-c67fef00-cea9-11eb-9eac-aad64ae3fa33.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/122262438-4007e500-ce8a-11eb-831e-17fa22db6cde.png)

*













****

### (8) Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand

  
  
*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677339-d001a380-d196-11eb-9eaf-3b5219da8201.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510506-8cead900-cfba-11eb-854a-d21b5bc43240.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499292-89992280-cfa5-11eb-8ece-e5f9cd4d8e96.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122496147-222ca400-cfa0-11eb-9068-eadead6d5cf2.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122489169-e4298300-cf93-11eb-9553-99aa9e22215d.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486527-1932d700-cf8e-11eb-89fa-02d3fc89ca60.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484480-8a23c000-cf89-11eb-9948-2a39a2044eb6.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122482416-5e064000-cf85-11eb-8203-0d081fe54acc.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479818-90616e80-cf80-11eb-96eb-9e58662356a8.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122477513-b5ec7900-cf7c-11eb-97fe-402c1b2f4c0c.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122446358-6c3d6780-cf57-11eb-8eca-f9523e67d384.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122416129-591d9e00-cf3d-11eb-9dde-c4bdd739c9c6.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122408285-19ec4e80-cf37-11eb-9a05-3148545f11e3.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122337259-f30c2900-cef2-11eb-90dd-34dac40077f4.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321536-da8f1500-ced8-11eb-917c-eeff25944068.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122316101-1ec9e780-ced0-11eb-8002-2b4c6d211e53.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122312009-3bfab800-cec8-11eb-9045-3616ee53af67.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122309152-9c86f680-cec2-11eb-9bca-69deb3dcedff.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291622-ddbedc80-cea9-11eb-803a-7c7cea81c58c.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122262603-6cbbfc80-ce8a-11eb-9fdf-3ef79e27ed60.png)

*














****

### (9) Daily deaths estimated to reported, reference scenarios, 2021

  
  
*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677374-eb6cae80-d196-11eb-8569-25ab67c5ad12.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510566-a55af380-cfba-11eb-8274-a2a847971160.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499352-a2093d00-cfa5-11eb-93ae-7991933edad7.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122496219-3bcdeb80-cfa0-11eb-813f-a6b46e095f10.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122489225-01f6e800-cf94-11eb-8ac9-318804865587.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486581-323b8800-cf8e-11eb-858c-feffdd6d030d.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484539-a889bb80-cf89-11eb-9dae-ab428cf32604.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122482462-79714b00-cf85-11eb-80d6-afde2520f9c2.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479874-a7a05c00-cf80-11eb-8453-cf3026a5f716.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122477607-dddbdc80-cf7c-11eb-953f-8e5ac5f9bde8.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122446442-84ad8200-cf57-11eb-96e2-0bbd247af95c.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122416268-72264f00-cf3d-11eb-996d-12e24d97b438.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122408392-32f4ff80-cf37-11eb-95af-5c04f89d1dc6.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122337326-0dde9d80-cef3-11eb-9d09-24cae6f4c258.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321590-f397c600-ced8-11eb-96c5-daae0bf035da.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122316170-386b2f00-ced0-11eb-933c-a614c732c906.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121114166-15ea5f00-c7c8-11eb-8e71-d4be9f0dbf4a.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122312072-57fe5980-cec8-11eb-8dec-42cf713e4271.png)
  
*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291715-f9c27e00-cea9-11eb-9aac-825693c1a7bc.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122282444-430dd000-cea0-11eb-8b39-03d9a9fa749e.png)

*














****

### (10) Daily cases estimated to reported, reference scenarios, 2021

  
  
*
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122677425-06d7b980-d197-11eb-8f53-e5578fa104f8.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122510628-c3285880-cfba-11eb-9083-0a35a1af49fd.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122499400-bb11ee00-cfa5-11eb-89a6-4f4c130a2866.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122496285-5738f680-cfa0-11eb-9ed4-7440248fe0ac.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122489276-205ce380-cf94-11eb-89af-53ad9154576c.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122486689-6b73f800-cf8e-11eb-8f3b-082336fca99f.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122484603-c820e400-cf89-11eb-8c51-e3e4f9ec8de9.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122482519-93ab2900-cf85-11eb-8890-35c952703e91.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479932-c0107680-cf80-11eb-98b1-44d00685f484.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122477785-27c4c280-cf7d-11eb-9dff-d2b16f208998.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122446515-9abb4280-cf57-11eb-80be-9850de142f1f.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122416382-8b2f0000-cf3d-11eb-98a8-2a56be087113.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122408503-4bfdb080-cf37-11eb-8666-cd7a253502d5.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088555-c5104180-c79a-11eb-8d86-46aef8e68f18.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122321653-0f02d100-ced9-11eb-9192-057140badabd.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **_IMPE 20210417_**, LANL 20210414, SRIV 20210417

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122316220-50db4980-ced0-11eb-83a6-1079b7da5b96.png)

*

**uptake 20210416**: DELP 20210416, **_IHME 20210416_**, IMPE 20210406, LANL 20210414, SRIV 20210416

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122312126-706e7400-cec8-11eb-8cc0-2af7ef2340de.png)

*

**uptake 20210409**: DELP 20210409, **_IHME 20210409_**, IMPE 20210406, LANL 20210407, SRIV 20210409

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122309243-cf30ef00-cec2-11eb-8d7a-9ef3e227c6af.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122291789-12329880-ceaa-11eb-91e6-5c79e10dda5d.png)

*

**uptake 20210401**: DELP 20210401, **_IHME 20210401_**, IMPE 20210329, LANL 20210331, SRIV 20210401

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122282539-5de04480-cea0-11eb-9d3e-1cb6ea799dc4.png)

*













****

<br/><br/>

 
********************************************************************************************************************************************
********************************************************************************************************************************************
 
 
## Licenses / Copyrights of data and / or graphs used in this repository:
  
All the data and / or graphs used in this repository are at non-individual and aggregate level, publicly available on the Internet, and under pertinent licenses and copyrights for non-commercial use, reproduction, and distribution for scientific research, provided that the conditions mentioned in the respective licenses and copyrights are met, as provided below.  

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
  
  
Pourmalek, F. GitHub repository “CovidVisualizedGlobal”: Combine and visualize international periodically updating estimates of COVID-19 at the global level. Version 1.1, Released June 23, 2021. http://doi.org/10.5281/zenodo.5019030 https://github.com/pourmalek/CovidVisualizedGlobal 
  
  

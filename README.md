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

These results in these three repositories get periodically updated. 

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

#### LATEST UPTAKE: uptake 20210625 

#### DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624
  
****

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200795-10acc700-da8b-11eb-8576-323719acf388.png)

****

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200829-2621f100-da8b-11eb-846a-cd6397242e77.png)

****

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200868-405bcf00-da8b-11eb-852a-a99b0227a743.png)

****

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200904-5c5f7080-da8b-11eb-8cde-7ed2ed3d37db.png)

****

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200939-726d3100-da8b-11eb-9dfc-2ac55b89b917.png)

****

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200965-887af180-da8b-11eb-92be-f6ccd80c8268.png)

****

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200989-9e88b200-da8b-11eb-867d-62bb99bda630.png)

****

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124201019-b4967280-da8b-11eb-9204-f960342d0fb6.png)

****

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124201037-caa43300-da8b-11eb-8747-1c475d1e90b2.png)

****

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124201071-e0195d00-da8b-11eb-8f27-f8c809c4fb71.png)

****
  
  


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

(22) uptake 20210625: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624   
  
(21) uptake 20210624: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624    
  
(20) uptake 20210618: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(19) uptake 20210611: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611  

(18) uptake 20210610: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(17) uptake 20210605: DELP 20210604, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(16) uptake 20210604: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(15) uptake 20210603: DELP 20210603, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

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

(2) uptake 20210406: DELP 20210406, IHME 20210401, **_IMPE 20210406_**, LANL 20210404, SRIV 20210406 

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
  
  
  
  
  
****  

### (1) Daily deaths, reference scenarios, all time
  
  
  
*  
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200795-10acc700-da8b-11eb-8576-323719acf388.png)
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203500-b6fbcb00-da91-11eb-9433-21ba173a0718.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124208836-465aab80-da9d-11eb-8472-8eed43fccd89.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213265-20390980-daa5-11eb-90b9-7128ae87c32d.png)
  
*  

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124224739-16ba9c00-dabb-11eb-8881-86ce6b9d021d.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340450-470d4380-db6a-11eb-8b00-df916411914e.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124279679-a3397e80-dafc-11eb-9301-25b5a647d571.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124305693-48168480-db1a-11eb-8e42-a970cb830035.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310319-dbeb4f00-db20-11eb-8429-27f916288825.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341872-77f27600-db74-11eb-8c51-e8ca2f9e872d.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122479381-d7029900-cf7f-11eb-9cda-c3875ccca879.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354601-ac405380-dbc1-11eb-9a4e-768e5a268b5d.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356851-3641e980-dbcd-11eb-919b-4c686506f0b4.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366112-1ed12380-dc02-11eb-8964-e527163796d2.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369408-88602a80-dc20-11eb-890b-57fcb671977b.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **ـIMPE 20210424ـ**, LANL 20210421, SRIV 20210424

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122336511-d7545300-cef1-11eb-8322-a03d8fd92091.png)

*

**uptake 20210422**: DELP 20210422, **_IHME 20210422_**, IMPE 2010417, LANL 20210421, SRIV 20210422

(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/122319861-15437e00-ced6-11eb-8a15-f03907282a71.png)
  
*
  
**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521   
  
(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346199-691abc00-db92-11eb-9cbd-eb11f8c15043.png)
  
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
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200829-2621f100-da8b-11eb-846a-cd6397242e77.png)
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203548-d4309980-da91-11eb-9f43-fc8136103991.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124208944-86ba2980-da9d-11eb-83a9-d2b7ebf0ed66.png)

*  
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213314-347d0680-daa5-11eb-836b-4093f2a946ee.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124224797-2d60f300-dabb-11eb-8d9b-498614265884.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340471-64421200-db6a-11eb-9eb3-e780694a3a0c.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299195-01249100-db12-11eb-93b9-429417c1c3bd.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124305769-5ebcdb80-db1a-11eb-96f7-b7d30267f477.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310505-240a7180-db21-11eb-8c09-1ff4be458428.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341881-90fb2700-db74-11eb-89c6-44c4cca3043f.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346218-80f24000-db92-11eb-9a5b-90b752d4c340.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354631-c7ab5e80-dbc1-11eb-8691-5bbf2da27651.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515
  
(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356864-507bc780-dbcd-11eb-89d8-c7facad89532.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366120-34464d80-dc02-11eb-9b33-56da0fff4c28.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(2) [Daily deaths, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369418-9e6deb00-dc20-11eb-9688-78630da783a1.png)

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
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200868-405bcf00-da8b-11eb-852a-a99b0227a743.png)  
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203595-eb6f8700-da91-11eb-8123-09db00c6945a.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209007-a3eef800-da9d-11eb-9ef8-892d9407fb8b.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213388-4d85b780-daa5-11eb-909c-88d72cbdf144.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124224849-45d10d80-dabb-11eb-801c-e12c3c6ef895.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340493-78860f00-db6a-11eb-8e3e-100d26475587.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299283-1bf70580-db12-11eb-8e29-5f48bcbf3882.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124305879-86ac3f00-db1a-11eb-84b0-98610726d1c4.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310586-3c7a8c00-db21-11eb-8020-e5094beeced1.png)
  
*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341890-ab350500-db74-11eb-9c78-ceec3a6c60c6.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346244-9e270e80-db92-11eb-8d88-c731e7d7175d.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354659-e14ca600-dbc1-11eb-92ab-0177364ed55f.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356874-69847880-dbcd-11eb-8344-5efad66728d7.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366139-4922e100-dc02-11eb-9742-267326d9b229.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506
  
(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2014%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369435-b5acd880-dc20-11eb-993c-06e286017c3f.png)

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

### (4) Daily cases or infections, reference scenarios, all time
  
  

*  
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203625-017d4780-da92-11eb-8746-8230528dd210.png)
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203625-017d4780-da92-11eb-8746-8230528dd210.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209102-c54fe400-da9d-11eb-8f66-2ee8f4a66e97.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213428-62624b00-daa5-11eb-9985-75d3555b9c70.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124224938-7153f800-dabb-11eb-8f43-4fcf4035f14e.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340510-8fc4fc80-db6a-11eb-97cc-392c26a7d206.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299378-34672000-db12-11eb-90ed-9d54e412fb70.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603
  
(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124305954-a0e61d00-db1a-11eb-8011-aab2cd0804de.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310639-53b97980-db21-11eb-8668-84044e879a94.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341904-c1db5c00-db74-11eb-9a4e-d974315969b1.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346266-bbf47380-db92-11eb-89c0-cb00831fe416.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354673-f9242a00-dbc1-11eb-880d-1d84351cf7d2.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356893-86b94700-dbcd-11eb-9599-08080e1606ea.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366152-635cbf00-dc02-11eb-8378-1dc5e44446a1.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(4) [Daily cases or infections, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2021%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369448-cc532f80-dc20-11eb-9844-256c9c946197.png)

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

### (5) Daily cases or infections, reference scenarios, 2021
  
  

*  
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200939-726d3100-da8b-11eb-9dfc-2ac55b89b917.png)
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203672-1954cb80-da92-11eb-8fc9-ba000fcbf2b2.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209149-dd276800-da9d-11eb-939d-c66dc1b63142.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213466-7ad26580-daa5-11eb-87a2-169b4de4430e.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124224993-8cbf0300-dabb-11eb-9228-decbf82a0c32.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340523-a53a2680-db6a-11eb-8e1f-cd58338076fe.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299480-52cd1b80-db12-11eb-9dc0-edc9509fd5d5.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124306017-b78c7400-db1a-11eb-8fa3-eb64f8aca106.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310687-69c73a00-db21-11eb-9e7c-fac8675cd7b7.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341916-d91a4980-db74-11eb-850b-d9ae2197fc33.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346287-d3336100-db92-11eb-86e5-104366f8a692.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354694-122cdb00-dbc2-11eb-8a23-749c17842ca1.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356913-a2bce880-dbcd-11eb-988d-3afbdc235a92.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366162-78d1e900-dc02-11eb-8bd5-be9408be07d0.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(5) [Daily cases or infections, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2022%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369459-e725a400-dc20-11eb-88a5-70e89c4237a4.png)

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

### (6) Daily cases or infections, 3 scenarios, 2011
  
  

*  
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200965-887af180-da8b-11eb-92be-f6ccd80c8268.png)
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203708-2ffb2280-da92-11eb-8cb6-fcf348261b8d.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209197-f203fb80-da9d-11eb-987d-1fbf9baf912b.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213508-8de53580-daa5-11eb-9e76-848f13063d5b.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124225041-a2342d00-dabb-11eb-8594-c420d210c104.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340544-bbe07d80-db6a-11eb-9102-4d72c0e12e3d.png)
  
*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299631-814af680-db12-11eb-82c9-d8dd20e6e93e.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124306098-cc690780-db1a-11eb-9b38-fdbeea9d2ca6.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310737-7f3c6400-db21-11eb-8986-1633ebbe2895.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341930-f0593700-db74-11eb-9cfb-ff18224725dd.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346312-e9d9b800-db92-11eb-92fd-f0e4652292b2.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516
  
(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354709-296bc880-dbc2-11eb-83e8-6aaac0198648.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356928-bc5e3000-dbcd-11eb-9694-d6ce8ca16190.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366170-8dae7c80-dc02-11eb-8f49-99dc3fbc7c5c.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(6) [Daily cases or infections, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2024%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369466-002e5500-dc21-11eb-82e2-f8df82f39b2f.png)

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
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124200989-9e88b200-da8b-11eb-867d-62bb99bda630.png)  
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203755-486b3d00-da92-11eb-9bee-d14778bfba89.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209245-0811bc00-da9e-11eb-9dad-ccfbc1a1adb7.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213554-a5242300-daa5-11eb-90e3-1b4445d488de.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124225105-b9731a80-dabb-11eb-9242-97f2697034f7.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340554-d1ee3e00-db6a-11eb-8018-ebb106e9fc37.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299727-9de72e80-db12-11eb-992f-71aa61087964.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124306165-e276c800-db1a-11eb-9c1a-55cebfbd9a68.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310797-93806100-db21-11eb-9df2-810420d3a1c4.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341945-06ff8e00-db75-11eb-9f83-c45f3be4e1f9.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346328-037aff80-db93-11eb-925f-d88785522eca.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354724-41434c80-dbc2-11eb-830d-9d1a7b2bad80.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356944-dc8def00-dbcd-11eb-87b9-8bd069daeea2.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366179-a28b1000-dc02-11eb-9f49-2426edc8166d.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2061%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369485-150ae880-dc21-11eb-8478-2fe569a390a6.png)

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
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124201019-b4967280-da8b-11eb-9204-f960342d0fb6.png) 
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203810-6769cf00-da92-11eb-86af-732b0e7994f5.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209307-2972a800-da9e-11eb-9b7b-6bd89f8f45de.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213597-ba00b680-daa5-11eb-8225-2ebfc1960f03.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124225162-d14a9e80-dabb-11eb-8868-3043aeaf5699.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340562-e6cad180-db6a-11eb-9e2b-5de337d93380.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299819-b6574900-db12-11eb-879a-8b2168d4d1af.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124306228-f8848880-db1a-11eb-9fe2-4f0480bf9174.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310871-aeeb6c00-db21-11eb-91bd-4a1e830b0421.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 
  
(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341952-1bdc2180-db75-11eb-8887-49509582b0bd.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346345-1c83b080-db93-11eb-84f3-c8edebe82920.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354748-5e781b00-dbc2-11eb-9b9b-f2c561a97ea2.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356967-f7f8fa00-dbcd-11eb-9369-bfe8adcf4639.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366187-b9316700-dc02-11eb-92b3-ed0b999106da.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2063%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369495-294ee580-dc21-11eb-8ad8-2e119b0ca798.png)

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
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124201037-caa43300-da8b-11eb-8747-1c475d1e90b2.png)  
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203861-7fd9e980-da92-11eb-8dbe-2149a64a48fd.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209360-3e4f3b80-da9e-11eb-81d4-e655db147de6.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213656-d00e7700-daa5-11eb-8cb1-41cf01ad9591.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124225243-f3dcb780-dabb-11eb-855a-74ed99c66af5.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340573-0104af80-db6b-11eb-82d8-c144f10c2660.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299906-cff89080-db12-11eb-8d4e-cd53fae9bf8c.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124306299-0df9b280-db1b-11eb-93be-f89cd6292da0.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310938-c9254a00-db21-11eb-9186-da9382cf8864.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341968-3a421d00-db75-11eb-90e2-86322470e032.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346364-38875200-db93-11eb-8ddf-de34df8e297e.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354770-76e83580-dbc2-11eb-94fb-4e666cdfef63.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124356988-1232d800-dbce-11eb-8fe7-0e3c92ee8db8.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366206-cea69100-dc02-11eb-9fd7-c791b9f6961c.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2082%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369509-41266980-dc21-11eb-94a3-7a05744947dc.png)

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

### (10) Daily cases or infections estimated to reported cases, reference scenarios, 2021

  
  
*  
  
**uptake 20210625**: DELP 20210625, **_IHME 20210625_**, IMPE 20210618, LANL 20210613, SRIV 20210624  
  
(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210625/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124201071-e0195d00-da8b-11eb-8f27-f8c809c4fb71.png) 
  
*

**uptake 20210624**: DELP 20210624, IHME 20210618, **_IMPE 20210618_**, LANL 20210613, SRIV 20210624   
  
(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210624/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124203897-9718d700-da92-11eb-93d7-0df4cb84d743.png)
  
*  
  
**uptake 20210618**: DELP 20210618, **_IHME 20210618_**, IMPE 20210611, LANL 20210613, SRIV 20210618  
  
(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210618/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124209401-545cfc00-da9e-11eb-8cc1-d5e7f13763cf.png)

*
  
**uptake 20210611**: DELP 20210611, IHME 20210610, **_IMPE 20210611_**, LANL 20210606, SRIV 20210611 
  
(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210611/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124213704-e61c3780-daa5-11eb-83af-eb34826c2ed3.png)
  
* 

**uptake 20210610**: DELP 20210610, **_IHME 20210610_**, IMPE 20210604, LANL 20210606, SRIV 20210610

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124225289-09ea7800-dabc-11eb-9fd7-323845632dac.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **_IMPE 20210604_**, LANL 20210602, SRIV 20210604

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124340585-1679d980-db6b-11eb-9291-f9c4d8f003f0.png)

*

**uptake 20210604**: DELP 20210604, **_IHME 20210604_**, IMPE 20210527, LANL 20210602, SRIV 20210604

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124299980-e69ee780-db12-11eb-8319-a79dec62d155.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **_IMPE 20210527_**, LANL 20210526, SRIV 20210603

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124306452-46998c00-db1b-11eb-9bc4-912ad917ad37.png)

*

**uptake 20210528**: DELP 20210528, **_IHME 20210528_**, IMPE 20210522, LANL 20210526, SRIV 20210528

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124310996-dfcba100-db21-11eb-88f0-8543ae8a0fc4.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **_IMPE 20210522_**, LANL 20210519, SRIV 20210522 

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124341987-580f8200-db75-11eb-98cd-bc36ff93599d.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124346378-4fc63f80-db93-11eb-872b-6d1ea78299a8.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **_IMPE 20210516_**, LANL 20210516, SRIV 20210516

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124354785-954e3100-dbc2-11eb-9525-c09323e0e41f.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **_IMPE 20210510_**, LANL 20210512, SRIV 20210515

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124357018-2b3b8900-dbce-11eb-9604-01a0a7297924.png)

*

**uptake 20210514**: DELP 20210514, **_IHME 20210514_**, IMPE 20210424, LANL 20210512, SRIV 20210514

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124366214-e716ab80-dc02-11eb-8207-d63b39086d39.png)

*

**uptake 20210506**: DELP 20210506, **_IHME 20210506_**, IMPE 20210424, LANL 20210505, SRIV 20210506

(10) [Daily cases or infections estimated to reported cases, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/124369515-58655700-dc21-11eb-95b8-2c6182d89b62.png)

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
  
  

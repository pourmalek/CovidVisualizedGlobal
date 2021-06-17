# CovidVisualizedGlobal


### Combine and visualize international periodically updating estimates of COVID-19 

### <div align="center"> at the global level 🌍 


********************************************************************************************************************************************
********************************************************************************************************************************************
* Project: Combine and visualize international periodically updating estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
********************************************************************************************************************************************
********************************************************************************************************************************************


### TOC

[I. SELCTED GRAPHS FROM LATEST UPTAKE](https://github.com/pourmalek/CovidVisualizedGlobal#i-selcted-graphs-from-latest-uptake)

[II. METHODS AND RESULTS OF THIS WORK](https://github.com/pourmalek/CovidVisualizedGlobal#ii-methods-and-results-of-this-work)

[III. INNER WORKS OF THIS REPOSITORY](https://github.com/pourmalek/CovidVisualizedGlobal#iii-inner-works-of-this-repository)

[IV. SELCTED GRAPHS FROM PREVIOUS UPTAKES](https://github.com/pourmalek/CovidVisualizedGlobal#iv-selcted-graphs-from-previous-uptakes)

********************************************************************************************************************************************

### Contents


********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************

## I. SELCTED GRAPHS FROM LATEST UPTAKE

********************************************************************************************************************************************
********************************************************************************************************************************************

LATEST UPDATE: **uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610


(1) [Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760021-666dff00-cadd-11eb-8360-cc43dd055ce5.png)

****

(2) [Daily deaths, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2015%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760043-830a3700-cadd-11eb-888c-04850e46671a.png)

****

(3) [Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2017%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760067-a339f600-cadd-11eb-83c3-69fcba90cccb.png)

****

(4) [Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760081-bf3d9780-cadd-11eb-92cb-a2a62d050600.png)

****

(5) [Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760092-d7151b80-cadd-11eb-93da-b1f9722a2ffb.png)

****

(6) [Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760106-ef853600-cadd-11eb-8cb7-edbd08a52f8b.png)

****

(7) [Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760128-075cba00-cade-11eb-9dda-0fa4cea9e7af.png)

****

(8) [Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760141-1e9ba780-cade-11eb-9487-b170deb352bb.png)

****

(9) [Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760171-36732b80-cade-11eb-81fe-e00796678cde.png)

****

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760196-4db21900-cade-11eb-8e42-37c2e23d9852.png)


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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760021-666dff00-cadd-11eb-8360-cc43dd055ce5.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time.pdf)

![image](https://user-images.githubusercontent.com/30849720/121531477-480be480-c9b3-11eb-9590-4d06d828dcb9.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121067539-07785500-c780-11eb-95fe-963c48e85ea6.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934581-aedb8600-c6b3-11eb-8082-1d26b01d4465.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120931804-14297a00-c6a8-11eb-840f-0ac56164fb34.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522 

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911744-a301ac80-c63e-11eb-8e5d-a587d076f980.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910180-8743d980-c631-11eb-8bd2-9bfa045b2776.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily deaths, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2015%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760043-830a3700-cadd-11eb-888c-04850e46671a.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily deaths, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2015%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121531764-93be8e00-c9b3-11eb-88c9-e0f138d534ea.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121067634-21199c80-c780-11eb-82cb-9dad079fbaf4.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934609-da5e7080-c6b3-11eb-9275-73767758268b.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120931860-391ded00-c6a8-11eb-949c-f331ba7623ac.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911761-c167a800-c63e-11eb-87b2-da1ba452f404.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910220-df7adb80-c631-11eb-9992-c840ff3d8eba.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2017%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760067-a339f600-cadd-11eb-83c3-69fcba90cccb.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily deaths, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2017%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121531996-ca94a400-c9b3-11eb-9949-ffa9800acb21.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121067692-37bff380-c780-11eb-8f5d-730a5f5c6713.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934642-0aa60f00-c6b4-11eb-8770-1008e0b9e3c5.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932179-a2eac680-c6a9-11eb-9188-033704a0cc05.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911778-dd6b4980-c63e-11eb-831a-85fa3e07cef8.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910357-143b6280-c633-11eb-9159-5fe9c11dbb6a.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760081-bf3d9780-cadd-11eb-92cb-a2a62d050600.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121532262-092a5e80-c9b4-11eb-92ea-a4d245f08424.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121067867-6ccc4600-c780-11eb-8e6f-8efdaebb5cd0.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934707-5062d780-c6b4-11eb-8170-d90c609b8919.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932211-beee6800-c6a9-11eb-9ac4-0ec651412d3d.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911799-fa078180-c63e-11eb-8991-9d6a92fcf968.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910233-0f29e380-c632-11eb-93ff-18297c7e500a.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760092-d7151b80-cadd-11eb-93da-b1f9722a2ffb.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121532555-4db5fa00-c9b4-11eb-9f09-266614be7ac1.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121067942-82da0680-c780-11eb-887d-472b795bfe88.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934733-6b354c00-c6b4-11eb-8a1a-74b5d989c6c1.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932241-d9c0dc80-c6a9-11eb-9538-e517becf751f.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911821-14415f80-c63f-11eb-9c52-74746ff30357.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910263-4f896180-c632-11eb-9a38-7760e91bfed5.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760106-ef853600-cadd-11eb-8cb7-edbd08a52f8b.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily cases, 3 scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121534447-18121080-c9b6-11eb-8776-3c1f1193f6e2.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121068026-9ab18a80-c780-11eb-8c1f-4fc3b5248c78.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934800-9ddf4480-c6b4-11eb-9a98-f22886437efd.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932268-f5c47e00-c6a9-11eb-986f-9ade53f34e46.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911838-30450100-c63f-11eb-892e-cde9a38c0a9d.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910383-5bc1ee80-c633-11eb-81e0-e7c71385f7ca.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760128-075cba00-cade-11eb-9dda-0fa4cea9e7af.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121534680-4a237280-c9b6-11eb-83c1-641d4922196d.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121068106-b2890e80-c780-11eb-96de-fdac95310798.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934823-c1a28a80-c6b4-11eb-8fe6-85ac2821fed1.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932296-0f65c580-c6aa-11eb-9793-c0e4aad5de3e.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911849-4eaafc80-c63f-11eb-98d2-5acde5292074.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910409-a93e5b80-c633-11eb-9e53-0d573021634a.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760141-1e9ba780-cade-11eb-9487-b170deb352bb.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121534783-64f5e700-c9b6-11eb-8545-48403a4d73d0.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121068172-c9c7fc00-c780-11eb-8897-e63cd20324fa.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934858-e860c100-c6b4-11eb-8ce7-451e3fd1a81c.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932329-2a383a00-c6aa-11eb-8e91-6a0ab58add2c.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911862-684c4400-c63f-11eb-98b1-7d35f9e5e8b7.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910429-d5f27300-c633-11eb-8869-464539a1188c.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760171-36732b80-cade-11eb-81fe-e00796678cde.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121534927-88209680-c9b6-11eb-81a9-469145d31bd6.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121068254-e6643400-c780-11eb-8448-3d71cf07ea2d.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934879-029a9f00-c6b5-11eb-9b80-40b1fbd1fddb.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932356-420fbe00-c6aa-11eb-8d0c-dddffbedf1b6.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911874-80bc5e80-c63f-11eb-97de-4af1abd4006f.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910467-0df9b600-c634-11eb-99bb-661b4aa92d11.png)

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

**uptake 20210610**: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210610/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121760196-4db21900-cade-11eb-8e42-37c2e23d9852.png)

*

**uptake 20210605**: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210605/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121535039-a2f30b00-c9b6-11eb-8509-9dad543bd116.png)

*

**uptake 20210604**: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121068326-fed44e80-c780-11eb-9890-7e1497c32a47.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934897-1e05aa00-c6b5-11eb-883d-370b8af41c22.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

(10) [Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2084%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/122337412-277fe500-cef3-11eb-853b-6977dfec22a3.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911884-9e89c380-c63f-11eb-8f33-b3c5430397e4.png)

*

**uptake 20210521**: DELP 20210521, **_IHME 20210521_**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910495-3681b000-c634-11eb-8acc-09dc7300f285.png)

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

* All codes are copyrighted by the author under Apache License 2.0.

* See [`LICENSE`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/LICENSE)

<br/><br/>

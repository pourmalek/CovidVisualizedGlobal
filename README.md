## CovidVisualizedGlobal


### Combine and visualize international periodically updating estimates of COVID-19 at the global level 


********************************************************************************************************************************************
********************************************************************************************************************************************
* Project: Combine and visualize international periodically updating estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
********************************************************************************************************************************************
********************************************************************************************************************************************


### TOC

[I. SELCTED GRAPHS FROM LATEST UPTAKE](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/README.md#i-selcted-graphs-from-latest-update)

[II. METHODS AND RESULTS OF THIS WORK](https://github.com/pourmalek/GlobalCovidCombineVisualize#ii-methods-and-results-of-this-work)

[III. INNER WORKS OF THIS REPOSITORY](https://github.com/pourmalek/GlobalCovidCombineVisualize#iii-inner-works-of-this-repository)

[IV. SELCTED GRAPHS FROM PREVIOUS UPTAKES](https://github.com/pourmalek/GlobalCovidCombineVisualize#iv-selcted-graphs-from-previous-update)

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

(18) uptake 20210610: DELP 20210610, **IHME 20210610**, IMPE 20210604, LANL 20210606, SRIV 20210610

(17) uptake 20210605: DELP 20210603, IHME 20210604, **IMPE 20210604**, LANL 20210602, SRIV 20210604

(16) uptake 20210604: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

(15) uptake 20210603: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

(14) uptake 20210528: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

(13) uptake 20210522: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

(12) uptake 20210521: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521

(11) uptake 20210516: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

(10) uptake 20210515: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

(9) uptake 20210514: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513 

(8) uptake 20210506: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506 

(7) uptake 20210424: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424 

(6) uptake 20210422: DELP N20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

(5) uptake 20210417: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

(4) uptake 20210416: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

(3) uptake 20210409: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

(2) uptake 20210406: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406 

(1) uptake 20210401: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401 

********************************************************************************************************************************************
********************************************************************************************************************************************

## IV. SELCTED GRAPHS FROM PREVIOUS UPTAKES



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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910180-8743d980-c631-11eb-8bd2-9bfa045b2776.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057135-d09c4200-c773-11eb-9912-5e5ccd008248.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121052444-3df9a400-c76f-11eb-99dc-71c9e9771ed0.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121074342-94271100-c788-11eb-9e1b-69b414e07ebc.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121203736-30095900-c82b-11eb-8933-dadd2f02c54f.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121087925-e1f84500-c799-11eb-901a-12ae7601f4dc.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092018-c7c16580-c79f-11eb-91eb-fdf1ad890cab.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121107578-031e5d00-c7bd-11eb-8c8b-586405e0b5e1.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121113676-4a115000-c7c7-11eb-93f7-8441a4fb775b.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121104592-3827b100-c7b7-11eb-9c69-96cfd9cad30c.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121192895-36df9e00-c822-11eb-9fa7-7cc8581d6c52.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225014-f42bbf00-c83d-11eb-967e-97df19fc0e63.png)

*











****

### (2) Daily deaths, reference scenarios, with uncertainty, 2011

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910220-df7adb80-c631-11eb-9992-c840ff3d8eba.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057230-e7db2f80-c773-11eb-9185-4765c9627034.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121052580-5d90cc80-c76f-11eb-847c-38b5860ebb26.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121074839-3f37ca80-c789-11eb-8ea3-273ab6728b90.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204086-7a8ad580-c82b-11eb-8add-eb4a8b041202.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121087987-f6d4d880-c799-11eb-9537-e2414980bd66.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092075-e0318000-c79f-11eb-86a0-8c1a57cc5df0.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121107625-1af5e100-c7bd-11eb-9b22-29a9550e8629.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121113748-68774b80-c7c7-11eb-858c-007d3cd48ea0.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121104644-5392bc00-c7b7-11eb-840b-e2e8dc642f2b.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121193004-51197c00-c822-11eb-80d8-c5448d44e004.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225097-0a397f80-c83e-11eb-9632-3aaa938159bc.png)

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910357-143b6280-c633-11eb-9159-5fe9c11dbb6a.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057320-02150d80-c774-11eb-9787-bd583e9e7d0e.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121052713-7d27f500-c76f-11eb-9981-ccff7236145c.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121074932-61314d00-c789-11eb-9055-1cadee2ec553.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204188-91312c80-c82b-11eb-8b61-6775b4f7fcf1.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088060-0d7b2f80-c79a-11eb-8d00-2961bcc66787.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092145-f9d2c780-c79f-11eb-8584-695bcf05f079.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121108835-4aa5e880-c7bf-11eb-8a14-e25abd3e694d.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121113787-804ecf80-c7c7-11eb-8a14-808e3b8214e9.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121104853-bf752480-c7b7-11eb-828b-1ea225ebceeb.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121193127-6b535a00-c822-11eb-8aea-60d4ba7e7655.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225197-23423080-c83e-11eb-8287-8829129b9287.png)

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910233-0f29e380-c632-11eb-93ff-18297c7e500a.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057417-1b1dbe80-c774-11eb-998c-2922592ac5df.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121052837-9b8df080-c76f-11eb-82b4-02aec8013c10.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121074996-7a39fe00-c789-11eb-9d9b-dda79bfce4b2.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204308-a7d78380-c82b-11eb-8572-74d432c48477.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088148-27b50d80-c79a-11eb-9ff6-6acbbea767a6.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092237-140ca580-c7a0-11eb-86ff-e116b6b8b83e.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121108884-614c3f80-c7bf-11eb-8af8-c53760539e42.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121113836-978dbd00-c7c7-11eb-973a-81e427bb0420.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121104923-e0d61080-c7b7-11eb-8041-c5edfe049e13.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121193427-b0778c00-c822-11eb-9135-7d370b687ee3.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225305-3e14a500-c83e-11eb-9821-ce37e80ffda2.png)

*















****

### (5) Daily cases, reference scenarios, with uncertainty, 2021

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910263-4f896180-c632-11eb-9a38-7760e91bfed5.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057507-37b9f680-c774-11eb-97b0-d24570f58227.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121052997-c11afa00-c76f-11eb-8c7b-d106520f1f1e.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121075064-9473dc00-c789-11eb-8e1f-4579785f0712.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204506-c76eac00-c82b-11eb-996c-76109ff80612.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088213-3dc2ce00-c79a-11eb-83cc-acec0e8c9e88.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092301-2daded00-c7a0-11eb-8576-a612d7ea2cbf.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121108944-7aed8700-c7bf-11eb-8a17-a0ca67db5cd5.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121113904-b2f8c800-c7c7-11eb-91b8-f48ba30061eb.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121104962-fa775800-c7b7-11eb-889e-9b5e1f61b73e.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121193547-c8e7a680-c822-11eb-949e-45f366c8d7ed.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225386-52f13880-c83e-11eb-8393-926254bd6a34.png)

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910383-5bc1ee80-c633-11eb-81e0-e7c71385f7ca.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057634-50c2a780-c774-11eb-8780-60bc6f6257ad.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121053082-d859e780-c76f-11eb-83d5-7fa6f9af04f0.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121075127-ab1a3300-c789-11eb-9798-04c8edacda50.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204632-dd7c6c80-c82b-11eb-93c6-e824e0999d3a.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088283-592dd900-c79a-11eb-86c4-9abbcef79a91.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092382-4fa76f80-c7a0-11eb-8c7a-c75c6d5c53c4.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121109015-98225580-c7bf-11eb-9c5f-7f4d8ec325df.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121113958-cad04c00-c7c7-11eb-93ef-55fad924cabd.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121105015-14b13600-c7b8-11eb-9059-5ac0f910ab1e.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121193678-e4eb4800-c822-11eb-84ff-6b32b601431d.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225482-6a302600-c83e-11eb-8d41-7a333ef617d3.png)

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910409-a93e5b80-c633-11eb-9e53-0d573021634a.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057712-6c2db280-c774-11eb-86ba-f01d13a5bac3.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121053193-f3c4f280-c76f-11eb-9005-5aacebe2d1c2.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121075210-c422e400-c789-11eb-8d4b-07d918707ee3.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204752-f8e77780-c82b-11eb-8474-ce5ba162c721.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088343-7498e400-c79a-11eb-9df0-088c44dfd01a.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092442-68178a00-c7a0-11eb-81d0-361a981642d9.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121109067-b1c39d00-c7bf-11eb-998a-8d978015544f.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121114028-e20f3980-c7c7-11eb-99be-27148711fc55.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121105065-2abef680-c7b8-11eb-899a-1287b54dc0d3.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121193833-03514380-c823-11eb-98df-30e495f5ca4c.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225565-7fa55000-c83e-11eb-893d-81b04d2d1d62.png)

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910429-d5f27300-c633-11eb-8869-464539a1188c.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057799-85366380-c774-11eb-836d-6120989493b3.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121053289-0ccda380-c770-11eb-87f6-03dd7201df37.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121075299-dc92fe80-c789-11eb-963f-6776b24b7a45.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204881-11579200-c82c-11eb-92e8-d73a33f35af6.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088406-91351c00-c79a-11eb-96bf-e9106474e465.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092510-81203b00-c7a0-11eb-803f-64a69dc2b7bb.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121109108-c738c700-c7bf-11eb-962a-6ca571570dd4.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121114102-fc491780-c7c7-11eb-8c09-59016174b87c.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121105101-43c7a780-c7b8-11eb-99ae-5222e54bbd36.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121194245-6d69e880-c823-11eb-9b95-adf8384faf9a.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225652-964ba700-c83e-11eb-99bd-55d06eb15910.png)

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

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910467-0df9b600-c634-11eb-99bb-661b4aa92d11.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057890-9da67e00-c774-11eb-980c-55f6c45c3992.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121053380-240c9100-c770-11eb-9160-7f40c05d6186.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121075365-f46a8280-c789-11eb-90d5-9d5bda572e50.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121204988-28967f80-c82c-11eb-95f2-fab3c2c830ad.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088484-ad38bd80-c79a-11eb-94aa-1b22ce6e042b.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092564-9ac18280-c7a0-11eb-85e9-551dd7b0c338.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121109153-de77b480-c7bf-11eb-9f51-977d7ef22676.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121114166-15ea5f00-c7c8-11eb-8e71-d4be9f0dbf4a.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121105146-5e018580-c7b8-11eb-983f-75c02cf41a95.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121194378-8a9eb700-c823-11eb-8c3c-a91f724efb08.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225740-ad8a9480-c83e-11eb-9233-62f0d8b64d8e.png)

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

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210528/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120932376-5bb10580-c6aa-11eb-9a86-197e08b45498.png)

*

**uptake 20210522**: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210522/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120911884-9e89c380-c63f-11eb-8f33-b3c5430397e4.png)

*

**uptake 20210521**: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521 

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210521/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120910495-3681b000-c634-11eb-8acc-09dc7300f285.png)

*

**uptake 20210516**: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210516/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121057968-b6af2f00-c774-11eb-96f5-e046291bc6d5.png)

*

**uptake 20210515**: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210515/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121053465-40a8c900-c770-11eb-9562-c62de000504c.png)

*

**uptake 20210514**: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210514/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121075445-0cda9d00-c78a-11eb-8b59-72bc0933ff1e.png)

*

**uptake 20210506**: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210506/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121205111-3fd56d00-c82c-11eb-8e6a-e6c68e511949.png)

*

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088555-c5104180-c79a-11eb-8d86-46aef8e68f18.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092622-b3ca3380-c7a0-11eb-81f1-cd38c19ce2d4.png)

*

**uptake 20210417**: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210417/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121109204-f51e0b80-c7bf-11eb-9b84-71222157bd47.png)

*

**uptake 20210416**: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210416/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121114210-2e5a7980-c7c8-11eb-9a2c-22758526af5c.png)

*

**uptake 20210409**: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210409/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121105192-77a2cd00-c7b8-11eb-880f-bbe17db7ccb8.png)

*

**uptake 20210406**: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210406/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121194501-a43ffe80-c823-11eb-91eb-054bbf75a1db.png)

*

**uptake 20210401**: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210401/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121225826-c5621880-c83e-11eb-8890-2b853bbf718b.png)

*













****

<br/><br/>

********************************************************************************************************************************************
********************************************************************************************************************************************

* All codes are copyrighted by the author under Apache License 2.0.

* See [`LICENSE`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/LICENSE)

<br/><br/>

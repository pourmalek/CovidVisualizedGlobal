## CovidVisualizedGlobal


## Combine and visualize international periodically updating estimates of COVID-19 at the global level 


********************************************************************************************************************************************
********************************************************************************************************************************************
* Project: Combine and visualize international periodically updating estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14
********************************************************************************************************************************************
********************************************************************************************************************************************


### TOC

[I. SELCTED GRAPHS FROM LATEST UPDATE](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/README.md#i-selcted-graphs-from-latest-update)

[II. METHODS AND RESULTS OF THIS WORK](https://github.com/pourmalek/GlobalCovidCombineVisualize#ii-methods-and-results-of-this-work)

[III. INNER WORKS OF THIS REPOSITORY](https://github.com/pourmalek/GlobalCovidCombineVisualize#iii-inner-works-of-this-repository)

[IV. SELCTED GRAPHS FROM PREVIOUS UPDATES](https://github.com/pourmalek/GlobalCovidCombineVisualize#iv-selcted-graphs-from-previous-update)

********************************************************************************************************************************************

### Contents


********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************
********************************************************************************************************************************************

## I. SELCTED GRAPHS 

********************************************************************************************************************************************
********************************************************************************************************************************************

### Daily deaths, reference scenarios, all time

***



********************************************************************************************************************************************
********************************************************************************************************************************************

### Daily cases, reference scenarios, with uncertainty, 2021

***


********************************************************************************************************************************************
********************************************************************************************************************************************

### Hospital-related outcomes, all time

***

********************************************************************************************************************************************
********************************************************************************************************************************************

### Daily deaths estimated to reported, reference scenarios, 2021

***



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

(1) The search for target studies is not performed in a replicable method. A systematic review might reveal more target studies that meet the eligibility criteria. (2) Software codes use a propriety software package. Use of  R or Phyton are preferable in terms of user accessibility. Even a R package might be produced for this purpose. (3) Checking and performing updates in this repository are not automated. Use of Phyton, for instance, can make the process automated. (4) Communication of results on GitHub covers a relatively limited proportion of audience. Alternative communication venues and strategies can broaden the outreach to the audience.   
I am willing for suggestions, collaboration, and help regarding overcoming the above-mentioned, and other limitations of this work. Please e-mail me (pourmalek_farshad@yahoo.com)
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

********************************************************************************************************************************************
********************************************************************************************************************************************

## IV. SELCTED GRAPHS FROM PREVIOUS UPDATE



****

### (1) Daily deaths, reference scenarios, all time

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945551-4bbb1500-c6ee-11eb-9d7c-a1d8f0a87e8d.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934581-aedb8600-c6b3-11eb-8082-1d26b01d4465.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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







****

### (2) Daily deaths, reference scenarios, with uncertainty, 2011

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945576-6ee5c480-c6ee-11eb-86b8-8635d163ad66.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934609-da5e7080-c6b3-11eb-9275-73767758268b.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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






****

### (3) Daily deaths, 3 scenarios, 2011

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945600-87ee7580-c6ee-11eb-9601-2a58ac541dfb.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934642-0aa60f00-c6b4-11eb-8770-1008e0b9e3c5.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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





****

### (4) Daily cases, reference scenarios, all time

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945634-a2285380-c6ee-11eb-8d3c-f5609b866f37.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934707-5062d780-c6b4-11eb-8170-d90c609b8919.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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









****

### (5) Daily cases, reference scenarios, with uncertainty, 2021

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945661-ba986e00-c6ee-11eb-8582-4003c2aa1437.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934733-6b354c00-c6b4-11eb-8a1a-74b5d989c6c1.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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





****

### (6) Daily cases, 3 scenarios, 2011

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945681-d3a11f00-c6ee-11eb-9a6c-5536e7328426.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934800-9ddf4480-c6b4-11eb-9a98-f22886437efd.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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







****

### (7) Hospital-related outcomes, all time

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945707-eca9d000-c6ee-11eb-8d1a-4d28365cdb96.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934823-c1a28a80-c6b4-11eb-8fe6-85ac2821fed1.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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









****

### (8) Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945743-064b1780-c6ef-11eb-8970-0f5b4679e75b.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934858-e860c100-c6b4-11eb-8ce7-451e3fd1a81c.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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





****

### (9) Daily deaths estimated to reported, reference scenarios, 2021

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945763-1d8a0500-c6ef-11eb-8bed-ca4fafbf71a1.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934879-029a9f00-c6b5-11eb-9b80-40b1fbd1fddb.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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





****

### (10) Daily cases estimated to reported, reference scenarios, 2021

*

**uptake 20210604**: DELP 20210603, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604, UCLA 20210507

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210604/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120945789-35fa1f80-c6ef-11eb-8a9d-00914efd587a.png)

*

**uptake 20210603**: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603, UCLA 20210507

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210603/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/120934897-1e05aa00-c6b5-11eb-883d-370b8af41c22.png)

*

**uptake 20210528**: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528, UCLA 20210507

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

****

<br/><br/>

********************************************************************************************************************************************
********************************************************************************************************************************************

* All codes are copyrighted by the author under Apache License 2.0.

* See [`LICENSE`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/LICENSE)

<br/><br/>

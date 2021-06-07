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



### uptakes in this repository 

**bold fonts** show the uptake was triggered by IHME or IMPE. 


uptake 20210604: DELP 20210604, **IHME 20210604**, IMPE 20210527, LANL 20210602, SRIV 20210604

uptake 20210603: DELP 20210602, IHME 20210528, **IMPE 20210527**, LANL 20210526, SRIV 20210603

uptake 20210528: DELP 20210528, **IHME 20210528**, IMPE 20210522, LANL 20210526, SRIV 20210528

uptake 20210522: DELP 20210522, IHME 20210521, **IMPE 20210522**, LANL 20210519, SRIV 20210522

uptake 20210521: DELP 20210521, **IHME 20210521**, IMPE 20210516, LANL 20210519, SRIV 20210521

uptake 20210516: DELP 20210516, IHME 20210514, **IMPE 20210516**, LANL 20210516, SRIV 20210516

uptake 20210515: DELP 20210515, IHME 20210514, **IMPE 20210510**, LANL 20210512, SRIV 20210513


.


uptake 20210514: DELP 20210514, **IHME 20210514**, IMPE 20210424, LANL 20210512, SRIV 20210513 

uptake 20210506: DELP 20210506, **IHME 20210506**, IMPE 20210424, LANL 20210505, SRIV 20210506 

uptake 20210424: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424 

uptake 20210422: DELP N20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

uptake 20210417: DELP 20210417, IHME 20210416, **IMPE 20210417**, LANL 20210414, SRIV 20210417

uptake 20210416: DELP 20210416, **IHME 20210416**, IMPE 20210406, LANL 20210414, SRIV 20210416

uptake 20210409: DELP 20210409, **IHME 20210409**, IMPE 20210406, LANL 20210407, SRIV 20210409

uptake 20210406: DELP 20210406, IHME 20210401, **IMPE 20210406**, LANL 20210404, SRIV 20210406 

uptake 20210401: DELP 20210401, **IHME 20210401**, IMPE 20210329, LANL 20210331, SRIV 20210401 

********************************************************************************************************************************************
********************************************************************************************************************************************

## IV. SELCTED GRAPHS FROM PREVIOUS UPDATE



****

### (1) Daily deaths, reference scenarios, all time

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121087925-e1f84500-c799-11eb-901a-12ae7601f4dc.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%20all%20time%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092018-c7c16580-c79f-11eb-91eb-fdf1ad890cab.png)

*





****

### (2) Daily deaths, reference scenarios, with uncertainty, 2011

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121087987-f6d4d880-c799-11eb-9537-e2414980bd66.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths, reference scenarios, with uncertainty, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2016%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092075-e0318000-c79f-11eb-86a0-8c1a57cc5df0.png)

*























****

### (3) Daily deaths, 3 scenarios, 2011

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088060-0d7b2f80-c79a-11eb-8d00-2961bcc66787.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2018%20COVID-19%20daily%20deaths%2C%20global%2C%203%20scenarios%2C%202021%2C%20without%20JOHN.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092145-f9d2c780-c79f-11eb-8584-695bcf05f079.png)

*






















****

### (4) Daily cases, reference scenarios, all time

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088148-27b50d80-c79a-11eb-9ff6-6acbbea767a6.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases, reference scenarios, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2031%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092237-140ca580-c7a0-11eb-86ff-e116b6b8b83e.png)

*























****

### (5) Daily cases, reference scenarios, with uncertainty, 2021

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088213-3dc2ce00-c79a-11eb-83cc-acec0e8c9e88.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases, reference scenarios, with uncertainty, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2033%20COVID-19%20daily%20cases%2C%20global%2C%20reference%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092301-2daded00-c7a0-11eb-8576-a612d7ea2cbf.png)

*























****

### (6) Daily cases, 3 scenarios, 2011

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088283-592dd900-c79a-11eb-86c4-9abbcef79a91.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases, 3 scenarios, 2011](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2034%20COVID-19%20daily%20cases%2C%20global%2C%203%20scenarios%2C%202021%2C%20uncertainty.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092382-4fa76f80-c7a0-11eb-8c7a-c75c6d5c53c4.png)

*

























****

### (7) Hospital-related outcomes, all time

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088343-7498e400-c79a-11eb-9df0-088c44dfd01a.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Hospital-related outcomes, all time](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092442-68178a00-c7a0-11eb-81d0-361a981642d9.png)

*














****

### (8) Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088406-91351c00-c79a-11eb-96bf-e9106474e465.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Hospital-related outcomes, 2021, without IHME Bed need and IMPE Hospital demand](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2072%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092510-81203b00-c7a0-11eb-803f-64a69dc2b7bb.png)

*














****

### (9) Daily deaths estimated to reported, reference scenarios, 2021

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088484-ad38bd80-c79a-11eb-94aa-1b22ce6e042b.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily deaths estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092564-9ac18280-c7a0-11eb-85e9-551dd7b0c338.png)

*














****

### (10) Daily cases estimated to reported, reference scenarios, 2021

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

**uptake 20210424**: DELP 20210424, IHME 20210422, **IMPE 20210424**, LANL 20210421, SRIV 20210424

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210424/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121088555-c5104180-c79a-11eb-8d86-46aef8e68f18.png)

*

**uptake 20210422**: DELP 20210422, **IHME 20210422**, IMPE 2010417, LANL 20210421, SRIV 20210422

[Daily cases estimated to reported, reference scenarios, 2021](https://github.com/pourmalek/CovidVisualizedGlobal/blob/main/20210422/output/merge/graph%2093%20COVID-19%20daily%20cases%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021.pdf)

![image](https://user-images.githubusercontent.com/30849720/121092622-b3ca3380-c7a0-11eb-81f1-cd38c19ce2d4.png)

*




















****

<br/><br/>

********************************************************************************************************************************************
********************************************************************************************************************************************

* All codes are copyrighted by the author under Apache License 2.0.

* See [`LICENSE`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/LICENSE)

<br/><br/>

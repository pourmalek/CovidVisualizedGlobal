## GlobalCovidCombineVisualize

### Combine and visualize international periodically updating estimates of COVID-19 at the global level 


********************************************************************************************************************************************
* Project: Combine and visualize international periodically updating estimates of COVID-19 at the global level (GlobalCovidCombineVisualize)
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14
********************************************************************************************************************************************

### TOC

I. SELCTED GRAPHS FROM LATEST UPDATE

II. METHODS AND RESULTS OF THIS WORK

III. INNER WORKS OF THIS REPOSITORY 

IV. SELCTED GRAPHS FROM PREVIOUS UPDATE

********************************************************************************************************************************************

### Contents


********************************************************************************************************************************************
********************************************************************************************************************************************

## I. SELCTED GRAPHS FROM LATEST UPDATE

### update 20210428

*
[COVID-19 daily deaths, Global, reference scenarios](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210428/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601081-e4d06200-a8de-11eb-997e-5f9d4f0ebe3e.png)


*
[COVID-19 daily deaths, global, reference scenarios, after 2021-01-01](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210428/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601258-26f9a380-a8df-11eb-83c7-2f7b924ffcbb.png)

* 
[COVID-19 daily active cases, global](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210428/output/merge/graph%2061%20COVID-19%20daily%20active%20cases.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601405-54dee800-a8df-11eb-861c-dab802964208.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210428/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601531-78099780-a8df-11eb-8a75-68e53678520a.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios, after 2020-12-01, without IHME Bed need, IMPE Hosp demand](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210428/output/merge/graph%2073%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601654-9374a280-a8df-11eb-9001-0877be166612.png)

*

[COVID-19 daily deaths estimated to reported, global, reference scenarios](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210428/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601776-b606bb80-a8df-11eb-88ca-467fb0328db7.png)

*

********************************************************************************************************************************************
********************************************************************************************************************************************


## II. METHODS AND RESULTS OF THIS WORK


SUMMARY

Five international and periodically updating models of COVID-19 pandemic are identified and the results of their estimates are gathered, combined, and graphs for the progression of the pandemic at the global level. Periodical releases of these studies’ estimates undergo processing and visualization in this repository. A longitudinal visualization component is also present.  


BACKGROUND

The idea put to work here is to combine and visualize international periodically updating studies / models of COVID-19 pandemic, for the global level. The end result being sharable codes and outputs, for estimates files and graphs, for individual studies, and for combination of them, and repeat the process periodically. 


METHODS

Eligibility for target (component) studies (models) of COVID-19 pandemic, are set as those that (1) provide estimates for at least one of the four outcomes of interests, i.e., daily deaths, daily incident cases, cumulative (total) deaths, and cumulative (total) incident cases, (2) at the global level, (3) as sum of estimates at the country level, (4) periodically updating into 2021, (5) provide a list of input data and their sources, and (6) provide explanation on methods of using input data and generation of model outputs. 

Target studies were found via hand search using google. After “Additional file 1 of Rapid review of COVID-19 epidemic estimation studies for Iran”, Page 39, [here](https://s3-eu-west-1.amazonaws.com/pstorage-npg-968563215/26271814/12889_2021_10183_MOESM1_ESM.docx)

Methods generally follow, with alterations, this article: Pourmalek F, Rezaei Hemami M, Janani L, Moradi-Lakeh M. Rapid review of COVID-19 epidemic estimation studies for Iran. BMC Public Health. 2021 Feb 1;21(1):257. doi: 10.1186/s12889-021-10183-3. https://bmcpublichealth.biomedcentral.com/articles/10.1186/s12889-021-10183-3


RESULTS

RESULTS, (A) Studies:

Five studies (models) meeting the eligibility criteria: DELP, IHME, IMPE, LANL, SRIV, details below. Results of estimates for each study are stored in Stata data files and graphs. Results for combination of all five studies’ estimates are also are stored in data files and combined graphs. 

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


RESULTS, (B) Periodical updates of component studies:  

Periodical updates of component studies are performed here according to release of new estimates updates by the two studies with less frequent estimates updates releases, i.e., IHME and IMPE. LANL updates every 3-4 days, SRIV every day, and DELP updates frequency is not discoverable to me. With each update release by IHME or IMPE, the whole set of five studies’ estimates updates are processed (updated here) and the results are stored in a directory named after the calendar date on which update was performed. 


RESULTS, (C) Longitudinal visualization of component studies’ estimates updates:

Within each study, estimates for any given person-place-time unit – that is any specific outcome (e.g., daily deaths), any given location (e.g., the global level), and given calendar time period (e.g., May 2021) – might vary (in terms of height and trajectory of outcome estimates), across consecutive releases of updated estimates. Analysis of such variations should – based on my understanding – reflect that the largest proportion of variance originates from the use of new data input to the model. This is true across all-time variations. Other sources of variation include input of new data types to the model, and less frequently, major and minor updates in the modeling process, that are known as “model version”, and are quite distinct from “model estimates updates”. Based on such variation of model estimates updates for any given person-place-time unit, looking at the estimates of the same person-place-time unit across consecutive model estimates updates of any given model might be expected to provide additional insight about how model estimates evolve along with progression of the pandemic. This leads to longitudinal view of component studies’ estimates updates: e.g., look at IHME estimates for daily global deaths for May 2021 across consecutive IHME estimates releases. Timing of longitudinal visualization is set for the end of each calendar month, to minimize the role of calendar time as source of the above-described variation. 

  
LIMITATIONS

(1) The search for target studies is not performed in a replicable method. A systematic review might reveal more target studies that meet the eligibility criteria. (2) Software codes use a propriety software package. Use of  R or Phyton are preferable in terms of user accessibility. Even a R package might be produced for this purpose. (3) Checking and performing updates in this repository are not automated. Use of Phyton, for instance, can make the process automated. (4) Communication of results on GitHub covers a relatively limited proportion of audience. Alternative communication venues and strategies can broaden the outreach to the audience. 
I am willing for suggestions, collaboration, and help regarding overcoming the above-mentioned, and other limitations of this work. Please e-mail me (pourmalek_farshad@yahoo.com)


FUTURE DIRECTIONS AND COLLABOATIONS 

The idea of this work originated from looking at estimates for COVID-19 epidemic in one location, Iran, in repository covir2. Then I thought about creating a template that can be used for any location and its sub-locations – from global level, to regional (e.g., continents, WHO regions, GBD regions, etc.), national, and subnational levels (where available). Also thought about a visualization hub, that creates (combined results and) graphs for all locations for which COVID-19 estimates are available via the international periodically updating models. For writing the code, I lack the knowledge and experience with Python to do the job. I am looking for suggestions, collaboration, and help; please e-mail me (pourmalek_farshad@yahoo.com)


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


### update 20210414

*
[COVID-19 daily deaths, Global, reference scenarios](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210414/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/116565488-c8bac980-a8ba-11eb-80a8-7d4496ed217c.png)

*
[COVID-19 daily deaths, global, reference scenarios, after 2021-01-01](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210414/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574073-3b7b7300-a8c2-11eb-9800-d7180c3e6f58.png)

* [COVID-19 daily active cases, global](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210414/output/merge/graph%2061%20COVID-19%20daily%20active%20cases.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574409-885f4980-a8c2-11eb-9561-785adab428ba.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210414/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574621-c3617d00-a8c2-11eb-80bb-fe9064b501ff.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios, after 2020-12-01, without IHME Bed need, IMPE Hosp demand](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210414/output/merge/graph%2073%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574950-11768080-a8c3-11eb-8b7f-1e94a31ec1e7.png)

*

[COVID-19 daily deaths estimated to reported, global, reference scenarios](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/20210414/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116581330-10e0e880-a8c9-11eb-904e-9edadf98b072.png)

*
<br/><br/>

********************************************************************************************************************************************
********************************************************************************************************************************************

* All codes are copyrighted by the author under Apache License 2.0.

* See [`LICENSE`](https://github.com/pourmalek/GlobalCovidCombineVisualize/blob/main/LICENSE)

<br/><br/>

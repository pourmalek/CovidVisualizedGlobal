## globalcovid
## Rapid review of international estimates of global COVID-19

********************************************************************************************************************************************
* Project: Rapid review of international estimates of global COVID-19
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14
* **OBJECTIVE** of these `Stata` codes: Get and prepare component studies' estimates for global level, graph estimates
*
* This review follows the methods described in Pourmalek F, Rezaei Hemami M, Janani L, Moradi-Lakeh M. Rapid review of COVID-19 epidemic estimation studies for Iran. BMC Public Health. 2021 Feb 1;21(1):257. doi: 10.1186/s12889-021-10183-3. https://bmcpublichealth.biomedcentral.com/articles/10.1186/s12889-021-10183-3
* Codes and configuration follow the prototype codes in [`covir2`](https://github.com/pourmalek/covir2) COVID-19 Iran Review No 2 https://github.com/pourmalek/covir2
********************************************************************************************************************************************

### Summary

The Stata _codes_ can be executed on local machines:

Run in Stata "Users|local-user-name|Downloads|globalcovid-main|20210428|code|master|do globalcovid master.do" on local machine after the directory |globalcovid-main| is downloaded into and is located in the root of |Downloads| folder of your local machine, for update 20210428; and later instances of 202YMMDD for later updates.

Preproduced _outputs_ are stored for each update, e.g., [`20210428`](https://github.com/pourmalek/globalcovid/tree/main/20210428), in folder [`output`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output), for each component study, i.e. [`DELP`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/DELP), [`IHME`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/IHME), [`IMPE`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/IMPE), [`LANL`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/LANL), and [`SRIV`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/SRIV), plus [`JOHN`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/JOHN) as benchmark. Combined results stored in [`merge`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/merge). 

[`longitudinal`](https://github.com/pourmalek/globalcovid/tree/main/longitudinal) assessment of models will be added later. 

Selected _graphs_ are shown below. 

_Component studies and their scenarios_ are mentioned below after the selected _graphs_.

[`_Variable name structure_`](https://github.com/pourmalek/globalcovid/blob/main/Variable%20name%20structure.md)

********************************************************************************************************************************************


## Selected graphs from update 20210428

*
[COVID-19 daily deaths, Global, reference scenarios](https://github.com/pourmalek/globalcovid/blob/main/20210428/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601081-e4d06200-a8de-11eb-997e-5f9d4f0ebe3e.png)


*
[COVID-19 daily deaths, global, reference scenarios, after 2021-01-01](https://github.com/pourmalek/globalcovid/blob/main/20210428/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601258-26f9a380-a8df-11eb-83c7-2f7b924ffcbb.png)

* 
[COVID-19 daily active cases, global](https://github.com/pourmalek/globalcovid/blob/main/20210428/output/merge/graph%2061%20COVID-19%20daily%20active%20cases.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601405-54dee800-a8df-11eb-861c-dab802964208.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios](https://github.com/pourmalek/globalcovid/blob/main/20210428/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601531-78099780-a8df-11eb-8a75-68e53678520a.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios, after 2020-12-01, without IHME Bed need, IMPE Hosp demand](https://github.com/pourmalek/globalcovid/blob/main/20210428/output/merge/graph%2073%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601654-9374a280-a8df-11eb-9001-0877be166612.png)

*

[COVID-19 daily deaths estimated to reported, global, reference scenarios](https://github.com/pourmalek/globalcovid/blob/main/20210428/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116601776-b606bb80-a8df-11eb-88ca-467fb0328db7.png)

*


********************************************************************************************************************************************

## Selected graphs from update 20210414

*
[COVID-19 daily deaths, Global, reference scenarios](https://github.com/pourmalek/globalcovid/blob/main/20210414/output/merge/graph%2011%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios.pdf)

![image](https://user-images.githubusercontent.com/30849720/116565488-c8bac980-a8ba-11eb-80a8-7d4496ed217c.png)

*
[COVID-19 daily deaths, global, reference scenarios, after 2021-01-01](https://github.com/pourmalek/globalcovid/blob/main/20210414/output/merge/graph%2012%20COVID-19%20daily%20deaths%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574073-3b7b7300-a8c2-11eb-9800-d7180c3e6f58.png)

* [COVID-19 daily active cases, global](https://github.com/pourmalek/globalcovid/blob/main/20210414/output/merge/graph%2061%20COVID-19%20daily%20active%20cases.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574409-885f4980-a8c2-11eb-9561-785adab428ba.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios](https://github.com/pourmalek/globalcovid/blob/main/20210414/output/merge/graph%2071%20COVID-19%20hospital-related%20outcomes.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574621-c3617d00-a8c2-11eb-80bb-fe9064b501ff.png)

*
[COVID-19 daily hospital-related outcomes global, median scenarios, after 2020-12-01, without IHME Bed need, IMPE Hosp demand](https://github.com/pourmalek/globalcovid/blob/main/20210414/output/merge/graph%2073%20COVID-19%20hospital-related%20outcomes%2C%20wo%20extremes%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116574950-11768080-a8c3-11eb-8b7f-1e94a31ec1e7.png)

*

[COVID-19 daily deaths estimated to reported, global, reference scenarios](https://github.com/pourmalek/globalcovid/blob/main/20210414/output/merge/graph%2092%20COVID-19%20daily%20deaths%20estimated%20to%20reported%2C%20global%2C%20reference%20scenarios%2C%202021-01-01%20on.pdf)

![image](https://user-images.githubusercontent.com/30849720/116581330-10e0e880-a8c9-11eb-904e-9edadf98b072.png)

*
<br/><br/>

********************************************************************************************************************************************

### Component studies

#### A00 JOHN
Benchmark for comparison.

Johns Hopkins University. Coronavirus resource center. https://coronavirus.jhu.edu/map.html 

Research article: Dong E, Du H, Gardner L. An interactive web-based dashboard to track COVID-19 in real time. Lancet Infect Dis. 2020 May;20(5):533-534. doi: 10.1016/S1473-3099(20)30120-1. Epub 2020 Feb 19. https://www.thelancet.com/journals/laninf/article/PIIS1473-3099(20)30120-1/fulltext

Data site: https://github.com/CSSEGISandData/COVID-19/tree/master/csse_covid_19_data/csse_covid_19_time_series
<br/><br/>

#### A01 DELP
COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology https://www.covidanalytics.io/projections

Main manuscript, pre-print: https://www.medrxiv.org/content/10.1101/2020.06.23.20138693v1

Data site: https://www.covidanalytics.io/projections
<br/><br/>

#### A02 IHME
Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid

Main article: IHME COVID-19 Forecasting Team. Modeling COVID-19 scenarios for the United States. Nat Med. 2021 Jan;27(1):94-105. doi: 10.1038/s41591-020-1132-9. Epub 2020 Oct 23. https://www.nature.com/articles/s41591-020-1132-9

Data site: http://www.healthdata.org/covid/data-downloads
<br/><br/>

#### A03 IMPE
MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports

Main article: Walker PGT, Whittaker C, Watson OJ, Baguelin M, Winskill P, et al. The impact of COVID-19 and strategies for mitigation and suppression in low- and middle-income countries. Science. 2020 Jul 24;369(6502):413-422. doi: 10.1126/science.abc0035. Epub 2020 Jun 12. https://science.sciencemag.org/content/369/6502/413

Data site: https://github.com/mrc-ide/global-lmic-reports/tree/master/data
<br/><br/>

#### A04 LANL
Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org

Main document: Castro L,  Fairchild G, Michaud I, Osthus D. COFFEE: COVID-19 Forecasts using Fast Evaluations and Estimation.
https://covid-19.bsvgateway.org/static/COFFEE-methodology.pdf

Data site: https://covid-19.bsvgateway.org
<br/><br/>

#### A05 SRIV
University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19
<br/><br/>

Main manuscript, pre-print:Srivastava A, Xu T, Prasanna VK. Fast and Accurate Forecasting of COVID-19 Deaths Using the SIkJα Model. arXiv pre-print. Submitted on 10 Jul 2020 (v1), last revised 13 Jul 2020 (this version, v2). https://arxiv.org/abs/2007.05180

Data site: https://github.com/scc-usc/ReCOVER-COVID-19/tree/master/results/historical_forecasts


********************************************************************************************************************************************

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


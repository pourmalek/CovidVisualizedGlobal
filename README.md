# globalcovid
# Rapid review of international estimates of global COVID-19

********************************************************************************************************************************************
* Project: Rapid review of international estimates of global COVID-19
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14
* **OBJECTIVE** of these `Stata` codes: Get and prepare component studies' estimates for global level, graph estimates
********************************************************************************************************************************************

The Stata _codes_ can be executed on local machines:

Run in Stata "Users|local-user-name|Downloads|globalcovid-main|20210428|code|master|do globalcovid master.do" on local machine after the directory |globalcovid-main| is downloaded into and is located in the root of |Downloads| folder of your local machine, for update 20210428; and later instances of 202YMMDD for later updates.

Preproduced _outputs_ are stored for each update, e.g., [`20210428`](https://github.com/pourmalek/globalcovid/tree/main/20210428), in folder [`output`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output), for each component study, i.e. [`DELP`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/DELP), [`IHME`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/IHME), [`IMPE`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/IMPE), [`LANL`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/LANL), and [`SRIV`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/SRIV), plus [`JOHN`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/JOHN) as benchmark. Combined results stored in [`merge`](https://github.com/pourmalek/globalcovid/tree/main/20210428/output/merge). 

[`longitudinal`](https://github.com/pourmalek/globalcovid/tree/main/longitudinal) assessment of models will be added later. 

Selected _graphs_ are showb below. 

********************************************************************************************************************************************

### Component studies

**A01 DELP** 
COVID Analytics. DELPHI epidemiological case predictions. Cambridge: Operations Research Center, Massachusetts Institute of Technology https://www.covidanalytics.io/projections
Main manuscript, pre-print: https://www.medrxiv.org/content/10.1101/2020.06.23.20138693v1
<br/><br/>

**A02 IHME** 
Institute for Health Metrics and Evaluation (IHME). COVID-19 mortality, infection, testing, hospital resource use, and social distancing projections. Seattle: Institute for Health Metrics and Evaluation (IHME), University of Washington. http://www.healthdata.org/covid
Main manuscript
<br/><br/>

**A03 IMPE** 
MRC Centre for Global Infectious Disease Analysis (MRC GIDA). Future scenarios of the healthcare burden of COVID-19 in low- or middle-income countries. London: MRC Centre for Global Infectious Disease Analysis, Imperial College London. https://mrc-ide.github.io/global-lmic-reports
<br/><br/>
**A04 LANL** 
Los Alamos National Laboratory (LANL). COVID-19 cases and deaths forecasts. Los Alamos: Los Alamos National Laboratory (LANL). https://covid-19.bsvgateway.org
<br/><br/>
**A05 SRIV**
University of Southern California (USC). COVID-19 forecast. Los Angeles: University of Southern California. https://scc-usc.github.io/ReCOVER-COVID-19
<br/><br/>

* **A00 JOHN**
Johns Hopkins University. Coronavirus resource center. https://coronavirus.jhu.edu/map.html 

Benchmark for comparison.


### Scenario number within component study


[Names within brackets assigned by this review study.]

* **A00 JOHN**
* S00 = [Not Applicable]
<br/><br/>
* **A01 DELP** 
* S00 = [Single scenario]
<br/><br/>
* **A02 IHME** 
* S01 = Reference scenario [Status Quo] 
* S02 = Best scenario (Universal masks) [Best]
* S03 = Worse scenario (Mandates easing) [Worst] 
<br/><br/>
* **A03 IMPE** 
* S01 = Additional 50% Reduction [Best]	
* S02 = Current level of interventions [Reference] 			
* S03 = Relax Interventions 50% [Worst]
* S04 = Surged Additional 50% Reduction [Best, Surged]
* S05 = Surged Maintain Status Quo [Reference, Surged] 	
* S06 = Surged Relax Interventions 50% [Worst, Surged]	
<br/><br/>
* **A04 LANL** 
* S00 = [Single scenario]
<br/><br/>
* **A05 SRIV**
* S00 = [current]
<br/><br/>

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


clear all

cd "$pathCovidVisualizedGlobal"

cd IMPE

 



***************************************************************************
* This is "do CovidVisualizedGlobal IMPE.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************



do "do CovidVisualizedGlobal IMPE 1.do"
* download and prepare estiamtes files


do "do CovidVisualizedGlobal IMPE 2.do"
* merge files




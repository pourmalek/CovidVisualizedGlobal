
clear all

cd "$pathCovidVisualizedGlobal"

cd IHME





***************************************************************************
* This is "do CovidVisualizedGlobal IHME.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************



do "do CovidVisualizedGlobal IHME 1.do" 
* download and prepare estimates files


do "do CovidVisualizedGlobal IHME 2.do" 
* continue preparation









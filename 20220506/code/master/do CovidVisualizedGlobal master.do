
***************************************************************************
* This is "do CovidVisualizedGlobal master.do"
                                                                                                          *******************
* Project: Combine and visualize international periodically updating                                      * uptake 20220506 *
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)                                       *******************
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


                                                                                                         ***************************
* To change uptake date, find and replace all, 20220506 (old), with 20220506 (new) <<--           <<<--- * change uptake date here *
*                                           1/ --------                                                  ***************************

***************************************

* set epoch for marking forecasts with ||||||||||

global DELPepoch 06May2022 // update release date
*            2/ ----------

global IHMEepoch 01Apr2022 // as per https://covid19.healthdata.org/global?view=daily-deaths&tab=trend
*            3/ ----------

global SRIVepoch 06May2022 // update release date																		 
*            4/ ----------


* To change uptake date in individual do files for models, change the following dates:

global DELPdate 20220506
*            5/ --------

global IHMEdate 2022-04-08
*            6/ --------

global SRIVdate 2022-05-06
*            7/ ----------



****************************************

* setup Stata path by operating system 

set more off 

set mem 1000m // for older versions of Stata

clear all

dis "`c(username)'"

local usrnam = "`c(username)'"

di "`usrnam'"

****** set path based on local operating system ******

if regexm(c(os),"Mac") == 1 {
	global pathCovidVisualizedGlobal "/Users/`usrnam'/Downloads/CovidVisualizedGlobal-main/20220506/code/" 
}
else if regexm(c(os),"Windows") {
	global pathCovidVisualizedGlobal = "C:\Users\\`usrnam'\Downloads\CovidVisualizedGlobal-main\20220506\code\"
}
*


cd "$pathCovidVisualizedGlobal"
 
cd master





* preserve native scheme (of the local machine; will be eventually restored at the end of "do CovidVisualizedGlobal merge.do")

di c(scheme)

global nativescheme `c(scheme)'

di "$nativescheme"



* get grstyle for graphs and its dependencies

ssc install grstyle, replace
ssc install palettes, replace
ssc install colrspace, replace

grstyle init
set scheme _GRSTYLE_ 
grstyle color background white




/* 

List of component studies:

JOHN
DELP
IHME
IMPE * discontinued
LANL * discontinued
SRIV
*/




* runs the do files for each study and merge them. 

* IF the target server for a given study is temp down, the respective line can be commented out. Edits would then be needed in merge.do, however. 


do "$pathCovidVisualizedGlobal/JOHN/do CovidVisualizedGlobal JOHN.do" 

do "$pathCovidVisualizedGlobal/DELP/do CovidVisualizedGlobal DELP.do" 

do "$pathCovidVisualizedGlobal/IHME/do CovidVisualizedGlobal IHME.do" 

// do "$pathCovidVisualizedGlobal/IMPE/do CovidVisualizedGlobal IMPE.do" // The latest / last available update of the IMPE model was for 2022-01-31. 

// do "$pathCovidVisualizedGlobal/LANL/do CovidVisualizedGlobal LANL.do" // The LANL COVID-19 Team made its last real-time forecast on September 27th, 2021. [for 20210926]. This is more than two weeks old and will not be used. 

do "$pathCovidVisualizedGlobal/SRIV/do CovidVisualizedGlobal SRIV.do" 

do "$pathCovidVisualizedGlobal/merge/do CovidVisualizedGlobal merge.do" 










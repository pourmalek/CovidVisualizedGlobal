
***************************************************************************
* This is "do CovidVisualizedGlobal master.do"
                                                                                                          *******************
* Project: Combine and visualize international periodically updating                                      * uptake 20220429 *
* estimates of COVID-19 at the global level (CovidVisualizedGlobal)                                       *******************
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


                                                                                                         ***************************
* To change uptake date, find and replace all, 20220429 (old), with 20220429 (new) <<--           <<<--- * change uptake date here *
*                                           1/ --------                                                  ***************************

* To change uptake date in individual do files for models, change the following dates:

global DELPdate 20220429
*            2/ --------

global IHMEdate 20220322
*            3/ --------

global IMPEdate 2022-01-31_v9 
*            4/ -------------

global SRIVdate 2022-04-29
*            5/ ----------


/* 

This file "do CovidVisualizedGlobal master.do" was set up to be run from:
  |Users|local-user-name|Downloads|CovidVisualizedGlobal-main|202YMMDD|code|master|do CovidVisualizedGlobal master.do
  where 2021MMDD is the udpate date, e.g. update 20220429

If the first run does not go thru due to directory path clash, edit the contents within " " of the line _59_ or _62_ below, located beneath ****** set path based on local operating system ****** ,,, 
,,, to reflect the location of directory /CovidVisualizedGlobal-main/ or \CovidVisualizedGlobal-main\ on your local machine. Path should be:


global pathCovidVisualizedGlobal "/Users/`usrnam'/Downloads/CovidVisualizedGlobal-main/202YMMDD/code/" [for Mac]

global pathCovidVisualizedGlobal = "C:\Users\\`usrnam'\Downloads\CovidVisualizedGlobal-main\202YMMDD\code\" [for Windows]



It can be moved to and run from anywhere else as far as path requirements are adjusted. 

This code was developed and run using Stata SE 14.2 on MacOS Big Sur 11.2.2 (also ran on same flavour of Stata on Windows 10).

*/



* setup Stata path by operating system 

set more off 

set mem 1000m // for older versions of Stata

clear all

dis "`c(username)'"

local usrnam = "`c(username)'"

di "`usrnam'"

****** set path based on local operating system ******

if regexm(c(os),"Mac") == 1 {
	global pathCovidVisualizedGlobal "/Users/`usrnam'/Downloads/CovidVisualizedGlobal-main/20220429/code/" 
}
else if regexm(c(os),"Windows") {
	global pathCovidVisualizedGlobal = "C:\Users\\`usrnam'\Downloads\CovidVisualizedGlobal-main\20220429\code\"
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
IMPE
LANL * 
SRIV
*/




* runs the do files for each study and merge them. 

* IF the target server for a given study is temp down, the respective line can be commented out. Edits would then be needed in merge.do, however. 


do "$pathCovidVisualizedGlobal/JOHN/do CovidVisualizedGlobal JOHN.do" 

do "$pathCovidVisualizedGlobal/DELP/do CovidVisualizedGlobal DELP.do" 

do "$pathCovidVisualizedGlobal/IHME/do CovidVisualizedGlobal IHME.do" 

do "$pathCovidVisualizedGlobal/IMPE/do CovidVisualizedGlobal IMPE.do" 

// do "$pathCovidVisualizedGlobal/LANL/do CovidVisualizedGlobal LANL.do" // The LANL COVID-19 Team made its last real-time forecast on September 27th, 2021. [for 20210926]. This is more than two weeks old and will not be used. 

do "$pathCovidVisualizedGlobal/SRIV/do CovidVisualizedGlobal SRIV.do" 

do "$pathCovidVisualizedGlobal/merge/do CovidVisualizedGlobal merge.do" 










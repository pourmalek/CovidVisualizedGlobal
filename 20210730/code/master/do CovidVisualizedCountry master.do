
***************************************************************************
* This is "do CovidVisualizedCountry master.do"
                                                                                                          *******************
* Project: Combine and visualize international periodically updating                                      * uptake 20210730 *
* estimates of COVID-19 at the country level (CovidVisualizedCountry)                                     *******************
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dotcom
* Time (initial): 2021-04-14
***************************************************************************


global country Canada // <<-- set here the country of choice - countries without subnational estimates     
                                                                                                         ***************************
di "$country"                                                                                  // <<<--- *   change country here   *
                                                                                                         ***************************
* To change uptake date, find and replace all, 20210730 (old), with 20210730 (new) <<--           <<<--- * change uptake date here *
                                                                                                         ***************************



/* 

This file "do CovidVisualizedCountry master.do" was set up to be run from:
  |Users|local-user-name|Downloads|CovidVisualizedCountry-main|202YMMDD|code|master|do CovidVisualizedCountry master.do
  where 2021MMDD is the udpate date, e.g. update 20210730

If the first run does not go thru due to directory path clash, edit the contents within " " of the line _63_ or _65_ below, located beneath ****** set path based on local operating system ****** ,,, 
,,, to reflect the location of directory /CovidVisualizedCountry-main/ or \CovidVisualizedCountry-main\ on your local machine. Path should be:


global pathCovidVisualizedCountry "/Users/`usrnam'/Downloads/CovidVisualizedCountry-main/202YMMDD/code/" [for Mac]

global pathCovidVisualizedCountry = "C:\Users\\`usrnam'\Downloads\CovidVisualizedCountry-main\202YMMDD\code\" [for Windows]



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
	global pathCovidVisualizedCountry "/Users/`usrnam'/Downloads/CovidVisualizedCountry-main/20210730/code/" 
}
else if regexm(c(os),"Windows") {
	global pathCovidVisualizedCountry = "C:\Users\\`usrnam'\Downloads\CovidVisualizedCountry-main\20210730\code\"
}
*


cd "$pathCovidVisualizedCountry"
 
cd master





* preserve native scheme (of the local machine; will be eventually restored at the end of "do CovidVisualizedCountry merge.do")

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
LANL
SRIV
*/




* runs the do files for each study and merge them. 

* IF the target server for a given study is temp down, the respective line can be commented out. Edits would then be needed in merge.do, however. 


do "$pathCovidVisualizedCountry/JOHN/do CovidVisualizedCountry JOHN.do" 

do "$pathCovidVisualizedCountry/DELP/do CovidVisualizedCountry DELP.do" 

do "$pathCovidVisualizedCountry/IHME/do CovidVisualizedCountry IHME.do" 

// do "$pathCovidVisualizedCountry/IMPE/do CovidVisualizedCountry IMPE.do" 

do "$pathCovidVisualizedCountry/LANL/do CovidVisualizedCountry LANL.do" 

do "$pathCovidVisualizedCountry/SRIV/do CovidVisualizedCountry SRIV.do" 

do "$pathCovidVisualizedCountry/merge/do CovidVisualizedCountry merge.do" 


/*

* On 20210824, the Imperial College COVID-19 model/study removed their "old fits" – 
all previously released updates from day 1 up to and including IMPE update 20210719 – 
from https://github.com/mrc-ide/global-lmic-reports/tree/master/data 

This means the Imperial College COVID-19 model/study is no more a periodically updated study with ACCESSIBLE updates – 
short of early retirement of the study. 

Several thousand lines of codes that used their previously released updates will not work.

The remedy for CovidVisualized repository https://github.com/pourmalek/CovidVisualizedGlobal for the global level: 
is to comment out the command line reading csv data from https://github.com/mrc-ide/global-lmic-reports/tree/master/data.

* However, the previously stored results, such as:
data in CovidVisualizedGlobal-main/20210730/output/merge/CovidVisualizedGlobal merge.dta
and graphs stored in:
CovidVisualizedGlobal-main/20210730/output/merge/*.pdf
and CovidVisualizedGlobal-main/20210730/output/IMPE/*.pdf
preserve a copy of previously accessed the Imperial College COVID-19 model/study removed updates.









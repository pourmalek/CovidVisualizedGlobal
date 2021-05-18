
***************************************************************************
* This is "do GlobalCovidCombineVisualize master.do"
                                                                                                          *******************
* Project: Combine and visualize international periodically updating                                      * uptake 20210506 *
* estimates of COVID-19 at the global level (GlobalCovidCombineVisualize)                                 *******************
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14
***************************************************************************






/* 

This file "do GlobalCovidCombineVisualize master.do" was set up to be run from:
  |Users|local-user-name|Downloads|GlobalCovidCombineVisualize-main|202YMMDD|code|master|do GlobalCovidCombineVisualize master.do
  where 2021MMDD is the udpate date, e.g. update 20210506

If the first run does not go thru due to directory path clash, edit the contents within " " of the line 57 or 60 below, located beneath ****** set path based on local operating system ****** ,,, 
,,, to reflect the location of directory /GlobalCovidCombineVisualize-main/ or \GlobalCovidCombineVisualize-main\ on your local machine. Path should be:


global pathGlobalCovidCombineVisualize "/Users/`usrnam'/Downloads/GlobalCovidCombineVisualize-main/202YMMDD/code/" [for Mac]

global pathGlobalCovidCombineVisualize = "C:\Users\\`usrnam'\Downloads\GlobalCovidCombineVisualize-main\202YMMDD\code\" [for Windows]



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
	global pathGlobalCovidCombineVisualize "/Users/`usrnam'/Downloads/GlobalCovidCombineVisualize-main/20210506/code/" 
}
else if regexm(c(os),"Windows") {
	global pathGlobalCovidCombineVisualize = "C:\Users\\`usrnam'\Downloads\GlobalCovidCombineVisualize-main\20210506\code\"
}
*


cd "$pathGlobalCovidCombineVisualize"
 
cd master





* preserve native scheme (of the local machine; will be eventually restored at the end of "do GlobalCovidCombineVisualize merge.do")

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


do "$pathGlobalCovidCombineVisualize/JOHN/do GlobalCovidCombineVisualize JOHN.do" 

do "$pathGlobalCovidCombineVisualize/DELP/do GlobalCovidCombineVisualize DELP.do" 

do "$pathGlobalCovidCombineVisualize/IHME/do GlobalCovidCombineVisualize IHME.do" 

do "$pathGlobalCovidCombineVisualize/IMPE/do GlobalCovidCombineVisualize IMPE.do" 

do "$pathGlobalCovidCombineVisualize/LANL/do GlobalCovidCombineVisualize LANL.do" 

do "$pathGlobalCovidCombineVisualize/SRIV/do GlobalCovidCombineVisualize SRIV.do" 

do "$pathGlobalCovidCombineVisualize/merge/do GlobalCovidCombineVisualize merge.do" 










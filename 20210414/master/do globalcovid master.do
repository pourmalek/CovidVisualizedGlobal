

***************************************************************************
* This is "do globalcovid master.do"

* Project: Rapid review of estimates of global COVID-19
* Person: Farshad Pourmalek pourmalek_farshad@yahoo.com
* Time (initial): 2021-04-14

* OBJECTIVE: Get, prepare, and combine component studies' estimates

* This update: 20210414
***************************************************************************


/* 

This file "do Iran master.do" was set up to be run from:
  |Users|local-user-name|Downloads|globalcovid-main|202YMMDD|master|do globalcovid master.do
  where 2021MMDD is the udpate date, e.g. starting with 20210414

If the first run does not go thru due to directory path clash, edit the contents within " " of the line 54 or 57 below, located beneath ****** set path based on local operating system ****** ,,, 
,,, to reflect the location of directory /globalcovid-main/ or \globalcovid-main\ on your local machine. Path of /data/ or \data\ should be:


global pathglobalcovid "/Users/`usrnam'/Downloads/globalcovid-main/202YMMDD/" [for Mac]

global pathglobalcovid = "C:\Users\\`usrnam'\Downloads\globalcovid-main\202YMMDD\" [for Windows]



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
	global pathglobalcovid "/Users/`usrnam'/Downloads/globalcovid-main/20210414/" 
}
else if regexm(c(os),"Windows") {
	global pathglobalcovid = "C:\Users\\`usrnam'\Downloads\globalcovid-main\20210414\"
}
*


cd "$pathglobalcovid"
 
cd master





* preserve native scheme (of the local machine; will be eventually restored at the end of "do Iran merge.do")

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


do "$pathglobalcovid/JOHN/do globalcovid JOHN.do" 

do "$pathglobalcovid/DELP/do globalcovid DELP.do" 

do "$pathglobalcovid/IHME/do globalcovid IHME.do" 

do "$pathglobalcovid/IMPE/do globalcovid IMPE.do" 

do "$pathglobalcovid/LANL/do globalcovid LANL.do" 

do "$pathglobalcovid/SRIV/do globalcovid SRIV.do" 

do "$pathglobalcovid/merge/do globalcovid merge.do" 






* since you are reading this:
* Useful additional note:  After first clean execution of entire codes, time-consuming commands can be /* bypassed */. These are -copy- commands to download component studies' estimates files, and -import delimited- after them. 





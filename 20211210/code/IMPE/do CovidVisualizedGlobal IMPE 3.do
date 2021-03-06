
clear all

cd "$pathCovidVisualizedGlobal"

cd IMPE

capture log close 

log using "log CovidVisualizedGlobal IMPE 3.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IMPE 3.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the `region' level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************
 

* graphs


use "CovidVisualizedGlobal IMPE.dta", clear


*************************

* graphs 


grstyle init

grstyle color background white



local list2 GLOBAL AFRO AMRO EMRO EURO SEARO WPRO

foreach region of local list2 {



	* daily deaths, 6 scenarios
	
	twoway ///
	(line DayDeaMeRaA03S01`region' date, sort lcolor(green)) ///
	(line DayDeaMeRaA03S02`region' date, sort lcolor(black)) ///
	(line DayDeaMeRaA03S03`region' date, sort lcolor(red)) ///
	(line DayDeaMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayDeaMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayDeaMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 1 COVID-19 daily deaths, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 1 COVID-19 daily deaths, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* daily deaths, S2 = median scenario 
	
	twoway ///
	(rarea DayDeaLoRaA03S02`region' DayDeaUpRaA03S02`region' date, sort color(green*0.2)) ///
	(line DayDeaMeRaA03S02`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Daily deaths) title("COVID-19 daily deaths, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 2 COVID-19 daily deaths, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 2 COVID-19 daily deaths, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* total deaths, 6 scenarios
	
	twoway ///
	(line TotDeaMeRaA03S01`region' date, sort lcolor(green)) ///
	(line TotDeaMeRaA03S02`region' date, sort lcolor(black)) ///
	(line TotDeaMeRaA03S03`region' date, sort lcolor(red)) ///
	(line TotDeaMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line TotDeaMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line TotDeaMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 3 COVID-19 total deaths, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 3 COVID-19 total deaths, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* total deaths, S2 = median scenario 
	
	twoway ///
	(rarea TotDeaLoRaA03S02`region' TotDeaUpRaA03S02`region' date, sort color(green*0.2)) ///
	(line TotDeaMeRaA03S02`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Total deaths) title("COVID-19 total deaths, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 4 COVID-19 total deaths, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 4 COVID-19 total deaths, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* daily infections, 6 scenarios
	
	twoway ///
	(line DayINFMeSmA03S01`region' date, sort lcolor(green)) ///
	(line DayINFMeSmA03S02`region' date, sort lcolor(black)) ///
	(line DayINFMeSmA03S03`region' date, sort lcolor(red)) ///
	(line DayINFMeSmA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayINFMeSmA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayINFMeSmA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 5 COVID-19 daily infections, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 5 COVID-19 daily infections, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* daily infections, S2 = median scenario 
	
	twoway ///
	(rarea DayINFLoRaA03S02`region' DayINFUpRaA03S02`region' date, sort color(green*0.2)) ///
	(line DayINFMeSmA03S02`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 6 COVID-19 daily infections, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 6 COVID-19 daily infections, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* total infections, 6 scenarios
	
	twoway ///
	(line TotINFMeRaA03S01`region' date, sort lcolor(green)) ///
	(line TotINFMeRaA03S02`region' date, sort lcolor(black)) ///
	(line TotINFMeRaA03S03`region' date, sort lcolor(red)) ///
	(line TotINFMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line TotINFMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line TotINFMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 7 COVID-19 total infections, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 7 COVID-19 total infections, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* total infections, S2 = median scenario 
	
	twoway ///
	(rarea TotINFLoRaA03S02`region' TotINFUpRaA03S02`region' date, sort color(green*0.2)) ///
	(line TotINFMeRaA03S02`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 8 COVID-19 total infections, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 8 COVID-19 total infections, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	
	
	
	* other outcomes
	
	
	* daily hospital demand, median scenario
	
	twoway ///
	(rarea DayHodLoRaA03S01`region' DayHodUpRaA03S01`region' date, sort color(green*0.2)) ///
	(line DayHodMeRaA03S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Daily outcome) title("COVID-19 daily hospital demand, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 11 COVID-19 daily hospital demand, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 11 COVID-19 daily hospital demand, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* daily hospital demand, 6 scenarios
	
	twoway ///
	(line DayHodMeRaA03S01`region' date, sort lcolor(green)) ///
	(line DayHodMeRaA03S02`region' date, sort lcolor(black)) ///
	(line DayHodMeRaA03S03`region' date, sort lcolor(red)) ///
	(line DayHodMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayHodMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayHodMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcome) title("COVID-19 daily hospital demand, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 12 COVID-19 daily hospital demand, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 12 COVID-19 daily hospital demand, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* daily hospital incidence, median scenario
	
	twoway ///
	(rarea DayHoiLoRaA03S01`region' DayHoiUpRaA03S01`region' date, sort color(green*0.2)) ///
	(line DayHoiMeRaA03S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Daily outcome) title("COVID-19 daily hospital incidence, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 13 COVID-19 daily hospital incidence, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 13 COVID-19 daily hospital incidence, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* daily hospital incidence, 6 scenarios
	
	twoway ///
	(line DayHoiMeRaA03S01`region' date, sort lcolor(green)) ///
	(line DayHoiMeRaA03S02`region' date, sort lcolor(black)) ///
	(line DayHoiMeRaA03S03`region' date, sort lcolor(red)) ///
	(line DayHoiMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayHoiMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayHoiMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcome) title("COVID-19 daily hospital incidence, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 14 COVID-19 daily hospital incidence, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 14 COVID-19 daily hospital incidence, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* daily ICU demand, median scenario
	
	twoway ///
	(rarea DayIcdLoRaA03S01`region' DayIcdUpRaA03S01`region' date, sort color(green*0.2)) ///
	(line DayIcdMeRaA03S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Daily outcome) title("COVID-19 daily ICU demand, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 15 COVID-19 daily ICU demand, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 15 COVID-19 daily ICU demand, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* daily ICU demand, 6 scenarios
	
	twoway ///
	(line DayIcdMeRaA03S01`region' date, sort lcolor(green)) ///
	(line DayIcdMeRaA03S02`region' date, sort lcolor(black)) ///
	(line DayIcdMeRaA03S03`region' date, sort lcolor(red)) ///
	(line DayIcdMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayIcdMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayIcdMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcome) title("COVID-19 daily ICU demand, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 16 COVID-19 daily ICU demand, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 16 COVID-19 daily ICU demand, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	* daily ICU incidence, median scenario
	
	twoway ///
	(rarea DayIciLoRaA03S01`region' DayIciUpRaA03S01`region' date, sort color(green*0.2)) ///
	(line DayIciMeRaA03S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	ytitle(Daily outcome) title("COVID-19 daily ICU incidence, `region', IMPE, median scenario", size(medium)) legend(off)
	
	qui graph save "graph `region' 17 COVID-19 daily ICU incidence, median scenario, `region', IMPE.gph", replace
	qui graph export "graph `region' 17 COVID-19 daily ICU incidence, median scenario, `region', IMPE.pdf", replace
	
	
	
	
	* daily ICU incidence, 6 scenarios
	
	twoway ///
	(line DayIciMeRaA03S01`region' date, sort lcolor(green)) ///
	(line DayIciMeRaA03S02`region' date, sort lcolor(black)) ///
	(line DayIciMeRaA03S03`region' date, sort lcolor(red)) ///
	(line DayIciMeRaA03S04`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayIciMeRaA03S05`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayIciMeRaA03S06`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcome) title("COVID-19 daily ICU incidence, `region', IMPE, 6 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) ///
	legend(region(lcolor(none))) legend(bexpand) legend(order(1 "S1" 2 "S2" 3 "S3" 4 "S4" 5 "S5" 6 "S6") rows(1))
		   
	qui graph save "graph `region' 18 COVID-19 daily ICU incidence, 6 scenarios, `region', IMPE.gph", replace
	qui graph export "graph `region' 18 COVID-19 daily ICU incidence, 6 scenarios, `region', IMPE.pdf", replace
	
	
	
	
	
	
	
	
	* DayINF DayDeaDay Dea_multip
	
	twoway ///
	(line DayINFMeSmA03S02`region' date, sort lcolor(blue)) ///
	(line DayDeaMeRaA03S02`region' date, sort lcolor(red)) ///
	(line DayDMuMeRaA03S02`region' date, sort lpattern(dot) lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#20, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections and deaths) title("COVID-19 daily infections and deaths, `region', IMPE", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(4)) legend(region(lcolor(none)))  ///
	legend(order(1 "Daily infections" 2 "Daily deaths" 3 "Daily deaths scaled for visualization") size(small)) ///
	subtitle("Daily deaths, scaled = times (means of infections divided by deaths) for visualization only", size(small)) ///
	note("Current scenario, mean estimate")
	
	qui graph save "graph `region' 25 COVID-19 daily deaths and infections `region', IMPE.gph", replace
	qui graph export "graph `region' 25 COVID-19 daily deaths and infections `region', IMPE.pdf", replace



}
*







*******************************

* regions together




* daily deaths, with GLOBAL

twoway ///
(line DayDeaMeRaA03S02AFRO date, sort lcolor(brown)) ///
(line DayDeaMeRaA03S02AMRO date, sort lcolor(red)) ///
(line DayDeaMeRaA03S02EMRO date, sort lcolor(gold)) ///
(line DayDeaMeRaA03S02EURO date, sort lcolor(green)) ///
(line DayDeaMeRaA03S02SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeRaA03S02WPRO date, sort lcolor(blue)) ///
(line DayDeaMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 1a COVID-19 daily deaths, regions together, IMPE.gph", replace
qui graph export "graph 1a COVID-19 daily deaths, regions together, IMPE.pdf", replace




* daily deaths, without GLOBAL

twoway ///
(line DayDeaMeRaA03S02AFRO date, sort lcolor(brown)) ///
(line DayDeaMeRaA03S02AMRO date, sort lcolor(red)) ///
(line DayDeaMeRaA03S02EMRO date, sort lcolor(gold)) ///
(line DayDeaMeRaA03S02EURO date, sort lcolor(green)) ///
(line DayDeaMeRaA03S02SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeRaA03S02WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 1b COVID-19 daily deaths, regions together wo global, IMPE.gph", replace
qui graph export "graph 1b COVID-19 daily deaths, regions together wo global, IMPE.pdf", replace




* daily infections, with GLOBAL

twoway ///
(line DayINFMeSmA03S02AFRO date, sort lcolor(brown)) ///
(line DayINFMeSmA03S02AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA03S02EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA03S02EURO date, sort lcolor(green)) ///
(line DayINFMeSmA03S02SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA03S02WPRO date, sort lcolor(blue)) ///
(line DayINFMeSmA03S02GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 2a COVID-19 daily infections, regions together, IMPE.gph", replace
qui graph export "graph 2a COVID-19 daily infections, regions together, IMPE.pdf", replace




* daily infections, without GLOBAL

twoway ///
(line DayINFMeSmA03S02AFRO date, sort lcolor(brown)) ///
(line DayINFMeSmA03S02AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA03S02EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA03S02EURO date, sort lcolor(green)) ///
(line DayINFMeSmA03S02SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA03S02WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 2b COVID-19 daily infections, regions together wo global, IMPE.gph", replace
qui graph export "graph 2b COVID-19 daily infections, regions together wo global, IMPE.pdf", replace





* total deaths, with GLOBAL

twoway ///
(line TotDeaMeRaA03S02AFRO date, sort lcolor(brown)) ///
(line TotDeaMeRaA03S02AMRO date, sort lcolor(red)) ///
(line TotDeaMeRaA03S02EMRO date, sort lcolor(gold)) ///
(line TotDeaMeRaA03S02EURO date, sort lcolor(green)) ///
(line TotDeaMeRaA03S02SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeRaA03S02WPRO date, sort lcolor(blue)) ///
(line TotDeaMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 3a COVID-19 total deaths, regions together, IMPE.gph", replace
qui graph export "graph 3a COVID-19 total deaths, regions together, IMPE.pdf", replace



* total deaths, without GLOBAL

twoway ///
(line TotDeaMeRaA03S02AFRO date, sort lcolor(brown)) ///
(line TotDeaMeRaA03S02AMRO date, sort lcolor(red)) ///
(line TotDeaMeRaA03S02EMRO date, sort lcolor(gold)) ///
(line TotDeaMeRaA03S02EURO date, sort lcolor(green)) ///
(line TotDeaMeRaA03S02SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeRaA03S02WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 3b COVID-19 total deaths, regions together wo global, IMPE.gph", replace
qui graph export "graph 3b COVID-19 total deaths, regions together wo global, IMPE.pdf", replace





* total infections, with GLOBAL

twoway ///
(line TotINFMeRaA03S02AFRO date, sort lcolor(brown)) ///
(line TotINFMeRaA03S02AMRO date, sort lcolor(red)) ///
(line TotINFMeRaA03S02EMRO date, sort lcolor(gold)) ///
(line TotINFMeRaA03S02EURO date, sort lcolor(green)) ///
(line TotINFMeRaA03S02SEARO date, sort lcolor(cyan)) ///
(line TotINFMeRaA03S02WPRO date, sort lcolor(blue)) ///
(line TotINFMeRaA03S02GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 4a COVID-19 total infections, regions together, IMPE.gph", replace
qui graph export "graph 4a COVID-19 total infections, regions together, IMPE.pdf", replace



* total infections, without GLOBAL

twoway ///
(line TotINFMeRaA03S02AFRO date, sort lcolor(brown)) ///
(line TotINFMeRaA03S02AMRO date, sort lcolor(red)) ///
(line TotINFMeRaA03S02EMRO date, sort lcolor(gold)) ///
(line TotINFMeRaA03S02EURO date, sort lcolor(green)) ///
(line TotINFMeRaA03S02SEARO date, sort lcolor(cyan)) ///
(line TotINFMeRaA03S02WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#27, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, WHO regions, IMPE", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 4b COVID-19 total infections, regions together wo global, IMPE.gph", replace
qui graph export "graph 4b COVID-19 total infections, regions together wo global, IMPE.pdf", replace




















view "log CovidVisualizedGlobal IMPE 3.smcl"

log close

exit, clear



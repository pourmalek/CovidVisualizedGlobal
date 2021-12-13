
clear all

cd "$pathCovidVisualizedGlobal"

cd IHME

capture log close 

log using "log CovidVisualizedGlobal IHME 3.smcl", replace

***************************************************************************
* This is "do CovidVisualizedGlobal IHME 3.do"

* Project: Combine and visualize international periodically updating 
* estimates of COVID-19 at the `region' level (CovidVisualizedGlobal)
* Person: Farshad Pourmalek pourmalek_farshad at yahoo dot com
* Time (initial): 2021-04-14
***************************************************************************


* graphs


use "CovidVisualizedGlobal IHME.dta", clear




***********************


* graphs


grstyle init

grstyle color background white




local list2 GLOBAL AFRO AMRO EMRO EURO SEARO WPRO

foreach region of local list2 {


	* daily deaths
	
	
	* daily reported deaths, reference scenario = S1 	   
		   
	twoway (rarea DayDeaLoSmA02S01`region' DayDeaUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported deaths) title("COVID-19 daily reported deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
		   
	qui graph save "graph `region' 1a COVID-19 daily reported deaths, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 1a COVID-19 daily reported deaths, reference scenario, `region', IHME.pdf", replace
	

	
	* daily excess deaths, reference scenario = S1 	   
		   
	twoway (rarea DayDeXLoSmA02S01`region' DayDeXUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayDeXMeSmA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily excess deaths) title("COVID-19 daily excess deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
		   
	qui graph save "graph `region' 1b COVID-19 daily excess deaths, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 1b COVID-19 daily excess deaths, reference scenario, `region', IHME.pdf", replace
	
	
	
	
	* daily reported & excess deaths, reference scenario = S1 	   
	
	twoway (rarea DayDeaLoSmA02S01`region' DayDeaUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) ///	   
	(rarea DayDeXLoSmA02S01`region' DayDeXUpSmA02S01`region' date, sort color(red*.2)) ///
	(line DayDeXMeSmA02S01`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported & excess deaths) title("COVID-19 daily reported & excess deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reported deaths" 4 "Excess deaths") rows(1)) yscale(titlegap(2))
		   
	qui graph save "graph `region' 1c COVID-19 daily reported & excess deaths, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 1c COVID-19 daily reported & excess deaths, reference scenario, `region', IHME.pdf", replace
	
	
	
	
	
	
	
	* daily reported deaths, 3 scenarios  
	  
	twoway ///
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line DayDeaMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayDeaMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported deaths) title("COVID-19 daily reported deaths, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))
	
	qui graph save "graph `region' 2a COVID-19 daily reported deaths, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 2a COVID-19 daily reported deaths, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily excess deaths, 3 scenarios  
	  
	twoway ///
	(line DayDeXMeSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line DayDeXMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayDeXMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily excess deaths) title("COVID-19 daily excess deaths, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))
	
	qui graph save "graph `region' 2b COVID-19 daily excess deaths, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 2b COVID-19 daily excess deaths, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily reported & excess deaths, 3 scenarios  
	  
	twoway ///
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line DayDeaMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayDeaMeSmA02S03`region' date, sort lcolor(red)) ///
	(line DayDeXMeSmA02S01`region' date, sort lcolor(black) lpattern(dash)) ///
	(line DayDeXMeSmA02S02`region' date, sort lcolor(green) lpattern(dash)) ///
	(line DayDeXMeSmA02S03`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported & excess deaths) title("COVID-19 daily reported & excess deaths, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) yscale(titlegap(2)) ///
	note("Excess deaths: dashed curves")
	
	qui graph save "graph `region' 2c COVID-19 daily reported & excess deaths, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 2c COVID-19 daily reported & excess deaths, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	
	* daily reported deaths, reference scenario = S1, CI
	  
	twoway ///
	(line DayDeaMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayDeaLoSmA02S01`region' date, sort lcolor(green)) ///
	(line DayDeaUpSmA02S01`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported deaths) title("COVID-19 daily reported deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 3 COVID-19 daily deaths, `region' reference scenario CI, IHME.gph", replace
	qui graph export "graph `region' 3 COVID-19 daily deaths, `region' reference scenario CI, IHME.pdf", replace
	
	
	
	
	* daily reported deaths, best scenario = S2, CI
	  
	twoway ///
	(line DayDeaMeSmA02S02`region' date, sort lcolor(black)) ///
	(line DayDeaLoSmA02S02`region' date, sort lcolor(green)) ///
	(line DayDeaUpSmA02S02`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported deaths) title("COVID-19 daily reported deaths, `region', IHME, best scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 4 COVID-19 daily deaths, `region' best scenario CI, IHME.gph", replace
	qui graph export "graph `region' 4 COVID-19 daily deaths, `region' best scenario CI, IHME.pdf", replace
	
	
	
	
	* daily reported deaths, worse scenario = S3, CI
	  
	twoway ///
	(line DayDeaMeSmA02S03`region' date, sort lcolor(black)) ///
	(line DayDeaLoSmA02S03`region' date, sort lcolor(green)) ///
	(line DayDeaUpSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily reported deaths) title("COVID-19 daily reported deaths, `region', IHME, worse scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 5 COVID-19 daily deaths, `region' worse scenario CI, IHME.gph", replace
	qui graph export "graph `region' 5 COVID-19 daily deaths, `region' worse scenario CI, IHME.pdf", replace
	
	
	
	
	* daily infections
	
	
	* daily infections, reference scenario = S1 	   
		   
	twoway (rarea DayINFLoSmA02S01`region' DayINFUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
		   
	qui graph save "graph `region' 6 COVID-19 daily infections, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 6 COVID-19 daily infections, reference scenario, `region', IHME.pdf", replace
	
	
	
	
	* daily infections, 3 scenarios  
	  
	twoway ///
	(line DayINFMeSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line DayINFMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayINFMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))
	
	qui graph save "graph `region' 7 COVID-19 daily infections, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 7 COVID-19 daily infections, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily infections, reference scenario = S1, CI
	  
	twoway ///
	(line DayINFMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayINFLoSmA02S01`region' date, sort lcolor(green)) ///
	(line DayINFUpSmA02S01`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 8 COVID-19 daily infections, `region' reference scenario CI, IHME.gph", replace
	qui graph export "graph `region' 8 COVID-19 daily infections, `region' reference scenario CI, IHME.pdf", replace
	
	
	
	
	* daily infections, best scenario = S2, CI 
	  
	twoway ///
	(line DayINFMeSmA02S02`region' date, sort lcolor(black)) ///
	(line DayINFLoSmA02S02`region' date, sort lcolor(green)) ///
	(line DayINFUpSmA02S02`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IHME, best scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 9 COVID-19 daily infections, `region' best scenario CI, IHME.gph", replace
	qui graph export "graph `region' 9 COVID-19 daily infections, `region' best scenario CI, IHME.pdf", replace
	
	
	
	
	* daily infections, worse scenario = S3, CI
	  
	twoway ///
	(line DayINFMeSmA02S03`region' date, sort lcolor(black)) ///
	(line DayINFLoSmA02S03`region' date, sort lcolor(green)) ///
	(line DayINFUpSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infections) title("COVID-19 daily infections, `region', IHME, worse scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 10 COVID-19 daily infections, `region' worse scenario CI, IHME.gph", replace
	qui graph export "graph `region' 10 COVID-19 daily infections, `region' worse scenario CI, IHME.pdf", replace
	
	
	
	
	* total deaths
	
	
	* total reported deaths, reference scenario = S1 	   
		   
	twoway (rarea TotDeaLoSmA02S01`region' TotDeaUpSmA02S01`region' date, sort color(black*.2)) ///
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported deaths) title("COVID-19 total reported deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
		   
	qui graph save "graph `region' 11a COVID-19 total reported deaths, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 11a COVID-19 total reported deaths, reference scenario, `region', IHME.pdf", replace
	
	
	
	* total excess deaths, reference scenario = S1 	   
		   
	twoway (rarea TotDeXLoSmA02S01`region' TotDeXUpSmA02S01`region' date, sort color(black*.2)) ///
	(line TotDeXMeSmA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total excess deaths) title("COVID-19 total excess deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
		   
	qui graph save "graph `region' 11b COVID-19 total excess deaths, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 11b COVID-19 total excess deaths, reference scenario, `region', IHME.pdf", replace
	
	
	
	
	* total reported & excess deaths, reference scenario = S1 	   
		   
	twoway (rarea TotDeaLoSmA02S01`region' TotDeaUpSmA02S01`region' date, sort color(black*.2)) ///
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) ///
	(rarea TotDeXLoSmA02S01`region' TotDeXUpSmA02S01`region' date, sort color(black*.2)) ///
	(line TotDeXMeSmA02S01`region' date, sort lcolor(black) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported and excess deaths) title("COVID-19 total reported & excess deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) yscale(titlegap(4)) legend(off) ///
	note("Excess deaths: dashed curve")
		   
	qui graph save "graph `region' 11c COVID-19 total reported & excess deaths, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 11c COVID-19 total reported & excess deaths, reference scenario, `region', IHME.pdf", replace
	
	
	
	
	* total reported deaths, 3 scenarios  
	  
	twoway ///
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line TotDeaMeSmA02S02`region' date, sort lcolor(green)) ///
	(line TotDeaMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported deaths) title("COVID-19 total reported deaths, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))
	
	qui graph save "graph `region' 12a COVID-19 total reported deaths, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 12a COVID-19 total reported deaths, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* total excess deaths, 3 scenarios  
	  
	twoway ///
	(line TotDeXLoSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line TotDeXLoSmA02S02`region' date, sort lcolor(green)) ///
	(line TotDeXLoSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total excess deaths) title("COVID-19 total excess deaths, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1))
	
	qui graph save "graph `region' 12b COVID-19 total excess deaths, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 12b COVID-19 total excess deaths, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* total reported & excess deaths, 3 scenarios  
	  
	twoway ///
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black) lwidth(vthick) lpattern(tight_dot)) ///
	(line TotDeaMeSmA02S02`region' date, sort lcolor(green)) ///
	(line TotDeaMeSmA02S03`region' date, sort lcolor(red)) ///
	(line TotDeXLoSmA02S01`region' date, sort lcolor(black) lpattern(dash)) ///
	(line TotDeXLoSmA02S02`region' date, sort lcolor(green) lpattern(dash)) ///
	(line TotDeXLoSmA02S03`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported and excess deaths) title("COVID-19 total reported & excess deaths, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "S1" 2 "S2" 3 "S3") rows(1)) ///
	note("Excess deaths: dashed curves")
	
	qui graph save "graph `region' 12c COVID-19 total reported & excess deaths, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 12c COVID-19 total reported & excess deaths, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	
	* total reported deaths, reference scenario = S1, CI
	  
	twoway ///
	(line TotDeaMeSmA02S01`region' date, sort lcolor(black)) ///
	(line TotDeaLoSmA02S01`region' date, sort lcolor(green)) ///
	(line TotDeaUpSmA02S01`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported deaths) title("COVID-19 total reported deaths, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 13 COVID-19 total deaths, `region' reference scenario CI, IHME.gph", replace
	qui graph export "graph `region' 13 COVID-19 total deaths, `region' reference scenario CI, IHME.pdf", replace
	
	
	
	
	* total reported deaths, best scenario = S2, CI
	  
	twoway ///
	(line TotDeaMeSmA02S02`region' date, sort lcolor(black)) ///
	(line TotDeaLoSmA02S02`region' date, sort lcolor(green)) ///
	(line TotDeaUpSmA02S02`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported deaths) title("COVID-19 total reported deaths, `region', IHME, best scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 14 COVID-19 total deaths, `region' best scenario CI, IHME.gph", replace
	qui graph export "graph `region' 14 COVID-19 total deaths, `region' best scenario CI, IHME.pdf", replace
	
	
	
	
	* total reported deaths, worse scenario = S3, CI
	  
	twoway ///
	(line TotDeaMeSmA02S03`region' date, sort lcolor(black)) ///
	(line TotDeaLoSmA02S03`region' date, sort lcolor(green)) ///
	(line TotDeaUpSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total reported deaths) title("COVID-19 total reported deaths, `region', IHME, worse scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 15 COVID-19 total deaths, `region' worse scenario CI, IHME.gph", replace
	qui graph export "graph `region' 15 COVID-19 total deaths, `region' worse scenario CI, IHME.pdf", replace
	
	
	
	
	* total infections
	
	
	* total infections, reference scenario = S1 	   
		   
	twoway (rarea TotINFLoSmA02S01`region' TotINFUpSmA02S01`region' date, sort color(black*.2)) ///
	(line TotINFMeSmA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(off)	
		   
	qui graph save "graph `region' 16 COVID-19 total infections, reference scenario, `region', IHME.gph", replace
	qui graph export "graph `region' 16 COVID-19 total infections, reference scenario, `region', IHME.pdf", replace
	
	
	
	
	* total infections, reference scenario = S1, CI
	  
	twoway ///
	(line TotINFMeSmA02S01`region' date, sort lcolor(black)) ///
	(line TotINFLoSmA02S01`region' date, sort lcolor(green)) ///
	(line TotINFUpSmA02S01`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 18 COVID-19 total infections, `region' reference scenario CI, IHME.gph", replace
	qui graph export "graph `region' 18 COVID-19 total infections, `region' reference scenario CI, IHME.pdf", replace
	
	
	
	
	* total infections, best scenario = S2, CI
	
	twoway ///
	(line TotINFMeSmA02S02`region' date, sort lcolor(black)) ///
	(line TotINFLoSmA02S02`region' date, sort lcolor(green)) ///
	(line TotINFUpSmA02S02`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IHME, better scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 19 COVID-19 total infections, `region' better scenario CI, IHME.gph", replace
	qui graph export "graph `region' 19 COVID-19 total infections, `region' better scenario CI, IHME.pdf", replace
	 
	
	 
	* total infections, worse scenario = S3, CI
	  
	twoway ///
	(line TotINFMeSmA02S03`region' date, sort lcolor(black)) ///
	(line TotINFLoSmA02S03`region' date, sort lcolor(green)) ///
	(line TotINFUpSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IHME, worse scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Mean" 2 "Lower" 3 "Upper") rows(1))
	
	qui graph save "graph `region' 19 COVID-19 total infections, `region' worse scenario CI, IHME.gph", replace
	qui graph export "graph `region' 19 COVID-19 total infections, `region' worse scenario CI, IHME.pdf", replace
	
	
	
	
	* total infections, 3 scenarios, CI
	  
	twoway ///
	(line TotINFMeSmA02S02`region' date, sort lcolor(green)) ///
	(line TotINFLoSmA02S02`region' date, sort lcolor(green*.5) lpattern(dash)) ///
	(line TotINFUpSmA02S02`region' date, sort lcolor(green*.5) lpattern(dash)) ///
	(line TotINFMeSmA02S03`region' date, sort lcolor(red)) ///
	(line TotINFLoSmA02S03`region' date, sort lcolor(red*.5) lpattern(dash)) ///
	(line TotINFUpSmA02S03`region' date, sort lcolor(red*.5) lpattern(dash)) ///
	(line TotINFMeSmA02S01`region' date, sort lcolor(black)) ///
	(line TotINFLoSmA02S01`region' date, sort lcolor(black) lpattern(dash)) ///
	(line TotINFUpSmA02S01`region' date, sort lcolor(black) lpattern(dash)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Total infections) title("COVID-19 total infections, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Worse" 4 "Better" 7 "Reference") rows(1)) ///
	note("Uncertainty limits: dashed curves")
	
	qui graph save "graph `region' 20 COVID-19 total infections, `region' 3 scenarios CI, IHME.gph", replace
	qui graph export "graph `region' 20 COVID-19 total infections, `region' 3 scenarios CI, IHME.pdf", replace
	
	
	
	
	
	  
	  
	* IDR, IHR, IFR, 2021
	
	
	* daily Infection fatality ratio, 3 scenarios  
	  
	twoway ///
	(line InfFatalA02S02`region' date, sort lcolor(green)) ///
	(line InfFatalA02S03`region' date, sort lcolor(red)) ///
	(line InfFatalA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily Infection fatality ratio) title("COVID-19 daily Infection fatality ratio, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1))
	
	qui graph save "graph `region' 21a COVID-19 daily IFR, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 21a COVID-19 daily IFR, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily Infection detection ratio, 3 scenarios, 2021  
	  
	twoway ///
	(line InfDetectA02S02`region' date, sort lcolor(green)) ///
	(line InfDetectA02S03`region' date, sort lcolor(red)) ///
	(line InfDetectA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily Infection detection ratio) title("COVID-19 daily Infection detection ratio, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1))
	
	qui graph save "graph `region' 21b COVID-19 daily IDR, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 21b COVID-19 daily IDR, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	
	* daily Infection hospitalization ratio, 3 scenarios, 2021  
	  
	twoway ///
	(line InfHospitA02S02`region' date, sort lcolor(green)) ///
	(line InfHospitA02S03`region' date, sort lcolor(red)) ///
	(line InfHospitA02S01`region' date, sort lcolor(black)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily Infection hospitalization ratio) title("COVID-19 daily Infection hospitalization ratio, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Better" 2 "Worse" 3 "Reference") rows(1))
	
	qui graph save "graph `region' 21c COVID-19 daily IHR, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 21c COVID-19 daily IHR, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily Infection outcomes ratios, reference scenario, 2021
	  
	twoway ///
	(line InfDetectA02S01`region' date, sort lcolor(green)) ///
	(line InfHospitA02S01`region' date, sort lcolor(black)) ///
	(line InfFatalA02S01`region' date, sort lcolor(red)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2))
	
	qui graph save "graph `region' 21d COVID-19 daily Infection outcomes ratios, `region' reference scenario, IHME.gph", replace
	qui graph export "graph `region' 21d COVID-19 daily Infection outcomes ratios, `region' reference scenario, IHME.pdf", replace
	
	
	
	* daily Infection outcomes ratios, better scenario, 2021
	  
	twoway ///
	(line InfDetectA02S02`region' date, sort lcolor(green)) ///
	(line InfHospitA02S02`region' date, sort lcolor(black)) ///
	(line InfFatalA02S02`region' date, sort lcolor(red)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, `region', IHME, better scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2))
	
	qui graph save "graph `region' 21e COVID-19 daily Infection outcomes ratios, `region' better scenario, IHME.gph", replace
	qui graph export "graph `region' 21e COVID-19 daily Infection outcomes ratios, `region' better scenario, IHME.pdf", replace
	
	
	
	
	
	* daily Infection outcomes ratios, worse scenario, 2021 
	  
	twoway ///
	(line InfDetectA02S03`region' date, sort lcolor(green)) ///
	(line InfHospitA02S03`region' date, sort lcolor(black)) ///
	(line InfFatalA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, `region', IHME, worse scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2))
	
	qui graph save "graph `region' 21f COVID-19 daily Infection outcomes ratios, `region' worse scenario, IHME.gph", replace
	qui graph export "graph `region' 21f COVID-19 daily Infection outcomes ratios, `region' worse scenario, IHME.pdf", replace
	
	
	
	
	
	
	* daily Infection outcomes ratios, 3 scenarios, 2021
	  
	twoway ///
	(line InfDetectA02S01`region' date, sort lcolor(green)) ///
	(line InfHospitA02S01`region' date, sort lcolor(black)) ///
	(line InfFatalA02S01`region' date, sort lcolor(red)) ///
	(line InfDetectA02S02`region' date, sort lcolor(green) lpattern(dash)) ///
	(line InfHospitA02S02`region' date, sort lcolor(black) lpattern(dash)) ///
	(line InfFatalA02S02`region' date, sort lcolor(red) lpattern(dash)) ///
	(line InfDetectA02S03`region' date, sort lcolor(green) lpattern(dash)) ///
	(line InfHospitA02S03`region' date, sort lcolor(black) lpattern(dash)) ///
	(line InfFatalA02S03`region' date, sort lcolor(red) lpattern(dash)) ///
	if date >= td(01jan2021) ///
	, xtitle(Date) xlabel(#14, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%9.2fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily infection outcome ratios) title("COVID-19 daily infection outcome ratios, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Infection detection ratio" 2 "Infection hospitalization ratio" 3 "Infection fatality ratio") rows(2)) ///
	note("Better and worse scenarios: dashed curves")
	
	qui graph save "graph `region' 21g COVID-19 daily Infection outcomes ratios, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 21g COVID-19 daily Infection outcomes ratios, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	
	
	
	* other outcomes 
	
	
	* daily beds needed, 3 scenarios
	
	twoway (rarea DayBedLoSmA02S01`region' DayBedUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayBedMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayBedMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayBedMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily beds needed) title("COVID-19 daily beds needed, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) 
	
	qui graph save "graph `region' 22a COVID-19 daily beds needed, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 22a COVID-19 daily beds needed, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily beds needed, 3 scenarios, with all_bed_capacity
	
	twoway (rarea DayBedLoSmA02S01`region' DayBedUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayBedMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayBedMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayBedMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily beds needed) title("COVID-19 daily beds needed, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(2)) 
	
	qui graph save "graph `region' 22b COVID-19 daily beds needed, `region' 3 scenarios, IHME all_bed_capacity.gph", replace
	qui graph export "graph `region' 22b COVID-19 daily beds needed, `region' 3 scenarios, IHME all_bed_capacity.pdf", replace
	
	
	
	
	* ICU beds needed, 3 scenarios
	
	twoway (rarea DayIcuLoSmA02S01`region' DayIcuUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayIcuMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayIcuMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayIcuMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(ICU beds needed) title("COVID-19 daily ICU beds needed, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) 
		   
	qui graph save "graph `region' 23a COVID-19 daily ICU beds needed, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 23a COVID-19 daily ICU beds needed, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	* ICU beds needed, 3 scenarios
	
	twoway (rarea DayIcuLoSmA02S01`region' DayIcuUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayIcuMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayIcuMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayIcuMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(ICU beds needed) title("COVID-19 daily ICU beds needed, `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(2)) 
	
		   
	qui graph save "graph `region' 23b COVID-19 daily ICU beds needed, `region' 3 scenarios, IHME icu_bed_capacity.gph", replace
	qui graph export "graph `region' 23b COVID-19 daily ICU beds needed, `region' 3 scenarios, IHME icu_bed_capacity.pdf", replace
	
	
	
	
	* daily hospital admissions, 3 scenarios
	
	twoway (rarea DayAdmLoSmA02S01`region' DayAdmUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayAdmMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayAdmMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayAdmMeSmA02S02`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily hospital admissions) title("COVID-19 daily hospital admissions `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) 
		   
	qui graph save "graph `region' 25 COVID-19 daily hospital admissions, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 26 COVID-19 daily hospital admissions, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	
	* daily ICU beds needed
	
	twoway (rarea DayIcuLoSmA02S01`region' DayIcuUpSmA02S01`region' date, sort color(black*.2)) ///
	(line DayIcuMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayIcuMeSmA02S02`region' date, sort lcolor(green)) ///
	(line DayIcuMeSmA02S03`region' date, sort lcolor(red)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small)) ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily ICU beds needed) title("COVID-19 daily ICU beds needed `region', IHME, 3 scenarios", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(2 "Reference" 3 "Better" 4 "Worse") rows(1)) 
	
	qui graph save "graph `region' 26 COVID-19 daily ICU beds needed, `region' 3 scenarios, IHME.gph", replace
	qui graph export "graph `region' 26 COVID-19 ICU beds needed, `region' 3 scenarios, IHME.pdf", replace
	
	
	
	

	
	
	
	
	* daily hospital-related outcomes
	
	twoway ///
	(line DayBedMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) ///
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Bed" 2 "ICU" 3 "Admission") rows(1)) yscale(titlegap(4))
	
	qui graph save "graph `region' 31a COVID-19 daily hospital-related outcomes, `region' reference scenario, IHME.gph", replace
	qui graph export "graph `region' 31a COVID-19 daily hospital-related outcomes, `region' reference scenario, IHME.pdf", replace
	
	
	
	
	* daily hospital-related outcomes, with all_bed_capacity ICU_bed_capacity
	
	twoway ///
	(line DayBedMeSmA02S01`region' date, sort lcolor(black)) ///
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) ///
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "Bed" 2 "ICU" 3 "Admission") rows(1)) yscale(titlegap(4))
	
	qui graph save "graph `region' 31b COVID-19 daily hospital-related outcomes, `region' reference scenario, IHME all_bed_capacity.gph", replace
	qui graph export "graph `region' 31b COVID-19 daily hospital-related outcomes, `region' reference scenario, IHME all_bed_capacity.pdf", replace
	
	
	
	
	
	
	* daily hospital-related outcomes
	
	twoway ///
	(line DayIcuMeSmA02S01`region' date, sort lcolor(green)) ///
	(line DayAdmMeSmA02S01`region' date, sort lcolor(yellow)) ///
	if date >= td(01jan2020) ///
	, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
	xlabel(, angle(forty_five)) ylabel(, format(%12.0fc) labsize(small))  ylabel(, labsize(small) angle(horizontal)) ///
	ytitle(Daily outcomes) title("COVID-19 daily hospital-related outcomes, `region', IHME, reference scenario", size(medium)) ///
	xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
	legend(order(1 "ICU" 2 "Admission") rows(1)) 
	
	qui graph save "graph `region' 32 COVID-19 daily hospital-related outcomes, `region' reference scenario, IHME, wo beds needed.gph", replace
	qui graph export "graph `region' 32 COVID-19 daily hospital-related outcomes, `region' reference scenario, IHME, wo beds needed.pdf", replace
	
	


}
*






*******************************

* regions together




* daily deaths, with GLOBAL

twoway ///
(line DayDeaMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line DayDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line DayDeaMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 1a COVID-19 daily deaths, regions together, IHME.gph", replace
qui graph export "graph 1a COVID-19 daily deaths, regions together, IHME.pdf", replace




* daily deaths, without GLOBAL

twoway ///
(line DayDeaMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line DayDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily deaths) title("COVID-19 daily deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 1b COVID-19 daily deaths, regions together wo global, IHME.gph", replace
qui graph export "graph 1b COVID-19 daily deaths, regions together wo global, IHME.pdf", replace




* daily infections, with GLOBAL

twoway ///
(line DayINFMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line DayINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line DayINFMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 2a COVID-19 daily infections, regions together, IHME.gph", replace
qui graph export "graph 2a COVID-19 daily infections, regions together, IHME.pdf", replace




* daily infections, without GLOBAL

twoway ///
(line DayINFMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line DayINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line DayINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line DayINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line DayINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line DayINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily infections) title("COVID-19 daily infections, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 2b COVID-19 daily infections, regions together wo global, IHME.gph", replace
qui graph export "graph 2b COVID-19 daily infections, regions together wo global, IHME.pdf", replace





* total deaths, with GLOBAL

twoway ///
(line TotDeaMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line TotDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotDeaMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 3a COVID-19 total deaths, regions together, IHME.gph", replace
qui graph export "graph 3a COVID-19 total deaths, regions together, IHME.pdf", replace



* total deaths, without GLOBAL

twoway ///
(line TotDeaMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line TotDeaMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotDeaMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotDeaMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotDeaMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotDeaMeSmA02S01WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total deaths) title("COVID-19 total deaths, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 3b COVID-19 total deaths, regions together wo global, IHME.gph", replace
qui graph export "graph 3b COVID-19 total deaths, regions together wo global, IHME.pdf", replace





* total infections, with GLOBAL

twoway ///
(line TotINFMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line TotINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
(line TotINFMeSmA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 4a COVID-19 total infections, regions together, IHME.gph", replace
qui graph export "graph 4a COVID-19 total infections, regions together, IHME.pdf", replace



* total infections, without GLOBAL

twoway ///
(line TotINFMeSmA02S01AFRO date, sort lcolor(brown)) ///
(line TotINFMeSmA02S01AMRO date, sort lcolor(red)) ///
(line TotINFMeSmA02S01EMRO date, sort lcolor(gold)) ///
(line TotINFMeSmA02S01EURO date, sort lcolor(green)) ///
(line TotINFMeSmA02S01SEARO date, sort lcolor(cyan)) ///
(line TotINFMeSmA02S01WPRO date, sort lcolor(blue)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%15.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Total infections) title("COVID-19 total infections, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO") size(small) rows (2)) ///
subtitle("without GLOBAL", size(small))

qui graph save "graph 4b COVID-19 total infections, regions together wo global, IHME.gph", replace
qui graph export "graph 4b COVID-19 total infections, regions together wo global, IHME.pdf", replace





* daily cfr, with GLOBAL

twoway ///
(line InfFatalA02S01AFRO date, sort lcolor(brown)) ///
(line InfFatalA02S01AMRO date, sort lcolor(red)) ///
(line InfFatalA02S01EMRO date, sort lcolor(gold)) ///
(line InfFatalA02S01EURO date, sort lcolor(green)) ///
(line InfFatalA02S01SEARO date, sort lcolor(cyan)) ///
(line InfFatalA02S01WPRO date, sort lcolor(blue)) ///
(line InfFatalA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
, xtitle(Date) xlabel(#24, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily cfr, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("with GLOBAL", size(small))

qui graph save "graph 5a COVID-19 daily cfr, regions together, IHME.gph", replace
qui graph export "graph 5a COVID-19 daily cfr, regions together, IHME.pdf", replace




* daily cfr after 2021, with GLOBAL

twoway ///
(line InfFatalA02S01AFRO date, sort lcolor(brown)) ///
(line InfFatalA02S01AMRO date, sort lcolor(red)) ///
(line InfFatalA02S01EMRO date, sort lcolor(gold)) ///
(line InfFatalA02S01EURO date, sort lcolor(green)) ///
(line InfFatalA02S01SEARO date, sort lcolor(cyan)) ///
(line InfFatalA02S01WPRO date, sort lcolor(blue)) ///
(line InfFatalA02S01GLOBAL date, sort lcolor(black) lwidth(thick)) ///
if date >= td(01jan2021) ///
, xtitle(Date) xlabel(#12, format(%tdYY-NN-DD) labsize(small)) xlabel(, grid) xlabel(, grid) ///
xlabel(, angle(forty_five)) ylabel(, format(%9.0fc) labsize(small))  ylabel(, labsize(small) angle(forty_five)) ///
ytitle(Daily CFR) title("COVID-19 daily cfr, WHO regions, IHME", size(medium)) ///
xscale(lwidth(vthin) lcolor(gray*.2)) yscale(lwidth(vthin) lcolor(gray*.2)) legend(region(lcolor(none))) legend(bexpand) ///
legend(order(1 "AFRO" 2 "AMRO" 3 "EMRO" 4 "EURO" 5 "SEARO" 6 "WPRO" 7 "GLOBAL") size(small) rows (2)) ///
subtitle("after 2021, with GLOBAL", size(small))

qui graph save "graph 6a COVID-19 daily cfr, regions together, IHME.gph", replace
qui graph export "graph 6a COVID-19 daily cfr, regions together, IHME.pdf", replace





view "log CovidVisualizedGlobal IHME 3.smcl"

log close

exit, clear




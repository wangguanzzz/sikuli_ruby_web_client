Feature: test sikuli

Scenario: test picture click
* Load SCREEN object from object
* SCREEN click the bin 

@002
Scenario: test right click picture 
* Load SCREEN object from object
* SCREEN right click the bin 


Scenario: test cordinate click
* Load SCREEN object from object
* SCREEN click the bin_pos

@003
Scenario: test cordinate click
* Load SCREEN object from object
* SCREEN double click the bin_pos


@004
Scenario: test type normal string
* Load SCREEN object from object
* SCREEN double click the bin 
* SCREEN click the bin_input
* Assign "abc" to var
* SCREEN enter var

@005
Scenario: save clipboard into variable
* Load SCREEN object from object
* SCREEN double click the bin 
* SCREEN click the bin_input
* SCREEN copy into test_var
* Print test_var

@006
Scenario: screenshot
* SCREEN full screenshot


@007
Scenario: partial screenshot
* SCREEN screenshot 12,87,61,74

@008
Scenario: test region
* Load SCREEN object from object
* SCREEN double click the bin_region

@009
Scenario: start and close app
* SCREEN run calc 
* Wait 3 seconds
* SCREEN close active window

@010
Scenario: wheel operation
*  Load SCREEN object from object
* SCREEN right click the bin
* SCREEN wheel down 3
* Wait 3 seconds
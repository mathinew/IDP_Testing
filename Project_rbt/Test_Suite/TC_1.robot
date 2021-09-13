*** Settings ***
Library    SeleniumLibrary    


*** Test Cases ***
TC1
    Open Browser    https://devcap.tnrtp.org/auth/staff/login    chrome
    Maximize Browser Window
    Input Text    name:userName    plf70
    Input Text    name:password    Amtex123    
    Click Element    xpath://button[@type='submit'] 
    #Get WebElement    css:ul.staff-sidebar h5
    Sleep    5s    
    @{HOME_SIDE_BAR}=    Get Webelements    css:ul.staff-sidebar h5
	FOR    ${item}	IN	@{HOME_SIDE_BAR}
		${SIDE_BAR_TEXT}=    Get Text    ${item}
		log to console	${SIDE_BAR_TEXT}
	END
	Sleep    5s    
	@{HOME_MAIN_MENU}=    Get Webelements    css:div.row div.menu-box p
	FOR    ${item}	IN	@{HOME_MAIN_MENU}
		${MAIN_MENU_TEXT}=    Get Text    ${item}
		log to console	${MAIN_MENU_TEXT}
	END
    Click Element    //p[text()='COVID-19 Assistance Package']    
    Sleep    5s 
    @{CAP_TOP_MENU}=    Get Webelements    css:ul[class*='custom-tab-theme'] a.nav-link
	FOR    ${item}	IN	@{CAP_TOP_MENU}
		${CAP_TOP_MENU_TEXT}=    Get Text    ${item}
		log to console	${CAP_TOP_MENU_TEXT}
	END  
     @{REPORT_HEADING}=    Get Webelements    css:table th
	FOR    ${item}	IN	@{REPORT_HEADING}
		${HEADER}=    Get Text    ${item}
		log to console	${HEADER}
	END  

    







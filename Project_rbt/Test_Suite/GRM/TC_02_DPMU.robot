*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String    


*** Variables ***
${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    css:button.btn_login
@{SIDE_BAR_ACTUAL}=    Create List    Menu    All Grievances    Closed Grievances    Logout    Version 1.1
@{TOP_HEADER_ACTUAL}=    All Grievances    Raise a Grievance
${Staffuser_Input}    xpath://input[@name='username']
${Staff_password}    xpath://input[@name='password']
${DPMU_status}=    Set   New    Assigned    Response    Resolved    Unassigned    Overdue
@{Expected_dpmuEscalated}    Escalated    Offline    Assigned    Response    Resolved    Overdue
@{DPMU_new}    New    Assigned    Response    Resolved    Unassigned
...    Overdue


*** Test Cases ***

TC_01
    @{Side Bar}    Create List    ${EMPTY}
    Open Browser    http://tnrtpgrm.amtex.co/stafflogin    chrome
    Maximize Browser Window
    Input Text    name:username    dmpu
    Input Text    name:password    tnrtpdmpu@1    
    Click Element    css:button.btn_login
    Sleep    5s    
    @{SIDE}    Get WebElements    css:nav#staffsidebar
    Sleep    10s    
    FOR    ${Side_bar}    IN       @{SIDE} 
        ${text}=    Get Text    ${Side_bar}
        Log To Console    ${text}  
        Append To List    ${Side Bar}    ${text}              
    END
    Log To Console    ${Side Bar} 



test
    Open Browser    http://tnrtpgrm.amtex.co/stafflogin    firefox
    Maximize Browser Window
    Input Text    ${Staffuser_Input}    newdpmu2
    Sleep    3s          
    Input Text    ${Staff_password}    Amtex123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    20s   
    @{spmu_status}=    Get WebElements    css:div.custom_row 
    FOR    ${Item}    IN    ${spmu_status}
        ${dpmu_status_text}=    Get Text    ${Item}
        ${Actual_list}=    Remove String Using Regexp    ${dpmu_status_text}    \\d
        @{dpmu_status}=    Split String    ${Actual_list}    \n\n 
     END
     ${Expected_Dpmu_status}    Create List    @{DPMU_status} 
     ${Actual_Dpmu_status}    Create List    @{dpmu_status}
     Lists Should Be Equal    ${Expected_Dpmu_status}    ${Actual_Dpmu_status}
     Sleep    10s    
     Click Element    xpath://div[contains(@class,'gr_nav_menu') and contains(text(),'Escalated')]
     Sleep    10s        
     @{Escalated_status}=    Get WebElements    css:div.custom_row 
     FOR    ${New_Item}    IN    ${Escalated_status}
         ${dpmu_Escalated}=    Get Text    ${New_Item}
         ${Actual_Escalated}=    Remove String Using Regexp    ${dpmu_Escalated}    \\d
         @{dpmu_Escalated_list}=    Split String    ${Actual_Escalated}    \n\n 
     END
     Sleep    2s
     ${Expected_Dpmu_Escalated}    Create List    @{Expected_dpmuEscalated} 
     ${Actual_Dpmu_Escalated}    Create List    @{dpmu_Escalated_list}
        #Lists Should Be Equal    ${Expected_Dpmu_Escalated}    ${Actual_DpmuEscalated_status}
        
testaa
    Open Browser    http://tnrtpgrm.amtex.co/stafflogin    firefox
    Maximize Browser Window
    Input Text    ${Staffuser_Input}    newdpmu2
    Sleep    3s          
    Input Text    ${Staff_password}    Amtex123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    20s   
    Click Element    xpath://div[contains(@class,'gr_nav_menu') and contains(text(),'Escalated')]
    Sleep    15s    
    @{Escalated_status}=    Get WebElements    css:div.custom_row 
    FOR    ${Item}    IN    ${Escalated_status}
        ${dpmu_status_text}=    Get Text    ${Item}
        ${Actual_list}=    Remove String Using Regexp    ${dpmu_status_text}    \\d
        @{dpmu_status}=    Split String    ${Actual_list}    \n\n 
     END
     ${Expected_Dpmu_status}    Create List    @{Dpmu_status} 
     ${Actual_Dpmu_status}    Create List    @{DPMU_status}


abc
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    xpath://input[@name='userName']    newdpmu2
    Sleep    5s       
    Input Text    xpath://input[@name='password']    Amtex123    
    Sleep    2s    
    Click Element    xpath://button[contains(@class,'btn-primary') and text()='Login']    
    Sleep    10s    
    Element Text Should Be    css:div.navbar-header span    TNRTP Staff Portal  
    Sleep    3s    
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='GRM']    
    Sleep    2s    
    ${handles}=    Get Window Handles
    Log To Console    ${handles}  
    Sleep    5s    
    Switch Window    ${handles}[1]  
    Sleep    10s    
    Element Text Should Be    xpath://h6[text()='Grievance Redressal Mechanism']    Grievance Redressal Mechanism    
    #Page Should Contain Textfield    xpath://h6[text()='Grievance Redressal Mechanism']
        

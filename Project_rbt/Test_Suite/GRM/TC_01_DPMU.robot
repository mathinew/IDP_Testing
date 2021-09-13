*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String   
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/GRM_locators.robot
Resource    ../../Resources/GRM_DPMU_locators.robot 
Resource    ../../Resources/GRM_Internaluser_Resources.robot


*** Variables ***
${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    xpath://button[contains(@class,'btn-primary') and text()='Login']
@{SIDE_BAR_ACTUAL}=    Create List    Menu    All Grievances    Closed Grievances    Logout    Version 1.1
@{TOP_HEADER_ACTUAL}=    All Grievances    Raise a Grievance
${Staffuser_Input}    xpath://input[@name='userName']    
${Staff_password}    xpath://input[@name='password']
${DPMU_status}=    Set   New    Assigned    Response    Resolved    Unassigned    Overdue
@{Expected_dpmuEscalated}    Escalated    Offline    Assigned    Response    Resolved    Overdue
@{DPMU_new}    New    Assigned    Response    Resolved    Unassigned
...    Overdue


*** Test Cases ***

TC1
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    newdpmu2
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
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
    

TC2
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    newdpmu2
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
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
    Verify_DPMU_Sidebar
        
TC 3
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    newdpmu2
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s    
    Element Text Should Be    css:div.navbar-header span    TNRTP Staff Portal  
    Sleep    3s    
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='GRM']    
    Sleep    2s    
    ${handles}=    Get Window Handles
    Log To Console    ${handles}  
    Sleep    5s    
    Switch Window    ${handles}[1] 
    Sleep    15s
    DPMU_HomePage_Topbar
    Sleep    3s    
    Verify_DPMU_Sidebar
    Sleep    3s    
    DPMU_OpenGrievances_Header
    
    
        
  

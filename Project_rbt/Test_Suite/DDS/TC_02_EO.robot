*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String   
Library    AutoItLibrary
Library    ExcelLibrary        
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/DDS_Resource.robot
Resource    ../../Resources/DDS_Locators.robot
Resource    ../../Resources/Internal_user.robot




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



*** Test Cases ***

TC
    Open Browser    https://qa-idp.tnrtp.org/auth/login    firefox
    Input Text    xpath://input[@label='User Name']    newdpmu    
    Input Text    xpath://input[@label='Password']    Amtex123  
    Click Element    xpath://button[text()='Login']      
    Sleep    2s    
    Element Should Be Visible    xpath://div[contains(@class,'Toastify') and @role='alert']
    ${aa}=    Get Text    xpath://div[contains(@class,'Toastify') and @role='alert']    
        


TC user
    Open Browser    https://qa-idp.tnrtp.org/auth/login    firefox
    Input Text    xpath://input[@label='User Name']    newdpmu2    
    Input Text    xpath://input[@label='Password']    Amtex123  
    Click Element    xpath://button[text()='Login']      
    Sleep    3s    
    Element Should Be Visible    xpath://div[contains(@class,'Toastify') and @role='alert']
    ${Actual}=    Get Text    xpath://div[contains(@class,'Toastify') and @role='alert']
    ${Expected}=    Set Variable    Your session has expired. Please relogin
    Should Be Equal    ${Actual}    ${Expected}    
       

TC 3
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    xpath://input[@name='userName']    EOED_TIRP_QA_GRM
    Sleep    5s       
    Input Text    xpath://input[@name='password']    Amtex123    
    Sleep    2s    
    Click Element    xpath://button[contains(@class,'btn-primary') and text()='Login']    
    Sleep    10s  
    Select Module    DDS
    Sleep    5s    
    Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    Sleep    10s
    Click View approved report
    Sleep    5s    
    Click Download
    Sleep    10S    
    Win Wait    ("[TITLE:Opening ; CLASS:MozillaDialogClass]","", 10)    
    Sleep    2s
    Win Activate    ("[TITLE:Opening ; CLASS:MozillaDialogClass]")
    Sleep    2s    
    Send    ("{TAB}")
    Sleep    2s    
    Send    ("{TAB}")
    Sleep    2s    
    Send    ("{TAB}")
    Sleep    2s    
    Send    ("{ENTER}")



Excel entry
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    xpath://input[@name='userName']    EOED_TIRP_QA_GRM
    Sleep    5s       
    Input Text    xpath://input[@name='password']    Amtex123    
    Sleep    2s    
    Click Element    xpath://button[contains(@class,'btn-primary') and text()='Login']    
    Sleep    10s  
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS'] 
    Sleep    5s    
    Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    Sleep    15s
     Click Element    xpath://button[@type='button' and text()='Continue Report']    
    Sleep    5s
    Click Institutional data
    Sleep    5s    
    ${row}=    Get Element Count    xpath://table/tbody/tr
    ${col}=    Get Element Count    xpath://table/tbody/tr[1]/td








    
*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String   
Library    AutoItLibrary
Library    ExcelLibrary        
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/DDS_Resource.robot
Resource    ../../Resources/DDS_Locators.robot

*** Variables ***
${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    xpath://button[contains(@class,'btn-primary') and text()='Login']
@{SIDE_BAR_ACTUAL}=    Create List    Menu    All Grievances    Closed Grievances    Logout    Version 1.1
@{TOP_HEADER_ACTUAL}=    All Grievances    Raise a Grievance
${Staffuser_Input}    xpath://input[@name='userName']    
${Staff_password}    xpath://input[@name='password']



*** Keywords ***


New Report
    Element Should Be Visible    xpath://div[@class='message'] 
    
Create Report    
    Click Element    xpath://span[text()='Create DDS Report']
    
Continue Report
    Element Should Be Visible    xpath://button[@type='button' and text()='Continue Report']     
    
Click Continue Report button
    Click Element    xpath://button[@type='button' and text()='Continue Report'] 
    
Create New Version
    Element Should Be Visible    xpath://span[text()='Create DDS Report']        

Click Create New Version
    Click Element    xpath://span[text()='Create DDS Report']        

View Report
    Click Element    xpath://button[text()='View Report']    
      

*** Test Cases ***

Test
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    EOED_ANNUR_QA_DDS
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s  
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS'] 
    Sleep    5s    
    Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    Sleep    10s
    Sleep    10s
    ${Report_Status}=    Get Text    xpath://div[@class='message']//h5[contains(@class,'text-black')]
    Run Keyword If    '${Report_Status}' == 'Click on Create DDS report to upload'   Create Report
    ...     ELSE IF    '${Report_Status}' == ''    Click Continue Report button 
    # # ...     ELSE IF   Create New Version    Click Create New Version
     ...     ELSE    View Report


Test1
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    EOED_ANNUR_QA_DDS
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s  
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS'] 
    Sleep    5s    
    Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    Sleep    10s
    ${No_Report}=    Get Text    xpath://div[@class='message']//h5[contains(@class,'text-black')]
    Run Keyword If    '${No_Report}' == 'Click on Create DDS report to upload'   Create Report
    ...     ELSE IF    '${No_Report}' == ''    Click Continue Report button 
    # # ...     ELSE IF   Create New Version    Click Create New Version
     ...     ELSE    View Report



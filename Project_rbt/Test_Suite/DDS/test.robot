*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    String    
Library    DateTime    
Library    ExcelLibrary    
Resource    ../../Resources/Internal_user.robot
Resource    ../../Resources/UM_Resource.robot
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
${as}    Read data


*** Test Cases ***


testing
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
    Go To    https://qa-idp.tnrtp.org/dds/createReport/249?section=1
    # Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS'] 
    # Sleep    5s    
    # Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    # Sleep    10s    
    # Click Element    xpath://button[@type='button' and text()='Continue Report']    
    # Sleep    10s
    # Socio-economic data_header 
    Sleep    5s     
    Open Excel Document    D:/Workspace/Project_rbt/GRM Scenarios.xlsx    doc_id=doc
    ${Row}=    Set Variable    10
    ${Column}=    Set Variable    1
    FOR    ${Item}    IN RANGE    1    ${Row}+1
        Log To Console    ${Item} 
        ${axc}    Read Excel Cell    ${Item}    col_num=1 
        Log To Console    ${axc}             
    END
    
    # Sleep    10s    
    # Input Text    ${In District}    ${axc}
    

read
    Open Excel Document    D:/Workspace/Project_rbt/Data.xlsx    doc_id=doc
    ${Row}=    Set Variable    10
    ${Column}=    Set Variable    1
    FOR    ${Item}    IN RANGE    2    ${Row}+1
        ${axc}    Read Excel Cell    ${Item}    ${Column} 
        Log To Console    ${axc}             
    END


a1
    Log To Console    ${as}    
     
    



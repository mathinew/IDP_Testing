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



*** Test Cases ***


TC_05_Groups
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SUADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    #Select sidebar    Groups  
    #Sleep    5s   
    Click Element    //button[text()='Add New User']
    Sleep    3s
    Click Element    xpath:(//div[@class='form-group']//div[contains(@class,'container')])[1]
    Sleep    2s            
    Click Element    xpath://div[contains(@class,'menu')]//div//div[text()='DPMU']    
    Sleep    2s    
    Click Element    xpath:(//div[@class='form-group']//div[contains(@class,'container')])[2]
    Sleep    2s
    Click Element    xpath://div[contains(@class,'menu')]//div//div[text()='Y.P']   
    Sleep    2s    
    Click Element    xpath:(//div[@class='form-group']//div[contains(@class,'container')])[3]    
    Sleep    2s    
    Click Element    xpath://div[contains(@class,'menu')]//div//div[text()='Erode']    
    #Sleep    2s    
    #Click Element    xpath:(//div[@class='form-group']//div[contains(@class,'container')])[4]    
    #Sleep    2s    


TC_05_Groups1
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SUADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    #Select sidebar    Groups  
    #Sleep    5s   
    Click Element    //button[text()='Add New User']
    Sleep    3s        
    ${Date_value}    Get Text    xpath://label[text()='Date Created']/following-sibling::span
    ${date_verification}=    Convert Date    ${Date_value}    date_format=%d/%m/%Y
    Log To Console    ${date_verification} 
    ${date}=    Get Current Date    
    Should Be Equal    ${date}    ${date_verification}   
    




 
    
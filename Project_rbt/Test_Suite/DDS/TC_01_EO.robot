*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String   
Library    AutoItLibrary    
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
${DPMU_status}=    Set   New    Assigned    Response    Resolved    Unassigned    Overdue
@{Expected_dpmuEscalated}    Escalated    Offline    Assigned    Response    Resolved    Overdue



*** Test Cases ***
TC 3 DDS Home page without Reports
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    EOED_TIRP_QA_GRM
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s    
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS']    
    Sleep    2s    
    DDS_TopBar  
    DDS_Sidebar
    DDS_Homepage_Withoutreports
    

TC 4 DDS Home page with Draft Reports
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
    Click Element    xpath://button[@type='button' and text()='Continue Report']    
    Sleep    10s
    Total Blocks count
    Sleep    5s     
    @{a1}=    Get WebElements    xpath:(//div[@class='form-row'])[2]
    FOR    ${Item}    IN    ${a1}   
        ${test}=    Get Text    ${Item}
        @{Actual}=    Split String    ${test}    \n
    END
    Socio-economic data_header 
    Input Text    ${In District}    11    
    Input Text    ${Village Panchayat_District}    34234    
    Input Text    ${Village Panchayat_TNRTP}    10001
    Input Text    ${Total Population}    10002
    Input Text    ${Total Population_TNRTP}    10003
    Input Text    ${Male_District}    10004
    Input Text    ${Male_TNRTP}    10005
    Input Text    ${Female_District}    10006
    Input Text    ${Female_TNRTP}    10007
    Input Text    ${Transgender}    10008
    Input Text    ${Transgender_TNRTP}    10009
    Input Text    ${SC}    10010
    Input Text    ${SC_TNRTP}    10011
    Input Text    ${ST}    10012
    Input Text    ${ST_TNRTP}    10013
    Input Text    ${Differently abled Person}    10014
    Input Text    ${Differently abled Person_TNRTP}    10015
    Input Text    ${Muslim}    10016
    Input Text    ${Muslim_TNRTP}    10017
    Input Text    ${Christians}    10018
    Input Text    ${Christians_TNRTP}    10019
    Input Text    ${Others}    10020
    Input Text    ${Others_TNRTP}    10021
    Input Text    ${Women Workers}    10022
    Input Text    ${Women Workers_TNRTP}    10023
    Input Text    ${Women Agriculture Labourers}    10022
    Input Text    ${Women Agriculture Labourers_TNRTP}    10022   
    Click Next
    Check Previous icon
    Sleep    5s    
    Market, Infrastructure & Industrial corridors data_header 
    

TC 02
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    EOED_PERUM_QA_DDS
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s  
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS'] 
    Sleep    5s    
    Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    Sleep    10s    
    Click Element    xpath://button[@type='button' and text()='Continue Report']    
    Sleep    10s
    Click Market, Infrastructure & Industrial corridors    
    Sleep    5s    
    Market, Infrastructure & Industrial corridors data_header 
    Sleep    2s    
    Market_Labels
    Sleep    3s    
    Details on Market Facilities
    Sleep    3s  
    Details on Market Facilities  
    Details on Infrastructure  
    Land use Pattern
    Climatic Zone & Rainfall     
    Details of Industrial corridors
   

TC_03
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    EOED_MELUR_QA_DDS
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s  
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='DDS'] 
    Sleep    5s    
    Click Element    xpath://div[@class='sub-link']//span[text()='DDS Reports']      
    Sleep    10s    
    Click Element    xpath://button[@type='button' and text()='Continue Report']    
    Sleep    10s
    Click Upload Documents
    Sleep    10s    
    Input Text    xpath://textarea[@name='natureOfInformation']    Passing information 
    Sleep    5s   
    Click Element    css:div.upload_text    
    Sleep    2s    
    Wait For Active Window    WindowTitle=File Upload
    Win Activate    File Upload    
    Sleep    5s    
    Send    C:\\Users\\Product\\Downloads\\New.pdf
    Sleep    3s    
    Send    {ENTER}



Test
    ${expect text}=    Create List
    Log To Console    ${expect text}    

    
Sample
    Open Browser    https://qa-idp.tnrtp.org    firefox
    Sleep    10s    
    Maximize Browser Window
    Sleep    2s    
    Input Text    ${Staffuser_Input}    EOED_MELUR_QA_DDS
    Sleep    5s       
    Input Text    ${Staff_password}    Amtex123    
    Sleep    2s    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    10s  
       





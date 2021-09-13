*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    String   
Library    DateTime     
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/GRM_Internaluser_Resources.robot

*** Variables ***

${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    css:button.btn_login
@{SIDE_BAR_ACTUAL}=    Create List    Menu    All Grievances    Closed Grievances    Logout    Version 1.1
@{TOP_HEADER_ACTUAL}=    All Grievances    Raise a Grievance
${Staffuser_Input}    xpath://input[@name='username']
${Staff_password}    xpath://input[@name='password']
@{spmu_list}    GRN    Summary    Raised by    Nature of Complaint    Category    Type    Assigned to    Created on    Due date

*** Test Cases ***

Sample_Cases
    Create new Grievance
    Sleep    5s    
    Element Text Should Be    css:div.green_content h5    Grievance Registered Successfully 
    Page Should Contain Element    css:div.green_content p     
    ${Grievance_id}=     Get Text    css:div.green_content p strong  
    Log To Console    ${Grievance_id}    
    Click Element    css:div.sheet_Header img.close_style
    sleep    5s
    Click Element    xpath:(//div[contains(@class,'TableBody')]//div//div[contains(text(),${Grievance_id})])[1]
    

 Calendar picker
    Open Browser    http://tnrtpgrm.amtex.co/login    chrome
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s   
    Click Element    xpath:(//span[text()='M'])[1]    
    Click Element    css:p.profile_menu    
    Sleep    5s    
    Click Element    css:div.rdt input.form-control
    #Click Element    css:div.rdtPicker div table thead tr th.rdtSwitch
    Sleep    2s    
    #Click Element    css:div.rdtPicker div table thead tr th.rdtSwitch
    ${Expected}=    Set Variable    April 1988    
    ${VALUE}=    Get Text    css:div.rdtPicker div table thead tr th.rdtSwitch 
    Log To Console    ${VALUE}     
    Run Keyword If    '${VALUE}'=='April 1988'    Log To Console    matched
    
 
 
Side bar
    @{Actual}=    Create List    TNRTP Grievance    Menu      
    Log To Console    @{Actual}      
    Open Browser    http://tnrtpgrm.amtex.co/login    chrome
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s   
    @{side_barvalue}=    Create List    
    @{SIDE_BAR}=    Get WebElements    css:#sidebar
    FOR    ${item}    IN    @{SIDE_BAR}
        ${SIDE_BAR_TEXT}=    Get Text    ${item}
        Log To Console    ${SIDE_BAR_TEXT}           
        Append To List    ${side_barvalue}        ${SIDE_BAR_TEXT}
        Log To Console    @{side_barvalue}     
    END  
    Lists Should Be Equal    @{Actual}    @{side_barvalue} 
       
 Regex
       ${test}=    Set Variable    9047838381 
       Should Match Regexp    ${test}    [\d]   Log To Console    sucess  

testing
    Open Browser    http://tnrtpgrm.amtex.co/login    chrome
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s 
    @{GRN_status}  Create List    new    In-progress    Resolved    Escalated
    Sleep    3s    
    FOR     ${Text}    IN    @{GRN_status}
        Log To Console  ${Text}
        Sleep    5s    
        Click Element    xpath://div[contains(text(),'${Text}')]//ancestor::div[contains(@class,'rdt_TableRow')]    
        Sleep    5s    
        Click Element    css:img.close_style
        ${status}  Get WebElements   xpath://div[contains(text(),'${Text}')]
        Sleep   5s
        ${length}   Get Length   ${status}
        Log To Console  ${length}  
     END
     Sleep    2s    
     #Click Element    xpath://div[contains(text(),'${GRN_status}[1]')]//ancestor::div[contains(@class,'rdt_TableRow')]    
     #Click Element    css:img.close_style
     #Sleep    5s           


regex1234
    Open Browser    http://tnrtpgrm.amtex.co/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381  
    Sleep    3s          
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    15s
    ${status}=    Set Variable    new
    #Click Element    xpath:(//div[contains(text(),${text})])[1] 
    Wait Until Element Is Visible    xpath:(//div[text()='${status}'])[2] 
    Sleep    2s    
    #Click Element    xpath:(//div[text()='${status}'])[2]//ancestor::div[contains(@class,'rdt_TableRow')] 
    Click Element    xpath:(//div[contains(text(),'new')]//following::div[starts-with(@id,'cell')][1])[4]       
    Sleep    15s  
    Element Text Should Be    css:div.statusNameStyle    New
    Sleep    5s    
    ${Raised}=    Set Variable    Grievance Raised
    Sleep    2s       
    ${date}=    Get Text    css:
    Verify date_format    ${date}  
    ${status}=    Set Variable    ${Raised}\n${date}     
    Sleep    5s     
    Verify Grievance_Status_withselection    ${status} 
    Sleep    5s    
    Verify Grievance_Status_withoutselection    Grievance In progress
    Sleep    3s    
    Verify Grievance_Status_withoutselection    Grievance Resolved
    Sleep    2s    
    Verify Grievance details Header 
    Sleep    2s
    Sender Details
    Sleep    2s
    Grievance Details
                          
 
test
    Open Browser    http://tnrtpgrm.amtex.co/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381  
    Sleep    3s          
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    15s
    Verify Header
    GRM_Internaluser_Resources.Verify Search
    
    
        
 aa
    Open Browser    http://tnrtpgrm.amtex.co/stafflogin    firefox
    Maximize Browser Window
    Input Text    ${Staffuser_Input}    newspmu 
    Sleep    3s          
    Input Text    ${Staff_password}    Amtex123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    20s   
    @{list}=    Get WebElements    css:div.rdt_TableHeadRow 
    FOR    ${Item}    IN    ${list}
        ${text}=    Get Text    ${Item} 
        @{Actual}=    Split String    ${text}    \n
     END
     Sleep    5s    
     ${Actual_list}    Create List    @{Actual}
     ${spmuheader_expected}    Create List    @{spmu_list}
     Lists Should Be Equal    ${Actual_list}    ${spmuheader_expected}   

                

    
    

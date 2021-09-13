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
@{Spmu_status}    Escalated    Offline    Assigned    Response    Resolved    Overdue

*** Test Cases ***

TC1
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
         

tseting
        Open Browser    http://tnrtpgrm.amtex.co/stafflogin    firefox
        Maximize Browser Window
        Input Text    ${Staffuser_Input}    newspmu 
        Sleep    3s          
        Input Text    ${Staff_password}    Amtex123    
        Click Element    ${LOGIN_BUTTON}    
        Sleep    20s   
        @{list}=    Get WebElements    //div[contains(@class,'statusOffiCard')]/parent::div 
        FOR    ${Item}    IN    ${list}
            ${text}=    Get Text    ${Item} 
            @{Actual}=    Split String    ${text}    \n
        END
        Sleep    5s    
        ${Actual_list}    Create List    @{Actual}
        ${aaa}=    Remove String Using Regexp    ${Actual_list}    \\d    
        

aa
        Open Browser    http://tnrtpgrm.amtex.co/stafflogin    firefox
        Maximize Browser Window
        Input Text    ${Staffuser_Input}    newspmu 
        Sleep    3s          
        Input Text    ${Staff_password}    Amtex123    
        Click Element    ${LOGIN_BUTTON}    
        Sleep    20s   
        @{spmu_status}=    Get WebElements    //div[contains(@class,'statusOffiCard')]/parent::div 
        FOR    ${Item}    IN    ${spmu_status}
            ${spmu_status_text}=    Get Text    ${Item} 
            ${Actual_list}=    Remove String Using Regexp    ${spmu_status_text}    \\d
            @{spmu_status}=    Split String    ${Actual_list}    \n\n  
        END
        ${Expected_Spmu_status}    Create List    @{Spmu_status} 
        ${Actual_Spmu_status}    Create List    @{spmu_status}
        Lists Should Be Equal    ${Expected_Spmu_status}    ${Actual_Spmu_status}    

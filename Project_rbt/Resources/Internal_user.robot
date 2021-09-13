*** Settings ***
Library    SeleniumLibrary   
Library    ../External_libraries/test.py  
Library    String  
Library    Collections                     


*** Variables ***
${USERNAME_INPUT}    css:input#userName
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    xpath://button[contains(@class,'btn-primary') and text()='Login']
${Incorrect password 4 attempts}    Invalid credentials. You have 4 attempts before your account is locked for 30 minutes.
${Incorrect password 3 attempts}    Invalid credentials. You have 4 attempts before your account is locked for 30 minutes.
${Incorrect password 2 attempts}    Invalid credentials. You have 4 attempts before your account is locked for 30 minutes.
${Incorrect password 1 attempts}    Invalid credentials. You have 4 attempts before your account is locked for 30 minutes.
${Account Locked}    Your account is locked due to too many failed login attempts. Please login after some time
${Logout}    Logged out successfully  
${Session_expired}    Your session has expired. Please relogin  
           

*** Keywords ***

Open Browser and maximize
    [Arguments]    ${URL}    ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window
    
Verifications on Login page
    Capture Element Screenshot    xpath://img[@alt='logo']    
    Element Text Should Be    xpath://label[text()='User Name']    User Name    
    Element Text Should Be    xpath://label[text()='Password']    Password    
    Element Text Should Be    xpath://h4[text()='TNRTP - Staff Login']    TNRTP - Staff Login    
       

Login
    [Arguments]    ${URL}    ${Browser}    ${Username_value}    ${Password_value}
    Open Browser and maximize    ${URL}    ${Browser}  
    Sleep    5s          
    Input Text    ${USERNAME_INPUT}    ${Username_value}   
    Sleep    3s     
    Input Text    ${PASSWORD_INPUT}    ${Password_value}    
    Sleep    2s 
    Click Element    ${LOGIN_BUTTON}


Select Module
    [Arguments]    ${Module}
    Click Element    xpath://div[@class='home-card-wrapper']//h5[text()='${Module}']

Toast message
    [Arguments]    ${Expected_Text}
	wait until element is visible	css:.Toastify [role='alert']
	${Message}=		get text	css:.Toastify [role='alert']
	Log to console		${Message}
	Should be Equal As Strings	${Message}	${Expected_Text}

Toast
    wait until element is visible	css:.Toastify [role='alert']
	${Message}=		get text	css:.Toastify [role='alert']
	Log to console		${Message}
	

Logout
    Click Element    xpath://button[@class='dropdown-item']    
    Click Element    xpath://button[text()='Yes, Logout']


Read data
    Excel_write

Compare List values with line
    [Arguments]    ${list}    ${Expected_data}    
    @{Actual_Element}=    Get WebElements    ${list}
    FOR    ${Item}    IN    ${Actual_Element}
        ${text}=    Get Text    ${Item}   
        @{Actual_value}=    Split String    ${text}    \n       
    END
    ${Actual}    Create List    @{Actual_value}
    ${Expected}    Create List    @{Expected_data} 
    Lists Should Be Equal    ${Actual}    ${Expected}
    


Compare List values with space
    [Arguments]    ${list}    ${Expected_data}    
    @{Actual_Element}=    Get WebElements    ${list}
    FOR    ${Item}    IN    ${Actual_Element}
        ${text}=    Get Text    ${Item}   
        @{Actual_value}=    Split String    ${text}          
    END
    ${Actual}    Create List    @{Actual_value}
    ${Expected}    Create List    @{Expected_data} 
    Lists Should Be Equal    ${Actual}    ${Expected}
    


*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String       
Resource    ../../Resources/Internal_user.robot



*** Test Cases ***

Test case for logging out
    Login as Public_user    https://qa-idp.tnrtp.org/auth/login    firefox    EOED_TIRP_QA_GRM    Amtex123
    Sleep    3s    
    Click Element    xpath:(//button[contains(@class,'btn-transparent')])[3]  
    Sleep    3s    
    Click Element    xpath://button[@class='dropdown-item']    
    Click Element    xpath://button[text()='Yes, Logout']  
    Sleep    1s          
    Toast message    ${Logout}  
      

    
Test case for Incorrect password attempts
    Login as Public_user    https://qa-idp.tnrtp.org/auth/login    firefox    NEWSPMU    Amtex1234
    Sleep    2s
    wait until element is visible	css:.Toastify [role='alert']
    ${Message}=		get text	css:.Toastify [role='alert']
    Run Keyword If     "${Message}"=="${Account Locked}"    Log To Console    Account Locked
    ...    ELSE IF    "${Message}"=="${Incorrect password 4 attempts}"    Log To Console    4 Attempts Pending
    ...    ELSE IF    "${Message}"=="${Incorrect password 3 attempts}"    Log To Console    3 Attempts Pending
    ...    ELSE IF    "${Message}"=="${Incorrect password 2 attempts}"    Log To Console    2 Attempts Pending
    ...    ELSE IF    "${Message}"=="${Incorrect password 1 attempts}"    Log To Console    1 Attempts Pending
                 
    
    











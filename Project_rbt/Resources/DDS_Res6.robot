    *** Settings ***
Library  SeleniumLibrary
Library  Collections
Library  String
Variables    ../External libraries/DDS_loc6.py
Library   OperatingSystem

*** Variables ***
${URL}   https://qa-idp.tnrtp.org/auth/login
${BROWSER}    firefox
${Username_value}   EOED_TIRP_QA_GRM
${Password_value}    Amtex123
${CURDI}   C:/User/GRMAutomation
*** Keywords ***

Open Browser and maximize
    #[Arguments]    ${URL}    ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window


Login
    [Arguments]    ${URL}    ${Browser}    ${Username_value}    ${Password_value}
    Open Browser and maximize
    Sleep    5s
    Input Text    ${USERNAME_INPUT}    ${Username_value}
    Sleep    3s
    Input Text    ${PASSWORD_INPUT}    ${Password_value}
    Sleep    2s
    Click Element    ${LOGIN_BUTTON}
    Sleep    10s
    Go To   https://qa-idp.tnrtp.org/dds/createReport/252?section=6
    #Click Element   ${Admin}
    Sleep    10s
    #Click Element   ${Add_New_User}
    #Sleep    5s

Logout
    Close All Browsers

Verify Text
    [Arguments]   ${Title Institu text}   ${expect text}
    Element Should Contain  ${Title Institu text}  ${expect text}

Enter Value
    [Arguments]   ${locator}  ${input text}
    Input Text   ${locator}  ${input text}

Click Button
    [Arguments]  ${locator}
    Click Element  ${locator}

Get Table Header Text
    [Arguments]  ${locator}  @{actual_List}
    @{text}=  Get WebElements   ${locator}
    ${length}  Get Length    ${text}
    @{expect text}=     Create List

    FOR    ${Item}    IN    @{text}
       ${text name}    Get Text    ${Item}
       Append To List  ${expect text}  ${text name}
    END
    Log To Console      ${actual_List}
    Log To Console      ${expect text}
    Sleep    2s
    Lists Should Be Equal    ${actual_List}    ${expect text}
    #Clear List  ${expect text}


Get Row Count
    [Arguments]     ${table_row}
    ${row count}=   Get Element Count  ${table_row}
    [Return]    ${row count}

Get Column Count
    [Arguments]     ${table_colunm}
    ${col count}=    Get Element Count  ${table_colunm}
    [Return]    ${col count}

Validate Table values
    [Arguments]     ${r}    ${c}    ${column_count}     ${input cell}   ${table cell}
    Run Keyword If    ${c} == 2    Log To Console    equals          
        Input Text    ${table cell}//following::tbody/tr[${r}]/td[${c}]//input  ${input cell}
        ELSE IF    3<= ${c} < ${column_count}
        Input Text    ${table cell}//following::tbody/tr[${r}]/td[${c}]//input  ${input cell}
        ELSE    
        ${TNRTB}    Get Element Attribute   ${table cell}//following::tbody/tr[${r}]/td[${c}]//input     value
        Log To Console  ${TNRTB}
    END
    # If   ${c} == 2
    # #IF    ${c} == "2"
        
    # ELSE IF  3<= ${c} < ${column_count}
        # Input Text  ${table cell}//following::tbody/tr[${r}]/td[${c}]//input  ${input cell}
    # ELSE    
        # ${TNRTB}    Get Element Attribute   ${table cell}//following::tbody/tr[${r}]/td[${c}]//input     value
        # Log To Console  ${TNRTB}
    # END

Fill Table Row And Column
     [Arguments]     ${input cell}   ${table_row}    ${table_colunm}     ${table cell}
     ${row_count}=     Get Row Count    ${table_row}
     ${column_count}=     Get Column Count  ${table_colunm}
     Log To Console      ${row_count}
     Log To Console      ${column_count}
     # FOR    ${r}    IN RANGE    1   ${row_count}+1
         # FOR    ${c}    IN RANGE    2    ${column_count}+1
            # Sleep   1s
            # Log To Console        ${table cell}//following::tbody/tr[${r}]/td[${c}]//input
            # #Input Text  xpath://tbody/tr[${r}]/td[${c}]//input  ${input cell}
            # Validate Table values   ${r}   ${c}      ${column_count}    ${input cell}   ${table cell}
         # END
     # END
    FOR    ${r}    IN RANGE    1   ${row_count}+1
    \    Log To Console    ${r}    
         FOR    ${c}    IN RANGE    2    ${column_count}+1
             Sleep   1s
             Log To Console        ${table cell}//following::tbody/tr[${r}]/td[${c}]//input
            #Input Text  xpath://tbody/tr[${r}]/td[${c}]//input  ${input cell}
             Validate Table values    ${r}    ${c}    ${column_count}    ${input cell}    ${table cell}
         END
    END
    



Test IFCOND
    [Arguments]     ${value1}  ${value2}
    Run Keyword If  "${value1}" == "${value2}"      Log To Console      value is equal

Clear List
    [Arguments]     ${list}

    FOR     ${elem}    IN    @{list}
        Remove values from list    ${list}    ${elem}
    END

# Upload file using AutoIT Library:
    # Click Element    css:div.dropzone
    # Wait For Active Window    WindowTitle=File Upload
    # Win Activate    File Upload
    # Sleep    5s
    # Send    C:\\Users\\Product\\Downloads\\New.pdf
    # Sleep    3s
    # Send    {ENTER}


Toast:
   Element Should Be Visible    xpath://div[contains(@class,'Toastify') and @role='alert']
   ${Actual}=    Get Text    xpath://div[contains(@class,'Toastify') and @role='alert']
    ${Expected}=    Set Variable    Your session has expired. Please relogin
    Should Be Equal    ${Actual}    ${Expected}



Get report summary text
    @{text}=  Get WebElements   xpath://div[@class='container-fluid p-0 pb-3']
    FOR    ${Item}    IN    @{text}
       ${text name}    Get Text    ${Item}
       Append To File   ${CURDI}${/}report.txt     ${text name}
    END

Clear Input Text
    [Arguments]     ${locator}
     #Input Text   xpath:(//div[@class='form-group']//div[contains(@class,'container')])[1]   ${EMPTY}
    FOR     ${i}    IN RANGE    2
        Press Keys   ${locator}   \DELETE
    END
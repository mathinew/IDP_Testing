*** Settings ***
Library    SeleniumLibrary    
Library    String    
Library    Collections  
Library    DateTime      
Resource    Internal_user.robot


*** Variables ***
@{Sidebar}=    Users    Groups   Roles    Permissions
@{table_value}    Groups    Description    No    of    Roles    Roles



*** Keywords ***

Home_Page_TopBar
    Element Should Be Visible    xpath://nav//div//i[contains(@class,'icon-home')]    
    Element Should Be Visible    xpath://div[contains(@class,'navbar-header')]    
    
Home_Page_Sidebar
    Element Should Be Visible    xpath://h5[text()='Menu']    
    Element Should Be Visible    xpath://span[text()='User Management']    
        

Actual List with lines
    [Arguments]    ${list}    
    @{Actual_Element}=    Get WebElements    ${list}
    FOR    ${Item}    IN    ${Actual_Element}
        ${text}=    Get Text    ${Item}   
        @{Actual_value}=    Split String    ${text}     \n     
    END
    ${Actual}    Create List    @{Actual_value}
    
   
Actual List with space
    [Arguments]    ${list}    
    @{Actual_Element}=    Get WebElements    ${list}
    FOR    ${Item}    IN    ${Actual_Element}
        ${text}=    Get Text    ${Item}   
        @{Actual_value}=    Split String    ${text}      
    END
    ${Actual}    Create List    @{Actual_value}
    



Compare List
    [Arguments]    ${list}    
    @{Actual_Element}=    Get WebElements    ${list}
    FOR    ${Item}    IN    ${Actual_Element}
        ${text}=    Get Text    ${Item}   
        @{Actual_value}=    Split String    ${text}    \n       
    END
    ${Actual}    Create List    @{Actual_value}
    ${Expected}    Create List    @{Sidebar} 
    Lists Should Be Equal    ${Actual}    ${Expected}

Select sidebar
    [Arguments]    ${value}
    Click Element    xpath://div[@class='sub-link']//span[text()='${value}']    



        
Groups Details
    
    Element Should Be Visible    xpath:(//ul[@class='list-unstyled'])[2]//li//label[text()='Group Name']    
    
Date Created
    ${Date_value}    Get Text    xpath://label[text()='Date Created']/following-sibling::span
    ${date_verification}=    Convert Date    ${Date_value}    date_format=%b %d %Y
    Log To Console    ${date_verification} 




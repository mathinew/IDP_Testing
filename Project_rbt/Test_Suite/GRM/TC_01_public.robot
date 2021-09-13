*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/GRM_locators.robot

*** Variables ***

${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    css:button.btn_login


*** Test Cases ***

TC 1 Public Login
    Open Browser    https://staginggrm.tnrtp.org/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s  
    Verify Public_Side Bar
    Verify Search        
  


TC1- Create New Grievance
    Open Browser    https://staginggrm.tnrtp.org/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s  
    Click Element    css:button.addGrBtn 
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[1]  
    Sleep    2s         
    Click Element    xpath://div[contains(text(),'General')] 
    Sleep    3s    
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[2] 
    Sleep    2s            
    Click Element    xpath://div[text()='Block Level'] 
    Sleep    3s 
    Input Text    xpath://input[@name='summary']    Test_Summary using automation for new scenario 
    Sleep    1s       
    Input Text    xpath://textarea[@name='Description']    Test Description testing using automation  for different scenario  
    Sleep    1s    
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[3]
    Sleep    3s    
    Click Element    xpath://div[text()='Chengalpattu']     
    Sleep    3s    
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[4]
    Sleep    2s  
    Click Element    xpath://div[text()='St.Thomas Mount'] 
    Input Text    xpath://textarea[@name='address']    New address 
    Sleep    2s    
    Click Element    xpath://label[text()='Same as my Residential Address']
    Click Element    css:button.addGrBtn 
    Sleep    2s    
    Page Should Contain Element    css:div#GrievanceDetails    
    Capture Element Screenshot    css:div#GrievanceDetails    
    Capture Element Screenshot    css:div.green_content     
    Page Should Contain Element    css:div.green_content h5 
    Get Text    css:div.green_content h5 
    Page Should Contain Element    css:div.green_content p    
    Get Text    css:div.green_content p   
    Page Should Contain Element    xpath://button[@class='btn btn_Grn' and text()='Download as PDF']    
    Page Should Contain Element    xpath://button[@class='btn btn_Grn' and text()='Print']
    Page Should Contain Element    xpath://p[contains(@class,'PublicViewDetailsHeader') and text()='Sender Details']    
    #Page Should Contain List    css:div.row div table tbody tr td.td_color    
    Sleep    5s    
    Element Text Should Be    css:div.green_content h5    Grievance Registered Successfully 
    Page Should Contain Element    css:div.green_content p     
    ${Grievance_id}=     Get Text    css:div.green_content p strong  
    Sleep    5s       
    Click Element    css:div.sheet_Header img.close_style
    sleep    5s
    Click Element    xpath:(//div[contains(@class,'TableBody')]//div//div[contains(text(),${Grievance_id})])[1]
    New_Grievance Header
    

TC-2
    Open Browser    https://staginggrm.tnrtp.org/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    15s  
    Wait Until Element Is Visible    xpath://div[contains(text(),'Resolved')]//following::div[starts-with(@id,'cell')][1]          
    Click Element    xpath://div[contains(text(),'Resolved')]//following::div[starts-with(@id,'cell')][1]
    Sleep    15s    
    Grievance ID
    Sleep    5s    
    Resolved_Grievance Header
    Sleep    2s    
    Grievace Raised
        




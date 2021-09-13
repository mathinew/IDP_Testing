*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/GRM_locators.robot


*** Test Cases ***
TC
    Open Browser and maximize    URL    Browser
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}
    Sleep    5s 
    Click Element    ${Raise_Grievance}
    Click Element    ${Select_Greivance_Category}  
    Sleep    3s     
    Select Grievance Category    'General' 
    Sleep    3s   
    Click Element    ${Select_LevelofGrievance} 
    Sleep    3s
    Select Level of Grievance Category    'Community Level'   
    Sleep    3s   
    Input Text    ${Grievance_Summay}    Summary: For testing the new Grievance from robot   
    Sleep    3s   
    Input Text    ${Grievance_Description}    Test Description : For testing the new Grievance from robot 
    Sleep    3s   
    Click Element    ${Select_District}
    Sleep    3s   
    Select District    'Chengalpattu'
    Sleep    3s
    Click Element    ${Select_Block}
    Sleep    3s   
    Select Block    'St.Thomas Mount'
    Enter Address    This is my new address
    Sleep    2s    
    Click Element    ${Same as residential}
    Click Element    ${Create Grievance }  
    Sleep    2s    
    #Click Element    css:img.close_style
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


Edit Grievances
    Open Browser and maximize    URL    firefox
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}
    Sleep    15s 
    Wait Until Element Is Visible    (//div[contains(@class,'rdt_TableBody')]//div[contains(text(),'Resolved')])    
    Click Element    xpath:(//div[contains(@class,'rdt_TableBody')]//div[contains(text(),'new')])[1]
    Sleep    10s    
    ${mobile_num}=    Get Text    xpath:(//div[@class='row']//tr//td[@class='table_padding'])[1]
    Log To Console    ${mobile_num}    
    Should Match Regexp    ${mobile_num}    [a-z]    Log To Console    sucess        
    






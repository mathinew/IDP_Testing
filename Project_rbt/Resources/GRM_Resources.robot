*** Settings ***
Library    SeleniumLibrary 
Library    DateTime    
Resource    GRM_locators.robot   


*** Variables ***
${URL}    http://tnrtpgrm.amtex.co/login
${BROWSER}    chrome


*** Keywords ***

Open Browser and maximize
    [Arguments]    ${URL}    ${Browser}
    Open Browser    ${URL}    ${Browser}
    Maximize Browser Window

Login as Public_user
    [Arguments]    ${URL}    ${Browser}    ${Username_value}    ${Password_value}
    Open Browser and maximize    ${URL}    ${Browser}  
    Sleep    5s          
    Input Text    ${USERNAME_INPUT}    ${Username_value}   
    Sleep    3s     
    Input Text    ${PASSWORD_INPUT}    ${Password_value}    
    Sleep    2s 
    Click Element    ${LOGIN_BUTTON}
    Sleep    5s 
    

Select Grievance Category
    [Arguments]    ${category_type}
    
    Click Element    xpath://div[contains(@id,'react-select') and contains(text(),${category_type})]
    #Click Element    xpath://div[contains(text(),${category_type})]

Select Level of Grievance Category
    [Arguments]    ${level of Grievance}
    Click Element    xpath://div[contains(@id,'react-select') and contains(text(),${level of Grievance})]

Select District
    [Arguments]    ${Select District}
    Click Element    xpath://div[contains(@id,'react-select') and contains(text(),${Select District})]
        
Select Block
    [Arguments]    ${Select Block}
    Click Element    xpath://div[contains(@id,'react-select') and contains(text(),${Select Block})] 

Enter Address
    [Arguments]    ${Address}
    Input Text    ${Enter_address}    New address
      

Create new Grievance
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
    Input Text    ${Grievance_Summay}    Summary: My loan amount in not disbursed    
    Sleep    3s   
    Input Text    ${Grievance_Description}    Test Description:My loan amount in not disbursed please check the same
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
    
Grievance ID
    ${Grievance ID}    Get Text    xpath://div[@class='sheet_Header']//span//strong
    Should Match Regexp    ${Grievance ID}    \\AGrievance ID: \nGRN\\d   Log To Console    ${Grievance ID}    
  
    
New_Grievance Header
    Element Should Be Visible    css:div.statusNameStyle    
    

Resolved_Grievance Header
    Element Should Be Visible    xpath://div[contains(@class,'statusNameStyle') and text()='Resolved']    

Grievace Raised      
    Element Text Should Be    xpath://span[@class='processcheckPublicDetails' and text()='Grievance Raised']     Grievance Raised
    Grievance_status date
    Verify Green_icon
        
Grievance_status date
    ${Date_value}    Get Text    xpath://span[@class='processcheckPublicDetails']//span
    ${date_verification}=    Convert Date    ${Date_value}    date_format=%b %d %Y
    Log To Console    ${date_verification}                



Verify mobile_num
    [Arguments]    ${mobile_num}
    ${mobile_num_value}=    Set Variable    ${mobile_num} 
    Should Match Regexp    ${mobile_num_value}    \\d{10}   Log To Console    sucess 
       
        
Verify date_format
    [Arguments]    ${date}    
    ${date_format}=    Set Variable    ${date}
    #Date format with %b - verify month value, %d - verify - date and %Y verify Year with 4 digit
    ${date_verification}=    Convert Date    ${date_format}    date_format=%b %d %Y
    Log To Console    ${date_verification}  

Verify GRN_Num
    [Arguments]    ${GRN_locator}
    ${GRN_number}=    Get Text    ${GRN_Locator}
    Should Match Regexp    ${GRN_number}    \\AGRN\\d[0-9]   Log To Console    ${GRN_number}
     
    
Verify Name_alphanumeric
    [Arguments]    ${Name_locator}
    ${Name}=    Get Text    ${Name_Locator}
    Should Match Regexp    ${Name}    \\W+   Log To Console    ${Name}
    
Verify Green_icon
    Element Should Be Visible    css:img.processCorrectImage      

Verify Grievance_Status_withselection
    [Arguments]    ${Gri_status_locator}
    ${Gri_status}=    Get Text    ${Gri_status_locator}
    Element Text Should Be    xpath://span[@id='processcheckPublicDetails' or @text()='${Gri_status}']    ${Gri_status} 


Verify Grievance_Status_withoutselection
    [Arguments]    ${Gri_InPrg_locator}
    ${Gri_InPrg}=    Get Text    ${Gri_InPrg_locator}
    Element Text Should Be    xpath://div[text()='${Gri_InPrg}']    ${Gri_InPrg}   

 
Verify Grievance details Header
    Element Text Should Be    xpath://strong[text()='Grievance Details']    Grievance Details    

Verify Summary
    [Arguments]    ${Summary_locator}
    ${Summary}=    Get Text    ${Summary_locator}
    Should Match Regexp    ${Summary}    [a-z]{5,100}    

Verify Description
    [Arguments]    ${Description_locator}
    ${Description}=    Get Text    ${Description_locator}
    Should Match Regexp    ${Description}    [a-z]{5,1000} 

Sender Details
    Element Text Should Be    xpath://p[text()='Sender Details']    Sender Details    
    
Grievance Details
    Element Text Should Be    xpath://p[text()='Grievance Details']    Grievance Details  
    
Sender_details_phonenum
    Element Text Should Be    xpath://td[contains(text(),'Phone Number')]    Phone Number  
    ${Phone}=    Get Text    xpath:(//td[@class='table_padding'])[1]
    Should Match Regexp    ${Phone}    \\d{10}
    
Sender_details_District
    Element Text Should Be    xpath://td[text()='District']    District    
    ${Distrct}=    Get Text    xpath:(//td[@class='table_padding'])[2]
    Should Match Regexp    ${Distrct}    [a-z] 

Sender_details_Block
    Element Text Should Be    xpath://td[text()='Block']    Block    
    ${Block}=    Get Text    xpath:(//td[@class='table_padding'])[3]
    Should Match Regexp    ${Block}    [a-z]        
    
Sender_details_Address
    Element Text Should Be    xpath://td[text()='Address']    Address    
    ${Address}=    Get Text    xpath:(//td[@class='table_padding'])[4]
    Should Match Regexp    ${Address}    \\w{1,100}

Grievance_Details_GRN No
    Element Text Should Be    xpath://td[text()='GRN No']    GRN No    
    ${GRN N0}=    Get Text    xpath:(//td[@class='table_padding'])[5]
    Verify GRN_Num    ${GRN N0} 

Grievance_Details_Category
    Element Text Should Be    xpath://td[text()='Category']    Category    
    ${Category}=    Get Text    xpath:(//td[@class='table_padding'])[6]
    Should Match Regexp    ${Category}    [a-z]      

Grievance_Details_Level Of Grievance
    Element Text Should Be    xpath://td[text()='Level Of Grievance']    Level Of Grievance    
    ${Level Of Grievance}=    Get Text    xpath:(//td[@class='table_padding'])[7]
    Should Match Regexp    ${Level Of Grievance}    [a-z] 

 Grievance_Details_Created on
    Element Text Should Be    xpath://td[text()='Created on']    Created on    
    ${Created on}=    Get Text    xpath:(//td[@class='table_padding'])[8]
    Verify date_format    ${Created on}
        
Grievance_Details_Assigned To
    Element Text Should Be    xpath://td[text()='Assigned To ']    Assigned To     
    ${Assigned To }=    Get Text    xpath:(//td[@class='table_padding'])[9]
    Should Match Regexp    ${Assigned To }    [a-z] 

 
 Verify Public_Side Bar
    Element Text Should Be    xpath://div[text()='TNRTP Grievance' and @class='logo_bold']    TNRTP Grievance    
    Element Text Should Be    xpath://div[text()='Menu' and @class='offi_menu']    Menu  
    Element Text Should Be    xpath://div[text()='All Grievances' and contains(@class,'p-Overwrite')]    All Grievances    
    Element Text Should Be    xpath://div[text()='Closed Grievances' and contains(@class,'p-Overwrite')]    Closed Grievances    


Verify Sender_details
    ${Sender_detail}    Get Text    css:span.Userdetail
    Verify mobile_num    ${Sender_detail}
    ${Logo}    Get Text    xpath:(//div[contains(@class,'UserProfile_icon')]//span)[1]
    Should Match Regexp    ${Logo}    [A-Z]{1}        

Verify Header
    Element Text Should Be    xpath://span[@class='PTitle' and text()='All Grievances']    All Grievances 
    Element Text Should Be    xpath://button[@class='btn addGrBtn' and text()='Raise a Grievance']    Raise a Grievance  

Verify Search
    Element Should Be Visible    xpath://img[@alt='logo']    
    Element Should Be Enabled    xpath://input[@id='search' and @type='text']         




       
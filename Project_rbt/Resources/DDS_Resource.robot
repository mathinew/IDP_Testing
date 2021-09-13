*** Settings ***
Library    SeleniumLibrary  
Library    Collections      
Library    String 
Resource    DDS_Locators.robot


*** Keywords ***

DDS_TopBar
    Element Should Be Visible    css:i.icon-home
    Capture Element Screenshot    css:i.icon-home        
    Element Should Be Visible    css:div.navbar-header i    
    Capture Element Screenshot    css:div.navbar-header i      
    Element Should Be Visible    css:i.icon-bell    
    Capture Element Screenshot    css:i.icon-bell        
    
DDS_Sidebar
    Element Text Should Be    css:h5.header    Menu    
    Element Text Should Be    xpath://span[text()='District Diagnose Study']    District Diagnose Study    
    Element Should Be Visible    css:div.link i.icon-file    
    Capture Element Screenshot    css:div.link i.icon-file    
    Element Text Should Be    xpath://span[text()='DDS Report']    DDS Report  
    
     
DDS_Homepage_Withoutreports
    Element Text Should Be    xpath://h3[text()='DDS Report']    DDS Report    
    Element Should Be Visible    xpath://img[@alt='No Reports']    
    Capture Element Screenshot    xpath://img[@alt='No Reports']    
    Element Text Should Be    xpath://h4[text()='No DDS Report']    No DDS Report    
    Element Text Should Be    xpath://h5[text()='Click on Create DDS report to upload']    Click on Create DDS report to upload 
    Element Should Be Enabled    xpath://button[@type='button']//span[text()='Create DDS Report']
    

DDS_Homepage_Draft report
    Element Should Be Enabled    xpath://button[@type='button' and text()='Continue Report']
    Element Should Be Visible    xpath://img[@alt='No Reports']    
    Capture Element Screenshot    xpath://img[@alt='No Reports']      
    Element Should Be Visible    xpath://div[@class='message']//h4[text()='No DDS Report']    
    Element Text Should Be    xpath://span[contains(@class,'dds-badge-draft')]//span    Draft      
    
Click View approved report
    Click Element    xpath://button[@type='button' and text()='View Report']    
    

Click Continue Report
    Click Element    xpath://button[@type='button' and text()='Continue Report']
    
Back to Home page
    Click Element    xpath://i[@class='icon-left-arrow']
    
Click Download
    Click Element    xpath://button[contains(@class,'btn-outline-purple') and text()='Download']    
    
Click Print
    Click Element    xpath://button[contains(@class,'btn-outline-purple') and text()='Print']            


Create DDS Header
    Element Should Be Visible    xpath://span[text()='Create DDS Report']
    
DDS header list
        @{Create_Report_header}=    Get WebElements    xpath:(//div[contains(@class,'report_header-item')]//parent::div)[1]
    FOR    ${Item}    IN    ${Create_Report_header}
        ${Header}=    Get Text    ${Item}
        @{head_list}=    Split String    ${Header}    \n
    END  
    
Socio-economic data_header 
    Element Should Be Visible    xpath://p[contains(text(),'1. Socio-economic data')]  
    Sleep    2s      
    Element Should Be Visible    xpath://div[contains(text(),'1. Socio-economic data')]     

Institutional data data_header 
    Element Should Be Visible    xpath://p[contains(text(),'2. Institutional data')]   
    Sleep    2s     
    Element Should Be Visible    xpath://div[contains(text(),'2. Institutional data')] 
    
Market, Infrastructure & Industrial corridors data_header 
    Element Should Be Visible    xpath://p[contains(text(),'3. Market, Infrastructure & Industrial corridors')]  
    Sleep    2s    
    Element Should Be Visible    xpath://div[contains(text(),'3. Market, Infrastructure & Industrial corridors')]


Banking & Finance data_header 
    Element Should Be Visible    xpath://p[contains(text(),'4. Banking & Finance')]    
    Element Should Be Visible    xpath://div[contains(text(),'4. Banking & Finance')]
 
All updates are saved as draft
    Element Should Be Visible    css:i.icon-tick-circle    
    Element Should Be Visible    xpath://div[contains(text(),'All Updates Saved as Draft')]    
    
Socio-economic_data_Basic
    Element Should Be Visible    xpath://h4[contains(@class,'sectionLabel') and text()='Basic'] 
    Element Should Be Visible    xpath://div[@class='form-group']//label[text()='Name of the District']    
    ${District name}    Get Value    xpath://div[@class='form-group']//input[@label='Name of the District'] 
    Should Match Regexp    ${District name}    [a-z]
    
Create_Socio-economic_data_No of Blocks
    Element Should Be Visible    xpath://div[contains(@class,'sectionLabel') and text()='No.of Blocks'] 
    Element Should Be Visible    xpath:(//div[@class='form-group']//label[(text()='In District')])[1]    
    Element Should Be Enabled    xpath://div[@class='form-group']//input[(@name='blocksInDistrict')]
    
Create_Socio-economic_data_No of Blocks_IN Tnrtp
    Element Should Be Visible    xpath:(//div[@class='form-group']//label[(text()='In TNRTP')])[1]
    

Click Next
    Click Element    //button[@type='submit' and text()='Next']
    

Click Previous
    Click Element    xpath://button[@type='button' and text()='Previous']   
    
Click Socio-economic data
    Click Element    xpath://p[contains(text(),'1. Socio-economic data')]/parent::*//span
    
Click Institutional data
    Click Element    xpath://p[contains(text(),'2. Institutional data')]/parent::*//span    
   
Click Market, Infrastructure & Industrial corridors
    Click Element    xpath://p[contains(text(),'3. Market, Infrastructure & Industrial corridors')]/parent::*//span
    
Click Banking & Finance
    Click Element    xpath://p[contains(text(),'4. Banking & Finance')]/parent::*//span
    
Click Water Resources
    Click Element    xpath://p[contains(text(),'5. Water Resources')]/parent::*//span 
    
Click Activity Details
    Click Element    xpath://p[contains(text(),'6. Activity Details')]/parent::*//span
    
Click Prioritised Commodities & Sub-Sector
    Click Element    xpath://p[contains(text(),'7. Prioritised Commodities & Sub-Sector')]/parent::*//span
    
Click Challenges & Opportunities
    Click Element    xpath://p[contains(text(),'8. Challenges & Opportunities')]/parent::*//span
    
Click Upload Documents
    Click Element    xpath://p[contains(text(),'9. Upload Documents')]/parent::*//span
    
    
Total Blocks count
    ${Block count}    Get Value    xpath://div[@class='form-group']//input[@name='blocksInTNRTP']
    ${Total count}    Convert To Integer    ${Block count}    
    @{Block_list}    Get WebElements    xpath://div[@class='form-group']//input[@name='ddsSocialBlocks']
    ${No of Blocks}    Get Length    ${Block_list}
    Should Be Equal    ${Total count}    ${No of Blocks}
    
Check Previous icon
    Element Should Be Visible    xpath://button[@type='button' and text()='Previous']    
         

Enter Socio-Economic data
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

    
Market_Labels
    Element Should Be Visible    xpath://div[contains(@class,'sectionLabel') and contains(text(),'Details on Market Facilities')]  
    Element Should Be Visible    xpath://div[contains(@class,'sectionLabel') and contains(text(),'Details on Infrastructure')]    
    Element Should Be Visible    xpath://div[contains(@class,'sectionLabel') and contains(text(),'Land use Pattern')]    
    Element Should Be Visible    xpath://div[contains(@class,'sectionLabel') and contains(text(),'Climatic Zone & Rainfall')]    
    Element Should Be Visible    xpath://div[contains(@class,'sectionLabel') and contains(text(),'Details of Industrial corridors')]      

1_Basic
    @{Basic}=    Get WebElements    xpath://h4[contains(text(),'Basic')]/parent::div
    FOR    ${Item}    IN    ${Basic}
        ${text}=    Get Text    ${Item}
        @{Basic_text}=    Split String    ${text}    \n    
    END
    @{Actual_Basic}=    Create List    Basic    Name of the District
    ${Actual_Basic_text}=    Create List    @{Actual_Basic}
    ${Expected_Basic}=    Create List    @{Basic_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_Basic_text}    ${Expected_Basic}

1_No of Village Panchayat
    @{No. of Village Panchayat}=    Get WebElements    xpath://div[contains(text(),'No. of Blocks')]/parent::div
    FOR    ${Item}    IN    ${No. of Village Panchayat}
        ${text}=    Get Text    ${Item}
        @{No. of Village Panchayat_text}=    Split String    ${text}    \n    
    END
    ${Expected_No. of Village Panchayat}=    Create List    @{No. of Village Panchayat_text}
    @{Actual_No. of Village Panchayat}=    Create List    Total Population    Total Population    Total Population (In TNRTP Blocks)    No. of Male    No. of Male (In TNRTP Blocks)    No. of Female    No. of Female (In TNRTP Blocks)    No. of Transgender    
    ${Actual_No. of Village Panchayat}=    Create List    @{Actual_No. of Village Panchayat}
    Lists Should Be Equal    ${Actual_No. of Village Panchayat}    ${Expected_No. of Village Panchayat}   


Details on Market Facilities
    @{Details on Market}=    Get WebElements    xpath://div[contains(text(),'Details on Market Facilities')]/parent::div
    FOR    ${Item}    IN    ${Details on Market}
        ${text}=    Get Text    ${Item}
        @{Details on Market_text}=    Split String    ${text}    \n    
    END
    @{actual}=    Create List    Details on Market Facilities    No. of local Sandais    No. of Uzhavar Sandais    Regulated markets (APMC)    Wholesale markets (Traders)    Co-op marketing societies
    ${actual_text}=    Create List    @{actual}
    ${Expected_label}=    Create List    @{Details on Market_text}
    Sleep    3s    
    Lists Should Be Equal    ${actual_text}    ${Expected_label}  
   
Details on Infrastructure
    @{Infrastructure}=    Get WebElements    xpath://div[contains(text(),'Details on Infrastructure')]/parent::div
    FOR    ${Item}    IN    ${Infrastructure}
        ${text}=    Get Text    ${Item}
        @{Details on Infrastructure_text}=    Split String    ${text}    \n    
    END
    @{Actual_Market value}=    Create List    Details on Infrastructure    No. of Godowns    No. of Cold Storage
    ${Actual_text}=    Create List    @{Actual_Market value}
    ${Expected_text}=    Create List    @{Details on Infrastructure_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_text}    ${Expected_text}   
   
   
Land use Pattern
    @{Land use Pattern}=    Get WebElements    xpath://div[contains(text(),'Land use Pattern')]/parent::div
    FOR    ${Item}    IN    ${Land use Pattern}
        ${text}=    Get Text    ${Item}
        @{Land use Pattern_text}=    Split String    ${text}    \n    
    END
    @{Actual_List}=    Create List    Land use Pattern    Cultivated Land (ha.)    Uncultivated Lands (ha.)    Irrigated Land (ha.)    Non agri Usage (ha.)    Forest (ha.)
    ${Actual_Land use Pattern}=    Create List    @{Actual_List}
    ${Expected_Land use Pattern}=    Create List    @{Land use Pattern_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_Land use Pattern}    ${Expected_Land use Pattern}  
    

Climatic Zone & Rainfall
        @{Climatic Zone & Rainfall}=    Get WebElements    xpath://div[contains(text(),'Climatic Zone & Rainfall')]/parent::div
    FOR    ${Item}    IN    ${Climatic Zone & Rainfall}
        ${text}=    Get Text    ${Item}
        @{Climatic Zone & Rainfall_text}=    Split String    ${text}    \n    
    END
    @{Actual_text}=    Create List    Climatic Zone & Rainfall    Climatic Zone    Select...    Total Rainfall (cm)
    ${Actual_Climatic Zone & Rainfall}=    Create List    @{Actual_text}
    ${Expected_Climatic Zone & Rainfall}=    Create List    @{Climatic Zone & Rainfall_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_Climatic Zone & Rainfall}    ${Expected_Climatic Zone & Rainfall}  
    

Details of Industrial corridors
    @{Details of Industrial corridors}=    Get WebElements    xpath://div[contains(text(),'Details of Industrial corridors')]/parent::div
    FOR    ${Item}    IN    ${Details of Industrial corridors}
        ${text}=    Get Text    ${Item}
        @{Details of Industrial corridors_text}=    Split String    ${text}    \n    
    END
    @{Actual_text}=    Create List    Details of Industrial corridors    No. of SIPCOT    No. of Industrial Parks    No. of Special Economic Zones    No. of Industrial Clusters
    ${Actual_Details of Industrial corridors}=    Create List    @{Actual_text}
    ${Expected_Details of Industrial corridors}=    Create List    @{Details of Industrial corridors_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_Details of Industrial corridors}    ${Expected_Details of Industrial corridors} 

    
Water Resources details
    @{Water resource details}=    Get WebElements    xpath://div[contains(text(),'Water resource details')]/parent::div
    FOR    ${Item}    IN    ${Water resource details}
        ${text}=    Get Text    ${Item}
        @{Water resource details_text}=    Split String    ${text}    \n    
    END
    @{Actual_text}=    Create List    Water resource details    No. of Reservoirs/Dam    No. of Lakes    No. of Ponds    No. of Rivers    Select...
    ${Actual_Water resource details}=    Create List    @{Actual_text}
    ${Expected_Water resource details}=    Create List    @{Water resource details_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_Water resource details}    ${Expected_Water resource details}  

Socio economic 
    @{Basic}=    Get WebElements    xpath://h4[contains(text(),'Basic')]/parent::div
    FOR    ${Item}    IN    ${Basic}
        ${text}=    Get Text    ${Item}
        @{Basic_text}=    Split String    ${text}    \n    
    END
    @{Actual_Basic}=    Create List    Details on Market Facilities    No. of local Sandais    No. of Uzhavar Sandais    Regulated markets (APMC)    Wholesale markets (Traders)    Co-op marketing societies
    ${Actual_Basic_text}=    Create List    @{Actual_Basic}
    ${Expected_Basic}=    Create List    @{Basic_text}
    Sleep    3s    
    Lists Should Be Equal    ${Actual_Basic_text}    ${Expected_Basic} 
    #No of blocks
    @{No. of Blocks}=    Get WebElements    xpath://div[contains(text(),'No. of Blocks')]/parent::div
    FOR    ${Item}    IN    ${No. of Blocks}
        ${text}=    Get Text    ${Item}
        @{No. of Blocks_text}=    Split String    ${text}    \n    
    END
    ${Expected_No. of Blocks}=    Create List    @{No. of Blocks_text}
    #No. of Village Panchayat
    @{No. of Village Panchayat}=    Get WebElements    xpath://div[contains(text(),'No. of Blocks')]/parent::div
    FOR    ${Item}    IN    ${No. of Village Panchayat}
        ${text}=    Get Text    ${Item}
        @{No. of Village Panchayat_text}=    Split String    ${text}    \n    
    END
    ${Expected_No. of Village Panchayat}=    Create List    @{No. of Village Panchayat_text}
    #Total Population
    @{No. of Village Panchayat}=    Get WebElements    xpath://div[contains(text(),'Total Population')]/parent::div
    FOR    ${Item}    IN    ${No. of Village Panchayat}
        ${text}=    Get Text    ${Item}
        @{No. of Village Panchayat_text}=    Split String    ${text}    \n    
    END
    ${Expected_No. of Village Panchayat}=    Create List    @{No. of Village Panchayat_text}
    #No. of Minority
    @{No. of Minority}=    Get WebElements    xpath://div[contains(text(),'Total Population')]/parent::div
    FOR    ${Item}    IN    ${No. of Minority}
        ${text}=    Get Text    ${Item}
        @{No. of Minority_text}=    Split String    ${text}    \n    
    END
    ${Expected_No. of Minority}=    Create List    @{No. of Minority_text}
    #Occupation Profile
    @{Occupation Profile}=    Get WebElements    xpath://div[contains(text(),'Total Population')]/parent::div
    FOR    ${Item}    IN    ${Occupation Profile}
        ${text}=    Get Text    ${Item}
        @{Occupation Profile_text}=    Split String    ${text}    \n    
    END
    ${Expected_Occupation Profile}=    Create List    @{Occupation Profile_text}

    
Get Form Header text
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
    Sleep    3s
    Lists Should Be Equal    ${actual_List}    ${expect text}










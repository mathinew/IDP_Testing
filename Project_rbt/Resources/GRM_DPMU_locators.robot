*** Settings ***
Library    SeleniumLibrary 
Library    DateTime    
Library    String    
Resource    GRM_locators.robot  


*** Keywords ***

 
DPMU_HomePage_Topbar
    Element Should Be Visible    css:img.HeaderHome 
    Capture Element Screenshot    css:img.HeaderHome      
    Element Should Be Visible    css:img.grmIcon    
    Capture Element Screenshot    css:img.grmIcon 
    Element Text Should Be    xpath://h6[text()='Grievance Redressal Mechanism']    Grievance Redressal Mechanism 
 
Notification
    Element Should Be Visible    css:img.notificationIcon    
    Capture Element Screenshot    css:img.notificationIcon 
    
User_details 
    Element Text Should Be    css:span.username    DPMU     
    Element Should Be Visible    css:div.userdetail    
    Element Should Be Visible    css:img.UserHeadericon   

DPMU_Home_page_menu
    #Element Should Be Visible    xpath://div[contains(@class,'offi_menu') and text()='Menu']
    Element Text Should Be    xpath://div[contains(@class,'offi_menu') and text()='Menu']    Menu     

Logout
    Element Should Be Visible    xpath://p[contains(@class,'logout_btn') and text()=' Logout']
    
Version
    Element Text Should Be    xpath://div[contains(@class,'version') and contains(text(),'Version')]    Version 1.1    
    
DPMU_Sidebar_AllGRN
    ${All_Grievance}=    Get Text    xpath://div[contains(@class,'menu_text') and contains(text(),'All Grievances')]
    Log to Console    ${All_Grievance}
    Should Match Regexp    ${All_Grievance}    \\AAll Grievances-\\d 
    Element Should Be Visible    css:img.small_offi_filelogo   

Grievance Escalated
    ${Escalated}=    Get Text    xpath://div[contains(@class,'gr_nav_menu') and contains(text(),'Escalated-')]
    Log To Console    ${Escalated}    
    Should Match Regexp    ${Escalated}    \\AEscalated-\\d    

Grievance Abuse/Corruption      
    ${Abuse/Corruption}=    Get Text    //div[contains(@class,'gr_nav_menu') and contains(text(),'Abuse/Corruption-')]
    Log To Console    ${Abuse/Corruption}    
    Should Match Regexp    ${Abuse/Corruption}    \\AAbuse/Corruption-\\d 
    
DPMU_Sidebar_Open
    ${Open_Grievance}=    Get Text    xpath://div[contains(@class,'gr_nav_menu') and contains(text(),'Open')]
    Log to Console    ${Open_Grievance}
    Should Match Regexp    ${Open_Grievance}    \\AOpen-\\d 
    
DPMU_Sidebar_Escalated
    ${Escalated_Grievance}=    Get Text    xpath://div[contains(@class,'gr_nav_menu') and contains(text(),'Escalated')]
    Log to Console    ${Escalated_Grievance}
    Should Match Regexp    ${Escalated_Grievance}    \\AEscalated-\\d    
    
DPMU_Sidebar_Closed
    Element Text Should Be    xpath://div[contains(@class,'menu_text') and text()='Closed Grievances']    Closed Grievances
 

DPMU_OpenGrievances_Header
    ${value}    Get Text    css:div.offi_header_text
    Should Match Regexp    ${value}    \\AOpen Grievances - \\d

#DPMU_Header_Open
    #${test}    css:div.offi_table_header
    #Should Match Regexp    ${test}    \\Anew - \\d    

SPMU_Dashboard
    Element Should Be Visible    xpath://div[@class='menu_text' and text()='Dashboard']    
    Element Should Be Visible    xpath:(//img[contains(@class,'dashboardLogo')])[1]    

Reports
    Element Text Should Be    xpath://div[contains(@class,'menu_text') and text()='Reports']    Reports  

Verify Search
    Element Should Be Visible    xpath://img[@alt='logo']    
    Element Should Be Enabled    xpath://input[@id='search' and @type='text']  

Compare list
    @{list}=    Get WebElements    css:css:div.rdt_TableHeadRow 
    FOR    ${Item}    IN    ${list}
        ${text}=    Get Text    ${Item} 
        @{Actual}=    Split String    ${text}    \n
     END
     Sleep    5s    
     ${Actual_list}    Create List    @{Actual}
     #Lists Should Be Equal    ${Actual_list}    ${spmu_header}

Verify_DPMU_Sidebar
       DPMU_Home_page_menu
       DPMU_Sidebar_AllGRN
       DPMU_Sidebar_Open
       DPMU_Sidebar_Escalated
       DPMU_Sidebar_Closed
       Reports
       
       
       
       
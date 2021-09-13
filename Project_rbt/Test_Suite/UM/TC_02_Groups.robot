*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    String    
Resource    ../../Resources/Internal_user.robot
Resource    ../../Resources/UM_Resource.robot
Resource    ../../Resources/UM_Locators.robot


*** Test Cases ***

TC_01
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SYADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    Select sidebar    Groups


TC_02
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SYADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    Select sidebar    Groups
    Sleep    2s       
    Compare list values    xpath:(//td[text()='Admin'])[1]//following::td[3]    ${Admin_list}
    Sleep    3s    
    Compare list values    xpath:(//td[text()='SPMU'])[1]//following::td[3]    ${SPMU_list}
    Sleep    3s    
    Compare list values    xpath:(//td[text()='DPMU'])[1]//following::td[3]    ${DPMU_list}
    Sleep    3s    
    Compare list values    xpath:(//td[text()='BPMU'])[1]//following::td[3]    ${BPMU_list}
    Sleep    3s       
    Compare list values    xpath:(//td[text()='Field Staff'])[1]//following::td[3]    ${Field Staff_list}  
    Sleep    3s    
    Compare list values    xpath:(//td[text()='Community'])[1]//following::td[3]    ${Community_list}
    Sleep    3s
    Compare list values    xpath:(//td[text()='Enterprise'])[1]//following::td[3]    ${Enterprise_list}
    Sleep    3s   
    Compare list values    xpath:(//td[text()='Supporting Consultants'])[1]//following::td[3]    ${Supporting Consultants_list}
    Sleep    3s     
    Compare list values    xpath:(//td[text()='WB Consultants'])[1]//following::td[3]    ${WB Consultants_list}    
    Sleep    3s    
    Compare list values    xpath:(//td[text()='Others'])[1]//following::td[3]    ${Others_list}
    

TC_03_Groups
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SYADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    Select sidebar    Groups  
    Sleep    5s   
    Compare list values    xpath://div[@class='header-container']//h4    ${Group-Count}
    Sleep    3s     
    Element Should Be Visible    xpath://input[@placeholder='Search Group, Role']    
    Sleep    3s    
    Compare list values    xpath:(//tr[@role='row'])[1]    ${table_value}
    Sleep    3s    
    Compare list values    xpath:(//tr[@role='row'])[2]    ${Admin}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[3]    ${SPMU}    
    Sleep    3s        
    Compare list values    xpath:(//tr[@role='row'])[4]    ${DPMU}
    Sleep    3s    
    Compare list values    xpath:(//tr[@role='row'])[5]    ${BPMU}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[6]    ${Field Staff}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[7]    ${Community}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[8]    ${Enterprise}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[9]    ${Supporting Consultants}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[10]    ${WB Consultants}
    Sleep    3s
    Compare list values    xpath:(//tr[@role='row'])[11]    ${Others}


TC_04_Group Details
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SYADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    Select sidebar    Groups  
    Sleep    5s  
    Click Element    xpath:(//tr[@role='row'])[2]//td[text()='Admin'][1]   
    Sleep    3s    
    Element Text Should Be    xpath://h5[text()='Group Details']    Group Details    
    Sleep    2s    
    Element Should Be Visible    xpath://span[@class='icon-close-dark']    
    Click Element    xpath://span[@class='icon-close-dark'] 
    Sleep    2s    
    ${Group}    Set Variable    Admin
    Click Element    xpath:(//tr[@role='row'])[2]//td[text()='${Group}'][1]
    #Element Should Be Visible    xpath://span[text()='SPMU']       
    #Actual List    xpath:(//ul[@class='list-unstyled'])[2]
    Sleep    3s    
    Element Should Be Visible    xpath://label[text()='Group Name'] 
    Element Should Be Visible    xpath:(//label[text()='Group Name']//following::span[text()='Admin'])[1]
    Element Should Be Visible    xpath://label[text()='Description']
    Element Should Be Visible    xpath:(//label[text()='Description']//following::span[text()='Admin'])
    Element Should Be Visible    xpath://label[text()='No of Roles']    
    Element Should Be Visible    xpath://span[text()='2']
    Element Should Be Visible    xpath://label[text()='Date Created']    
    Element Should Be Visible    xpath://label[text()='Created By']
    Element Should Be Visible    xppath://span[contains(@class,'groups-header') and text()='Roles']
    Sleep    2s        
    ${a}    Get Text    xpath://ul/following::span[contains(@class,'roles-section')]
        
       
TC_05_Groups
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SUADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    Select sidebar    Groups 
    Sleep    5s    
    ${Group}    Set Variable    Admin
    Click Element    xpath:(//tr[@role='row'])[2]//td[text()='${Group}'][1]
    Sleep    3s    
    Compare list values    ${Actual_List}    ${Admin_Details}
    Sleep    3s    
    Click Element    xpath://span[@class='icon-close-dark']    
    Sleep    5s    
    ${Group_Name}    Set Variable    SPMU
    Click Element    xpath:(//tr[@role='row'])[3]//td[text()='${Group_Name}'][1]   
    Sleep    3s
    Compare list values    ${Actual_List}    ${SPMU_Details}
    Sleep    3s    
    Click Element    xpath://span[@class='icon-close-dark']
    Sleep    3s    
    ${Group_Name}    Set Variable    DPMU
    Click Element    xpath:(//tr[@role='row'])[4]//td[text()='${Group_Name}'][1]
    Sleep    3s    
    Compare list values    ${Actual_List}    ${DPMU_Details}
    Sleep    5s    
    Click Element    xpath://span[@class='icon-close-dark']
    Sleep    2s    
    ${Group_Name}    Set Variable    BPMU
    Click Element    xpath:(//tr[@role='row'])[5]//td[text()='${Group_Name}'][1]
    Sleep    3s    
    Compare list values    ${Actual_List}    ${BPMU_Details}
    Sleep    3s
    Click Element    xpath://span[@class='icon-close-dark']
    Sleep    2s       
    ${Group_Name}    Set Variable    Field Staff
    Click Element    xpath:(//tr[@role='row'])[6]//td[text()='${Group_Name}'][1]
    Sleep    3s    
    Compare list values    ${Actual_List}    ${Field Staff_Details}
    Sleep    3s    
    Click Element    xpath://span[@class='icon-close-dark']
    Sleep    3s
    ${Group}    Set Variable    Community
    Click Element    xpath:(//tr[@role='row'])[7]//td[text()='${Group}'][1]
    Sleep    3s    
    #Actual List    ${Actual_List}
    Compare list values    ${Actual_List}    ${Community_Details}
    Sleep    3s    
    Click Element    xpath://span[@class='icon-close-dark']    
    Sleep    3s    
    ${Group}    Set Variable    Enterprise
    Click Element    xpath:(//tr[@role='row'])[8]//td[text()='${Group}'][1]
    Sleep    3s    
    #Actual List    ${Actual_List}
    Compare list values    ${Actual_List}    ${Enterprise__Details}
    Sleep    3s    
    Click Element    xpath://span[@class='icon-close-dark'] 
    Sleep    3s    
    ${Group}    Set Variable    Supporting Consultants
    Click Element    xpath:(//tr[@role='row'])[9]//td[text()='${Group}'][1]
    Sleep    3s    
    #Actual List    ${Actual_List}
    Compare list values    ${Actual_List}    ${Supporting Consultants__Details}
    Sleep    3s
    Click Element    xpath://span[@class='icon-close-dark']
    Sleep    3s   
    ${Group}    Set Variable    WB Consultants
    Click Element    xpath:(//tr[@role='row'])[10]//td[text()='${Group}'][1]
    Sleep    3s    
    #Actual List    ${Actual_List}
    Compare list values    ${Actual_List}    ${WB Consultants__Details}
    Sleep    3s    
    Click Element    xpath://span[@class='icon-close-dark']
    Sleep    3s    
    ${Group}    Set Variable    Others
    Click Element    xpath:(//tr[@role='row'])[11]//td[text()='${Group}'][1]
    Sleep    3s    
    #Actual List    ${Actual_List}
    Compare list values    ${Actual_List}    ${Others_Details} 
    




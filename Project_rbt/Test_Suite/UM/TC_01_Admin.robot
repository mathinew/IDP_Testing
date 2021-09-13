*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    String    
Resource    ../../Resources/Internal_user.robot
Resource    ../../Resources/UM_Resource.robot


*** Variables ***
@{Sidebar}=    Users    Groups   Roles    Permissions


*** Test Cases ***
TC_01 Login
    Open Browser and maximize    https://qa-idp.tnrtp.org/    firefox
    Verifications on Login page
    Sleep    5s    
    Close Browser
    
    
TC_02
    Login as Public_user    https://qa-idp.tnrtp.org/    firefox    SYADM_QA    tnrtpadmin@1
    Sleep    3s    
    Select Module    Admin
    Sleep    2s    
    Element Should Be Visible    xpath://h5[text()='Menu']    
    Element Should Be Visible    xpath://span[text()='User Management']
    Compare List    xpath://div[@class='collapse show']       
         





    




    
    

    










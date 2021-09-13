*** Settings ***
Library    SeleniumLibrary    
Resource    ../../Resources/GRM_Resources.robot
Resource    ../../Resources/GRM_locators.robot

*** Test Cases ***

testing
    #Open Browser and maximize    http://tnrtpgrm.amtex.co/login    firefox 
    Login as Public_user    http://tnrtpgrm.amtex.co/login    firefox    9047838381    Amtex@123
    #Should Match Regexp    ${test}    \d   Log To Console    sucess





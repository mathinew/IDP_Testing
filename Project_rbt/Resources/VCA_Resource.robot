*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    String    
Resource    Internal_user.robot


*** Keywords ***


Select_Farm_commodity
    [Arguments]    ${Commodity_name}
    Click Element    xpath://div[contains(@class,'menu')]//div//div[text()='${Commodity_name}'] 





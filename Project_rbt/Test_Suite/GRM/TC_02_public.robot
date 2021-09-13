*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Resource    ../../Resources/GRM_Resources.robot

*** Variables ***

${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    css:button.btn_login



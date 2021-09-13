*** Settings ***
Library    SeleniumLibrary    


*** Variables ***
${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    css:button.btn_login
${Raise_Grievance}    css:button[class='btn addGrBtn']
${Select_Greivance_Category}    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[1]
${Select_LevelofGrievance}    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[2]
${Grievance_Summay}    xpath://input[@name='summary']
${Grievance_Description}    xpath://textarea[@name='Description']
${Select_District}    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[3]
${Select_Block}    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[4]
${Enter_address}    xpath://textarea[@name='address']
${Same as residential}    xpath://label[text()='same as my Residential Address']
${Create Grievance }    xpath://button[@class='btn addGrBtn']







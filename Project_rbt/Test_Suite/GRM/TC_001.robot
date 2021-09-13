*** Settings ***
Library    SeleniumLibrary      
Library    Collections    
Library    AutoItLibrary
Resource    ../../Resources/GRM_Resources.robot

*** Variables ***

${USERNAME_INPUT}    css:input#mobilenumber
${PASSWORD_INPUT}    css:input#password
${LOGIN_BUTTON}    css:button.btn_login


*** Test Cases ***
TC_001 - TC_007 - Login
    Open Browser    https://idp-qa-grm.tnrtp.org/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s    
    
TC_002_Profile creation
    Page Should Contain    Profile Information    
    Input Text    id:Name    Mathiyarasi.C    
    Input Text    id:Email    mathiyarasi@amtexsystems.com    
    Sleep    2s  
    Click Element    css:div.form-group div[class*='singleValue']    
    Click Element    xpath://div[text()='Female']    
    #Input Text    id:react-select-2-input    Female
    Sleep    1s    
    #Select From List By Label    gender    Female
    #Select From List By Index    css:div.form-group div[class*='singleValue']    1
    Input Text    id:SHGName    asdfasdfasdfas
    Input Text    id:shgCode    12345678912345
    Input Text    id:EMathiCode    1234567891234123  
    #Click Element    css:div input[id='react-select-3-input']
    #Click Element    xpath://div[text()='Chengalpattu']

    Input Text    id:CommunicationAddress    This is my new adress 
    Click Element    css:input.btn-success 
    Page Should Contain Element    xpath://div[text()='Profile created Successfully']                
        
TC_003_Home_page

    @{SIDE_BAR}=    Get WebElements    css:#sidebar
    FOR    ${item}    IN    @{SIDE_BAR}
        ${SIDE_BAR_TEXT}=    Get Text    ${item}        
    END
    #Header text
    @{HEADER}=    Get WebElements    css:div.PublicHeaderBlock_Wrapper
    FOR    ${item}    IN    @{HEADER}
        ${HEADER_TEXT}=    Get Text    ${item}        
    END
    #Top bar text
    @{PUBLIC_TOP_HEADER}=    Get WebElements    css:div.Publictop_headerInner div
    FOR    ${item}    IN    @{PUBLIC_TOP_HEADER}
        ${PUBLIC_TOP_HEADER}=    Get Text    ${item}        
    END
    

TC_004_Raise _Grievances
    Open Browser    https://idp-qa-grm.tnrtp.org/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s  
    Click Element    css:button.addGrBtn 
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[1]  
    Sleep    2s         
    Click Element    xpath://div[contains(text(),'General')] 
    Sleep    3s    
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[2] 
    Sleep    2s            
    Click Element    xpath://div[text()='Block Level'] 
    Sleep    3s 
    Input Text    xpath://input[@name='summary']    Test_Summary using automation for new scenario 
    Sleep    1s       
    Input Text    xpath://textarea[@name='Description']    Test Description testing using automation  for different scenario  
    Sleep    1s    
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[3]
    Sleep    3s    
    Click Element    xpath://div[text()='Chengalpattu']     
    Sleep    3s    
    Click Element    xpath:(//div[@class='form-row']//div[contains(@class,'control')])[4]
    Sleep    2s  
    Click Element    xpath://div[text()='St.Thomas Mount'] 
    Input Text    xpath://textarea[@name='address']    New address 
    Sleep    2s    
    Click Element    xpath://label[text()='Same as my Residential Address']
    #Click Element    css:button.addGrBtn
    Sleep    2s    
    #Click Element    css:img.close_style
    Click Element    css:div.dropzone
    Sleep    5s     
    Press Keys    CTRL+v       C://Users/Product/Downloads/New.pdf
    #Input Text    css:div.dropzone    C://Users/Product/Downloads/New.pdf
    


Test
    Open Browser    https://idp-qa-grm.tnrtp.org/login    firefox
    Maximize Browser Window
    Input Text    ${USERNAME_INPUT}    9047838381        
    Input Text    ${PASSWORD_INPUT}    Amtex@123    
    Click Element    ${LOGIN_BUTTON}    
    Sleep    5s  
    Click Element    css:button.addGrBtn 
    Sleep    10s      
    Click Element    css:div.dropzone
    Wait For Active Window    WindowTitle=File Upload
    Win Activate    File Upload    
    Sleep    5s    
    Send    C:\\Users\\Product\\Desktop\\toast 1.png
    Sleep    3s    
    Send    {ENTER}
    #Control Click    {ENTER}
    #Scroll Element Into View    css:div.dropzone
    #Choose File    div.dropzone    C://Users/Product/Downloads/New.pdf
    

aa
    Open Browser    https://www.wikipedia.org/    firefox
    Maximize Browser Window
    Execute Javascript    window.scrollTo(0,1000)

       
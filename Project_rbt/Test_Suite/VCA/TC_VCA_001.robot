*** Settings ***
Library    SeleniumLibrary    
Library    Collections    
Library    String    
Library    DateTime    
Library    ExcelLibrary    
Resource    ../../Resources/Internal_user.robot
Resource    ../../Resources/UM_Resource.robot
Resource    ../../Resources/VCA_Resource.robot

*** Variables ***

@{VCA_Report_table}    Activity    Name    Commodity    Name    File    Approved    on    Uploaded    by    District    Version    Status
@{Farm_Commodity_list}    Aarali    Avocado    Badam Nut    Beans    Beet Root    Beetle Leaves    Bengalgram    Black Gram And Green Gram    Brinjal    Broccoli    Cabbage    Cardamom    Carrot    Cashew Nut    Castor    Cauliflower    Chick Pea    Cholam    Chow-Chow    Cloves    Coffee    Coriander Seeds    Cotton    Cow Pea    Cucumber    Drumstick    Finger Millet    Foxtail Millet    Garlic    Grafting Nursery    GreenGram    Greens    Ground Nut    Herbal Plants    Horsegram    Jackfruit    Jasmine    Jowar (Sorghum)    Lemon    Lemon Grass    Little Millet    Maize & Cholam    Mango    Marigold    Mint    Moringa    Mushroom    Mushroom Cultivation    Nursery    Nutmeg    Oil Seeds    Orange    Other Millets    Paddy    Papaya    Passion Fruit    Pea    Pearl Millet    Pepper    Pista nut    Potato    Pulses    Pumpkin    Radish    Ragi    Red Gram    Roses    Sea Weed    Sesame    Small Onion    Snake Gourd    Sorghum    Sugarcane    Sunflower    Tamarind    Tapioca    Tea    Tomato    Toor Gram    Turmeric    Vegetable    Wheat
@{VCA_Report_Header}    1. Overview    2. Commodity Geography    3. Districts Covered    4. Commodity Details    5. Group Details    6. VCA Activities    7. SWOT Analysis    8. Upload Documents
@{Commodity_Label}    Major Production in the world (country)    Name of the Country    Select...    Area of the Cultivation    Units    Select...    Percentage of Production    Volume of Production    Units    Select...    Ranking of India among the World    Major Production in the India (State)    Name of the State    Select...    Area of the Cultivation    Units    Select...    Percentage of Production    Volume of Production    Units    Select...    Ranking of Tamil Nadu among India    Major Production in the Tamilnadu (District)    Name of the district    Select...    Area of the Cultivation    Units    Select...    Percentage of Production    Volume of Production    Units    Select...    PreviousNext



*** Test Cases ***

TC_021
    Login    https://qa-idp.tnrtp.org/    firefox    EOED_ANNUR_QA_DDS    Amtex123
    Sleep    5s    
    Select Module    DDS
    Sleep    3s 
    Click Element    xpath://span[text()='Value Chain Analysis']    
    Sleep    3s       
    Click Element    xpath://span[text()='VCA Reports']
    Sleep    5s    
    Compare List values with space    xpath://tr[@role='row']    ${VCA_Report_table}
    Sleep    5s    
    Click Element    xpath:(//button[text()='Continue Report'])[2] 
    Sleep    10s    
    Compare List values with line    xpath:(//div[contains(@class,'report_header')])[1]    ${VCA_Report_Header}
    Sleep    5s 
    Click Element    xpath://div[contains(@class,'container')]//div[contains(@class,'control')] 
    Sleep    5s    
    Compare List values with line    xpath://div[contains(@class,'menu')]    ${Farm_Commodity_list}  
    Sleep    3s    
    Select_Farm_commodity    Beans
          
    

Test label name
    Login    https://qa-idp.tnrtp.org/    firefox    EOED_ANNUR_QA_DDS    Amtex123
    Sleep    5s    
    Select Module    DDS
    Sleep    3s 
    Click Element    xpath://span[text()='Value Chain Analysis']    
    Sleep    3s       
    Click Element    xpath://span[text()='VCA Reports']
    Sleep    5s    
    Compare List values with space    xpath://tr[@role='row']    ${VCA_Report_table}
    Sleep    5s    
    Click Element    xpath:(//button[text()='Continue Report'])[2] 
    Sleep    15s   
    FOR    ${i}    IN RANGE    1    9
        Exit For Loop If    ${i}==9
        Log To Console    (//p[contains(@class,'d-inline-block')])[${i}]
        ${{i}_Header}=    Get Text    xpath:(//p[contains(@class,'d-inline-block')])[${i}]   
        Log To Console    ${{i}_Header}     
           
    END  
    
    # ${1_Header}=    Get Text    xpath:(//p[contains(@class,'d-inline-block')])[1]
    # ${Expected_Report Header}=    Get Text    xpath://div[contains(@class,'form_header_left')]
    # Should Be Equal    ${1_Header}    ${Expected_Report Header}    
    

    # @{test}=    Get WebElements    xpath://div[contains(@class,'overview-row')]//div[contains(@class,'d-block')]
    # FOR    ${item}    IN    ${test}
        # ${text}=    Get Text    ${Item}
    # END
    # Click Element    xpath:(//i[@class='icon-circle'])[2]
    # Sleep    3s    
    # Compare List values with line    xpath://div[contains(@class,'commodity-geography-wrapper')]    ${Commodity_Label}  
    


 test
    FOR    ${i}    IN RANGE    1    9
        Exit For Loop If    ${i}==9
        Log To Console    (//button[text()='Continue Report'])[${i}]   
    END  



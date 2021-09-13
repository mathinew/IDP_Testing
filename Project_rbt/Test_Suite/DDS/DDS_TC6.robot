*** Settings ***
Library     SeleniumLibrary
Resource    ../../Resources/DDS_Res6.robot
Library    ../../External libraries/DDS_loc6.py


*** Variables ***

${URL}   https://qa-idp.tnrtp.org/auth/login
${BROWSER}    firefox
${Username_value}   EOED_TIRP_QA_GRM
${Password_value}    Amtex123

*** Test Cases ***
Login Into Application
    Login    ${URL}    ${BROWSER}    ${Username_value}    ${Password_value}
    


Verify Lebal Text
    Verify Text     ${Activity_Details}     6. Activity Details
    Verify Text     ${Farm}   Type of activity - Farm
    Verify Text     ${Commodity1}    Commodity
    Verify Text     ${OFF_Farm1}   Type of activity - OFF Farm
    Verify Text     ${Commodity2}    Commodity
    Verify Text     ${Non_Farm}   Type of activity - Non Farm
    Verify Text     ${Sub_Sector1}    Sub Sector
    Verify Text     ${Service}   Type of activity - Service
    Verify Text     ${Sub_Sector2}    Sub Sector

Verify Farm commodity
    Login    ${URL}    ${BROWSER}    ${Username_value}    ${Password_value}
    FOR   ${comdy}  IN      Beans       Badam Nut
        Clear Input Text    ${Farm_commodity}
        Sleep   3s
        Click ELement   ${Farm_commodity}
        Sleep   3s
        Click Element  xpath://div[contains(@class,'menu')]//span[contains(text(),'${comdy}')]
        Sleep   1s
        Verify Text     xpath:(//*[contains(text(),'${comdy}')])[2]  ${comdy}
        Get Table Header Text    ${table_colunm_labeltext}    Names    In District    Avinashi    Kundadam    Pongalur    Tiruppur    Udumalaipettai    TNRTP Blocks
        Get Table Header Text    ${table_row_labeltext}      Contribution of state level Percentage(%)   Total No.of producers   No.of Hectares of cultivation   Total Production in Tones
        Fill Table Row And Column    02    xpath:(//div[contains(text(),'${comdy}')])[2]//following::tbody/tr  xpath:(//div[contains(text(),'${comdy}')])[2]//following::tbody/tr[1]/td    xpath:(//div[contains(text(),'${comdy}')])[2]
    END


Verify Off-Farm commodity
        Clear Input Text    ${Off_Farm2}
        Sleep   3s
        Click ELement  ${Off_Farm2}
        Sleep   3s
        Click Element  ${Banana_Fibre}
        Sleep   1s
        Verify Text  ${Banana_Fibre_Text}   Banana Fibre Extraction Unit
        Get Table Header Text  ${Table_Col_Header_Text}   Names	In District	Avinashi	Kundadam	Pongalur	Tiruppur	Udumalaipettai	TNRTP Blocks
        Get Table Header Text   ${Table_Row_Header_Text}      Contribution of state level Percentage(%)   Total No.of producers   No.of Hectares of cultivation   Total Production in Tones
        Fill Table Row And Column   10     ${Table_Row}      ${Table_Col}     ${Table_Cell}

Verify Non-Farm commodity
        Clear Input Text    ${Non_Farm_com}
        Sleep   3s
        Click ELement  ${Non_Farm_com}
        Sleep   3s
        Click Element  ${Agarbathi}
        Sleep   1s
        Verify Text     ${Agarbathi_Text}    Agarbathi
        Get Table Header Text   ${Table_NonCol_Header_Text}   Names	In District	Avinashi	Kundadam	Pongalur	Tiruppur	Udumalaipettai	TNRTP Blocks
        Get Table Header Text   ${Table_NonRow_Header_Text}    Total number of persons involved
        Fill Table Row And Column   10  ${Table_NonRow}   ${Table_NonCol}       ${Table_NonCell}

Verify Activity-Service
        Clear Input Text    ${Activity_Service}
        Sleep  3s
        Click ELement  ${Activity_Service}
        Sleep   3s
        Click Element  ${Agri_Clinic}
        Sleep   1s
        Verify Text     ${Agri_Clinic_Text}  Agri Clinic
        Get Table Header Text   ${Table_SerCol_Header_Text}   Names	In District	Avinashi	Kundadam	Pongalur	Tiruppur	Udumalaipettai	TNRTP Blocks
        Get Table Header Text   ${Table_SerRow_Header_Text}      Total number of persons involved
        Fill Table Row And Column   30.5  ${Table_SerRow}     ${Table_SerCol}     ${Table_SerCell}

Verify Submit Button
  Click Button   xpath://button[@type='submit']

Logout The Application
  Logout
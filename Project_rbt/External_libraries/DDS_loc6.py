#Login loctors
USERNAME_INPUT= "xpath://input[contains(@name,'userName')]"
PASSWORD_INPUT= "xpath://input[contains(@name,'password')]"
LOGIN_BUTTON= "xpath://button[contains(text(),'Login')]"

#Activity Details page locators
#Lables
Activity_Details = "xpath://div[contains(text(),'6. Activity Details')]"
Farm = "xpath://div[contains(text(),'Type of activity - Farm')]"
Commodity1 = "xpath:(//label[contains(text(),'Commodity')])[1]"
OFF_Farm1 =  "xpath://div[contains(text(),'Type of activity - OFF Farm')]"
Commodity2 = "xpath:(//label[contains(text(),'Commodity')])[2]"
Non_Farm = "xpath://div[contains(text(),'Type of activity - Non Farm')]"
Sub_Sector1 = "xpath:(//label[contains(text(),'Sub Sector')])[1]"
Service = "xpath://div[contains(text(),'Type of activity - Service')]"
Sub_Sector2 = "xpath:(//label[contains(text(),'Sub Sector')])[2]"

#Farm commodity
Farm_commodity = "xpath:(//div[@class='form-group']//div[contains(@class,'container')])[1]"

#Off-Farm commodity
Off_Farm2 = "xpath:(//div[@class='form-group']//div[contains(@class,'container')])[2]"
Banana_Fibre = "xpath://div[contains(@class,'menu')]//span[contains(text(),'Banana Fibre Extraction Unit')]"
Banana_Fibre_Text =  "xpath:(//div[contains(text(),'Banana Fibre Extraction Unit')])[2]"
Table_Col_Header_Text =  "xpath:(//div[contains(text(),'Banana Fibre Extraction Unit')])[2]//following::thead/tr/th"
Table_Row_Header_Text = "xpath:(//div[contains(text(),'Banana Fibre Extraction Unit')])[2]//following::tbody/tr/td[1]"
Table_Row = "xpath:(//div[contains(text(),'Banana Fibre Extraction Unit')])[2]//following::tbody/tr"
Table_Col = "xpath:(//div[contains(text(),'Banana Fibre Extraction Unit')])[2]//following::tbody/tr[1]/td"
Table_Cell = "xpath:(//div[contains(text(),'Banana Fibre Extraction Unit')])[2]"
table_row_labeltext= "xpath://tbody/tr/td[1]"
table_colunm_labeltext= "xpath://thead/tr/th"

#Non-Farm commodity
Non_Farm_com = "xpath:(//div[@class='form-group']//div[contains(@class,'container')])[3]"
Agarbathi = "xpath://div[contains(@class,'menu')]//span[contains(text(),'Agarbathi')]"
Agarbathi_Text = "xpath:(//div[contains(text(),'Agarbathi')])[2]"
Table_NonCol_Header_Text =  "xpath:(//div[contains(text(),'Agarbathi')])[2]//following::thead/tr/th"
Table_NonRow_Header_Text = "xpath:(//div[contains(text(),'Agarbathi')])[2]//following::tbody/tr/td[1]"
Table_NonRow = "xpath:(//div[contains(text(),'Agarbathi')])[2]//following::tbody/tr"
Table_NonCol = "xpath:(//div[contains(text(),'Agarbathi')])[2]//following::tbody/tr[1]/td"
Table_NonCell = "xpath:(//div[contains(text(),'Agarbathi')])[2]"

#Activity-Service
Activity_Service = "xpath:(//div[@class='form-group']//div[contains(@class,'container')])[4]"
Agri_Clinic = "xpath://div[contains(@class,'menu')]//span[contains(text(),'Agri Clinic')]"
Agri_Clinic_Text = "xpath:(//div[contains(text(),'Agri Clinic')])[2]"
Table_SerCol_Header_Text =  "xpath:(//div[contains(text(),'Agri Clinic')])[2]//following::thead/tr/th"
Table_SerRow_Header_Text = "xpath:(//div[contains(text(),'Agri Clinic')])[2]//following::tbody/tr/td[1]"
Table_SerRow = "xpath:(//div[contains(text(),'Agri Clinic')])[2]//following::tbody/tr"
Table_SerCol = "xpath:(//div[contains(text(),'Agri Clinic')])[2]//following::tbody/tr[1]/td"
Table_SerCell = "xpath:(//div[contains(text(),'Agri Clinic')])[2]"






*** Settings ***
Library    SeleniumLibrary    
Library    String    
Library    Collections    
Resource    Internal_user.robot




*** Variables ***

${Actual_List}    xpath:(//div[@class='row'])[2]

@{Group-Count}    Groups    -    10
@{table_value}    Groups    Description    No    of    Roles    Roles
@{Admin_list}    SUADM,    SYADM
@{SPMU_list}    CEO,    COO    (PM),    COO    (PI),    ACOO    (M&E,    MIS    &    ACT),    ACOO    (FM),    ACOO    (P    &    C),    ACOO    (S    &    J),    ACOO    (EBF),    ACOO    (EED),    DyCOO    (M&E/MIS),    DyCOO    (Accounts),    DyCOO    (ESMF),    DyCOO    (Admin),    DyCOO    (EDP    &    Partnerships),    DyCOO    (CSS/CFS),    DyCOO    (Innovation),    DyCOO    (Business    Financing),    DyCOO    (EP),    DyCOO    (ED),    Y.P,    MIS    (SA),    DBA,    DENTOPR
@{DPMU_list}    DEO,    Y.P,    EO-ED,    EO-BPF,    EO-S&J,    EO-A&A
@{BPMU_list}    BTL,    PE-ED,    PE-S&J,    PE-A&A
@{Field Staff_list}    ECP's,    BP's,    CFS    -    SPARKS,    CSS    -    Trainers
@{Community_list}    PLF,    VPRC
@{Enterprise_list}    PC,    PG,    EG
@{Supporting Consultants_list}    EED    -    TSA,    EED    -    Field    TSA,    BPF    -    TSA,    S&J    TSA,    Consultants    /    Consultancy,    KMC,    M&E,    ESMF    -    TSA
@{WB Consultants_list}    WBC    -    TTL,    WBC    -    EED,    WBC    -    BPF,    WBC    -    Innovation,    WBC    -    S&J,    WBC    -    HR,    WBC    -    Finance,    WBC    -    Procurement,    WBC    -    ICT,    WBC    -    M&E,    WBC    -    ESMF
@{Others_list}    MSC,    OSF    

${Admin_Roles}    2
${SPMU_Roles}    23
${DPMU_Roles}    6        
${BPMU_Roles}    4
${Field Staff_Roles}    4
${Community_Roles}    2
${Enterprise_Roles}    3
${Supporting Consultants_Roles}    8    
${WB Consultants_Roles}    11        
${Others_Roles}    2


@{Admin}    Admin    Admin    ${Admin_Roles}    @{Admin_list}
@{SPMU}    SPMU    State    Project    Management    Unit    ${SPMU_Roles}    @{SPMU_list}        
@{DPMU}    DPMU    District    Project    Management    Unit    ${DPMU_Roles}    @{DPMU_list}
@{BPMU}    BPMU    Block    Project    Management    Unit    ${BPMU_Roles}    @{BPMU_list}
@{Field Staff}    Field    Staff    Field    Staffs    ${Field Staff_Roles}    @{Field Staff_list}
@{Community}    Community    Community    ${Community_Roles}    @{Community_list}
@{Enterprise}    Enterprise    Enterprise    ${Enterprise_Roles}    @{Enterprise_list}
@{Supporting Consultants}    Supporting    Consultants    Supporting    Consultants    ${Supporting Consultants_Roles}    @{Supporting Consultants_list}    
@{WB Consultants}    WB    Consultants    World    Bank    Consultants    ${WB Consultants_Roles}    @{WB Consultants_list}
@{Others}    Others    Others    ${Others_Roles}    @{Others_list}

${Admin_values}    SUADMSYADM
${SPMU_Values}    CEOCOO (PM)COO (PI)ACOO (M&E, MIS & ACT)ACOO (FM)ACOO (P & C)ACOO (S & J)ACOO (EBF)ACOO (EED)DyCOO (M&E/MIS)DyCOO (Accounts)DyCOO (ESMF)DyCOO (Admin)DyCOO (EDP & Partnerships)DyCOO (CSS/CFS)DyCOO (Innovation)DyCOO (Business Financing)DyCOO (EP)DyCOO (ED)Y.PMIS (SA)DBADENTOPR    
${DPMU_Values}    DEOY.PEO-EDEO-BPFEO-S&JEO-A&A
${BPMU_Values}    BTLPE-EDPE-S&JPE-A&A
${Field Staff_Values}    ECP'sBP'sCFS - SPARKSCSS - Trainers
${Community_Values}    PLFVPRC
${Enterprise_Values}    PCPGEG       
${Supporting Consultants_Values}    EED - TSAEED - Field TSABPF - TSAS&J TSAConsultants / ConsultancyKMCM&EESMF - TSA 
${WB Consultants_Values}    WBC - TTLWBC - EEDWBC - BPFWBC - InnovationWBC - S&JWBC - HRWBC - FinanceWBC - ProcurementWBC - ICTWBC - M&EWBC - ESMF 
${Others_Values}    MSCOSF    


@{Admin_Details}    Admin    Group Name    Admin    Description    Admin    No of Roles    ${Admin_Roles}    Date Created    -    Created By    -    Roles    ${Admin_values}
@{SPMU_Details}    SPMU    Group Name    SPMU    Description    State Project Management Unit    No of Roles    ${SPMU_Roles}    Date Created    -    Created By    -    Roles    ${SPMU_Values}                
@{DPMU_Details}    DPMU    Group Name    DPMU    Description    District Project Management Unit    No of Roles    ${DPMU_Roles}    Date Created    -    Created By    -    Roles    ${DPMU_Values}        
@{BPMU_Details}    BPMU    Group Name    BPMU    Description    Block Project Management Unit    No of Roles    ${BPMU_Roles}    Date Created    -    Created By    -    Roles    ${BPMU_Values}        
@{Field Staff_Details}    Field Staff    Group Name    Field Staff    Description    Field Staffs    No of Roles    ${Field Staff_Roles}    Date Created    -    Created By    -    Roles    ${Field Staff_Values}    
@{Community_Details}    Community    Group Name    Community    Description    Community    No of Roles    ${Community_Roles}    Date Created    -    Created By    -    Roles    ${Community_Values}
@{Enterprise__Details}    Enterprise    Group Name    Enterprise    Description    Enterprise    No of Roles    ${Enterprise_Roles}    Date Created    -    Created By    -    Roles    ${Enterprise_Values}
@{Supporting Consultants__Details}    Supporting Consultants    Group Name    Supporting Consultants    Description    Supporting Consultants    No of Roles    ${Supporting Consultants_Roles}        Date Created    -    Created By    -    Roles    ${Supporting Consultants_Values}
@{WB Consultants__Details}    WB Consultants    Group Name    WB Consultants    Description    World Bank Consultants    No of Roles    ${WB Consultants_Roles}    Date Created    -    Created By    -    Roles    ${WB Consultants_Values}
@{Others_Details}    Others    Group Name    Others    Description    Others    No of Roles    ${Others_Roles}    Date Created    -    Created By    -    Roles    ${Others_Values}








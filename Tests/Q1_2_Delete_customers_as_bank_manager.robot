*** Settings ***
Documentation    To delete customer data as "BankManager"
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../resources/Generic.robot
Resource    ../POM/bankManagerPage.robot
Test Setup    Login HomePage
Test Teardown    Close Browser Session

*** Variables ***

*** Test Cases ***
Validate customers details are deleted (TC001)
    [Documentation]    Test case is to delete customer data
    [Tags]    Regression
    Login and navigate to customer display page
    Search and delete customer details

*** Keywords ***
Login and navigate to customer display page
    [Documentation]    To Navigate to customer display page as "Bank Manager"
    Click Element    ${bankManager_login_Btn}
    Wait Until Element Is Visible    ${bankManager_showCustomers_Btn}
    Click Element    ${bankManager_showCustomers_Btn}
    Wait Until Element Is Visible    ${bankManager_custDetail_tbl}

Search and delete customer details
    [Documentation]    To delete customers data
    Wait Until Element Is Visible    ${bankManager_searchCust_txt}
    Wait Until Element Is Visible    ${bankManager_custDetail_tbl}
    FOR    ${name}    IN    Hermoine    Harry    Christopher
        Input Text    ${bankManager_searchCust_txt}    ${name}
        Sleep    1s
        # Check if the name exists in the table
        ${found}=    Run Keyword And Return Status    Page Should Contain    ${name}
        # exit loop if the name doesn't exists in the table
            Exit For Loop If    '${found}' == 'False'
        Click Button    ${bankManager_deleteCust_btn}
        Sleep    3
        Clear Element Text    ${bankManager_searchCust_txt}
        Sleep    1s
        Log    customer deleted successfully ${name}
    END
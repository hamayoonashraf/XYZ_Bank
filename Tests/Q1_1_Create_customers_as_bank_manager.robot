*** Settings ***
Documentation    To add customer data as "BankManager"
Library    SeleniumLibrary
Library    String
Resource    ../resources/Generic.robot
Resource    ../POM/bankManagerPage.robot
Test Setup    Login HomePage
Test Template    Fill in the Customers Details and Verify
Test Teardown    Close Browser Session
Default Tags    Regression

*** Variables ***


*** Test Cases ***    firstName    lastName    postCode
# Adding customer data
Enter First Customer    Christopher    Connely    L789C349
Enter Second Customer    Frank    Connely    A897N450
Enter Third Customer    Christopher    Minka    M098Q585
Enter Fourth Customer    Connely    Jackson    L789C349
Enter Fifth Customer    Jackson    Frank    L789C349
Enter Sixth Customer    Minka    Jackson    A897N450
Enter Seventh Customer    Jackson    Connely    L789C349

*** Keywords ***

Fill in the Customers Details and Verify
    [Documentation]    To enter multiple customers as "Bank Manager"
    [Tags]    Regression
    [Arguments]    ${firstName}    ${lastName}    ${postCode}
    Click Element    ${bankManager_login_Btn}
    Wait Until Element Is Visible    ${verifyHomePageIsLoaded}
    Wait Until Element Is Visible    ${bankManager_addCustomer_Btn}
    Click Element    ${bankManager_addCustomer_Btn}
    Sleep    5
    Input Text    ${bankManager_firstName_txt}    ${firstName}
    Input Text    ${bankManager_lastName_txt}    ${lastName}
    Input Text    ${bankManager_postCode_txt}    ${postCode}
    Click Button    ${bankManager_addCust_btn}
    Sleep    5
    ${result}=    Handle Alert    ACCEPT
    Log    ${result}
    Should Contain    ${result}    Customer added successfully
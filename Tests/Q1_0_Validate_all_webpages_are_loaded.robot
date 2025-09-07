*** Settings ***
Documentation    To validate all webpages are loaded for smoke test
Library    SeleniumLibrary
Resource    ../resources/Generic.robot
Resource    ../POM/bankManagerPage.robot
Resource    ../POM/bankCustomerPage.robot
Test Setup    Login HomePage
Test Teardown    Close Browser Session

*** Variables ***


*** Test Cases ***
Validate HomePage is Loaded (TC001)
    [Documentation]    To Validate "Home Page" is loaded successfully
    [Tags]    Smoke
    Wait Until Element Is Visible    ${verifyHomePageIsLoaded}
    Log    WebPage is loaded successfully

Validate Successful login as Bank Manager (TC002)
    [Documentation]    To Validate "Bank Manager" logged-in successfully
    [Tags]    Smoke
    Click Element    ${bankManager_login_Btn}
    Wait Until Element Is Visible    ${verifyHomePageIsLoaded}
    Wait Until Element Is Visible    ${bankManager_addCustomer_Btn}
    Log    WebPage is loaded successfully

Validate Customer Tab is loaded as Bank Manager (TC003)
    [Documentation]    To Validate "Customer Tab" screen loaded successfully
    [Tags]    Smoke
    Click Element    ${bankManager_login_Btn}
    Wait Until Element Is Visible    ${verifyHomePageIsLoaded}
    Wait Until Element Is Visible    ${bankManager_showCustomers_Btn}
    Click Element    ${bankManager_showCustomers_Btn}
    Wait Until Element Is Visible    ${bankManager_custDetail_tbl}
    Log    WebPage is loaded successfully

Validate Customer Login page is loaded (TC004)
    [Documentation]    To Validate "Customer Login" screen loaded successfully
    [Tags]    Smoke
    Wait Until Element Is Visible    ${verifyHomePageIsLoaded}
    Wait Until Element Is Visible    ${Customer_login_Btn}
    Click Element    ${Customer_login_Btn}
    Wait Until Element Is Visible    ${bankCustomer_selectUser_dropdown}    timeout=10s
    Page Should Contain   Your Name :
    Log    WebPage is loaded successfully

*** Keywords ***


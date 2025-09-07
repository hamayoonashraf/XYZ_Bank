*** Settings ***
Documentation    Enter user to login and perform debit and credit transactions
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ../resources/Generic.robot
Resource    ../POM/bankCustomerPage.robot
Test Setup    Login HomePage
Test Teardown    Close Browser Session

*** Variables ***


*** Test Cases ***
User login and perform Debit/Credit Account (TC001)
    [Documentation]    Test case is to login as customer provided as parameter
    [Tags]    Regression
    # user is parameterized to enter different user (if needed)
    Select user and login    Hermoine Granger
    # User account is parameterized to enter different account (if needed)
    Select Customer Account    1003
    # Perform Credit Account
    Perform Transaction Credit Account
    # Perform Debit Account
    Perform Transaction Debit Account

*** Keywords ***
Select user and login
    [Arguments]    ${user}
    [Documentation]    To Navigate to customer login page as select user provided as parameter
    Wait Until Element Is Visible    ${verifyHomePageIsLoaded}
    Wait Until Element Is Visible    ${Customer_login_Btn}
    Click Element    ${Customer_login_Btn}
    Wait Until Element Is Visible    ${bankCustomer_selectUser_dropdown}    timeout=10s
    Select From List By Label    ${bankCustomer_selectUser_dropdown}    ${user}
    Log    ${user}
    Wait Until Element Is Visible    ${bankCustomer_custLogin_btn}
    Click Element    ${bankCustomer_custLogin_btn}
    Wait Until Element Is Visible    ${bankCustomer_welcome_lbl}
    # Verifying customer logged-in successfully!
    Page Should Contain   Welcome ${user}

Select Customer Account
    [Documentation]    Select Customer Account provided as parameter
    [Arguments]    ${account}
    Select From List By Label    ${bankCustomer_selectAccount_dropdown}    ${account}
    # Verifying customer account into log
    Log    ${account}

Perform Transaction Credit Account
    [Documentation]    Customer Account credited
    Click Element    ${bankCustomer_custDeposit_btn}
    Wait Until Element Is Visible    ${bankCustomer_amount_txt}
    #Perform Credit into the account
    FOR    ${credit}    IN    50000    5000    1500
        Input Text    ${bankCustomer_amount_txt}    ${credit}
        Click Element    ${bankCustomer_custCredit_btn}
        Clear Element Text    ${bankCustomer_amount_txt}
        # Verifying account credit details into log
        Log    customer account credited successfully ${credit}
    END

Perform Transaction Debit Account
    [Documentation]    Customer Account debited
    Click Element    ${bankCustomer_custWithdrawal_btn}
    Wait Until Element Is Visible    ${bankCustomer_amount_txt}
    #Perform Debit into the account
    FOR    ${debit}    IN    3000    2000    10000    15000
        Input Text    ${bankCustomer_amount_txt}    ${debit}
        Wait Until Element Is Visible    ${bankCustomer_custDebit_btn}
        Click Element    ${bankCustomer_custDebit_btn}
        Clear Element Text    ${bankCustomer_amount_txt}
        # Verifying account debit details into log
        Log    customer account debited successfully ${debit}
    END
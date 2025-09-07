*** Settings ***
Documentation    To setup all common variable used by the "Customer" page
Library    SeleniumLibrary
Library    String

*** Variables ***
${bankCustomer_selectUser_dropdown}    css:select[ng-model='custId']
${bankCustomer_custLogin_btn}    css:.btn.btn-default
${bankCustomer_welcome_lbl}    css:.fontBig.ng-binding
${bankCustomer_selectAccount_dropdown}    css:select[ng-model='accountNo']
${bankCustomer_custTrans_btn}    css:button[ng-click='transactions()']
${bankCustomer_custDeposit_btn}    css:button[ng-click='deposit()']
${bankCustomer_custWithdrawal_btn}    css:button[ng-click='withdrawl()']
${bankCustomer_amount_txt}    css:input[ng-model='amount']
${bankCustomer_custCredit_btn}    xpath://button[@type='submit' and text()='Deposit']
${bankCustomer_custDebit_btn}    xpath://button[@type='submit' and text()='Withdraw']

*** Keywords ***

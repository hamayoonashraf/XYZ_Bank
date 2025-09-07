*** Settings ***
Documentation    To setup all common variable used by the "BankManger" page
Library    SeleniumLibrary
Library    String

*** Variables ***
${bankManager_addCustomer_Btn}    css:button[ng-click='addCust()']
${bankManager_openAccount_Btn}    css:button[ng-click='openAccount()']
${bankManager_showCustomers_Btn}    css:button[ng-click='showCust()']
${bankManager_firstName_txt}    css:input[ng-model='fName']
${bankManager_lastName_txt}    css:input[ng-model='lName']
${bankManager_postCode_txt}    css:input[ng-model='postCd']
${bankManager_addCust_btn}    css:.btn.btn-default
${bankManager_custDetail_tbl}    css:table.table-bordered.table-striped
${bankManager_searchCust_txt}    css:input[ng-model='searchCustomer']
${bankManager_deleteCust_btn}    css:button[ng-click='deleteCust(cust)']

*** Keywords ***

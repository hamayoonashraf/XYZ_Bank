*** Settings ***
Documentation    A generic resource file to be used for generic keywords
Library    SeleniumLibrary


*** Variables ***
${url}    https://www.globalsqa.com/angularJs-protractor/BankingProject/#/login
${verifyHomePageIsLoaded}    css:.mainHeading
${bankManager_login_Btn}    css:button[ng-click='manager()']
${Customer_login_Btn}    css:button[ng-click='customer()']

*** Keywords ***
Login HomePage
    Create Webdriver    Chrome
    Maximize Browser Window
    Go To    ${url}
    Sleep    3

Close Browser Session
    Close Browser

## XYZ Bank Automation Project
This project contains Robot Framework + Selenium automation tests for the XYZ Bank demo application.

## Tools & Technologies
- Robot Framework for test automation
- SeleniumLibrary for browser interactions
- Python as the scripting language
- Test execution and report integration using PyCharm

## Key Features
- Generic resource files for generic reusable keywords, URL's, locator and test steps
- Page Object Model (POM) style separation of page-specific locators and actions
- Custom keywords
- Tagging to organize and selectively run smoke and regression

## How to Run
- goto project directory ..\XYZ_Bank>
- execute cmd " robot --include smoke --include regression --outputdir results . " (without quotes)

## Reports
- Test reports will be saved here XYZ_Bank/tests/results/
- log.html
- report.html
- output.xml

*** Settings ***
Library  SeleniumLibrary
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Using Variables
    Comment    This test uses variables!


*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Sleep    1

# Optionally we could use a variable section
*** Variables ***
${SiteUrl}    http://inv.beaufortfairmont.com
${Browser}     Chrome

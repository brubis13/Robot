*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check invoice manager page
    Comment    We've learned how to create a custom keyword!
    Navigate To Home Page
    Page Should Contain     Invoice Manager


*** Keywords ***
Navigate To Home Page
    Open Browser    http://inv.beaufortfairmont.com		chrome

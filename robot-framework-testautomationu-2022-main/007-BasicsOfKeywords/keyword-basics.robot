*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check invoice manager page
    Comment    We're learning how to create a custom keyword.
    Open Browser  http://inv.beaufortfairmont.com/   chrome
    Page Should Contain     Invoice Manager

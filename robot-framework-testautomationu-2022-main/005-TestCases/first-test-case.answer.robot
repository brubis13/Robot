*** Settings ***
Library  SeleniumLibrary

*** Test Cases ***
Check invoice manager page
    Open Browser    http://inv.beaufortfairmont.com/    chrome
    Comment    Checking that we're on the invoice manager page
    Page Should Contain    Invoice Manager

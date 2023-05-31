*** Settings ***
Library  SeleniumLibrary

Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Using a suite teardown works
    Comment    Using a suite teardown to close the browser.

*** Keywords ***
Navigate To Home Page
    Open Browser    http://inv.beaufortfairmont.com		Chrome

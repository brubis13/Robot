*** Settings ***
Library  SeleniumLibrary

Suite Setup  Navigate To Home Page

*** Test Cases ***
Using a suite setup works
    Comment    Using a suite setup to navigate to home page.

*** Keywords ***
Navigate To Home Page
    Open Browser    http://inv.beaufortfairmont.com    Chrome

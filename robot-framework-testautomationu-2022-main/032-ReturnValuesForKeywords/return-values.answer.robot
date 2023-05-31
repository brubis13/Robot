*** Settings ***
Library  SeleniumLibrary
Library  DateTime
Resource  resources.robot
Suite Setup  Navigate To Home Page
Suite Teardown  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    Input Text  invoice   my example invoice
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    ${today}=  Get Today's Date
    Input Text  dueDate   ${today}
    Input Text  comment   Unclogged Drain
    Select From List By Value   selectStatus    Past Due
    Click Button    createButton

*** Keywords ***
Get Today's Date
    ${date}=  Get Current Date  result_format=%Y-%m-%d
    [Return]  ${date}

Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    0.5 Seconds

Click Add Invoice
    Click Link  Add Invoice
    Page Should Contain Element     invoiceNo_add

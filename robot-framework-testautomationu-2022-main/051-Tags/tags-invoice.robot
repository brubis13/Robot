*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Screenshot

Resource  resources.robot

Test Setup  Run Keywords   Navigate To Home Page


*** Test Cases ***
Navigate To Home Page
    [Tags]   Smoke
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    .25 Seconds

Create an Invoice
    [Tags]  Smoke  Regression
    Click Add Invoice
    ${invoiceNumber}=    Create Invoice Number
    Set Suite Variable   ${invoiceNumber}
    Add Invoice  ${invoiceNumber}    ACME, Inc  Roadrunner Extermination   1.00     11/7/2019     Warning: Roadrunners can be tricky.     Paid
    Page Should Contain     ${invoiceNumber}
    Capture Page Screenshot

Delete The Invoice
    [Tags]  Smoke  Regression
    ${invoice_count}=   Get Element Count    css:[id^='invoiceNo_${invoiceNumber}'] > a
    Should Be True  ${invoice_count} > 0
    Delete Invoice  css:[id^='invoiceNo_${invoiceNumber}'] > a
    Page Should Not Contain     ${invoiceNumber}

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    .25 Seconds

Add Invoice
    [Documentation]     This keywords fills out the invoice details page
    [Arguments]  ${Name}    ${Company}  ${Type}     ${Cost}     ${Date}     ${Comments}     ${Status}
    Input Text  invoice   ${Name}
    Input Text  company   ${Company}
    Input Text  type   ${Type}
    Input Text  price   ${Cost}
    Input Text  dueDate   ${Date}
    Input Text  comment   ${Comments}
    Select From List By Value   selectStatus    ${Status}
    Click Button    createButton
    
Click Add Invoice
    Click Link  Add Invoice
    Page Should Contain Element     invoiceNo_add

Delete Invoice
    [Arguments]  ${invoice_element}
    Click Link  ${invoice_element}
    Click Button    deleteButton

Delete Invoice If Exists
    ${invoice_count}=   Get Element Count    css:[id^='invoiceNo_${invoiceNumber}'] > a
    Run Keyword If      ${invoice_count} > 0    Delete Invoice  css:[id^='invoiceNo_${invoiceNumber}'] > a

Create Invoice Number
    ${RandomInvoiceNum}    Generate Random String    10    [LETTERS]
    [Return]    ${RandomInvoiceNum}

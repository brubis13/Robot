*** Settings ***
Library  SeleniumLibrary
Library  String
Library  Screenshot

Resource  invoice-details-page.robot
Resource  resources.robot

Suite Setup  Run Keywords   Navigate To Home Page
Suite Teardown  Run Keywords    Delete Invoice If Exists  Close Browser


*** Test Cases ***
Create an Invoice
    Click Add Invoice
    ${invoiceNumber}=    Create Invoice Number
    Set Suite Variable   ${invoiceNumber}
    Add Invoice  ${invoiceNumber}    ACME, Inc  Roadrunner Extermination   1.00     11/7/2019     Warning: Roadrunners can be tricky.     Paid
    Page Should Contain     ${invoiceNumber}
    Capture Page Screenshot

*** Keywords ***
Navigate To Home Page
    Open Browser    ${SiteUrl}		${Browser}
    Set Selenium Speed    .25 Seconds
    
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

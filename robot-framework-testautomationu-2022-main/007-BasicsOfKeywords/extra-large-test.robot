*** Settings ***
Library  SeleniumLibrary
Library  RequestsLibrary
Library  String
Library  Collections

Suite Setup  Run Keywords   
Suite Teardown  Run Keywords    Close Browser  

*** Test Cases ***
Create an Invoice
    My Keyword
    Open Browser    http://inv.beaufortfairmont.com		chrome
    ${invoiceId}=    Generate Random String    10    [LETTERS]
    Set Suite Variable   ${invoiceId}
    Set Selenium Speed    0.5 Seconds
    Click Link    Add Invoice
    Page Should Contain Element     invoiceNo_add
    Input Text  invoice   ${invoiceId}

    Fill in invoice information

    Click Button    createButton
    Create Session	invoice-manager     http://inv.beaufortfairmont.com:8082
    ${resp}=  Get On Session    invoice-manager    /invoices/${invoiceId}
    Should Be Equal As Strings  ${resp.status_code}	 200
    Dictionary Should Contain Value	 ${resp.json()}	 ${invoiceId}
    ${resp}=  Delete On Session    invoice-manager    /invoices/${invoiceId}
    Should Be Equal As Strings	${resp.status_code}	 200
    ${resp}=  Get On Session    invoice-manager    /invoices/${invoiceId}    expected_status=any
    Should Be Equal As Strings  ${resp.status_code}  404

*** Keywords ***

My Keyword
   Log to Console  This is a keyword I created!


Fill in invoice information
    Input Text  company   my example company
    Input Text  type   plumbing
    Input Text  price   34.00
    Input Text  dueDate   2018-10-31
    Input Text  comment   Unclogged Drain
    Select From List By Value   selectStatus    Past Due


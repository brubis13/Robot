*** Settings ***

*** Test Cases ***
My Test Case
  My Log  hello world!


*** Keywords ***
My Log
   [Arguments]  ${text}
   Log to Console   This is the message: ${text}

   
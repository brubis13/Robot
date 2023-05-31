*** Settings ***

*** Test Cases ***
My Test Case
  ${nickName}=  Set Variable  Paul
  Print Profile  ${nickName}  Merrill  Trainer  dpaulmerrill
  ${nickName}=  Set Variable  Davie
  Print Profile  ${nickName}  Merrill  Trainer  dpaulmerrill

*** Keywords ***
Print Profile
   [Arguments]  ${firstName}  ${lastName}  ${title}  ${twitterHandle}
   Log to Console   \n__Profile__
   Log to Console   First Name: "${firstName}"
   Log to Console   Last Name: "${lastName}"
   Log to Console   Title: "${title}"
   Log to Console   Twitter Handle: "${twitterHandle}"
 
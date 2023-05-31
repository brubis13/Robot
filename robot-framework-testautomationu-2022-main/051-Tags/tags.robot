*** Settings ***
Force Tags  Functional
Default Tags  Invoice Team

*** Test Cases ***
Quick Check On System Status
    [Tags]  Smoke
    Log To Console    This is a quick chcek to make sure the system is up and running

Log Into The System
    [Tags]   Smoke  Regression
    Log To Console    This test verifies the login to the application

Navigation Bar Links Are Functional
    [Tags]   Regression  Acceptance
    Log To Console    This test goes through the navigation bar and verifies all links take you to the proper page
    #  Simulate "some time"
    Sleep  2secs

Thorough Check Of The Main Page
   [Tags]  Acceptance  Exhaustive
   Log To Console    Verification that all elements are on the main page
   # Simulate "long amount of time"
   Sleep  10secs

Test With Known Issue
   [Tags]  Regression  Acceptance  KnownIssue-66
   Log To Console    This test has a known issue
    #  Simulate "some time"
   Sleep  2secs
   Fail  Known Issue #66

Test With Another Known Issue
   [Tags]  Regression  KnownIssue-27
   Log To Console    This test has a known issue
   Fail  Known Issue #27

Test That Is Currently Under Development
   [Tags]  Regression  RunMe
   Log To Console   Test Script in progress ...

Test With Traceabilty
   [Tags]  Acceptance  Requirement-A250
   Log To Console    A test with traceability that verifies requirement A250

Test With New, Unknown Issue
   [Tags]  Acceptance
   Log To Console    This test presents a new, unknown issue
   Fail  New Issue

Test That Takes Some Time To Execute
   [Tags]  Exhaustive
   Log To Console    This test takes some long amount of time to execute
   # Simulate "long amount of time"
   Sleep  10secs

Test With Too Many Tags
   [Tags]  Smoke  Regression  Acceptance  Requirement-C143  Exhaustive  TestWithTooManyTags
   Log To Console    This test has too many tags

Test With No Tags
   Log To Console    This test has no tags. What happens?
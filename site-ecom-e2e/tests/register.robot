*** Settings ***
Resource         ../resources/support/commom.robot

Test Setup       Run Keywords
...              Start Session   AND
...              Fake Data Generator 
Test Teardown    Finish Session

*** Test Cases ***
Test Case 001: Register New PF User 
   [Tags]   Cs    Regressive
   Given I'm On The Registration Page
   And Fill In The Registration Form PF
   And Click To Register PF
   And Select Method To Receive MFA Code 1
   When Click To Create Account
   Then Should Create The Account Successfully
Test Case 002: Register New PJ User 
   [Tags]   Cs    Regressive
   Given I'm On The Registration Page
   And Fill In The Registration Form Pj
   And Click To Register Pj
   And Select Method To Receive MFA Code 1
   When Click To Create Account
   Then Should Create The Account Successfully
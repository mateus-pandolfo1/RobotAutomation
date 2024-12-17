*** Settings ***
Resource         ../resources/support/commom.robot

Test Setup       Run Keywords
...              Start Session   AND
...              Fake Data Generator 
Test Teardown    Finish Session

*** Variables ***
${QtdRegister}    2

*** Test Cases ***
Test Case 001: Stress Register New PF User And Buy With Pix
#     Set Selenium Speed    0.3
    FOR    ${RegisterPF}    IN RANGE    0   ${QtdRegister}
       Given Stress I'm On The Registration Page
       And Stress Fill In The Registration Form PF
       And Stress Click To Register Pf
       And Select Method To Receive MFA Code 1
       And Click To Create Account
       When Stress Quick Add Product To Bag
       And Stress Fill New Adress And Go To Payment
       Then Stress Confirm Payment With Pix
       And Stress Save New User Data To Csv PF
       And Stress Click To Logout
    END

Test Case 002: Stress Register New PJ User And Buy With Pix
#    Set Selenium Speed    0.3
   FOR    ${RegisterPj}    IN RANGE    0   ${QtdRegister}
       Given Stress I'm On The Registration Page
       And Stress Fill In The Registration Form PJ
       And Stress Click To Register Pj
       And Select Method To Receive MFA Code 1
       And Click To Create Account
       When Stress Quick Add Product To Bag
       And Stress Fill New Adress And Go To Payment
       Then Stress Confirm Payment With Pix
       And Stress Save New User Data To Csv PJ
       And Stress Click To Logout
   END
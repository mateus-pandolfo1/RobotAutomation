*** Settings ***
Resource     ../resources/support/commom.robot

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Test Case 001: Log In Successfully With PF
    [Tags]   Cs    Regressive
    Given I'm On The Login Page    
    And Fill In The Login Form    739.565.540-00    Petz@123
    And Click To Enter
    And Select Method To Receive MFA Code 2
    When Click To Login
    Then Should Authenticate Successfully
Test Case 001: Log In Successfully With PJ
    [Tags]   Cs    Regressive
    Given I'm On The Login Page    
    And Fill In The Login Form    ${Cnpj}      ${Password} 
    And Click To Enter
    And Select Method To Receive MFA Code 2
    When Click To Login
    Then Should Authenticate Successfully
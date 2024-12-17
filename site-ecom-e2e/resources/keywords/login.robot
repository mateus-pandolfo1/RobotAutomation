*** Settings ***
Resource    ../support/commom.robot

*** Keywords ***
I'm On The Login Page      
   Access Profile Menu
   Click    ${LoginButton}   

Fill In The Login Form 
   [Arguments]   ${Email}   ${Password}
   Wait For Elements State    ${LoginEmailInput}    timeout=5s
   Type Text   ${LoginEmailInput}    ${Email}
   Type Text   ${LoginPasswordInput}       ${Password}

Click To Enter  
   Sleep  3s
   Click    ${LoginEntrarButton} 
Should Authenticate Successfully
   Access Profile Menu
   Access My Data 

Do Login 
    [Arguments]               ${email}          ${password}
    Fill in Login       ${email}          ${password}
    Sleep            4

Fill in Login
    [Arguments]                            ${email}                    ${password}  
    Validate and Fill Text          ${emailTextField}                ${email}
    Validate and Fill Text          ${passwordTextfield}             ${password}
    Validate and Click                  ${submit}
    Validate Element    ${ProfileButton}
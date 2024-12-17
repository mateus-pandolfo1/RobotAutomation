*** Settings ***
Resource    ../support/commom.robot

*** Variables ***
${teste}    Estou de acordo com a

*** Keywords ***
I'm On The Registration Page
   Access Profile Menu
   Click Create Account
Click Create Account
   Wait For Load State    load    timeout=20s
   Click    ${CreateAccountLink}   
    
Fill In The Registration Form PF
   Wait For Elements State   ${CreateYourAccountLabel}    timeout=10
   Wait For Elements State    ${RegisterNameInput}
   Sleep   ${Delay}
   Type Text   ${RegisterNameInput}     ${NameFake}
   Type Text     ${RegisterEmailInput}      ${EmailFake}${Complement}
   Sleep   ${Delay}
   ${CellPhoneFake}=    Generate Random String   8      [NUMBERS]
   Type Text     ${RegisterCellPhoneInput}   119${CellPhoneFake} 
   Type Text     ${RegisterCPFInput}    ${CpfFake} 
   Scroll To Element   ${RegisterPassswordInput}
   Type Text     ${RegisterPassswordInput}      ${Password}
   Type Text     ${RegisterConfirmPasswordInput}      ${Password}
   Scroll To Element    ${RegisterTermCheck} 
   Click   ${RegisterTermCheck}  
Fill In The Registration Form PJ
   Wait For Elements State   ${CreateYourAccountLabel}    timeout=10
   Click     ${RegisterRadioPj} 
   Type Text    ${RegisterPjCorporateNameInput}     ${NameFake}
   Type Text    ${RegisterPjEmailInput}        ${EmailFake}${Complement}
   Sleep   ${Delay}
   ${CellPhoneFake}=    Generate Random String   8      [NUMBERS]
   Type Text    ${RegisterPjCelPhoneInput}    119${CellPhoneFake} 
   Type Text    ${RegisterPjCnpjInput}       ${CnpjFake}
   Scroll To Element    ${RegisterPjFreeIeRadio}
   Click     ${RegisterPjFreeIeRadio}
   Type Text    ${RegisterPjPassswordInput}       ${Password} 
   Type Text    ${RegisterPjConfirmPasswordInput}     ${Password} 
   Scroll To Element   ${RegisterPjTermCheck} 
   Click    ${RegisterPjTermCheck} 
Click To Register PF
   Wait For Elements State   ${RegisterPfButton}     timeout=10 
   Click   ${RegisterPfButton} 
   Wait For Load State    load  
Click To Register PJ
   Wait For Elements State   ${RegisterPjButton}     timeout=10 
   Click   ${RegisterPjButton}  
   Wait For Load State    load  
Click To Create Account  
   Click    ${RegisterButton}   
Should Create The Account Successfully
   Sleep  15s      
   Access My Data
   
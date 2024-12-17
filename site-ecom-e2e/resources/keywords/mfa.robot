*** Settings ***
Resource    ../support/commom.robot

*** Keywords ***
Select Method To Receive MFA Code ${Option}
    # Verifica se o botão de opção está visível
    ${ElementVisible}=    Run Keyword And Return Status    Wait For Elements State    ${MfaShippingOptionRadio}   state=visible     timeout=20
    # Se o elemento estiver visível, executa o fluxo
    Run Keyword If   ${ElementVisible}   Run Flow ${Option}
    # Caso o elemento não seja visível, o fluxo será pulado
    Run Keyword Unless    ${ElementVisible}    Log    O botão não está visível
Run Flow ${Option}
    Sleep  5s
    Click     xpath=(//span[@class="check"])[${Option}]
    Wait For Elements State   ${MfaContinueButton} 
    Click  ${MfaContinueButton} 
    Wait For Elements State   ${MfaCodeInput}    timeout=20
    Type Text   ${MfaCodeInput}    000000
    Wait For Load State    load   
Click To Login
   ${ElementVisibleLogin}=    Run Keyword And Return Status    Wait For Elements State    ${MfaLoginEntrarButton}    state=visible     timeout=20
    Run Keyword If   ${ElementVisibleLogin}   Check Visible Login Button
    Run Keyword Unless    ${ElementVisibleLogin}    Log    O botão não está visível
Check Visible Login Button
    Sleep  3s
    Click     ${MfaLoginEntrarButton}
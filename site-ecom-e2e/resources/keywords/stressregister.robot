*** Settings ***
Resource    ../support/commom.robot

*** Variables ***
${BtnSair}                     xpath=//*[@*='Sair']
${BtnUserLogged}               xpath=//*[@*='ptz-header-profile-button-content-logged']
${BtnLogin}                    xpath=//*[@*='ptz-header-profile-button-content-login']
${OrderNumberClass}            css=.order-number
${StressEmailFake}
${StressCpfFake}
${StressCnpjFake}
${BtnQuickAdd}                 xpath=(//*[contains(@*,'ptz-card-button')])[1]
${BtnImgProduct}               xpath=(//*[contains(@*,'ptz-card-image')])[1]
${DetailProduct}               xpath=//h1[@*='name']
${BtnConfirmBuy}               xpath=//*[@*='drawer-header-title'][contains(.,'Confira sua compra')]
${BtnGoToBag}                  xpath=//*[@data-testid='ptz-button-ir-para-sacola'][contains(.,'Ir para sacola')]
${BtnCloseResumeBag}           xpath=//*[contains(@aria-label,'Fechar a gaveta do resumo da sacola')]
${InputCEP}                    xpath=//*[contains(@placeholder,'00000-000')]
${EconomicDelivery}            xpath=//*[@*='labelTitle'][contains(.,'Econômica')]
${SelectEconomicDelivery}      xpath=(//*[contains(@class,'labelTitle')])[1]
${BtnConfirmPayment}           xpath=//*[@id='cartButtonConfirm']
${RegisterNewAddress}          xpath=//*[@class='title'][contains(.,'Cadastrar endereço')]
${BtnRegisterNewAddress}       xpath=//*[@size='is-large'][contains(.,'Cadastrar')]
${TitleRegisterNewAddress}     xpath=//*[@class='title'][contains(.,'Cadastrar novo endereço')]
${FieldNumberHouse}            xpath=//input[@data-testid='ptz-bag-address-register-number']
${FieldNicknameHouse}          xpath=//input[contains(@name,'name')]
${BtnSaveNewAddress}           xpath=//button[contains(.,'Salvar endereço')]
${SelectPixPayment}            xpath=//div[@class='tab-payment'][contains(.,'PixNovo')]
${BtnPayNow}                   xpath=//button[contains(.,'Pagar agora')] 
${TxtClientName}               //h2[@class='client-name']
${BtnGoHomeStore}              xpath=//a[@class='button is-large']
${AcceptCookie}                xpath=//button[contains(.,'Prosseguir com todos')]
${TitleBagPage}                //h1[@*='title']
${TitlePaymentPage}            //h1[@class='payment-title']

*** Keywords ***
Stress I'm On The Registration Page
   Stress Access Profile Menu
   Click Create Account

Stress Access Profile Menu
   ${ValidateCookie}    Run Keyword And Return Status    Wait For Elements State   ${AcceptCookie}    visible    10    
   IF    ${ValidateCookie}
          Validate and Click    ${AcceptCookie}
   END
   Validate and Click    ${HeaderProfileButton}

Stress Click To Register Pf
   Sleep   ${Delay}  
   Validate and Click  ${RegisterPfButton}
   ${ValidateFieldCPF}=   Run Keyword And Return Status    Wait For Elements State   CPF já cadastrado    hidden    15     
    IF    ${ValidateFieldCPF} == False
       Clear Text    ${RegisterCPFInput}
       ${NewCpfFake}             FakerLibrary.Cpf
       Validate and Fill Text    ${RegisterCPFInput}    ${NewCpfFake}
       Click         ${RegisterPfButton}
    END

Stress Click To Register Pj
   Sleep   ${Delay}  
   Validate and Click  ${RegisterPjButton}
   ${ValidateFieldCPF}=   Run Keyword And Return Status    Wait For Elements State    CNPJ já cadastrado    hidden    15
       IF    ${ValidateFieldCPF} == False
       Clear Text    ${RegisterPjCnpjInput}
       ${NewCnpjFake}        FakerLibrary.Cnpj
       Validate and Fill Text     ${RegisterPjCnpjInput}    ${NewCnpjFake}
       Scroll To Element    ${RegisterPjButton}
       Validate and Click   ${RegisterPjButton}
    END  

Stress Click To Logout
    Wait For Elements State   ${HeaderProfileButton}     visible    15
    Get Text    ${BtnUserLogged}    should be    Olá, Teste.
    Click                     ${HeaderProfileButton}
    Click                     ${BtnSair}
    Sleep    3
    Wait For Elements State    ${HeaderProfileButton}    visible    15
    Wait For Elements State    ${BtnLogin}    visible    15     
    Get Text    ${BtnLogin}    should be    Entrar

Stress Fill In The Registration Form PF
   ${StressEmailFake}=        FakerLibrary.Random Number    digits= 09
   ${StressCellPhoneFake}=    FakerLibrary.Phone Number
   ${StressCpfFake}=          FakerLibrary.Cpf
   Set Test Variable   ${StressCpfFake}    
   Set Test Variable   ${StressEmailFake} 
   Wait For Elements State   ${CreateYourAccountLabel}    visible   15
   Validate and Fill Text    ${RegisterNameInput}     ${NameFake}
   Validate and Fill Text    ${RegisterEmailInput}      ${StressEmailFake}${Complement}
   Sleep   ${Delay}
   ${StressCellPhoneFake}=    Generate Random String   8      [NUMBERS]
   Fill Text    ${RegisterCellPhoneInput}   119${StressCellPhoneFake} 
   Scroll To Element    ${RegisterCPFInput}
   Sleep    1
   Fill Text    ${RegisterCPFInput}    ${StressCpfFake} 
   Fill Text    ${RegisterPassswordInput}      ${Password}
   Fill Text    ${RegisterConfirmPasswordInput}      ${Password}
   Validate and Click      ${RegisterTermCheck}

Stress Fill In The Registration Form PJ
   ${StressEmailFake}=         FakerLibrary.Random Number    digits= 09
   ${StressCellPhoneFake}=     FakerLibrary.Phone Number
   ${StressCnpjFake}=          FakerLibrary.Cnpj
   Set Test Variable   ${StressCnpjFake}    
   Set Test Variable   ${StressEmailFake} 
   Wait For Elements State   ${CreateYourAccountLabel}    visible    10
   Validate and Click  ${RegisterRadioPj} 
   Fill Text   ${RegisterPjCorporateNameInput}     ${NameFake}
   Fill Text   ${RegisterPjEmailInput}        ${StressEmailFake}${Complement}
   Sleep   ${Delay}
   ${CellPhoneFake}=    Generate Random String   8      [NUMBERS]
   Fill Text   ${RegisterPjCelPhoneInput}    119${StressCellPhoneFake} 
   Fill Text    ${RegisterPjCnpjInput}       ${StressCnpjFake}
   Scroll To Element     ${RegisterPjFreeIeRadio}  
   Click    ${RegisterPjFreeIeRadio}
   Fill Text   ${RegisterPjPassswordInput}       ${Password} 
   Fill Text   ${RegisterPjConfirmPasswordInput}     ${Password} 
   Sleep   ${Delay}
   Click   ${RegisterPjTermCheck}

Stress Quick Add Product To Bag
    Sleep    5
    Scroll To Element    ${BtnQuickAdd}
    Wait For Elements State    ${BtnQuickAdd}      visible    15       
   #  Click      ${BtnImgProduct}
    Click    ${BtnQuickAdd} 
    Sleep    3
   #  Wait For Elements State    ${DetailProduct}    visible    15
    Wait For Elements State    ${BtnConfirmBuy}    visible    15
    Wait For Elements State    ${BtnGoToBag}       visible    15
    Sleep    3
   #  Click      ${BtnCloseResumeBag}
    Click      ${BtnGoToBag} 

Stress Fill New Adress And Go To Payment
    Wait For Elements State     ${TitleBagPage} 
    Get Text    ${TitleBagPage}    should be    Sacola 
    Wait For Elements State     ${InputCEP}    enabled     15 
    Fill Text    ${InputCEP}    01153-000
    Sleep    10
    Validate and Click    ${EconomicDelivery}
    Sleep    3
    Scroll To Element    ${BtnConfirmPayment}
    Validate and Click   ${BtnConfirmPayment}
    Wait For Elements State    ${RegisterNewAddress}    visible   15
    Sleep    3
    validate and Click    ${BtnRegisterNewAddress}
    Wait For Elements State    ${TitleRegisterNewAddress}    visible     15
    Sleep    3
    Fill Text    ${FieldNumberHouse}        11
    Fill Text    ${FieldNicknameHouse}      11
    Wait For Elements State    ${BtnSaveNewAddress}    visible     15
    Sleep    3
    Click    ${BtnSaveNewAddress} 

Stress Confirm Payment With Pix
    Wait For Elements State    ${TitlePaymentPage}     visible    15
    Get Text    ${TitlePaymentPage}     should be    Pagamento     
    Sleep    3
    Wait For Elements State   ${SelectPixPayment}    visible     15
    Sleep    3
    Click    ${SelectPixPayment} 
    Validate and Click    ${BtnPayNow}   
    Wait For Elements State   ${TxtClientName}    visible     15
    ${OrderNumber}=    Get Text   ${OrderNumberClass}
    Set Test Variable    ${OrderNumber}
    Scroll To Element    ${BtnGoHomeStore}
    Validate and Click   ${BtnGoHomeStore}

Stress Save New User Data To Csv PF
    ${list}    Create List    ${StressCpfFake}    ${StressEmailFake}${Complement}    ${Password}    ${OrderNumber}
    ${data}    Create List    ${list}
    Append To Csv File    ${FilePath}    ${data}    delimiter=,

Stress Save New User Data To Csv PJ
    ${list}    Create List    ${StressCnpjFake}    ${StressEmailFake}${Complement}    ${Password}    ${OrderNumber}
    ${data}    Create List    ${list}
    Append To Csv File    ${FilePath}    ${data}    delimiter=,
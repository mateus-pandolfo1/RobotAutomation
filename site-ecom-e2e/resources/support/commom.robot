*** Settings ***
Library    Browser
Library    FakerLibrary    locale=pt_BR
Library    OperatingSystem
Library    String
Library    Process
Library    BuiltIn
Library    Collections
Library    RequestsLibrary

Resource    ../locators/locators.robot
Resource    ../keywords/login.robot
Resource    ../keywords/mfa.robot
Resource    ../keywords/register.robot
Resource    ../keywords/stressregister.robot
Resource    ../keywords/profile.robot
Resource    ../keywords/home.robot
Resource    ../keywords/bag.robot
Resource    ../keywords/pdp.robot
Resource    ../keywords/subscription.robot
Resource    ../keywords/checkout.robot


*** Variables ***
${UrlStg}                                               https://stg-site.labpetz.com.br
${UrlPrd}                                               https://www.petz.com.br/  
${Environment}                                          prd 
${Browser}                                              chromium
${EnvFile}                                              stg  
${FilePath}                                             ./resources/variables/${EnvFile}-data.csv
${Delay}                                                0.3s  
${Complement}                                           site@stresstest.com.br
${NameFake}                                             Teste Site
${Cnpj}                                                 12663743000120
${Password}                                             Petz@123

${HeaderProfileButton}                                  xpath=//*[@class="ptz-header-profile-button-content"]
${BagXpath}                                             xpath=//i[contains(@class,'ds-icon-line ds-petz-bag ptz-icon ptz-icon-lg ptz-icon-neutral-black')]
${GoToBagButtonXpath}                                   xpath=//button[@data-testid='ptz-button-ir-para-sacola'][contains(.,'Ir para sacola')]
${SearchFieldXpath}                                     xpath=//input[contains(@class,'ptz-input ptz-input-md ptz-input-with-icon-right ptz-input-with-icon-md ptz-input-with-icon ptz-input-boxed ptz-input-boxed-md ptz-input-boxed-resting')]
${ButtonSearchXpath}                                    xpath=//i[contains(@class,'ds-icon-line ds-search ptz-icon ptz-icon-lg ptz-icon-neutral-dark')]
${EmailTextField}                                       xpath=//input[@placeholder="Digite seu e-mail ou CPF/CNPJ"]
${PasswordTextfield}                                    xpath=//input[@placeholder="Sua senha"]
${Submit}                                               xpath=//button[@class="ptz-btn ptz-btn-light-primary ptz-btn-md-full-width ptz-btn-left"]
${PetzHome}                                             xpath=//div[@class="ptz-header-content"]
${BotaoCachorroHome}                                    xpath=//a[@href="https://www.petz.com.br/cachorro"]
${TituloCategoriaCachorro}                              xpath=//h1[@class="main-title"]
${SubtituloCategoriaCachorro}                           xpath=//h2[@id="titleRecomendationsCategory"]
${Subscriptionmenu}                                     xpath=//a[@role='tab'][contains(.,'Assinatura')]

#Home
${FavoritePageButton}                                   xpath=//*[@*='ds-icon-line ds-heart ptz-icon ptz-icon-lg ptz-icon-neutral-black']
${FindField}                                            xpath=//input[@*='headerSearch']
${ProfileButton}                                        xpath=//span[@class='ptz-header-profile-button-content-logged'][contains(.,'Olá, Heloisa.')]
${MyPetsButton}                                         xpath=//*[contains(text(),'Meus Pets')]


#Find Page
${ProductSearch}                                        Brinquedo Chalesco

#Product Page
${FavoriteButton}                                       //*[@*='favorite-icon']
${ProductNameOnProductPage}                             (//*[@itemprop='name'])[5]  
${FavoriteButtonSelected}                               //*[@*='favorite-icon' and @class='fa fa-heart']
${Bag_xpath}                         //i[contains(@class,'ds-icon-line ds-petz-bag ptz-icon ptz-icon-lg ptz-icon-neutral-black')]
${Go_to_bag_button_xpath}            //button[@data-testid='ptz-button-ir-para-sacola'][contains(.,'Ir para sacola')]
${EmailTextField}                    //input[@placeholder="Digite seu e-mail ou CPF/CNPJ"]
${PasswordTextfield}                 //input[@placeholder="Sua senha"]
${Submit}                            //button[@class="ptz-btn ptz-btn-light-primary ptz-btn-md-full-width ptz-btn-left"]
${ProfileButton}                     //span[@class='ptz-header-profile-button-content-logged'][contains(.,'Olá, teste.')]
${PetzHome}                          //div[@class="ptz-header-content"]
${BotaoCachorroHome}                 //a[@href="https://www.petz.com.br/cachorro"]
${TituloCategoriaCachorro}           //h1[@class="main-title"]
${SubtituloCategoriaCachorro}        //h2[@id="titleRecomendationsCategory"]
${UserMain}                          69782530140
${PasswordMain}                      123456
${Subscriptionmenu}                  //a[@role='tab'][contains(.,'Assinatura')]

*** Keywords ***
Start Session
    Run Keyword If    '${Environment}' == 'stg'    Test In Staging Environment
    Run Keyword If    '${Environment}' == 'prd'    Test In Production Environment
Test In Staging Environment
    Open Browser    ${UrlStg}   ${Browser}  headless=False
    Wait For Load State    domcontentloaded    
Test In Production Environment
    Open Browser     ${UrlPrd}      ${Browser}    pause_on_failure=false
    Wait For Load State    domcontentloaded 
Finish Session
   Close Browser
Fake Data Generator 
   Sleep    ${Delay}
   ${EmailFake}           FakerLibrary.Random Number    digits= 09
   ${CellPhoneFake}       FakerLibrary.Phone Number
   ${CpfFake}             FakerLibrary.Cpf 
   ${CnpjFake}            FakerLibrary.Cnpj 
   ${PasswordFake}        FakerLibrary.Password
   Set Global Variable    ${NameFake}
   Set Global Variable    ${CpfFake} 
   Set Global Variable    ${EmailFake}
   Set Global Variable    ${CellPhoneFake} 
   Set Global Variable    ${Complement}
   Set Global Variable    ${CnpjFake}  
   Set Global Variable    ${Cnpj}  
   Set Global Variable    ${Password}
Save Data Csv File 
    ${list}    Create List  ${CpfFake}   ${EmailFake}${Complement}   ${Password}   
    ${data}    create list    ${list}
    Append To Csv File    ${FilePath}     ${data}    delimiter=,
Read Data Csv File
    @{User}=     Read Csv File To Associative  ${FilePath} 
    # -1 will always get the last line
    Set Global Variable    @{User}
Log In with PF 
    [Arguments]  ${EmailOrCpf}     ${Password}
    I'm On The Login Page    
    Fill In The Login Form    ${EmailOrCpf}   ${Password}
    Click To Enter
    Select Method To Receive MFA Code 2
    Click To Login
Register A New User PF
    I'm On The Registration Page
    Fill In The Registration Form PF
    Click To Register PF
    Select Method To Receive MFA Code 1
    Click To Create Account

Open Website
    New Persistent Context    is_incognito=True    headless=false     ignoreHTTPSErrors=true     viewport={'width': 1270, 'height': 850}    
    Delete All Cookies
    # Go To   https://stg-site.labpetz.com.br/checkout/login/indexLogado_Loja
    Go To    https://www.petz.com.br/checkout/login/indexLogado_Loja
    
Close Website
    Sleep    2
    Take Screenshot
    Close Browser

open user menu
    Click    ${ProfileButton}

im on the site
    Validate Element    ${emailTextField}

# Filling login
# Quando inserir dados validos
    # Run Keyword    Fill in Login    ${emailTextfield}    ${email}    ${password}

Fill in Registration
    [Arguments]                     ${firstNameTextField}            ${firstName}                        ${lastNameTextField}    ${lastName}    ${emailTextField}    ${email}    ${passwordTextField}    ${password}    ${registerButton}
    Wait for Elements State         ${firstNameTextField}
    Fill Text                       ${firstNameTextField}            ${firstName}
    Fill Text                       ${lastNameTextField}             ${lastName}
    Fill Text                       ${emailTextField}                ${email}
    Fill Text                       ${passwordTextField}             ${password}
    Click                    ${registerButton}

# Filling Registration
# Quando inserir dados validos no cadastro
#                      ${firstName}        FakerLibrary.Name
#                      ${lastName}         FakerLibrary.Name
#                      ${email}            FakerLibrary.Email
#                      ${password}         FakerLibrary.Password
#                      Run Keyword         Fill in registration     ${firstNameTextField}    ${firstName}    ${lastNameTextField}    ${lastName}    ${emailTextField}    ${email}    ${passwordTextField}    ${password}    ${registerButton}


Validate and Fill Text
    [Arguments]                      ${selector}                       ${text}
    Wait for Elements State    ${selector}                       timeout=30 s
    Fill Text                       ${selector}                       ${text}

# Validating and typing texts
    # Validate And Fill Text  ${emailTextfield}  teste
    # Validate And Fill Text  ${passwordTextfield}  teste


Validate Element
    [Arguments]                      ${selector}
    Wait for Elements State    ${selector}                       timeout=30 s

Validate and Click
    [Arguments]                      ${selector}
    Wait for Elements State    ${selector}          visible                 timeout=30 s
    Click                    ${selector}

# Validating and Click
    # Validate And Click       ${submit}

Validate Text on Screen
    [Arguments]    ${selector}    ${text}
    ${get_text}=    Get Text    ${selector}
    Should Contain    ${get_text}    ${text}

I Click On Favorite Button
    Validate Text on Screen             ${ProductNameOnProductPage}     ${ProductSearch}
    Validate and Click                  ${FavoriteButton}
    Validate Element                    ${FavoriteButtonSelected}

I Open Favorite Page
    Validate and Click                  ${FavoritePageButton}
    
I Click On Find Field
    Validate and Click                  ${FindField}

I Open Pets Page
    Validate and Click                  ${ProfileButton}
    Validate and Click                  ${MyPetsButton}


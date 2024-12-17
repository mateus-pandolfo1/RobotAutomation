*** Settings ***
Resource    ../support/commom.robot

*** Variables ***

# Register Page 
${CreateAccountLink}                    css=a.ptz-link.ptz-link-medium.ptz-link-light-default
${CreateYourAccountLabel}               xpath=//h2[@class='register-title'][contains(.,'Crie sua conta')]
${RegisterNameInput}                    id=cadastroNome
${RegisterEmailInput}                   id=cadastroEmailFisica 
${RegisterCellPhoneInput}               id=cadastroCelularFisica
${RegisterCPFInput}                     id=cadastroCPF
${RegisterPassswordInput}               id=cadastroSenhaFisica 
${RegisterConfirmPasswordInput}         id=cadastroConfirmarSenhaFisica
${RegisterTermCheck}                    xpath=(//span[@class='check'])[1]
${RegisterButton}                       xpath=//button[@type='submit'][contains(.,'Criar conta')]
${RegisterPfButton}                     id=cadastroCriarConta
${RegisterRadioPj}                      xpath=//li[a/span[text()='Pessoa Jurídica']]
${RegisterPjCorporateNameInput}         id=cadastroRazaoSocial
${RegisterPjEmailInput}                 id=cadastroEmailJuridica 
${RegisterPjCelPhoneInput}              id=cadastroCelularJuridica
${RegisterPjCnpjInput}                  id=cadastroCNPJ
${RegisterPjFreeIeRadio}                id=cadastroIsentoIE
${RegisterPjPassswordInput}             id=cadastroSenhaJuridica
${RegisterPjConfirmPasswordInput}       id=cadastroConfirmarSenhaJuridica
${RegisterPjTermCheck}                  xpath=//section[1]/div[2]/form[1]/div[11]/div[1]/label[1]/span[1]
${RegisterPjButton}                     id=cadastroCriarContaJuridica

# Pop-up MFA Page
${MfaShippingOptionRadio}               xpath=(//span[@class="check"])[1]
${MfaCodeInput}                         id=code
${MfaContinueButton}                    xpath=//button[contains(.,'Continuar')]   
${MfaLoginEntrarButton}                 xpath=//button[contains(.,'Entrar')]

# Login Page
${LoginButton}                          id=loginButton
${LoginEmailInput}                      id=loginEmail
${LoginPasswordInput}                   id=loginPassword
${LoginEntrarButton}                    id=loginEntrar
${EmailTextField}                       xpath=//input[@placeholder="Digite seu e-mail ou CPF/CNPJ"]
${PasswordTextfield}                    xpath=//input[@placeholder="Sua senha"]
${Submit}                               xpath=//button[@class="ptz-btn ptz-btn-light-primary ptz-btn-md-full-width ptz-btn-left"]
${ProfileButton}                   xpath=//span[@class="ptz-header-profile-button-content-logged"][text()='Olá, teste.']

# Profile Page
${ProfileMenuMyOrders}                  xpath=//span[contains(.,'Meus pedidos')]
${ProfileMenuSignature}                 xpath=//span[contains(.,'Assinatura')]
${ProfileMenuMyPetz}                    xpath=//span[contains(.,'Meus Petz')]
${ProfileMenuMyData}                    xpath=//span[contains(.,'Meus Dados')] 
${ProfileMenuExitAccount}               xpath=//span[contains(.,'Meus Sair')] 


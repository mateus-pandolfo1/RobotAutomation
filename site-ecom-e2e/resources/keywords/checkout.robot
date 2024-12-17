*** Comments ***
Documentation
... Suite with system register resources

*** Settings ***

Resource    ../support/commom.robot


Library    BuiltIn
Library    Collections

*** Variables ***

${ImgPaymentXpath}                 xpath=//p[@class='wallet-title'][contains(.,'Carteira Petz')]
${FieldCard}                        xpath=//input[contains(@placeholder,'Digite o número do cartão')]
${FieldCardName}                    xpath=//input[contains(@placeholder,'Digite o nome que está no cartão')]
${MonthExpire}                      xpath=//div[@class="wrapper-installments"]/select[1]
${YearExpire}                       xpath=//div[@class="wrapper-installments"]/select[2]
${SecurityCode}                     xpath=//input[contains(@placeholder,'Ex: 123')]
${TermsAndConditionsCheckbox}       xpath=//input[contains(@class,'ptz-checkbox ptz-checkbox-sm ptz-checkbox-light-error')]
${BttPayNow}                        xpath=//button[@data-testid='ptz-checkout-pay-now'][contains(.,'Pagar agora')]

*** Keywords ***

Fill Fields Of Credit Card
    Validate And Fill Text    ${FieldCard}         5116841376681067
    Validate And Fill Text    ${FieldCardName}    Teste QA
    Select Options By         ${MonthExpire}       text    01
    Select Options By         ${YearExpire}        text    2029
    Fill Text                 ${SecurityCode}      739

Check Terms And Conditions Of Subscribe
    Validate And Click        ${TermsAndConditionsCheckbox}

Finish Order
    Validate And Click        ${BttPayNow}
    Sleep    5s
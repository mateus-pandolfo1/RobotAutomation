*** Comments ***
Documentation
... Suite with system register resources

*** Settings ***

Resource    ../support/commom.robot


Library    BuiltIn
Library    Collections

*** Variables ***

${HeaderSubscription}    //h1[@class='sc-iXzfSG cyzmsI'][contains(.,'Assinatura')]
${SubscribeNumber}       null
${EditSubscription}      //div[contains(text(), 'Assinatura #${SubscribeNumber}')]/ancestor::div[contains(@class, 'sc-eDPEul')]//button[@data-testid='ptz-button-alterar-assinatura']

*** Keywords ***

Access Subscriptions
    Open User Menu
    Validate And Click    ${SubscriptionMenu}
    Validate Element      ${HeaderSubscription}

User Access The Edit Subscription
    [Arguments]            ${SubscribeNumber}
    Validate And Click    ${EditSubscription}
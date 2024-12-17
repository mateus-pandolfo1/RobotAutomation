*** Comments ***
Documentation
... Suite with system register resources

*** Settings ***
Resource    ../support/commom.robot

Library    BuiltIn
Library    Collections

*** Variables ***
${EconomicDeliveryXpath}                xpath=//button[@type='button'][contains(.,'Padrão')]
${ExpressDeliveryXpath}                 xpath=//button[@type='button'][contains(.,'Expressa')]
${ScheduleDeliveryXpath}                xpath=//button[@type='button'][contains(.,'Agendada')]
${PickupDeliveryXpath}                  xpath=//button[@type='button'][contains(.,'Retire na Loja')]
${ProductNumber}                        1
${ToggleSubscribeProductBaseXpath}=     xpath=(//div[@class="slider round"])[${ProductNumber}]
${ToggleValue30Xpath}                   xpath=//li[@value='30'][contains(.,'30 dias')]
${SearchFieldXpath}                     xpath=//input[contains(@class,'ptz-input ptz-input-md ptz-input-with-icon-right ptz-input-with-icon-md ptz-input-with-icon ptz-input-boxed ptz-input-boxed-md ptz-input-boxed-resting')]
${ButtonSearchXpath}                    xpath=//i[contains(@class,'ds-icon-line ds-search ptz-icon ptz-icon-lg ptz-icon-neutral-dark')]
${ImgBagXpath}                          xpath=//h1[@class='title'][contains(.,'Sacola')]
${GoToCheckoutXpath}                    xpath=//span[contains(.,'Ir para pagamento')]
${SchedulePopup}                        xpath=//div[@class='modal-header'][contains(.,'Agende o dia e horário da sua entrega')]
${FirstOptionSchedule}                  xpath=//div[contains(@class,'item dayCard active')]
${FirstHourOptionSchedule}              xpath=(//input[contains(@type,'radio')])[1]
${ButtonFinishSchedule}                 id=finishSchedule
${DeliveryChecked}                      xpath=//i[contains(@class,'ds-icon-line ptz-icon ds-check ptz-icon-md')]
${FirstOptionPickup}                    xpath=//span[@class='store-name'][contains(.,'Petz Santa Cecília')]
${PickupPopup}                          xpath=//div[@class='modal-header'][contains(.,'Escolha a loja para retirar o pedido')]
${ButtonConfirmPickup}                  xpath=//button[@type='button'][contains(.,'Retirar nesta loja')]

*** Keywords ***

Subscribe Product    #Passar Como Parametro O Numero Do Produto Que Deseja Assinar Na Ordem Que Está Sendo Apresentado Na Sacola
    [Arguments]    ${ProductNumber}
    ${ToggleSubscribeProductXpath}=    Set Variable    ${ToggleSubscribeProductBaseXpath}
    Validate And Click    ${ToggleSubscribeProductXpath}
    Sleep    1
    Run Keyword If    '${ToggleSubscribeProductXpath}' == 'true'    Log    Toggle Is ON
    Click    ${ToggleValue30Xpath}
    Wait For Elements State    //span[@class='input-frequency-title'][contains(.,'Envio a cada 30 dias')]    Visible
    Sleep    2

Select Delivery Type    #Passar Como Parametro Economic, Express, Schedule Ou Pickup
    [Arguments]    ${DeliveryNumber}
    IF    '${DeliveryNumber}' == 'economic'
        Validate and Click   ${EconomicDeliveryXpath}
        Wait For Elements State    ${DeliveryChecked}
    ELSE IF    '${DeliveryNumber}' == 'express'
        Validate and Click    ${ExpressDeliveryXpath}
        Wait For Elements State    ${DeliveryChecked}
    ELSE IF    '${DeliveryNumber}' == 'schedule'
        Validate and Click    ${ScheduleDeliveryXpath}
        Wait For Elements State    ${SchedulePopup}    Visible
        Validate and Click    ${FirstOptionSchedule}
        Validate and Click    ${FirstHourOptionSchedule}
        Validate and Click    ${ButtonFinishSchedule}
        Wait For Elements State    ${DeliveryChecked}
    ELSE IF    '${DeliveryNumber}' == 'pickup'
        Validate and Click    ${PickupDeliveryXpath}
        Wait For Elements State    ${PickupPopup}    Visible
        Validate and Click    ${FirstOptionPickup}
        Validate And Click    ${ButtonConfirmPickup}
        Wait For Elements State    ${DeliveryChecked}
    END
    Sleep    1

Go To Checkout
    Scroll By    ${GoToCheckoutXpath}
    Validate and Click    ${GoToCheckoutXpath}
    Wait For Elements State    ${ImgBagXpath}    Visible

*** Settings ***
Resource    ../support/commom.robot

*** Keywords ***
Access My Data
    Wait For Load State    load
    Access Profile Menu
    Click   ${ProfileMenuMyData}  
    Wait For Elements State   xpath=//h1[contains(.,'Meus Dados')]      timeout=10  
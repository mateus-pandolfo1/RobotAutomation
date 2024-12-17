*** Comments ***
Documentation
... Suite with system register resources

*** Settings ***

Resource    ../support/commom.robot

Library    BuiltIn
Library    Collections

*** Variables ***

${ProductXpath}                     (//div[contains(@class,'ptz-card-content')])[1]
${AddToBagXpath}                  //button[contains(@class,'ptz-btn ptz-btn-light-primary ptz-btn-sm ptz-btn-left')]

*** Keywords ***

Add Product To Bag
    Access The Product
    Wait For Elements State    ${AddToBagXpath}    Visible
    Validate and Click                      ${AddToBagXpath}
    Sleep    2
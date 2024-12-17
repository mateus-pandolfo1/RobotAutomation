*** Settings ***
Resource    ../support/commom.robot

*** Variables ***

${FirstProductDisplayed}                       (//*[@id='produto-href'])[1]
${ProductMostSearched}                         (//*[@*='ptz-dropdown-option'])[5] 
${FirstProductMostSearched}                    (//*[@*='ptz-card-label-left'])[1]

*** Keywords ***
I Click On First Product Displayed In Search Page
    Validate Text on Screen                    ${FirstProductDisplayed}       ${ProductSearch}          
    Validate and Click                         ${FirstProductDisplayed}   

Validate Product Searched
    Validate Text on Screen                    ${FirstProductDisplayed}       ${ProductSearch}        

Select A First Product Most Searched  
    Validate and Click                         ${ProductMostSearched}

The Product Most Searched Will Be Displayed
    Validate Element                    ${FirstProductMostSearched}    
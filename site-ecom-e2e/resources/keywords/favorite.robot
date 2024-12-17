*** Settings ***
Resource    ../support/commom.robot

*** Variables ***

${FirstProductNameFavorited}                     //*[@*='ptz-card-label-left']
${UnfavoriteButton}                              //*[@*='ptz-card-heart-icon hydrated']
${ConfirmUnfavoriteButton}                       //*[contains(text(),'Sim')] 
${EmptyFavoriteMessage}                          //*[@*='emptyList']  
${EmptyFavoriteText}                             Você ainda não adicionou nenhum produto como favorito

*** Keywords ***

I Validate Product Favorited
    Validate Text on Screen    ${FirstProductNameFavorited}    ${ProductSearch}

I Click To Unfavorite Button
    Validate and Click         ${UnfavoriteButton}
    Validate and Click         ${ConfirmUnfavoriteButton}

The Product Was Unfavorite Successfully
    Validate Text on Screen    ${EmptyFavoriteMessage}          ${EmptyFavoriteText}

    
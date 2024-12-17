Documentation
...Suite with favorite tests

*** Settings ***
Resource         ../resources/support/commom.robot
Resource         ../resources/keywords/login.robot
Resource         ../resources/keywords/search.robot
Resource         ../resources/keywords/favorite.robot


Test Setup       Open Website
#Test Teardown    Close Website

*** Test Cases ***

Test Case 001: Favorite Product and Unfavorite
    [Tags]    Regression    Positive    Favorite
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And search product     ${ProductSearch}
    And I Click On First Product Displayed In Search Page
    When I Click On Favorite Button
    And I Open Favorite Page
    Then I Validate Product Favorited

    When I Click To Unfavorite Button
    Then The Product Was Unfavorite Successfully

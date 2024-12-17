Documentation
...Suite with Search tests

*** Settings ***
Resource         ../resources/support/commom.robot
Resource         ../resources/keywords/login.robot
Resource         ../resources/keywords/search.robot


Test Setup       Open Website
Test Teardown    Close Website

*** Test Cases ***

Test Case 001: Search Product
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And search product     ${ProductSearch}
    When I Click On First Product Displayed In Search Page
    Then Validate Product Searched

Test Case 002: Most Search Product
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Click On Find Field
    And Select A First Product Most Searched
    Then The Product Most Searched Will Be Displayed



Documentation
...Suite with Category tests

*** Settings ***
Resource         ../resources/support/commom.robot
Resource         ../resources/keywords/home.robot
Resource         ../resources/keywords/login.robot


Test Setup       Open Website
Test Teardown    Close Website

*** Test Cases ***
Test Case 001: Dog Category
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open The Section Of A Product In The Dog Category
    Then The Products Of Dog Category Will Be Displayed

Test Case 002: Cat Category
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open The Section Of A Product In The Cat Category
    Then The Products Of Cat Category Will Be Displayed

Test Case 003: Bird Category
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open The Section Of A Product In The Bird Category
    Then The Products Of Bird Category Will Be Displayed

Test Case 004: Fish Category
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open The Section Of A Product In The Fish Category
    Then Then The Products Of Fish Category Will Be Displayed

Test Case 005: Other Pets Category
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open The Section Of A Product In The Other Pets Category
    Then The Products Of Other Pets Category Will Be Displayed

Test Case 006: House And Garden Category
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open The Section Of A Product In The House And Garden Category
    Then The Products Of House And Garden Category Will Be Displayed
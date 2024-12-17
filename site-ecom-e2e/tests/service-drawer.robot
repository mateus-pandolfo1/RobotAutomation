Documentation
...Suite with Service Drawer tests

*** Settings ***
Resource         ../resources/support/commom.robot
Resource         ../resources/keywords/login.robot
Resource         ../resources/keywords/service-drawer.robot




Test Setup       Open Website
Test Teardown    Close Website

*** Test Cases ***

Test Case 001: Veterinarian Service
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Click On Service Menu
    And I Click On Veterinarian Service
    Then I Validate The Veterinarian Page

Test Case 002: Bath And Grooming Service
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Click On Service Menu
    And I Click On Bath And Grooming Service
    Then I Validate The Bath And Grooming Page

Test Case 003: Adoption Service
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Click On Service Menu
    And I Click On Adoption Service
    Then I Validate The Adoption Page
Test Case 004: Training Service
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Click On Service Menu
    And I Click On Training Service
    Then I Validate The Training Page

Test Case 005: Training Courses Service
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Click On Service Menu
    And I Click On Online Course Service
    Then I Validate The Online Course Page

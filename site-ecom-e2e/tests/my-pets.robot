Documentation
...Suite with My Pets tests

*** Settings ***
Resource         ../resources/support/commom.robot
Resource         ../resources/keywords/login.robot
Resource         ../resources/keywords/my-pets.robot


Test Setup       Open Website
Test Teardown    Close Website

*** Test Cases ***

Test Case 001: Add a New Pet And Delete
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open Pets Page
    And I Click To Add A New Pet
    When I Fill Pet Information
    Then The Pet Has Been Added Successfully

Test Case 001: Edit Existent Pet
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open Pets Page
    And I Click To Edit The Pet
    When I Fill Pet Name      Edited
    And I Click To Save Pet
    Then The Pet Has Been Added Successfully
    
Test Case 001: Delete Existent Pet
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    And I Open Pets Page
    When I Click To Delete Pet
    Then The Pet Has Been Deleted Successfully
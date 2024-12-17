Documentation
...Suite with login tests

*** Settings ***
Resource         ../resources/support/commom.robot
Resource         ../resources/keywords/login.robot

Test Setup       Open Website
Test Teardown    Close Website

*** Test Cases ***

Test Case 001: Create subscription with economic delivery
    [Documentation]    O cenário em questão valida a criação de uma assinatura
    [Tags]    Regression    Positive    CreateSubscription
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    When Search Product     Brinquedo Chalesco
    And Add Product To Bag
    And Select Delivery Type    economic
    And Subscribe Product     1
    And Go To Checkout
    And Fill Fields Of Credit Card 
    And Check Terms And Conditions Of Subscribe
    And Finish Order 
    # When the order has been generated
    # And subscribe has been created

Test Case 002: Create subscription with express delivery
    [Documentation]    O cenário em questão valida a criação de uma assinatura
    [Tags]    Regression    Positive    CreateSubscription
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    When Search Product     Brinquedo Chalesco
    And Add Product To Bag
    And Select Delivery Type    express
    And Subscribe Product     1
    And Go To Checkout
    And Fill Fields Of Credit Card 
    And Check Terms And Conditions Of Subscribe
    And Finish Order 
    # When the order has been generated
    # And subscribe has been created

Test Case 003: Create subscription with schedule delivery
    [Documentation]    O cenário em questão valida a criação de uma assinatura
    [Tags]    Regression1    Positive    CreateSubscription
    Given im on the site        
    And Do Login    ${UserMain}        ${PasswordMain}
    When Search Product     Brinquedo Chalesco
    And Add Product To Bag
    And Select Delivery Type    schedule
    And Subscribe Product     1
    And Go To Checkout
    And Fill Fields Of Credit Card 
    And Check Terms And Conditions Of Subscribe
    And Finish Order 
    # When the order has been generated
    # And subscribe has been created

# Test Case 004: Create subscription with pickup delivery
#     [Documentation]    O cenário em questão valida a criação de uma assinatura
#     [Tags]    Regression    Positive    CreateSubscription
#     Given im on the site        
#     And Do Login    ${UserMain}        ${PasswordMain}
#     When Search Product     Brinquedo Chalesco
#     And Add Product To Bag
#     And Select Delivery Type    pickup
#     And Subscribe Product     1
#     And Go To Checkout
#     And Fill Fields Of Credit Card 
#     And Check Terms And Conditions Of Subscribe
#     And Finish Order 
#     # Then the order has been generated
#     # And subscribe has been created

# Test Case 005: Cancel subscription with option 1
#     [Documentation]    O cenário em questão a alteração de assinatura
#     [Tags]    Regression    Positive    CancelSubscriptionw
#     Given im on the site        
#     And Do Login    ${UserMain}        ${PasswordMain}
#     And access subscriptions
#     When user access the edit subscription    4593640

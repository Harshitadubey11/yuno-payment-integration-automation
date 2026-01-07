Feature: Customer creation and payment method enrollment via Yuno API

  Background:
    Given valid public and private API keys are provided
    And a unique idempotency key is generated

  @Regression @Integration
  Scenario: Create a customer with valid details
    When a customer is created with valid customer information
    Then the customer should be created successfully
    And the customer ID should be returned

  @Regression @Integration
  Scenario: Enroll a payment method for an existing customer
    Given a customer already exists
    When the payment method enrollment request is initiated
    Then the payment method should be enrolled successfully

  @Negative
  Scenario: Enroll payment method for non-existent customer
    When the payment method enrollment is attempted for an invalid customer
    Then the enrollment should fail
    And the error message should indicate customer not found


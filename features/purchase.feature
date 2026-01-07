Feature: Purchase payment via Yuno API

  Background:
    Given valid public and private API keys are provided
    And a unique idempotency key is generated
    And the workflow field is set to "DIRECT"

  @Sanity @Integration
  Scenario: Successful purchase with minimal required fields
    When a purchase payment is created with minimal fields
    Then the payment should be approved
    And the response status should be "APPROVED"

  @Regression @Integration
  Scenario: Successful purchase with maximal fields
    When a purchase payment is created with customer_payer and additional_data
    Then the payment should be approved
    And the response status should be "APPROVED"

  @Negative
  Scenario: Purchase payment with invalid card number
    When a purchase payment is created using an invalid card
    Then the payment should be declined
    And the error message should be returned


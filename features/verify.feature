Feature: Verify payment method via Yuno API

  Background:
    Given valid public and private API keys are provided
    And a unique idempotency key is generated
    And the workflow field is set to "DIRECT"

  @Sanity @Integration
  Scenario: Verify card using payment verification
    When a payment is created with verify set to true
    Then the card should be verified successfully
    And the response status should be "VERIFIED"

  @Negative
  Scenario: Verify card with invalid card details
    When a payment verification is attempted using invalid card details
    Then the verification should fail
    And the error message should be returned


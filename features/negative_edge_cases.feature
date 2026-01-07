Feature: Negative and edge case scenarios for Yuno payment APIs

  Background:
    Given valid public and private API keys are provided
    And a unique idempotency key is generated
    And the workflow field is set to "DIRECT"

  @Negative @Sanity
  Scenario: Payment request with invalid public API key
    When a payment request is sent with an invalid public API key
    Then the request should be rejected
    And the response status code should be 401

  @Negative
  Scenario: Payment request with missing mandatory workflow field
    When a payment request is sent without the workflow field
    Then the request should fail
    And the error message should indicate missing mandatory field

  @Negative
  Scenario: Payment with expired card number
    When a purchase payment is created using an expired card
    Then the payment should be declined
    And the error message should indicate card expired

  @Negative
  Scenario: Duplicate payment request with same idempotency key
    Given a payment request has already been processed
    When the same payment request is sent again with the same idempotency key
    Then the response should be idempotent
    And duplicate payment should not be created

  @Negative
  Scenario: Refund with invalid payment ID
    When a refund request is initiated with an invalid payment ID
    Then the refund request should fail
    And the error message should indicate transaction not found


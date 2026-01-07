Feature: Refund and Cancel payment via Yuno API

  Background:
    Given valid public and private API keys are provided
    And a unique idempotency key is generated
    And the workflow field is set to "DIRECT"

  @Regression @Integration
  Scenario: Successful refund of a completed payment
    Given a payment has been successfully completed
    When a refund request is initiated for the payment
    Then the refund should be processed successfully
    And the response status should be "REFUNDED"

  @Regression @Integration
  Scenario: Cancel an authorized payment
    Given a payment has been successfully authorized
    When a cancel request is initiated
    Then the payment should be cancelled successfully
    And the response status should be "CANCELLED"

  @Negative
  Scenario: Refund a payment that does not exist
    When a refund request is initiated for a non-existent payment
    Then the refund request should fail
    And the error message should indicate transaction not found

  @Negative
  Scenario: Refund an already refunded payment
    Given a payment has already been refunded
    When another refund request is initiated
    Then the refund request should fail
    And the error message should indicate duplicate refund


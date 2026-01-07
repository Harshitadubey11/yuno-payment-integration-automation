Feature: Authorization and Capture payment via Yuno API

  Background:
    Given valid public and private API keys are provided
    And a unique idempotency key is generated
    And the workflow field is set to "DIRECT"

  @Sanity @Integration
  Scenario: Successful authorization with minimal required fields
    When an authorization payment is created with minimal fields
    Then the authorization should be successful
    And the response status should be "AUTHORIZED"

  @Regression @Integration
  Scenario: Successful authorization with maximal fields
    When an authorization payment is created with customer_payer and additional_data
    Then the authorization should be successful
    And the response status should be "AUTHORIZED"

  @Regression @Integration
  Scenario: Capture an authorized payment
    Given a payment has been successfully authorized
    When a capture request is sent for the authorized payment
    Then the payment should be captured successfully
    And the response status should be "CAPTURED"

  @Negative
  Scenario: Capture payment without authorization
    When a capture request is sent without prior authorization
    Then the capture request should fail
    And the error message should indicate invalid payment state

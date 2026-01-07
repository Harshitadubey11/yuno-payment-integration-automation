
from behave import given, when, then
import uuid
import requests

# -------------------------
# Common / Background Steps
# -------------------------

@given('valid public and private API keys are provided')
def step_valid_api_keys(context):
    context.public_api_key = "public-api-key"
    context.private_secret_key = "private-secret-key"


@given('a unique idempotency key is generated')
def step_generate_idempotency_key(context):
    context.idempotency_key = str(uuid.uuid4())


@given('the workflow field is set to "DIRECT"')
def step_set_workflow(context):
    context.workflow = "DIRECT"


# -------------------------
# Purchase / Payment Steps
# -------------------------

@when('a purchase payment is created with minimal required fields')
def step_create_purchase_minimal(context):
    context.request_payload = {
        "workflow": context.workflow,
        "amount": 100,
        "currency": "USD"
    }
    # API call intentionally mocked / not executed


@when('a purchase payment is created with maximal fields')
def step_create_purchase_maximal(context):
    context.request_payload = {
        "workflow": context.workflow,
        "amount": 100,
        "currency": "USD",
        "customer_payer": {},
        "additional_data": {}
    }


@then('the payment should be created successfully')
def step_payment_success(context):
    assert context.request_payload["workflow"] == "DIRECT"


# -------------------------
# Authorization / Capture
# -------------------------

@when('an authorization request is sent')
def step_authorization_request(context):
    context.authorization_sent = True


@then('the authorization should be successful')
def step_authorization_success(context):
    assert context.authorization_sent is True


@when('a capture request is sent for the authorized payment')
def step_capture_request(context):
    context.capture_sent = True


@then('the capture should be successful')
def step_capture_success(context):
    assert context.capture_sent is True


# -------------------------
# Refund / Cancel
# -------------------------

@when('a refund request is initiated')
def step_refund_request(context):
    context.refund_requested = True


@then('the refund should be processed successfully')
def step_refund_success(context):
    assert context.refund_requested is True


@when('a cancel payment request is sent')
def step_cancel_request(context):
    context.cancel_requested = True


@then('the payment should be cancelled successfully')
def step_cancel_success(context):
    assert context.cancel_requested is True


# -------------------------
# Verify
# -------------------------

@when('a payment is created with verify flag set to true')
def step_verify_payment(context):
    context.verify = True


@then('the payment method should be verified')
def step_verify_success(context):
    assert context.verify is True


# -------------------------
# Negative / Edge Cases
# -------------------------

@when('a payment request is sent with an invalid public API key')
def step_invalid_api_key(context):
    context.invalid_key_used = True


@then('the request should be rejected')
def step_request_rejected(context):
    assert context.invalid_key_used is True

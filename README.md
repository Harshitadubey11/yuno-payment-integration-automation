# Yuno Payment Integration Automation

BDD automation framework for payment API integrations using Python and Behave.

---

## Overview
This project demonstrates a BDD-based automation testing framework for Yuno payment API integrations.
It covers core payment workflows such as Purchase, Authorization, Capture, Refund, Cancel, Verify,
Customer creation, and Payment Method Enrollment.

The framework focuses on test coverage, negative scenarios, and clear automation design rather than
full API execution.

---

## Tech Stack
- Python
- Behave (BDD)
- Gherkin

---

## Project Structure
```
yuno-payment-integration-automation/
├── features/
│   ├── purchase.feature
│   ├── authorization_capture.feature
│   ├── refund_cancel.feature
│   ├── verify.feature
│   ├── customer_enrollment.feature
│   ├── negative_edge_cases.feature
│   └── steps/
│       └── payment_steps.py
├── README.md
├── requirements.txt
└── testcases.md
```
## Test Coverage
The following payment scenarios are covered:
- Purchase payments with minimal and maximal request fields
- Authorization and Capture flows
- Refund and Cancel operations
- Payment method verification using `verify=true`
- Customer creation and payment method enrollment
- Negative and edge cases such as invalid credentials, expired cards, missing mandatory fields,
  and duplicate requests using idempotency keys

---

## Installation

```bash
pip install -r requirements.txt
```

## Execution

Run all tests:
```bash
behave
```

Run tests by tags:
```bash
behave --tags=@Sanity
behave --tags=@Regression
behave --tags=@Integration
behave --tags=@Negative
```

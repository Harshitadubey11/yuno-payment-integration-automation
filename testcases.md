# Test Case Documentation – Yuno Payment Integration

## Overview
This document describes the test scenarios designed for validating Yuno payment API integrations.
The scenarios cover Purchase, Authorization, Capture, Refund, Cancel, Verify, Customer, and Enrollment
flows, including positive, negative, and edge cases.

---

## Test Case Scenarios

### Purchase Flow

| TC ID | Scenario | Type | Priority | Test Suite |
|------|---------|------|----------|------------|
| TC_P_01 | Purchase with minimal required fields | Positive | High | Sanity, Integration |
| TC_P_02 | Purchase with maximal fields (customer_payer, additional_data) | Positive | Medium | Regression, Integration |
| TC_P_03 | Purchase with invalid card number | Negative | High | Regression |
| TC_P_04 | Purchase without mandatory workflow field | Negative | High | Regression |

---

### Authorization & Capture Flow

| TC ID | Scenario | Type | Priority | Test Suite |
|------|---------|------|----------|------------|
| TC_A_01 | Authorization with minimal fields | Positive | High | Sanity, Integration |
| TC_A_02 | Authorization with maximal fields | Positive | Medium | Regression |
| TC_A_03 | Capture authorized payment | Positive | High | Regression, Integration |
| TC_A_04 | Capture payment without authorization | Negative | High | Regression |

---

### Refund & Cancel Flow

| TC ID | Scenario | Type | Priority | Test Suite |
|------|---------|------|----------|------------|
| TC_R_01 | Refund a completed payment | Positive | Medium | Regression, Integration |
| TC_R_02 | Cancel an authorized payment | Positive | Medium | Regression |
| TC_R_03 | Refund a non-existent payment | Negative | High | Regression |
| TC_R_04 | Refund an already refunded payment | Negative | Medium | Regression |

---

### Verify Flow

| TC ID | Scenario | Type | Priority | Test Suite |
|------|---------|------|----------|------------|
| TC_V_01 | Verify card with verify=true flag | Positive | High | Sanity |
| TC_V_02 | Verify card with invalid details | Negative | High | Regression |

---

### Customer & Enrollment Flow

| TC ID | Scenario | Type | Priority | Test Suite |
|------|---------|------|----------|------------|
| TC_C_01 | Create customer with valid details | Positive | Medium | Regression |
| TC_C_02 | Enroll payment method for customer | Positive | Medium | Regression, Integration |
| TC_C_03 | Enroll payment method for invalid customer | Negative | High | Regression |

---

### Negative & Edge Cases

| TC ID | Scenario | Type | Priority | Test Suite |
|------|---------|------|----------|------------|
| TC_N_01 | Invalid public API key | Negative | High | Sanity |
| TC_N_02 | Expired card payment | Negative | High | Regression |
| TC_N_03 | Duplicate request with same idempotency key | Negative | Medium | Regression |
| TC_N_04 | Refund with invalid payment ID | Negative | High | Regression |

---

## Functional Requirements

- The system must support payment creation using DIRECT workflow.
- The system must support Purchase, Authorization, Capture, Refund, Cancel, and Verify flows.
- The system must validate mandatory request fields.
- The system must ensure idempotency for duplicate requests.
- The system must handle customer creation and payment method enrollment.

---

## Non-Functional Requirements

- API requests must be securely authenticated using API keys.
- The system should respond within acceptable performance limits.
- The system should handle concurrent payment requests reliably.
- The system should prevent duplicate transactions using idempotency keys.
- Sensitive data such as card details must be handled securely.


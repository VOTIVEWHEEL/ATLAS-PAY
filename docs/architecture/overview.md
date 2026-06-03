# AtlasPay — Architecture Overview

## Services

| Service | Port | Responsibility |
|---|---|---|
| `auth-service` | 3001 | Authentication, JWT, KYC |
| `wallet-service` | 3002 | Wallet CRUD, balance ops |
| `ledger-service` | 3003 | Double-entry bookkeeping |
| `notification-service` | 3004 | Email, SMS, push alerts |

## Communication
- **Sync**: REST (inter-service via internal DNS)
- **Async**: Redis Pub/Sub

## Data Flow
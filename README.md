AtlasPay

> A production-ready fintech microservices monorepo

## Services

| Service | Description |
|---|---|
| `auth-service` | User auth, JWT, KYC |
| `wallet-service` | Multi-currency wallets |
| `ledger-service` | Double-entry bookkeeping |
| `notification-service` | Email, SMS, push |

## Getting Started

```bash
# Install dependencies
npm install

# Start all services (dev)
npm run dev

# Start with Docker
docker compose -f docker/docker-compose.yml up
```

## Structure

```
atlaspay/
├── apps/           # Microservices
├── packages/       # Shared libs (shared, database)
├── docs/           # Architecture, ERD, API docs
├── docker/         # Compose + env configs
├── tests/          # Integration & e2e tests
└── .github/        # CI/CD workflows
```

## Stack

- **Runtime**: Node.js 20 + TypeScript
- **Framework**: Express
- **Database**: PostgreSQL 16
- **Cache/Queue**: Redis 7 + BullMQ
- **CI/CD**: GitHub Actions
- **Containers**: Docker + Docker Compose

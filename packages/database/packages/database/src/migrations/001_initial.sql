CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

CREATE TABLE users (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email       VARCHAR(255) UNIQUE NOT NULL,
  phone       VARCHAR(20) UNIQUE NOT NULL,
  first_name  VARCHAR(100) NOT NULL,
  last_name   VARCHAR(100) NOT NULL,
  password_hash TEXT NOT NULL,
  bvn         VARCHAR(11),
  kyc_status  VARCHAR(20) DEFAULT 'pending' CHECK (kyc_status IN ('pending','verified','rejected')),
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE wallets (
  id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  user_id        UUID NOT NULL REFERENCES users(id),
  currency       VARCHAR(3) NOT NULL,
  balance        BIGINT DEFAULT 0,
  ledger_balance BIGINT DEFAULT 0,
  is_active      BOOLEAN DEFAULT TRUE,
  created_at     TIMESTAMPTZ DEFAULT NOW(),
  updated_at     TIMESTAMPTZ DEFAULT NOW(),
  UNIQUE(user_id, currency)
);

CREATE TABLE transactions (
  id          UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  wallet_id   UUID NOT NULL REFERENCES wallets(id),
  user_id     UUID NOT NULL REFERENCES users(id),
  type        VARCHAR(10) NOT NULL CHECK (type IN ('credit','debit')),
  amount      BIGINT NOT NULL,
  currency    VARCHAR(3) NOT NULL,
  status      VARCHAR(20) DEFAULT 'pending' CHECK (status IN ('pending','success','failed','reversed')),
  reference   VARCHAR(100) UNIQUE NOT NULL,
  description TEXT,
  metadata    JSONB,
  created_at  TIMESTAMPTZ DEFAULT NOW(),
  updated_at  TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ledger_entries (
  id             UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  transaction_id UUID NOT NULL REFERENCES transactions(id),
  wallet_id      UUID NOT NULL REFERENCES wallets(id),
  entry_type     VARCHAR(6) NOT NULL CHECK (entry_type IN ('debit','credit')),
  amount         BIGINT NOT NULL,
  balance_before BIGINT NOT NULL,
  balance_after  BIGINT NOT NULL,
  created_at     TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX idx_transactions_user_id    ON transactions(user_id);
CREATE INDEX idx_transactions_wallet_id  ON transactions(wallet_id);
CREATE INDEX idx_transactions_reference  ON transactions(reference);
CREATE INDEX idx_transactions_created_at ON transactions(created_at DESC);
CREATE INDEX idx_ledger_transaction_id   ON ledger_entries(transaction_id);
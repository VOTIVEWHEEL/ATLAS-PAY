import { Currency } from '@atlaspay/shared';

export type TransactionType = 'credit' | 'debit';
export type TransactionStatus = 'pending' | 'success' | 'failed' | 'reversed';

export interface Transaction {
  id: string;
  walletId: string;
  userId: string;
  type: TransactionType;
  amount: number;
  currency: Currency;
  status: TransactionStatus;
  reference: string;
  description: string;
  metadata?: Record<string, unknown>;
  createdAt: Date;
  updatedAt: Date;
}
import { Currency } from '@atlaspay/shared';

export interface Wallet {
  id: string;
  userId: string;
  currency: Currency;
  balance: number;
  ledgerBalance: number;
  isActive: boolean;
  createdAt: Date;
  updatedAt: Date;
}
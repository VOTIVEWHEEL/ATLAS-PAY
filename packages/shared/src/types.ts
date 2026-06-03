export interface ApiResponse<T = unknown> {
  success: boolean;
  data?: T;
  error?: string;
  timestamp: string;
}

export interface PaginatedResponse<T> extends ApiResponse<T[]> {
  pagination: {
    page: number;
    limit: number;
    total: number;
  };
}

export type Currency = 'NGN' | 'USD' | 'GBP' | 'EUR';

export interface Money {
  amount: number;
  currency: Currency;
}
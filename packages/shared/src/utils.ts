export const formatMoney = (amount: number, currency: string): string =>
  new Intl.NumberFormat('en-NG', { style: 'currency', currency }).format(amount / 100);

export const generateReference = (prefix = 'ATP'): string =>
  `${prefix}-${Date.now()}-${Math.random().toString(36).slice(2, 8).toUpperCase()}`;

export const sleep = (ms: number): Promise<void> =>
  new Promise(resolve => setTimeout(resolve, ms));
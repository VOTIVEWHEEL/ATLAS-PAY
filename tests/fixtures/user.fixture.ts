export const mockUser = {
  id: '550e8400-e29b-41d4-a716-446655440000',
  email: 'test@atlaspay.io',
  phone: '08012345678',
  firstName: 'Test',
  lastName: 'User',
  kycStatus: 'verified' as const,
  createdAt: new Date(),
  updatedAt: new Date(),
};

export const mockWallet = {
  id: '660e8400-e29b-41d4-a716-446655440001',
  userId: mockUser.id,
  currency: 'NGN' as const,
  balance: 100000,
  ledgerBalance: 100000,
  isActive: true,
  createdAt: new Date(),
  updatedAt: new Date(),
};
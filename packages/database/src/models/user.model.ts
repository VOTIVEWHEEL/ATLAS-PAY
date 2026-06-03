export interface User {
  id: string;
  email: string;
  phone: string;
  firstName: string;
  lastName: string;
  bvn?: string;
  kycStatus: 'pending' | 'verified' | 'rejected';
  createdAt: Date;
  updatedAt: Date;
}
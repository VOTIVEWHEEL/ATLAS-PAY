import request from 'supertest';

const BASE = process.env.WALLET_SERVICE_URL || 'http://localhost:3002';

describe('Wallet Service — Integration', () => {
  it('GET /health returns 200', async () => {
    const res = await request(BASE).get('/health');
    expect(res.status).toBe(200);
    expect(res.body.status).toBe('ok');
  });
});
import express from 'express';

const app = express();
app.use(express.json());

const SERVICE_NAME = 'notification-service';

app.get('/health', (_req, res) => res.json({ status: 'ok', service: SERVICE_NAME }));

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`[${SERVICE_NAME}] running on port ${PORT}`));

export default app;
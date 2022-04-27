import express from 'express';
import authRouter from './authRoutes';
import campaignRoutes from './campaignRoutes';
import reportsRouter from './reportsRoutes';

const router = express.Router();
router.use(authRouter);
router.use(campaignRoutes);
router.use(reportsRouter);

export default router;

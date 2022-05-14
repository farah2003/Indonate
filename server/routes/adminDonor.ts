import { Router } from 'express';
import {
  deleteDonorById, getCampaignsForDonor, getDonors,
} from '../controllers';
import { authUser, authAdmin } from '../middlewares';

const adminDonorRouter = Router();

adminDonorRouter.route('/donor/:id').delete(authUser, authAdmin, deleteDonorById);
adminDonorRouter.get('/donor/:id/campaigns', authUser, authAdmin, getCampaignsForDonor);
adminDonorRouter.get('/donors', authUser, authAdmin, getDonors);

export default adminDonorRouter;

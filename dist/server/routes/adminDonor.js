"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const express_1 = require("express");
const controllers_1 = require("../controllers");
const middlewares_1 = require("../middlewares");
const adminDonorRouter = (0, express_1.Router)();
adminDonorRouter.route('/donor/:id').patch(middlewares_1.authUser, middlewares_1.authAdmin, controllers_1.updateDonorById).delete(middlewares_1.authUser, middlewares_1.authAdmin, controllers_1.deleteDonorById);
adminDonorRouter.get('/donor/:id/campaigns', middlewares_1.authUser, middlewares_1.authAdmin, controllers_1.getCampaignsForDonor);
adminDonorRouter.get('/donors', middlewares_1.authUser, middlewares_1.authAdmin, controllers_1.getDonors);
exports.default = adminDonorRouter;

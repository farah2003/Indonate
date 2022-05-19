import { Request, Response, NextFunction } from 'express';
import {
  Donation,
  Family,
  sequelize,
  Donor,
  Campaign,
} from '../../database/models';

const getStatistics = async (req: Request, res: Response, next:NextFunction) => {
  try {
    const
      [families,
        [{
          money,
          food: foods,
          clothes,
        }],
      ] :any = await Promise.all([
        Family.count(),
        Donation.findAll({
          attributes: [[sequelize.fn('SUM', sequelize.col('money')), 'money'],
            [sequelize.fn('SUM', sequelize.col('food')), 'food'],
            [sequelize.fn('SUM', sequelize.col('clothes')), 'clothes']],
        }),
      ]);

    const [donors, campagins] = await Promise.all([
      Donor.count(),
      Campaign.count(),

    ]);
    res.json({
      message: 'Success',
      data: {
        families,
        foods,
        money,
        clothes,
        donors,
        campagins,
      },
    });
  } catch (error) {
    next(error);
  }
};

export default getStatistics;

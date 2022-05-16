import { Request, Response, NextFunction } from 'express';
import {
  Campaign, Category, Donation, sequelize,
} from '../../database/models';
import { CustomError, querySchema } from '../../utils';

const getCampaigns = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const { page = 1, limit = 15 }: any = req.query;
    await querySchema.validateAsync(req.query);
    const { count, rows: campaigns } = await Campaign.findAndCountAll({
      limit,
      offset: (page - 1) * limit,
      group: ['campaigns.id', 'category.id'],
      attributes: [
        'id',
        'title',
        'description',
        'food_target',
        'clothes_target',
        'money_target',
        'image_link',
        'is_available',
        [
          sequelize.fn('SUM', sequelize.literal('COALESCE(food, 0)')),
          'current_food',
        ],
        [
          sequelize.fn('SUM', sequelize.literal('COALESCE(clothes, 0)')),
          'current_clothes',
        ],
        [
          sequelize.fn('SUM', sequelize.literal('COALESCE(money, 0)')),
          'current_money',
        ],
      ],
      include: [
        {
          model: Donation,
          required: false,
          duplicating: false,
          attributes: [],
          as: 'donations',
        },
        {
          model: Category,
          required: false,
          duplicating: false,
          attributes: ['name'],
        },
      ],
      order: [
        ['is_available', 'DESC'],
        ['updatedAt', 'DESC'],
      ],
    });
    res.json({ message: 'Success', data: { campaigns, count: count.length } });
  } catch (error) {
    if (error.name === 'ValidationError') {
      next(new CustomError(error.message, 401));
    }
    next(error);
  }
};
export default getCampaigns;

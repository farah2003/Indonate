"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.sequelize = exports.Capon = exports.Campaign = exports.Category = exports.Contact = exports.Donation = exports.Family = exports.Donor = void 0;
const connection_1 = __importDefault(require("../config/connection"));
exports.sequelize = connection_1.default;
const donor_1 = __importDefault(require("./donor"));
exports.Donor = donor_1.default;
const family_1 = __importDefault(require("./family"));
exports.Family = family_1.default;
const donation_1 = __importDefault(require("./donation"));
exports.Donation = donation_1.default;
const contact_1 = __importDefault(require("./contact"));
exports.Contact = contact_1.default;
const category_1 = __importDefault(require("./category"));
exports.Category = category_1.default;
const campaign_1 = __importDefault(require("./campaign"));
exports.Campaign = campaign_1.default;
const capon_1 = __importDefault(require("./capon"));
exports.Capon = capon_1.default;
campaign_1.default.belongsTo(category_1.default);
campaign_1.default.belongsToMany(family_1.default, { through: capon_1.default });
family_1.default.belongsToMany(campaign_1.default, { through: capon_1.default });
campaign_1.default.belongsToMany(donor_1.default, {
    through: { model: donation_1.default, unique: false },
    constraints: true,
});
donor_1.default.belongsToMany(campaign_1.default, {
    through: { model: donation_1.default, unique: false },
    constraints: true,
});

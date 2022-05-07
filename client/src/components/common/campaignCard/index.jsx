import React from 'react';
import PropTypes from 'prop-types';
import {
  Card, Typography, Skeleton, Image, Avatar,
} from 'antd';
import { DonationButton } from '../../index';
import styles from './index.less';
import 'antd/dist/antd.less';

const { Text } = Typography;
const { Meta } = Card;

function Campaign({
  id,
  title,
  description,
  imgSrc,
  categoryIcon,
  loading,
}) {
  return (
    <Card
      className="customCard"
      hoverable
      cover={!loading && (
        <Image
          alt="Category"
          src={imgSrc}
        />
      )}
    >
      <Skeleton loading={loading} avatar active>
        <Meta
          className={styles.title}
          title={title}
          avatar={<Avatar src={categoryIcon} />}
        />
        <Text type="secondary">{description}</Text>
        <DonationButton campaignId={id} />
      </Skeleton>
    </Card>
  );
}

export default Campaign;

Campaign.propTypes = {
  id: PropTypes.number.isRequired,
  title: PropTypes.string.isRequired,
  description: PropTypes.string.isRequired,
  imgSrc: PropTypes.string.isRequired,
  categoryIcon: PropTypes.string.isRequired,
  loading: PropTypes.string.isRequired,
};

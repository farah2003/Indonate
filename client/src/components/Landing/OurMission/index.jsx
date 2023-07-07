import React from 'react';
import './style.less';
import { Typography } from 'antd';
import { Container } from '../../common';

const { Paragraph } = Typography;

const OurMission = () => (
  <Container>
    <section className="our-mission-section" id="our-mission-section">
      <div className="our-mission-image-container">
        <div className="green-background" />
      </div>
      <div className="our-mission-description-container">
        <Paragraph className="title">Our Mission</Paragraph>
        <Paragraph className="our-mission-description">
          provide assistance and support to individuals in need, improving their quality
          of life and offering a beacon of hope. We aim to alleviate hunger among children
          by providing nourishment and ensuring access to nutritious meals.
          we empower fathers to provide education for their children, recognizing the
          transformative power of education in breaking the cycle of poverty. Through our
          efforts, we strive to be a source of hope for those facing hardships, inspiring
          them to overcome challenges and pursue a better life.
        </Paragraph>
      </div>
    </section>
  </Container>
);

export default OurMission;

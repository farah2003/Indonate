import React, { useState } from 'react';
import { useDispatch } from 'react-redux';
// import { useNavigate } from 'react-router-dom';
import axios from 'axios';
import {
  Form,
  Button,
  Input,
  message,
  Space,
  Typography,
} from 'antd';
import { signUp } from '../../redux/feature/user/userSlice';
import './style.less';

function SignUp() {
  // const navigate = useNavigate();
  const dispatch = useDispatch();
  const [userInfo, setUserInfo] = useState({
    name: '', email: '', password: '', phone: '',
  });

  const registor = async () => {
    try {
      const { data: { data: [userInfoObject] } } = await axios.post('/api/signup', userInfo);
      dispatch(signUp(userInfoObject));
      // navigate('/');// home page
    } catch (err) {
      message.error({
        content: err,
        style: {
          marginTop: '20vh',
        },
      });
    }
  };

  const passwordValidation = () => ({
    validator(_, value) {
      if (value.length >= 6) {
        return Promise.resolve();
      }

      return Promise.reject(new Error('password should have at least 6 character '));
    },
  });

  const confirmPasswordValidation = (getFieldValue) => ({
    validator(_, value) {
      if (!value || getFieldValue('password') === value) {
        return Promise.resolve();
      }
      return Promise.reject(new Error('The two passwords that you entered do not match!'));
    },
  });

  const handleChange = ({ target: { name, value } }) => {
    setUserInfo({ ...userInfo, [name]: value });
  };
  return (
    <div className="sign-up-container">
      <div className="img-side-sgin-up">
        <Typography.Title
          style={{ color: '#fff' }}
          level={3}
        >
          Subsicribe with us to make yourself a contributor to charity and help people in need.
        </Typography.Title>
      </div>
      <div className="form-conatainer-signup">
        <Space
          className="space-component"
          direction="horizontal"
          align="center"
        >
          <Typography.Title
            style={{ color: '#469D62' }}
            level={3}
          >
            Sign Up
          </Typography.Title>
          <Form
            className="Form-sign-up"
            name="register"
            onFinish={registor}
          >
            <Form.Item
              rules={[
                {
                  required: true,
                  message: 'Please input your name!',
                  whitespace: true,
                },
              ]}
            >
              <Input
                name="name"
                placeholder="Name"
                onChange={(e) => handleChange(e)}
              />
            </Form.Item>
            <Form.Item
              rules={[
                {
                  type: 'email',
                  message: 'The input is not valid E-mail!',
                },
                {
                  required: true,
                  message: 'Please input your E-mail!',
                },
              ]}
            >
              <Input
                name="email"
                placeholder="Email"
                onChange={(e) => handleChange(e)}
              />
            </Form.Item>
            <Form.Item
              rules={[
                {
                  required: true,
                  message: 'Please input your phone number!',
                },
              ]}
            >
              <Input
                placeholder="Phone Number"
                name="phone"
                onChange={(e) => handleChange(e)}
              />
            </Form.Item>
            <Form.Item
              rules={[
                {
                  required: true,
                  message: 'Please input your password!',
                },
                () => passwordValidation(),
              ]}
            >
              <Input.Password
                placeholder="Password"
                name="password"
                onChange={(e) => handleChange(e)}
              />
            </Form.Item>
            <Form.Item
              name="confirm"
              dependencies={['password']}
              rules={[
                {
                  required: true,
                  message: 'Please confirm your password!',
                },
                ({ getFieldValue }) => confirmPasswordValidation(getFieldValue),
              ]}
            >
              <Input.Password placeholder="Confirm password" />
            </Form.Item>
            <Button className="sign-up-btn" type="primary" htmlType="submit">
              Sign Up
            </Button>
          </Form>
        </Space>

      </div>
    </div>
  );
}

export default SignUp;

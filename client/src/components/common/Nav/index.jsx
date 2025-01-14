import React from 'react';
import axios from 'axios';
import { NavLink, useLocation, useNavigate } from 'react-router-dom';
import {
  Layout, Menu, Button, message, Image,
} from 'antd';
import { useSelector, useDispatch } from 'react-redux';
import { HashLink as Link } from 'react-router-hash-link';

import './style.less';
import logo from '../../../assets/images/indonate-logo.svg';

import { logout } from '../../../redux/feature/user/userSlice';

const { Header } = Layout;

const Nav = () => {
  const user = useSelector((state) => state.user);
  const dispatch = useDispatch();
  const { pathname } = useLocation();
  const navigate = useNavigate();

  const logoutFun = async () => {
    try {
      await axios.post('/api/logout');
      dispatch(logout());
    } catch ({
      response: {
        data: { message: errorMessage },
      },
    }) {
      message.error({
        content: errorMessage,
      });
    }
  };

  const commonList = [
    { label: <NavLink to="/"> Home </NavLink> },
    { label: <Link to="/#our-mission-section">About Us</Link> },
    { label: <Link to="/#reports-form-container">Contact Us</Link> },
    { label: <NavLink to="/campaigns"> Campaigns</NavLink> },
  ];
  const userItem = [
    {
      label: (
        <NavLink to="/signup">
          <Button type="primary" size="large">
            Signup
          </Button>
        </NavLink>
      ),
    },
    {
      label: (
        <NavLink to="/login">
          <Button type="primary" size="large" className="custom-button">
            Login
          </Button>
        </NavLink>
      ),
    },
  ];

  const guestItem = [
    {
      label: (
        <NavLink to="/">
          <Button onClick={logoutFun} className="btn" type="primary" size="large">
            Logout
          </Button>
        </NavLink>
      ),
    },
    {
      label: user?.userData?.isAdmin ? (
        <NavLink to="/admin">
          <Button type="primary" size="large" className="custom-button">
            Dashboard
          </Button>
        </NavLink>
      ) : (
        <NavLink to="/campaigns">
          <Button type="primary" size="large" className="custom-button">
            Donate Now
          </Button>
        </NavLink>
      ),
    },
  ];
  return (
    !pathname.startsWith('/admin') && (
      <div className="nav-container">
        <Layout>
          <Header>
            <Image
              width={170}
              src={logo}
              preview={false}
              onClick={() => navigate('/')}
            />

            <Menu
              mode="horizontal"
              defaultSelectedKeys={1}
              size="large"
              items={
                user.isUserAuthorized
                  ? [...commonList, ...guestItem]
                  : [...commonList, ...userItem]
              }
              className="custom-menu"
            />
          </Header>
        </Layout>
      </div>
    )
  );
};

export default Nav;

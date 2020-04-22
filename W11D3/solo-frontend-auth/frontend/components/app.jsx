import React from 'react';
import WelcomeBar from './nav_bar/welcome_bar_container';
import NavBarContainer from './nav_bar/nav_bar_container';
import ChirpIndexContainer from './chirps/chirp_index_container';
import SignupContainer from './session/signup_container'; // part 6
import LoginContainer from './session/login_container';
import Home from './home/home';
import { Route } from 'react-router-dom';
import { AuthRoute, ProtectedRoute } from '../utils/route_utils';

// line 15 is also part 6
// line 18 is part 7
export default () => (
  <div>
    <Route path="/" component={NavBarContainer} />
    <Route exact path="/" component={Home} />
    <ProtectedRoute path="/chirps" component={ChirpIndexContainer} />
    <Route path="/signup" component={SignupContainer} />
    <Route path="/login" component={LoginContainer} />
  </div>
);

/**
 *
 * App.js
 *
 */

import React from 'react';
import { Switch, Route, Redirect, BrowserRouter } from 'react-router-dom';
import localforage from 'localforage';
import { get, isEmpty, set } from 'lodash';
import logIn from '../logIn';
import signUp from '../signUp';
// import store from '../../reduxApp/store';

export default class App extends React.Component { // eslint-disable-line react/prefer-stateless-function
  constructor(props) {
    super(props);
    this.state = { userLoaded: false };
  }

  componentWillMount = async () => {
    this.setState({
      userLoaded: true,
      // user: await localforage.getItem('currentUser'),
    });
  }

  // get user from either local storage or from redux store

  // getAccessToken = () => get(this.getCurrentUser(), 'accessToken');

  // getCurrentUser = () => {
  //   const { user: userInState } = this.state;
  //   const userInRedux = get(store.getState().get('auth'), 'currentUser');
  //   if (!isEmpty(userInRedux)) {
  //     return userInRedux;
  //   }
  //   return userInState;
  // }

  // getUserRoutes = (userRole) => {
  //   if (userRole === 'Customer') {
  //     return <CustomerRoutes requireAuth={this.requireAuth} />;
  //   } else if (userRole === 'Host') {
  //     return <HostRoutes requireAuth={this.requireAuth} />;
  //   }
  //   return <Redirect to="/login" />;
  // }

  // requireAuth = (ComponentToRender) => () =>
  //   this.getAccessToken()
  //     ? (
  //       <MainContainer style={{ height: '100%' }}>
  //         <ComponentToRender />
  //       </MainContainer>
  //     )
  //     : <Redirect to="/login" />


  render() {
    // a hack to wait for the user to be loaded from localStorage
    // const { requireAuth } = this;
    return (
      <div style={{ height: '100%' }}>
        <BrowserRouter>
          <Switch>
            <Route exact path="/" component={signUp} />
            <Route exact path="/login" component={logIn} />
          </Switch>
        </BrowserRouter>
      </div>
    );
  }
}

// Run this example by adding <%= javascript_pack_tag 'hello_react' %> to the head of your layout file,
// like app/views/layouts/application.html.erb. All it does is render <div>Hello React</div> at the bottom
// of the page.


import 'babel-polyfill';

import App from '../containers/App'
// Import all the third party stuff
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { ConnectedRouter } from 'react-router-redux';
import createHistory from 'history/createBrowserHistory';
import store, { history } from '../reduxApp/store';
import { persistStore, autoRehydrate } from 'redux-persist';
// import 'sanitize.css/sanitize.css';
import 'bootstrap/dist/css/bootstrap.css';
import HttpsRedirect from 'react-https-redirect';
import LanguageProvider from '../containers/LanguageProvider';

document.addEventListener('DOMContentLoaded', (messages) => {
  ReactDOM.render(
    <App />,
    document.body.appendChild(document.createElement('div')),
  )
})

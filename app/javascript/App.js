import 'babel-polyfill';

// Import all the third party stuff
import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { ConnectedRouter } from 'react-router-redux';
import createHistory from 'history/createBrowserHistory';
// import store, { history } from './reduxApp/store';
import { persistStore, autoRehydrate } from 'redux-persist';
// import 'sanitize.css/sanitize.css';
import 'bootstrap/dist/css/bootstrap.css';
import HttpsRedirect from 'react-https-redirect';

// Import root app
import RouteApp from './containers/App';

// Import Language Provider
// import LanguageProvider from './containers/LanguageProvider';
const App = () => {
  const obj = document.createElement('div');
  obj.setAttribute('id', 'root');
  const MOUNT_NODE = document.body.appendChild(obj);
  
  const render = (messages) => {
    ReactDOM.render(
      <Provider>
        {/* <LanguageProvider messages={messages}> */}
          <ConnectedRouter>
            <HttpsRedirect>
              <RouteApp />
            </HttpsRedirect>
          </ConnectedRouter>
        {/* </LanguageProvider> */}
      </Provider>,
      MOUNT_NODE
    );
  }
}

export default App

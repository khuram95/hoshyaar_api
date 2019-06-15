import { combineReducers } from 'redux-immutable';
import Immutable from 'seamless-immutable';
import { LOCATION_CHANGE } from 'react-router-redux';
import languageProviderReducer from '../containers/LanguageProvider/reducer';
// Initial routing state
const routeInitialState = Immutable({
  location: null,
});

/**
 * Merge route into the global application state
 */
function routeReducer(state = routeInitialState, action) {
  switch (action.type) {
    /* istanbul ignore next */
    case LOCATION_CHANGE:
      return state.merge({
        location: action.payload,
      });
    default:
      return state;
  }
}

/**
 * Creates the main reducer with the dynamically injected ones
 */
export default function createReducer(injectedReducers) {
  const appReducer = combineReducers({
    route: routeReducer,
    language: languageProviderReducer,
    ...injectedReducers,
    // auth: require('./AuthRedux').reducer,
    // ADD_REDUX_REDUCER
  });
  const rootReducer = (state, action) => {
    if (action.type === 'SIGNOUT_REQUEST') {
      state = undefined;
    }
    return appReducer(state, action);
  };
  return rootReducer;
}

/*
 *
 * LanguageProvider reducer
 *
 */

import Immutable from 'seamless-immutable'
import {
  CHANGE_LOCALE,
} from './constants';
import {
  DEFAULT_LOCALE,
} from './constants'; // eslint-disable-line

const initialState = Immutable({
  locale: DEFAULT_LOCALE,
});

function languageProviderReducer(state = initialState, action) {
  switch (action.type) {
    case CHANGE_LOCALE:
      return state
        .set('locale', action.locale);
    default:
      return state;
  }
}

export default languageProviderReducer;

// a library to wrap and simplify api calls
import apisauce from 'apisauce';

const create = () => {
  const api = apisauce.create({
    baseURL: '/',
    headers: {
      'Cache-Control': 'no-cache',
      Accept: 'application/json',
    },
    timeout: 10000,
  });

  const authApi = apisauce.create({
    baseURL: '/',
    headers: {
      'Cache-Control': 'no-cache',
      Accept: 'application/json',
    },
    timeout: 10000,
  });

  const getRoot = () => api.get('');

  const login = (email, password, device_id) =>
    authApi.post('/auth/sign_in', { email, password, device_id });

  const signup = (payload) => {
    const formData = new FormData();
    formData.append('email', payload.email);
    formData.append('first_name', payload.firstName);
    formData.append('zip_code', payload.zipCode);
    formData.append('type', payload.role);
    formData.append('platform', payload.platform);

    return authApi.post('auth', formData);
  };
  // ADD_API_HANDLER

  // ------
  // STEP 3
  // ------
  //
  // Return back a collection of functions that we would consider our
  // interface.  Most of the time it'll be just the list of all the
  // methods in step 2.
  //
  // Notice we're not returning back the `api` created in step 1?  That's
  // because it is scoped privately.  This is one way to create truly
  // private scoped goodies in JavaScript.
  //
  return {
    // a list of the API functions from step 2
    getRoot,
    login,
    signup,
    // EXPORT_API_HANDLER
  };
};

// let's return back our create method as the default.
export default {
  create,
};

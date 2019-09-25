import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  const store = configureStore(preloadedState);
  store.dispatch = applyMiddlewares(store)(addLoggingToDispatch)
  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
  
  const addLoggingToDispatch = store => next => action => {
    let dispatch = store.dispatch
    next.forEach(middleware => {
      dispatch = middleware(store)(dispatch);
    })
    console.log(store.getState());
    console.log(action);
    console.log(dispatch(action));
    console.log(store.getState());
    return Object.assign({}, store, { dispatch })
  };


});

import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';
import Root from './components/root';
import { fetchSearchGiphys } from './util/api_util'


document.addEventListener("DOMContentLoaded", () => {
  const store = configureStore();
  const fetchSearchGiphys = store.fetchSearchGiphys;
  const root = document.getElementById("root")
  ReactDOM.render(<Root />, root)
})
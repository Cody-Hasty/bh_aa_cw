
import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store'
import selectAllPokemon from './reducers/selectors'
import Root from './components/root'
import { receiveAllPokemon, requestAllPokemon} from './actions/pokemon_actions'
import { fetchAllPokemon, fetchPokemon } from './util/api_util'


document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  const store = configureStore();
  
  window.selectAllPokemon = selectAllPokemon
  window.requestAllPokemon = requestAllPokemon;
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.fetchPokemon = fetchPokemon;
  window.store = store;
  window.getState = store.getState;
  window.dispatch = store.dispatch;
  
  const getSuccess = pokemon => console.log(receiveAllPokemon(pokemon));
  fetchAllPokemon().then(getSuccess);
  // ReactDOM.render(<h1>Pokedex</h1>, rootEl);
  ReactDOM.render(<Root store={store} />, rootEl);
});

import React from 'react';
import ReactDOM from 'react-dom';
import { receiveAllPokemon} from './actions/pokemon_actions'
import { fetchAllPokemon } from './util/api_util'
import { fetchPokemon } from './util/api_util'


document.addEventListener('DOMContentLoaded', () => {
  const rootEl = document.getElementById('root');
  window.receiveAllPokemon = receiveAllPokemon;
  window.fetchAllPokemon = fetchAllPokemon;
  window.fetchPokemon = fetchPokemon;
  const getSuccess = pokemon => console.log(receiveAllPokemon(pokemon));
  fetchAllPokemon().then(getSuccess);
  ReactDOM.render(<h1>Pokedex</h1>, rootEl);
});
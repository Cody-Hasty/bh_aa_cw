import React from 'react';
import PokemonIndexContainer from './pokemon/pokemon_index_container'
import { Provider } from 'react-redux';
const Root = ({ store }) => {
    return (
        <Provider store={store}>
            <PokemonIndexContainer />
        </Provider>
    );
};

export default Root;
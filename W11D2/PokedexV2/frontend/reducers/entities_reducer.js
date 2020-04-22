import { combineReducers } from 'redux'
import pokemonReducer from './pokemon_reducer'

const entitesReducer = combineReducers({
    pokemon: pokemonReducer
})

export default entitesReducer
import {combineReducers} from 'redux'
import itemsReducer from './items_reducer'
import pokemonReducer from './pokemon_reducer'

const entitesReducer = combineReducers({
    pokemon: pokemonReducer
})

export default entitesReducer
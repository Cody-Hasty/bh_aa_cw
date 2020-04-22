import { combineReducers } from 'redux';
import entitiesReducer from './entities';
import sessionReducer from './session'; // part 3

export default combineReducers({
  entities: entitiesReducer,
  session: sessionReducer, // part 3
});

import { RECEIVE_TODOS } from '../actions/todo_actions'
import { RECEIVE_TODO } from '../actions/todo_actions'

const initialState = {
    1: {
        id: 1,
        title: "wash car",
        body: "with soap",
        done: false
    },
    2: {
        id: 2,
        title: "wash dog",
        body: "with shampoo",
        done: true
    }
};

const todosReducer = (state = initialState, action) => {

  Object.freeze(state);
  let nextState = Object.assign({}, state)

  switch (action.type) {
      case RECEIVE_TODOS:
          // return the todos from the action

          action.todos.forEach((todo) => {
            nextState[todo.id] = todo;
          });

          return nextState;
      case RECEIVE_TODO:
        // Make a new object setting a single key value pair for action.todo
        // Return a new state object by merging your previous state and your
        // new object
        // 
          
          // const nextState = Object.assign({}, state)
          const todo = {[action.todo.id]: action.todo}
          nextState = Object.assign(nextState, todo);
        //   nextState[action.todo.id] = action.todo;
          return nextState;
      default:
          return state;
  }
};

export default todosReducer;


// const todoReducer = (state = initialState, action) => {
//   Object.freeze(state);
//   const nextState = Object.assign({}, state); // { state: []}
//   switch (action.type) {
//     case RECEIVE_TODOS:
//         action.todos.map(obj => nextState[obj.id] = obj)
//       return nextState;
//     case RECEIVE_TODO:
//         nextState[action.todo.id] = action.todo;
//         return nextState;
//     default:
//       return state;
//   }
// }
// export default todoReducer;
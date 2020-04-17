import React from 'react';
import TodoListItem from '../todo_list/todo_list_item';
// import { allTodos } from '../../reducers/selectors';
// import todoListContainer from './todo_list_container'
// export default () => <h3>Todo List goes here!</h3>


export default (state) => {
    // debugger;
    return (
        <ul>
            <h3>I should be a list!</h3>
            {state.todos.forEach(todo => { 
                // debugger; 
                <TodoListItem todo={todo} />
            })}
        </ul>
    )
}



// class TodoList extends React.Component {
//     constructor(props) {
//         super(props);
//     }

//     componentDidMount() {
//         this.props.allTodos();
//     }

//     render() {
//         return (
//             {allTodos.map(todo => {
//                     <li>{todo.title}</li>
//                 })}
//         );
//     }
// }

// export default TodoList;
import React from 'react'

class TodoListItem extends React.Component {

    constructor(props){
        super(props)
        render();
    }
    
    render(){
        
        return (
            <li key={props.todo.id}>{props.todo.title}</li>
        )     
    }


} 




export default TodoListItem;
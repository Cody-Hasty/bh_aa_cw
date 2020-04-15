let todos = [];
// let element = document.getElementsByClassName('drop-down-dog-list');
// let element = document.getElementsByClassName('drop-down-dog-list');

function addTodo(){
    let input = document.getElementsByName("add-todo");
    let todo = {
        "done": `${input.value}`;
    };
    todos.push(todo);
    input.value = "";
}

function populateList(){
    for (const todo in todos) {
        let link = document.createElement("INPUT");
        link.setAttribute("label", todo["done"]);
        link.innerHTML = todo["done"];
        let checkbox = document.createElement("INPUT");
        checkbox.setAttribute("type", "checkbox");

        let list = document.createElement("LI");
        list.setAttribute("class", "todo-list-item");
        list.appendChild(link);
        list.appendChild(checkbox);
    }
    todos.forEach((todo) => {
        let element = document.getElementsByClassName('todos');
        element[0].appendChild(todo);
    });
}
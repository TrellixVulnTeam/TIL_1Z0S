import React,{useState} from "react";
import Todo from "./components/Todo";
import Form from "./components/Form";

import FilterButton from "./components/FilterButton";


function App(props) {

    const[tasks,setTasks ] = useState();

    function addTask(){
        const newTask = { id: "id", name: "name", completed: false };
        setTasks([...tasks, newTask]);
    }


    const taskList = props.tasks.map(task => (
            <Todo
                id={task.id}
                name={task.name}
                completed={task.completed}
                key={task.id}
            />
        )
    );

    function addTask(name) {
        alert(name);
    }



    return (
        <div className="todoapp stack-large">
            <h1>TodoMatic</h1>
            <Form addTask={addTask} />

            <div className="filters btn-group stack-exception">
                <FilterButton name ="all"/>
                <FilterButton name = "active"/>
                <FilterButton  name = "completed"/>

            </div>
            <h2 id="list-heading">
                3 tasks remaining
            </h2>
            <ul
                role="list"
                className="todo-list stack-large stack-exception"
                aria-labelledby="list-heading"
            >
                {taskList}

            </ul>
        </div>
    );
}

export default App;

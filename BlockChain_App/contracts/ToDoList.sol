pragma solidity > 0.5.0 <= 0.9.0;

contract ToDoList {
    uint TaskCount = 0;

    struct Task {
        uint id;
        string content;
        bool completed;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated (
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted (
        uint id,
        bool completed
    );

    constructor() public {
        createTask("Hello From RC");
    }

    function createTask(string memory _content) public {
        TaskCount ++;
        tasks[TaskCount] = Task(TaskCount, _content, false);
        emit TaskCreated(TaskCount, _content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
       _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);
    }
}
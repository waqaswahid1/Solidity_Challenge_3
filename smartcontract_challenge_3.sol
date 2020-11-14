pragma solidity 0.6.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract ToDoList is Ownable {
    
    uint public taskCount = 0;
    
    
    struct Task {
        uint id;
        string content;
        bool completed;
    }
    
    mapping(uint=>Task) public tasks;
    
    constructor() public {
        createTask("learn blockchain with BlockXSociety");
    }
    
    function createTask(string memory _content) public onlyOwner {
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }
    function TaskCompleted(uint _id) public onlyOwner  {
    Task memory _task = tasks[_id];
    _task.completed = !_task.completed;
    tasks[_id] = _task;
    }
}

pragma solidity ^0.8.4;

import "hardhat/console.sol";


contract Todolist{
	uint public taskCount = 0;
	
	struct Task{
		uint id;
		uint date;
		string content;
		bool completed;
	}

	event Taskcreated(
		uint id,
		uint date,
		string content,
		bool completed
	);

	event Taskcompleted(
		uint id,
		bool completed
	);

	mapping(uint => Task) public tasks;

	//Add new task
	function createTask(string memory _content) public{
		taskCount++;
		tasks[taskCount] = Task(taskCount, block.timestamp, _content, false);
		emit Taskcreated(taskCount, block.timestamp, _content, false);
	}


	function toggleCompleted(uint _id) public{
		Task memory _task = tasks[_id];
		_task.completed = !_task.completed;
		tasks[_id] = _task;
	} 
}
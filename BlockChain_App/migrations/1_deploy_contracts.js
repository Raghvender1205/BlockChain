var ToDolist = artifacts.require("./ToDoList.sol");

module.exports = function(deployer) {
    deployer.deploy(ToDolist);
};
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

contract Car {
    string public model;
    address public owner;
    uint256 public cost;

    constructor(string memory _model, address _owner) payable {
        model = _model;
        owner = _owner;
        cost = msg.value;
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

//0x568864A892a1B25127018Be020d2AF585Dff6c96
//0x9B90AD58bc5D129E343603C262fa7a3dec8C94e9
//0xcb97883F1a40Feb3DD97Edb2eD95E761E13D8979

contract CarFactory {
    Car[] public cars;

    // function create(string memory _model) public {
    //     Car car = new Car(_model, address(this));
    //     cars.push(car);
    // }

    function createWithMoney(string memory _model) public payable {
        require(msg.value >= 1 ether, "Not enough money!");
        Car car = new Car{value: msg.value}(_model, address(this));
        cars.push(car);
    }
}

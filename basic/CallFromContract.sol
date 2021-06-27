//SPDX-License-Identifier:MIT

pragma solidity ^0.8.4;

contract ContractA {
    uint256 public x;
    uint256 public value;

    function setX(uint256 _x) public returns (uint256) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint256 _x)
        public
        payable
        returns (uint256, uint256)
    {
        x = _x;
        value = msg.value;
        return (x, value);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

contract ContractB {
    function callSetX(ContractA _contractA, uint256 _x) public {
        _contractA.setX(_x);
    }

    function callSetXFromAddress(address _contractAAddress, uint256 _x) public {
        ContractA _contractA = ContractA(_contractAAddress);
        _contractA.setX(_x);
    }

    function callSetXandSendEther(ContractA _contractA, uint256 _x)
        public
        payable
    {
        _contractA.setXandSendEther{value: msg.value}(_x);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}

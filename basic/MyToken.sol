//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20{
    constructor(string memory name, string memory symbol)ERC20(name,symbol){
        _mint(msg.sender,99999*10**decimals());
    }

    function decimals() public override view returns(uint8) {
        return 6;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";

//https://docs.openzeppelin.com/contracts/4.x/erc1155
//Opensea testnet Rinkeby

contract MyErc1155 is ERC1155 {
    uint256 public constant GOLD = 0;
    uint256 public constant SILVER = 1;
    uint256 public constant THORS_HAMMER = 2;
    uint256 public constant SWORD = 3;
    uint256 public constant SHIELD = 4;

    constructor()
        ERC1155(
            "https://gateway.pinata.cloud/ipfs/QmSMbs3ZmjNpj5GLFSVcGtBMKDzUpeYkjJnpCXDzbFv85w/MyErc1155Metadata/{id}.json"
        )
    {
        _mint(msg.sender, GOLD, 10**9, "");
        _mint(msg.sender, SILVER, 10**27, "");
        _mint(msg.sender, THORS_HAMMER, 2, "");
        _mint(msg.sender, SWORD, 10**3, "");
        _mint(msg.sender, SHIELD, 10**3, "");
    }
}

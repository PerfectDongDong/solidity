//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

//https://docs.opensea.io/docs/metadata-standards

//https://gateway.pinata.cloud/ipfs/QmYSSJBc3MHwZFD7ppzNkJ3bqUVYwTNcfBrFFQkAcoQjyE

contract MyErc721 is ERC721URIStorage {
    uint256 public counter;

    constructor() ERC721("OpenSea", "SEA") {
        counter = 0;
    }

    function createNFTs(string memory tokenURI) public returns (uint256) {
        uint256 tokenId = counter;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, tokenURI);

        counter++;
        return tokenId;
    }

    function burn(uint256 _tokenId) public {
        require(
            _isApprovedOrOwner(msg.sender, _tokenId),
            "ERC721: transfer caller is not owner nor approved"
        );
        super._burn(_tokenId);
    }
}

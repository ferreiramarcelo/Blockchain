// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SimpleNFT {
    uint256 public totalSupply;
    mapping (uint256 => address) public owners;

    constructor(uint256 _totalSupply) {
        totalSupply = _totalSupply;
        for (uint256 i = 0; i < _totalSupply; i++) {
            owners[i] = msg.sender;
        }
    }

    function transfer(address _to, uint256 _tokenId) public {
        require(owners[_tokenId] == msg.sender, "You are not the owner");
        owners[_tokenId] = _to;
    }
}

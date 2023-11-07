// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract SimpleToken {
    mapping (address => uint256) public balanceOf;

    constructor(uint256 initialSupply) {
        balanceOf[msg.sender] = initialSupply;
    }

    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
    }
}

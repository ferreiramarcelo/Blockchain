// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SecretMessage {
    string private message;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    function setMessage(string memory newMessage) public {
        require(msg.sender == owner, "Only the owner can set the message.");
        message = newMessage;
    }

    function getMessage() public view returns (string memory) {
        require(msg.sender == owner, "Only the owner can get the message.");
        return message;
    }
}

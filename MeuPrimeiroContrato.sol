// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract MeuPrimeiroContrato {
    string public saudacao;
    
    constructor(string memory _saudacao) {
        saudacao = _saudacao;
    }
    
    function setSaudacao(string memory _saudacao) public {
        saudacao = _saudacao;
    }
}
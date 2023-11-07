// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts@4.9.0/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract ArteDigital is ERC721Enumerable, Ownable {
    using Strings for uint256;
    
    string public baseURI;
    string public baseExtension = ".json";
    
    constructor(string memory _name, string memory _symbol, string memory _initBaseURI) 
        ERC721(_name, _symbol) {
        setBaseURI(_initBaseURI);
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI;
    }
    
    function mint(address _to) public onlyOwner {
        uint256 tokenId = totalSupply() + 1;
        _safeMint(_to, tokenId);
    }

    function tokenURI(uint256 tokenId) 
        public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        return bytes(baseURI).length > 0 
            ? string(abi.encodePacked(baseURI, tokenId.toString(), baseExtension)) 
            : "";
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseURI = _newBaseURI;
    }

    function setBaseExtension(string memory _newBaseExtension) public onlyOwner {
        baseExtension = _newBaseExtension;
    }
}

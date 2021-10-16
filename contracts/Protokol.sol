//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract Protokol is ERC721, Pausable, Ownable {
    
    using Counters for Counters.Counter;
    using Strings for uint256;
    Counters.Counter private _tokenIds;
    uint256 public constant TOTAL_SUPPLY = 1000;
    mapping(uint256 => string) _tokenURIs;

    constructor()ERC721("Protokol", "PTK"){

    }

    function setTokenURI(uint256 tokenId, string memory _tokenURI) internal {
        _tokenURIs[tokenId] = _tokenURI;
    }

    function mint(address recipient, string memory uri) public {
        uint256 newId = _tokenIds.current();
        _mint(recipient, newId);
        _tokenIds.increment();
    }



}
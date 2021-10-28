//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/// @title A basic ERC721 smart contract that allows user to mint multiple tokens at once.  
/// @dev Inherits standard Openzeppelin's library.

contract Protokol is ERC721, Pausable, Ownable, ERC721URIStorage {
    
    using Counters for Counters.Counter;
    using Strings for uint256;
    Counters.Counter private _tokenIds;
   

    /// @dev Sets maximum number of mintable tokens at once.
    uint256 public maxMintAmount = 10;

    mapping(uint256 => string) _tokenURIs;

    constructor()ERC721("Protokol", "PTK"){

    }

    
    /**
    @notice onlyOwner is not enforced so as to allow anyone call this function.
    @dev Requires minimum number of mintable token to be at least 1.
    Requires number to be minted to be below maximum mintable as once.
    Requires total supply not to exceed MAX_TOKEN.
    */

    function mint(address recipient, string memory uri uint256 _mintAmount) public {
        uint supply = totalSupply();
        require(_mintAmount > 0, "Minimum number of mintable token is 1");
        require(_mintAmount <= maxMintAmount, "Maximum amount mintable at once is 10");
        require(supply + _mintAmount <= MAX_TOKEN, "Total number of tokens exceeded");
        
        for (uint256 i; i <= _mintAmount; i++) {
            uint256 newId = _tokenIds.current();
            _safeMint(recipient, newId);
            _setTokenURI(newId, uri);
            _tokenIds.increment();
        } 
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        require(_exists(tokenId), "Token not exist");
        string memory _tokenURI = _tokenURIs[tokenId];
        return _tokenURI;
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

}
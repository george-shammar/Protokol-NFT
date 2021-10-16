//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol"
import "@openzeppelin/contracts/utils/Counters.sol";

contract Protokol is ERC721, Pausable, Ownable {
    

    constructor()ERC721("Protokol", "PTK"){

    }



}
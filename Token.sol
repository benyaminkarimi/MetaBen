// contracts/NFT.sol
// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract NftCollection is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    address contractAddress;
    uint256 public CollectionTokenCount ;
    uint256 public totalSupply = 0;
    mapping(uint256 => address) public tokenCreator;
    mapping(uint256 => uint256) public tokenLevel;

    constructor(string memory name, string memory symbol, uint256 NumberOfToken)
        ERC721(name, symbol)
    {
        CollectionTokenCount= NumberOfToken;
    }

    function Mint(string memory tokenURI , uint256 level) public returns (uint256) {
        require(totalSupply < CollectionTokenCount,"CollectionTokenCount ERROR!");

        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();

        _mint(msg.sender, newItemId);
        tokenCreator[newItemId] = msg.sender;
        tokenLevel[newItemId] = level;
        _setTokenURI(newItemId, tokenURI);
        setApprovalForAll(contractAddress, true);
        totalSupply = totalSupply+1;
        return newItemId;
    }



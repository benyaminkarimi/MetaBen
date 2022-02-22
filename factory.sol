// SPDX-License-Identifier: MIT OR Apache-2.0
pragma solidity 0.8.4;
import "./Token.sol";
contract CollectionFactory {
 
  NftCollection public token;
  mapping(string => mapping(string => address)) private nameAndSymbolToAddress;

  function getCollectionAddressFromNameAndSymbol(string memory _token, string memory _symbol) public view returns (address) {
    return address(nameAndSymbolToAddress[_token][_symbol]);
  }


   // E.G. Token = "Your Full Name"
  function collectionFactory(string memory _token,string memory _symbol,uint256 _count) public {
    require(nameAndSymbolToAddress[_token][_symbol] == address(0));
  token = new NftCollection(_token, _symbol,_count);
  nameAndSymbolToAddress[_token][_symbol]=address(token);

  }

}


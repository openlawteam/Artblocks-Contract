pragma solidity ^0.5.0;

import "./GenArt721Minter3.sol";

/**
 * Validator that uses an explicit whitelist to control who
 * can receive a mint.
 */
contract ValidateWhitelist is Validator {

  GenArt721CoreContract public artblocksContract;

  mapping(address => bool) public whitelist;

  constructor(address _genArt721Address) public {
    artblocksContract = GenArt721CoreContract(_genArt721Address);
  }

  function addToWhitelist(address _address) public {
    require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
    whitelist[_address] = true;
  }

  function removeFromWhitelist(address _address) public {
    require(artblocksContract.isWhitelisted(msg.sender), "can only be set by admin");
    whitelist[_address] = false;
  }

  function validateMint(address _address) external view {
    require(whitelist[_address], "address is not in the whitelist");
  }
}


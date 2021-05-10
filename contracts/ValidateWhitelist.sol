pragma solidity ^0.5.0;

import "./libs/Validator.sol";

/**
 * Validator that uses an explicit whitelist to control who
 * can receive a mint.
 */
contract ValidateWhitelist is Validator {

  mapping(address => bool) public whitelist;

  function addToWhitelist(address _address) public {
    whitelist[_address] = true;
  }

  function removeFromWhitelist(address _address) public {
    whitelist[_address] = false;
  }

  function validateMint(address _address) external view {
    require(whitelist[_address], "address is not in the whitelist");
  }
}


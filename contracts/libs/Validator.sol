pragma solidity ^0.5.0;

/**
 * @dev Interface for a validation mechanism for mint destination addresses.
 */
interface Validator {

  /**
   * Validates that the given destination address is validate for a mint. Function
   * should revert is validation fails.
   */
  function validateMint(address _to) external view;
}

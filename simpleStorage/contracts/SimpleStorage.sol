// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; 

contract SimpleStorage {
    // This will get initialized to 0!
    uint256 favoriteNumber;
    function store (uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

}
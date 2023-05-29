// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; 

contract SimpleStorage {
    // This will get initialized to 0!
    uint256 public favoriteNumber;
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;
    
    constructor () {
        favoriteNumber = 10;
        people.push(People(favoriteNumber, "Nathan"));
    }

    function store (uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    function retrieve () public view returns (uint256) {
        return favoriteNumber;
    }

}
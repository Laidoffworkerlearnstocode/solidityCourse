// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 

contract FundMe {

    function fund() public payable {
        require(msg.value >= 0.01 ether, "Minimum contribution is 0.01 ether");
    }
}
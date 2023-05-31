// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 

import "@chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumContribution = 50; // in usd

    function fund() public payable {
        require(msg.value >= 0.01 ether, "Minimum contribution is 0.01 ether");
    }

    function getPrice() public {
        //0x694AA1769357215DE4FAC081bf1f309aDC325306
    }

    function getConversionRate() public {

    }
}
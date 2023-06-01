// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 

import "@chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe {

    uint256 public minimumContribution = 50; // in usd

    function fund() public payable {
        require(msg.value >= minimumContribution, "You need to spend more ETH!");
    }

    function getPrice() public view returns (uint256) {
        //0x694AA1769357215DE4FAC081bf1f309aDC325306
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (
            /* uint80 roundID */,
            int answer,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return uint256(answer * 1e10);
    }

    function getConversionRate() public {

    }
}
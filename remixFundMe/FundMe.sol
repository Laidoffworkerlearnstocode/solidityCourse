// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8; 

import "./priceConverter.sol";

contract FundMe {

    uint256 public minimumContribution = 50 * 1e18;

    address [] public funders;
    mapping(address => uint256) public addressToAmountFunded;
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        require(PriceConverter.getConversionRate(msg.value) >= minimumContribution, "You need to spend more ETH!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withDraw() public onlyOwner(){
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        (bool success ,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success, "Failed to withdraw funds from contract");
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

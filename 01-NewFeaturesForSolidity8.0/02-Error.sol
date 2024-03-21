// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

error unAuthorized(address _addr);

// Error
contract Error{
    address payable owner = payable(msg.sender);

    function withDraw() public{
        if(msg.sender != owner) {
            // revert("unAuthorized");
            revert unAuthorized(msg.sender);
        }
        owner.transfer(address(this).balance);
    }
}
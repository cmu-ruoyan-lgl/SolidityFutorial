// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Library like
// no public/pure/payable/....
// no contract variable
function pow2(uint256 a) returns(uint256){
    return a*a;
}

contract contractTest{
    function test() public{
        uint256 a = 2;
        uint256 b = pow2(a);
        assert(b == 4);
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// gas refund, state update are revert
contract Error{
    function testRequire(uint _i) public pure {
        // _i = 1;
        require(_i != 1, "require");
    }

    function testRevert(uint _i) public pure {
        // _i = 1;
        if(_i != 1){
            revert("revert");
        }
    }

    error Err(uint x);
    function testError(uint _i) public pure {
        // _i = 1;
        if(_i != 1){
            revert Err(_i);
        }
    }

    function testAssert(uint _i) public pure {
        // _i = 1;
        assert(_i == 1);
    }
}
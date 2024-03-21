// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// SafeMath
contract SafeMath{
    function uintUnderFlow() public pure returns(uint){
        uint x = 0;
        x--;
        // 运行时发出 revert 错误
        return x;
    }

    function uintUncheckedUnderFlow() public pure returns(uint){
        uint x = 0;
        unchecked{
            x--;
            // 2^256 - 1 = 115792089237316195423570985008687907853269984665640564039457584007913129639935 (以十进制表示)
        }
        return x;
    }
}
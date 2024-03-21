// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {pow2 as POW2} from "./03-FuncOutsideContract.sol";

contract Import{

    // 不能重载 编译器在合约内找到了pow2函数，就不去外边函数找了，所以不能重载
    // function pow2() public pure returns(uint) {
    //     return pow2(1);
    // }

    function pow2(uint256 a) public pure returns(uint){
        return a * a * a;
    }

    function test1() public returns(uint x){
        x = pow2(2);
    }

    function test2() public returns(uint x){
        x = POW2(2);
    }
}
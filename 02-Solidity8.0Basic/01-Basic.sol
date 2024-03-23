// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract ValueTypes{
    bool public vis = true;
    uint public u = 123; // uint == uint256 [0,2^256-1]
                         // uint8 [0,2^8-1]
                         // uint16 [0,2^16-1]
    int public i = -123; // int == int256 [-2^255,2^255-1]
                         // int8 [-2^7,2^7-1]
                         // int16 [-2^15,2^15-1]
                         // int128 [-2^127,2^127-1]
    int public minInt = type(int).min;
    int public maxInt = type(int).max;

    string public str = "Hello, World!";
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // 20字节 加上0x长度是42个字符
    bytes32 public b32 = keccak256(abi.encodePacked(str));
    // 32字节 长64字符 下标[0,63]
    mapping(uint => uint) public mp;
    mapping(address => mapping(address => bool)) public mp2;
    // 内部使用Keccak-256进行Hash运算
}

contract StateVariable{
    uint public x = 123; // 存区块链上
    uint constant public y = 123;
    uint internal q;
}
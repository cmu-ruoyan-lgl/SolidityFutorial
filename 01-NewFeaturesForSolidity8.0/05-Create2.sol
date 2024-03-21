// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

contract D{
    uint public x;
    constructor(uint _x){
        x = _x;
    }
}

contract Create2{
    function getBytes32(uint salt) public pure returns(bytes32){
        return bytes32(salt);
        // return keccak256(abi.encodePacked(salt));
    }

    function getAddress(bytes32 salt, uint arg) external view returns(address _addr) {
        _addr = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff), 
            // 常数前缀：0xff，这是一个约定俗成的选择，用来标识这是 CREATE2 操作而非普通的 CREATE 操作。
            address(this),
            salt,
            keccak256(abi.encodePacked(type(D).creationCode, arg))
            // type(contractName).creationCode 是指合约构造函数的编译后字节码，常用于配合 CREATE2 指令进行确定性合约部署。
            // type(contractName).creationCode 是一个内部的 EVM 字节码表示形式，它对应于指定合约类型（这里是 D）的构造函数代码。
            // arg是D的构造函数参数
        )))));
    }

    address public deployedAddress;

    function createDSalt(bytes32 salt, uint arg) public {
        D d = new D{salt:salt}(arg);
        deployedAddress = address(d);
    }
}
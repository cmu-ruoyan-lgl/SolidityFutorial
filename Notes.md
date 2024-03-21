### [Solidity8.0新特性](https://docs.soliditylang.org/en/v0.8.24/080-breaking-changes.html)
#### 1. 安全数学Unchecked{}
在Solidity编程语言中，unchecked 关键字用于指示编译器在执行算术运算时忽略溢出检查。这意味着当 unchecked 作用域内的整数操作（如加法、减法、乘法等）可能导致数值溢出到类型的最大允许范围之外时，编译器不会抛出异常或回滚交易，而是允许数值“环绕”到类型的最小值或最大值重新开始。
取消溢出检查。
#### 2.自定义错误
error
用法同event，比revert更轻量级，可以减少gas消耗。
revert(string)随string变长，gas消耗变高。
#### 3. 合约外定义函数
当作library函数使用
合约优先搜索内部函数，找不到再搜索外部函数。
#### 4.Import
增加取指定函数并重命名。
#### 5.Create2
在create2中，可以指定salt，可以指定合约地址。
在合约部署之前，确定合约的部署地址。
###
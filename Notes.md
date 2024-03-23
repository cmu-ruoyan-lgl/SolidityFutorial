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

--------

### Solidity Basic

#### 1.variable

uint == uint256 [0,2^256-1]
uint8 [0,2^8-1]
uint16 [0,2^16-1]
int == int256 [-2^255,2^255-1]
int128 [-2^127,2^127-1]
typeA [type(typeA).min,type(typeA).max]

string 
address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
// 20字节 加上0x长度是42个字符
bytes32 public b32 = keccak256(abi.encodePacked("Hello, World!"));
// 32字节 长64字符 下标[0,63]

[type] [空/immutable(推荐使用)/constant(已经弃用)] [public/private/internal] [变量名]

#### 2.function

- 合约外function：当library用，当和合约内函数有重名函数时只会找合约内函数
- 合约内function：
function [函数名] (pram...) [public/private/internal/external] [空/pure/view/payable] [空/returns (typeA...)] {
    [空/returns (typeA...)];
    // returns 中可以定义变量，如果需要返回的变量都是定义好的就可以省略
}

访问控制关键字:
public：表示函数可以在合约外部调用。
private：表示函数只能在合约内部调用。
internal：表示函数可以在合约内部以及继承自该合约的子合约中调用。
external：表示函数只能在合约外部调用，不能在合约内部调用。

函数修饰符:
pure：表示函数不会修改合约的任何状态，也不会读取任何状态。
view：表示函数不会修改合约的任何状态，但可以读取状态。
payable：表示函数可以接收Ether。

#### Some other useful matters

#### 1.delete

type x;
delete x; 
会把x所占用的空间释放，x的值会变为0

#### 2.默认值

solidity中，默认值是0，false，address(0)，0x0000000000000000000000000000000000000000
所有的变量默认的占有的空间都是0
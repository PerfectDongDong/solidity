//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

library SafeMath {
    function add(uint256 x, uint256 y) internal pure returns (uint256) {
        uint256 result = x + y;
        require(result >= x, "Overflow");
        return result;
    }
}

contract TestSafeMath {
    using SafeMath for uint256;

    function testAdd(uint256 x, uint256 y) public pure returns (uint256) {
        uint256 result = x.add(y);
        return result;
    }
}

library Array {
    function remove(uint256[] storage arr, uint256 index) internal {
        arr[index] = arr[arr.length - 1];
        arr.pop();
    }
}

contract TestArray {
    using Array for uint256[];
    uint256[] public testArr;

    function testArrRemove() public {
        testArr.push(1);
        testArr.push(2);
        testArr.push(3);
        testArr.push(4);
        testArr.push(5);

        testArr.remove(1);

        assert(testArr.length == 4);
        assert(testArr[1] == 5);
        assert(testArr[2] == 3);
    }
}

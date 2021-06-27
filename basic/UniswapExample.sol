//SPDX-License-Identifier:MIT
pragma solidity ^0.8.4;

interface UniswapV2Factory {
    function getPair(address tokenA, address tokenB)
        external
        view
        returns (address pair);
}

interface UniswapV2Pair {
    function getReserves()
        external
        view
        returns (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        );
}

contract UniswapV2Example {
    address public factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address public dai = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public weth = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;

    function getTokenReserve()
        public
        view
        returns (
            uint112,
            uint256,
            uint32
        )
    {
        address pair = UniswapV2Factory(factory).getPair(dai, weth);
        (
            uint112 reserve0,
            uint112 reserve1,
            uint32 blockTimestampLast
        ) = UniswapV2Pair(pair).getReserves();
        return (reserve0, reserve1, blockTimestampLast);
    }
}

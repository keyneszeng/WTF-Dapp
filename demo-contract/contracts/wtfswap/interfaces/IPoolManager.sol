// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;
pragma abicoder v2;

import "./IFactory.sol";

interface IPoolManager is IFactory {
    struct PoolInfo {
        address tokenA;
        address tokenB;
        uint8 feeProtocol;
        int24 tickLower;
        int24 tickUpper;
        int24 tick;
        uint160 sqrtPriceX96;
    }

    struct Pair {
        address tokenA;
        address tokenB;
    }

    function getPairs() external view returns (Pair[] memory);

    function getAllPools() external view returns (PoolInfo[] memory poolsInfo);

    struct CreateAndInitializeParams {
        address tokenA;
        address tokenB;
        uint24 fee;
        int24 tickLower;
        int24 tickUpper;
        uint160 sqrtPriceX96;
    }

    function createAndInitializePoolIfNecessary(
        CreateAndInitializeParams calldata params
    ) external payable returns (address pool);
}

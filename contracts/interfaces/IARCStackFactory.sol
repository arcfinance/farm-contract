// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

import "../interfaces/IBEP20.sol";

interface IARCStackFactory {

    function newPool(
        IBEP20 _stakedToken,
        IBEP20 _rewardToken,
        uint256 _rewardPerBlock,
        uint256 _startBlock,
        uint256 _bonusEndBlock,
        uint256 _poolLimitPerUser
    ) external;

    event NewPool(address indexed newAddress, address indexed stackToken, address indexed rewardToken, uint256 rewardPerBlock, uint256 startBlock, uint256 bonusEndBlock);
}
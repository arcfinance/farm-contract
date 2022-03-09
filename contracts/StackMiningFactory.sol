// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

import "./interfaces/IBEP20.sol";
import "./interfaces/IARCStackFactory.sol";
import "./StackMining.sol";

contract StackMiningFactory is Ownable, IARCStackFactory {

    /**
     * @dev All pools
     */
    mapping(address => bool) public pools;
    
    /**
     * @dev Add new pool to factory
     *
     * @param _stakedToken: staked token address
     * @param _rewardToken: reward token address
     * @param _rewardPerBlock: reward per block (in rewardToken)
     * @param _startBlock: start block
     * @param _bonusEndBlock: end block
     * @param _poolLimitPerUser: pool limit per user in stakedToken (if any, else 0)
     * @param _admin: admin address with ownership
     *
     * Emits an {NewPool} event indicating create new stacking pool
     */
    function newPool(
        IBEP20 _stakedToken,
        IBEP20 _rewardToken,
        uint256 _rewardPerBlock,
        uint256 _startBlock,
        uint256 _bonusEndBlock,
        uint256 _poolLimitPerUser,
        address _admin
    ) external onlyOwner {
        require(_stakedToken.totalSupply() >= 0);
        require(_rewardToken.totalSupply() >= 0);
        require(_stakedToken != _rewardToken, "Tokens must be different");

        // create contract
        bytes memory bytecode = type(StackMining).creationCode;
        bytes32 salt = keccak256(abi.encodePacked(_stakedToken, _rewardToken, _startBlock));
        address stackAddress;
        assembly {
            stackAddress := create2(0, add(bytecode, 32), mload(bytecode), salt)
        }

        require(!pools[stackAddress], "this stack pool is create");
        // init contract
        StackMining(stackAddress).initialize(
            _stakedToken,
            _rewardToken,
            _rewardPerBlock,
            _startBlock,
            _bonusEndBlock,
            _poolLimitPerUser,
            _admin
        );

        pools[stackAddress] = true;
        emit NewPool(stackAddress, address(_stakedToken), address(_rewardToken), _rewardPerBlock, _startBlock, _bonusEndBlock);
    }
}
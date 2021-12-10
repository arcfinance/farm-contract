const stackMiningFactory = artifacts.require("StackMiningFactory");

module.exports = function (deployer) {
  deployer.deploy(stackMiningFactory);
};

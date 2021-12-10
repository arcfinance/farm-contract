const Token = artifacts.require("ARCToken");
var BigNumber = require('big-number');
const base = BigNumber(10).pow(18)
const totalsupply = BigNumber(10).pow(8)

module.exports = function (deployer) {
  // deployer.deploy(Token, "Arc Finance Token", "ARC", totalsupply.mult(base).toString());
};

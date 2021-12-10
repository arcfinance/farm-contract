// const ARCtoken = artifacts.require("ARCToken");
const LP = artifacts.require("LPMining");


module.exports = function (deployer, network, accounts) {
    return deployer.then(async () => {
        // const token = await ARCtoken.deployed()
        const router = await deployer.deploy(LP, "0x2bb821f8034820F36c3977c67Ee8c9a825a72157", "0x69a997D3bC72189A6c030367c7B5775Eb8682A2e", '10000000000000000000', 14354220)
    })
}

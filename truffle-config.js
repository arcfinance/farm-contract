const HDWalletProvider = require('@truffle/hdwallet-provider');
// const fs = require('fs');
// const mnemonic = fs.readFileSync(".secret").toString().trim();


const account = {
  publicKey: "0x69a997D3bC72189A6c030367c7B5775Eb8682A2e",
  privateKey: "a1219281b84b5606cf8dbde5f236debe98e0b0f1f4e170b6b525cbcb48d63211",
}


module.exports = {
  networks: {
    dev: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*",
      gas: 6000000,
    },
    testnet: {
      provider: () => new HDWalletProvider(account.privateKey, `https://data-seed-prebsc-1-s1.binance.org:8545`),
      network_id: 97,
      confirmations: 10,
      timeoutBlocks: 200,
      skipDryRun: true
    },
    bsc: {
      provider: () => new HDWalletProvider(account.privateKey, `https://bsc-dataseed1.binance.org`),
      network_id: 56,
      confirmations: 10,
      timeoutBlocks: 200,
      skipDryRun: true
    },
  },

  // Set default mocha options here, use special reporters etc.
  mocha: {
    // timeout: 100000
  },

  plugins: [
    'truffle-contract-size'
  ],

  // Configure your compilers
  compilers: {
    solc: {
      version: "^0.8.9", // A version or constraint - Ex. "^0.5.0"
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}

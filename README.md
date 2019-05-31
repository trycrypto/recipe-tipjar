# SmartPage Recipe - Tips

This is a SmartPage recipe for receiving Tips (donations) for published works.

# Pre-requisites

In order to develop and build this Smart Contract, the following pre-requisites must be installed:

* [Visual Studio Code](https://code.visualstudio.com/download) (or any IDE for editing Javascript and Solidity code)
* [NodeJS v10.x](https://nodejs.org/en/download/)
* [Truffle v5.0.7](https://truffleframework.com/truffle)
* [Ganache v2.0.0](https://truffleframework.com/ganache)
* [Solidity v0.5.7](https://www.npmjs.com/package/solc)

# Installation

1. Launch the Ganache GUI and create a new workspace with the following settings:
   - Workspace Name: *recipe-tips*
   - Port Number (Server tab): *7545*
   - Network ID (Server tab): *5777*
   - Mnemonic (Accounts & Keys tab): *pottery movie angle day assault faculty banana rural lyrics hammer believe learn*

2. Using a terminal (or command prompt), change to your Smart Contract recipe folder and type: `npm install`

# Usage

`truffle compile` to compile contracts/*.sol files

`truffle compile --reset` to force compile contracts/*.sol files

`truffle test ./test/recipe.js` to compile smart contracts and run test script (shortcut `npm run test`)

`truffle migrate` to deploy smart contracts and regenerate configuration file

`truffle migrate --reset` to force deploy smart contracts and regenerate configuration file

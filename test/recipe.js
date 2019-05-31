const Test = require('./testConfig.js');
const truffleAssert = require('truffle-assertions');

contract('Smart Contract Recipe Tests', async (accounts) => {

  let config;
  before('setup contract', async () => {
    config = await Test.Config(accounts);
  });


});
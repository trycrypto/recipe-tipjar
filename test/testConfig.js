
const Recipe = artifacts.require("TipJar");
const BigNumber = require('bignumber.js');
const bs58 = require('bs58');

const Config = async function(accounts) {
    
    // These test addresses are useful when you need
    //  to add multiple users in test scripts
    let testAddresses = [
        "0xb1ac66b49fdc369879123332f2cdd98caad5f75a",
        "0x0d27a7c9850f71d7ef71ffbe0155122e83d9455d",
        "0x88477a8dc34d60c40b160e9e3b1721341b63c453",
        "0x2880e2c501a70f7db1691a0e2722cf6a8a9c9009",
        "0x0226df61d33e41b90be3b5fd830bae303fcb66f5",
        "0x60a4dff3d25f4e5a5480fb91d550b0efc0e9dbb3",
        "0xa2f52a2060841cc4eb4892c0234d2c6b6dcf1ea9",
        "0x71b9b9bd7b6f72d7c0841f38fa7cdb840282267d",
        "0x7f54a3318b2a728738cce36fc7bb1b927281c24e"
    ];


    return {
        owner: accounts[0],
        weiMultiple: (new BigNumber(10)).pow(18),
        testAddresses: testAddresses,
        recipeApp: await Recipe.new()
    }
}

module.exports = {
    Config: Config
};
const Recipe = artifacts.require("TipJar");
const fs = require('fs');

module.exports = function(deployer) {

    deployer.deploy(Recipe)
    .then(() => {
       
    });
}
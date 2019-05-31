const Recipe = artifacts.require("Tips");
const fs = require('fs');

module.exports = function(deployer) {

    deployer.deploy(Recipe)
    .then(() => {
       
    });
}
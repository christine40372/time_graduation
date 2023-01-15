var donation = artifacts.require("./donation.sol");

module.exports = function(deployer) {
  deployer.deploy(donation);
};

var InvoiceLedger = artifacts.require("./InvoiceLedger");

module.exports = function(deployer) {
  deployer.deploy(InvoiceLedger);
};

const MiContrato = artifacts.require("CupcakesOrders");

module.exports = function (deployer) {
  deployer.deploy(MiContrato);
};

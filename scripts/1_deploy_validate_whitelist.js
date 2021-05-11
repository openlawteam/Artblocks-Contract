const {BigNumber} = require('ethers');

async function main() {
  const [deployer] = await ethers.getSigners();
  const deployerAddress = await deployer.getAddress();
  console.log(
    "Deploying ValidateWhitelist from:",
    deployerAddress
  );

  const genArt721Address = prompt('GenArt721 address? ');
  const ValidateWhitelist = await ethers.getContractFactory("ValidateWhitelist");
  const validateWhitelist = await ValidateWhitelist.deploy(genArt721Address);

  console.log('ValidateWhitelist contract deployed at:', (await validateWhitelist.deployed()).address);
}

main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });

//implement ethers from hardhat
const{ethers} = require("hardhat");

const main = async () => {
/** A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts, so VerificateNFTContract here is a factory for instances of our Verificate NFT contract.
*/
console.log("deploying Verificate contract.......")
  const VerificateNFTContract = await ethers.getContractFactory("Verificate");

  // here we deploy the contract
  const deployedVerificateNFTContract = await VerificateNFTContract.deploy();

  // Wait for it to finish deploying
  await deployedVerificateNFTContract.deployed();

  // print the address of the deployed contract
  console.log(
    "\n 🏵 Verificate Contract Address:",
    deployedVerificateNFTContract.address
  );
}

// Call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
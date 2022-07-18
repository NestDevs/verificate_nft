//implement ethers from hardhat
const{ethers} = require("hardhat");

async function main(){
     /*
  A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts, so VerificateNFTContract here is a factory for instances of our Verificate NFT contract.
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



  const main = async () => {
    const [deployer] = await hre.ethers.getSigners();
    // const accountBalance = await deployer.getBalance();
  
    console.log("Deploying contracts with account: ", deployer.address);
    // console.log("Account balance: ", accountBalance.toString());
  
    const PlynTokenFactory = await hre.ethers.getContractFactory(
      "PlynToken"
    );
    const plyncontract = await PlynTokenFactory.deploy();
    await plyncontract.deployed();
  
    console.log("plyncontract address: ", plyncontract.address);
  };
  
  const runMain = async () => {
    try {
      await main();
      process.exit(0);
    } catch (err) {
      console.log(err);
      process.exit(1);
    }
  };
  
  runMain();
import { ethers } from "hardhat";

async function main() {

  const MultiSend = await ethers.getContractFactory("MultiSend");
  const multiSend = await MultiSend.deploy();

  await multiSend.deployed();

  console.log("Multisend address:", multiSend.address);

  // Multisend address: 0x5FbDB2315678afecb367f032d93F642f64180aa3
//   const CONTRACTADDRESS = " 0x5FbDB2315678afecb367f032d93F642f64180aa3";
//   const IMULTI = await ethers.getContractAt("IMultiSend", CONTRACTADDRESS);
//   const response = await IMULTI.getContractBalance();
//   console.log(response)
// }

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
}
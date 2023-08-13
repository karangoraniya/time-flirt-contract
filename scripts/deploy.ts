import { ethers } from 'hardhat';

async function main() {
  const TimeFlirt = await ethers.getContractFactory('TimeFlirt');
  const timeFlirt = await TimeFlirt.deploy();

  await timeFlirt.deployed();

  console.log(`TimeFlirt deployed to ${timeFlirt.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

# Time Flirt Capsule: An Overview

Time Flirt Capsule is a cutting-edge digital artifact designed to bridge the gap between cherished memories and future interactions. Utilizing blockchain technology and leveraging the power of decentralized storage, the Time Flirt Capsule allows users to capture, preserve, and share moments with a unique twist. This project is driven by a sense of fun and a willingness to experiment with some truly unconventional and weird ideas.

## Team Members

- [Shantanu Bharadwaj](https://github.com/itsshantanu)
- [Mohit Chandel](https://github.com/mohitchandel)

## Frontend Repo

- [Time Flirt FE](https://github.com/karangoraniya/time-flirt-fe)

## Features

- **Capture Moments**: Users can upload images, videos, notes, or any form of digital content, embodying a specific memory or sentiment.
- **Set Expiration**: Add a time element by setting an expiration date. The content within the capsule can be made to appear or disappear at specific times, giving an element of surprise or nostalgia.
- **Mint as NFT**: The capsule can be minted as a Non-Fungible Token (NFT), giving it a unique identity on the blockchain.
- **Gift or Trade**: Share the capsule with friends and loved ones or trade it within the community.
- **Secure & Decentralized**: Stored securely on a decentralized network, ensuring the privacy and integrity of the content.

## Deploy Contract

- [Optimism Goerli](https://goerli-optimism.etherscan.io/address/0x32ef3be4bb15492ca859e5b1776e55671ed81a79)
- [Zora Testnet](https://testnet.explorer.zora.energy/address/0x662c66962B02Ebd79Fdc204e21065b268A15e920)
- [Polygon Mumbai](https://mumbai.polygonscan.com/address/0xc84eac7f76b17a78ef6bdb915b5d8bfb5c9f10d2)
- [Mode Sepolia](https://sepolia.explorer.mode.network/address/0x9c774Ba3c07D9526c0a658D1e6FE001D0E9fF1B7)

## Run Locally

Clone the project

```bash
  git clone https://github.com/karangoraniya/time-flirt-contract.git
```

Go to the project directory

```bash
  cd time-flirt-contract
```

Install dependencies

```bash
  npm install
```

Compile

```bash
  npx hardhat compile
```

Test

```bash
  npx hardhat test
```

Deploy on Optimism

```bash
  npx hardhat run scripts/deploy.ts --network op_testnet
```

Deploy on Zora Testnet

```bash
  npx hardhat run scripts/deploy.ts --network zora_testnet
```

Deploy on Mode Sepolia

```bash
  npx hardhat run scripts/deploy.ts --network mode
```

Deploy on Mumbai

```bash
  npx hardhat run scripts/deploy.ts --network mumbai
```

Verify Contract

For the op_testnet network:

```bash
npx hardhat verify --network op_testnet <YOUR_CONTRACT_ADDRESS> <WITH_ARGUMENT_IF_REQUIRED>
```

Help

```bash
  npx hardhat help
```

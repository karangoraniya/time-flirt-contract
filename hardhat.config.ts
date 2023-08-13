import { HardhatUserConfig } from 'hardhat/config';
import '@nomicfoundation/hardhat-toolbox';
require('dotenv').config();

const { PRIVATE_KEY, POLYGON_SCAN_API_KEY, OP_ALCHEMY_API } = process.env;

const config: HardhatUserConfig = {
  solidity: '0.8.18',
  networks: {
    mumbai: {
      url: 'https://rpc.ankr.com/polygon_mumbai',
      accounts: [`0x${PRIVATE_KEY}`],
    },
    mode: {
      url: 'https://sepolia.mode.network/',
      accounts: [`0x${PRIVATE_KEY}`],
    },
    op_testnet: {
      url: `https://opt-goerli.g.alchemy.com/v2/${OP_ALCHEMY_API}`,
      accounts: [`0x${PRIVATE_KEY}`],
    },
    zora_testnet: {
      url: 'https://testnet.rpc.zora.energy',
      accounts: [`0x${PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: POLYGON_SCAN_API_KEY,
  },
};

export default config;

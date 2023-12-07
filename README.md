# Soulbound - Game Smart Contract

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Overview

This repository contains the smart contract for the Soulbound Game, an ERC1155 token contract on the Ethereum blockchain. The project is deployed on the Sepolia testnet at the following address: [0x352490F4FBB00367e1be93d875C9844C551aCa7C](https://sepolia.etherscan.io/address/0x352490F4FBB00367e1be93d875C9844C551aCa7C).

## Features

- ERC1155 compliant: Supports the ERC1155 token standard.
- Soulbound Main Token: Each wallet can own only one soulbound main token.
- Item Minting: The owner can mint item tokens associated with the main token.
- Secure Ownership Transfer: Implements secure ownership transfer for the main token.

## Contract Deployment on Sepolia Testnet

### Using Remix

1. **Access Remix:**
   - Go to the Remix IDE at [https://remix.ethereum.org/](https://remix.ethereum.org/).

2. **Create a New File:**
   - Create a new file in Remix and copy-paste the contents of your Solidity contract into the file.

3. **Compiler Settings:**
   - Make sure the compiler version is set to at least 0.8.0 (as specified in the code). You can find the compiler version selector on the left side of the Remix IDE.

4. **Deploy the Contract:**
   - Switch to the "Deploy & Run Transactions" tab.
   - Choose the environment as "Injected Web3" to connect to your MetaMask wallet.
   - Make sure MetaMask is connected to the Sepolia testnet.
   - Click on the "Deploy" button to deploy the contract.

5. **Interact with the Contract:**
   - After deployment, you can interact with the contract using the provided functions in the "Deployed Contracts" section.

   Note: For functions like `mintItemToken`, you need to call it from the account that is the owner (deployer) of the contract.

6. **Test the Contract:**
   - You can simulate transactions, send tokens, and test various functionalities of the contract using the Remix interface.

**Contract Deployment Information:**

- **Network**: Sepolia Testnet
- **Contract Address**: [0x352490F4FBB00367e1be93d875C9844C551aCa7C](https://sepolia.etherscan.io/address/0x352490F4FBB00367e1be93d875C9844C551aCa7C)

**Getting Sepolia Testnet Coins:**

To interact with the contract on the Sepolia testnet, you'll need test ETH. You can get Sepolia testnet coins from the Sepolia testnet faucet [here](https://www.coingecko.com/learn/sepolia-eth#:~:text=How%20to%20Claim%20Sepolia%20Testnet,%2C%20QuickNode%2C%20and%20Infura%20faucets.).

## Development

- **Testing**: Run tests with `truffle test`.
- **Linting**: Lint the code with `npm run lint`.
- **Contributing**: Contributions are welcome. Open an issue for discussions.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

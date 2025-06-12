# GreenExchangetext  


## 📖 Project Description

**GreenExchange** is a decentralized Web3 platform built on the Stacks blockchain that enables users to tokenize clean energy production as GreenTokens and trade them in a transparent marketplace. It promotes renewable energy adoption by creating a trustless ecosystem where energy producers can monetize their clean energy and buyers can support green initiatives easily.

This dApp provides:

- Minting of energy tokens proportional to kWh generated  
- Listing tokens for sale at user-defined prices  
- Purchasing listed energy tokens securely  
- Wallet integration for seamless blockchain interactions  

---

## 🚀 Key Features

- **Energy Tokenization:** Mint fungible GreenTokens representing clean energy units.  
- **Decentralized Marketplace:** List and buy energy tokens transparently on-chain.  
- **Wallet Connect:** Supports Hiro Wallet and Xverse for easy onboarding.  
- **Secure Payments:** STX transfers and token exchanges handled atomically in smart contracts.  
- **Carbon Impact Tracking:** Basic analytics to encourage green energy trading.

---

## 🧰 Technology Stack

- **Stacks Blockchain** — underlying blockchain network  
- **Clarity** — smart contract language used for energy-market.clar  
- **Next.js / React** — frontend framework  
- **@stacks/connect-react** — wallet connection and contract call integration  
- **TypeScript** — typed JavaScript for frontend and scripts  
- **Clarinet** — testing framework for Clarity contracts  

---

## ⚙️ Getting Started

### Prerequisites

- Node.js (v16+) and npm installed  
- [Clarinet](https://github.com/hirosystems/clarinet) installed for contract development and testing  
- Hiro Wallet or Xverse browser extension installed for interacting with the dApp  

### Installation

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/greenexchange-dapp.git
cd greenexchange-dapp/frontend

# Install frontend dependencies
npm install
```

## Running Locally
```bash
npm run dev
```
Open http://localhost:3000 to see the app in action.

## Usage
- Connect your wallet using the Connect Wallet button.

- Mint GreenTokens to represent your generated clean energy.

- List your energy tokens with a price to sell in the marketplace.

- rowse marketplace listings and buy tokens securely with STX.


## Deployment
Compile and test your contracts:

```bash

clarinet check
clarinet test
```
Deploy contracts to the Stacks testnet/mainnet via deployment scripts in /scripts/deploy.ts.

Update frontend config to point to the deployed contract address and network.

## Testing
Run all Clarity contract tests with Clarinet:

```bash

clarinet test
```
## Acknowledgments
- Thanks to the Stacks ecosystem for enabling decentralized app development on Bitcoin.

- Inspired by the global movement for clean energy and sustainability.

- Special thanks to the open source community and Clarinet team for tooling support.


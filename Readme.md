### 2. README.md

Rewards for producing educational video series.

## Project Description
The **Learn-to-Earn Streaming Platform** leverages blockchain technology to create a decentralized platform where content creators (educators, professionals) can upload educational content, and learners can earn rewards for watching or interacting with the content. Content creators are incentivized through token-based rewards, while viewers earn tokens for their engagement, creating a symbiotic ecosystem.

The system operates on a smart contract deployed on the Ethereum blockchain, ensuring transparency, security, and decentralized control over content distribution and reward systems.

## Contract Address
0xcE52BbE120e9a818E35fe8591a777b1a878a6Ffa

## Project Vision
The **Learn-to-Earn** platform aims to revolutionize online education by rewarding both content creators and learners in a transparent and decentralized manner. By utilizing blockchain technology, we aim to:
- Incentivize educators to produce high-quality content.
- Reward learners for their engagement and efforts in learning.
- Create a sustainable, decentralized education ecosystem.
- Promote continuous learning by creating a rewarding environment for both creators and viewers.

## Key Features

### 1. **Content Upload**:
   Content creators can upload new educational materials (such as video courses, tutorials, etc.) to the platform. Each piece of content is given a unique ID and is associated with a creator.

### 2. **Content Approval**:
   After uploading, content must be approved by an authorized approver (could be a moderator or the creator themselves). Once approved, the content becomes eligible for rewards distribution.

### 3. **Reward Distribution**:
   - **Content Creators**: Creators receive a fixed reward (in tokens) once their content is approved and viewed by learners.
   - **Viewers**: Learners or viewers who engage with the content by watching it are rewarded with tokens.

### 4. **Token Economy**:
   The platform uses a native ERC-20 token called `L2E` (Learn-to-Earn Token), which serves as both a reward mechanism and a medium of exchange on the platform.

### 5. **Transparency**:
   All interactions (content upload, approval, viewing, reward distribution) are stored on the blockchain, ensuring transparency and accountability.

### 6. **Decentralization**:
   The platform is fully decentralized and operates on the Ethereum blockchain, removing the need for a central authority to manage rewards or content approvals.

### 7. **Watch-to-Earn Model**:
   Viewers are incentivized to engage with educational content by earning tokens each time they watch content. This encourages continuous learning and interaction.

## How to Interact with the Contract

### 1. **Upload Content**:
   As a content creator, you can upload your educational content (e.g., videos, tutorials) using the `uploadContent` function. You'll need to provide a title for the content.

### 2. **Approve Content**:
   Once the content is uploaded, you can approve it using the `approveContent` function (if you are authorized). This will make the content eligible for rewards.

### 3. **Watch Content**:
   Viewers can watch the content and earn rewards by interacting with the `watchContent` function. Once content is viewed, the viewer will receive a reward in tokens.

### 4. **Check Token Balances**:
   Users can check their balance using the `balanceOf` function to track their earnings.

### 5. **Transfer Tokens**:
   You can transfer tokens to other users using the `transfer` function.

## Requirements
- Ethereum network (mainnet, Rinkeby, or any other test network).
- MetaMask or any Ethereum wallet to interact with the smart contract.
- Ether for paying gas fees (when interacting with the Ethereum network).



---

### Explanation of Key Parts of the Smart Contract

1. **Token Implementation**:
   The contract implements a basic ERC-20 token called `L2E` (Learn-to-Earn Token). Users receive tokens as rewards for viewing educational content.

2. **Content Upload**:
   Content creators can upload new educational content, which is recorded on the blockchain. Each content item is assigned a unique ID and associated with the creator's address.

3. **Content Approval**:
   After content is uploaded, it must be approved by an authorized approver. Only after approval can viewers begin watching the content and earning rewards.

4. **Reward Distribution**:
   - **Content Creator**: Creators receive a fixed reward for each approved content. The reward is distributed directly to the creator’s address.
   - **Viewers**: Viewers who watch the content are rewarded with tokens (using the `watchContent` function).

5. **Security**:
   The contract uses modifiers like `onlyCreator` to ensure that only authorized users can perform specific actions, maintaining security and integrity of the platform.

This contract can be extended with additional features like:
- Voting mechanisms for content quality assessment.
- Reputation or ranking systems for content creators based on engagement.
- A staking system where learners can stake tokens to unlock premium content.


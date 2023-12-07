// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SoulboundGame is ERC1155, Ownable {
    // Mapping to track the owner of the soulbound main token
    mapping(address => bool) private soulboundTokenOwners;

    // Event to notify when a wallet obtains the soulbound main token
    event SoulboundTokenObtained(address indexed wallet, uint256 tokenId);

    // Modifier to ensure that only the owner can perform certain actions
    modifier onlyMainTokenOwner() {
        require(soulboundTokenOwners[msg.sender], "You must own the soulbound main token");
        _;
    }

    constructor() ERC1155("https://api.soulboundgame.com/api/token/{id}.json") Ownable(msg.sender) {
        // Mint soulbound main token to the contract deployer
        _mint(msg.sender, 1, 1, "");

        // Mark the deployer as the owner of the soulbound main token
        soulboundTokenOwners[msg.sender] = true;

        // Emit event indicating that the deployer obtained the soulbound main token
        emit SoulboundTokenObtained(msg.sender, 1);
    }

    // Function to allow the owner to mint item tokens
    function mintItemToken(address account, uint256 id, uint256 amount, bytes memory data) external onlyOwner {
        _mint(account, id, amount, data);
    }

    // Function to check if a wallet owns the soulbound main token
    function isSoulboundTokenOwner(address account) external view returns (bool) {
        return soulboundTokenOwners[account];
    }

    // Function to transfer the soulbound main token
    function transferSoulboundToken(address to) external onlyMainTokenOwner {
        // Revoke ownership from the current owner
        soulboundTokenOwners[msg.sender] = false;

        // Assign ownership to the new owner
        soulboundTokenOwners[to] = true;

        // Emit event indicating the transfer of the soulbound main token
        emit SoulboundTokenObtained(to, 1);
    }

    // Override the ERC1155 safeTransferFrom function to enforce ownership rules
    function safeTransferFrom(
        address from,
        address to,
        uint256 id,
        uint256 amount,
        bytes memory data
    ) public override {
        // Check if the transfer involves item tokens
        require(soulboundTokenOwners[from], "Sender must own the soulbound main token");
        require(soulboundTokenOwners[to], "Recipient must own the soulbound main token");

        // Call the ERC1155 safeTransferFrom function
        super.safeTransferFrom(from, to, id, amount, data);
    }
}

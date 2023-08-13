// SPDX-License-Identifier: MIT

pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";

/**
 * @title TimeFlirt
 * @dev This contract manages "Flirt Capsules", NFTs that unlock content at a specific time for a designated recipient.
 * @author Shantanu Bharadwaj
 */

contract TimeFlirt is ERC721, ERC721URIStorage, Ownable, IERC721Receiver {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    /**
     * @notice Defines a Flirt Capsule with a tokenId, unlock time, recipient, and content URI.
    */
    struct FlirtCapsule {
        uint256 tokenId;
        uint256 unlockTime;
        address recipient;
        string contentURI; // URI for the additional content
    }

    /**
     * @dev Mapping from tokenId to FlirtCapsule details.
    */
    mapping(uint256 => FlirtCapsule) private _flirtCapsules;

     /**
     * @notice Constructor initializes the contract.
     */
    constructor() ERC721("TimeFlirt", "TFT") {}

    /**
     * @notice Required function to implement the IERC721Receiver interface.
     * @return Returns the selector for the `onERC721Received` function.
     */
     function onERC721Received(address, address, uint256, bytes memory) public virtual override returns (bytes4) {
        return this.onERC721Received.selector;
    }

      /**
     * @notice Create a time-locked Flirt Capsule with specified details.
     * @param recipient Address of the recipient.
     * @param uri URI of the capsule.
     * @param unlockTime Timestamp when the capsule can be unlocked.
     * @param contentURI URI for the additional content.
     */
    function createFlirt(address recipient, string memory uri, uint256 unlockTime, string memory contentURI) public {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(address(this), tokenId); // Mint the NFT to the contract itself
        _setTokenURI(tokenId, uri);
        _flirtCapsules[tokenId] = FlirtCapsule(tokenId, unlockTime, recipient, contentURI); // Store the time-lock information
    }

    /**
     * @notice Claim a Flirt Capsule if conditions are met.
     * @param tokenId ID of the capsule to claim.
     */
    function claimFlirt(uint256 tokenId) public {
        require(_exists(tokenId), "Flirt Capsule does not exist");
        require(_flirtCapsules[tokenId].recipient == msg.sender, "You must be the owner of the Flirt Capsule");
        require(_flirtCapsules[tokenId].unlockTime <= block.timestamp, "Flirt Capsule is still locked");

        // Update the URI to the content URI
        _setTokenURI(tokenId, _flirtCapsules[tokenId].contentURI);

        // Transfer the token to the recipient
        _transfer(address(this), msg.sender, tokenId);
    }

    /**
     * @notice Get the content URI of a Flirt Capsule.
     * @param tokenId ID of the capsule.
     * @return Returns the content URI of the specified capsule.
     */
    function getContentURI(uint256 tokenId) public view returns (string memory) {
        require(_flirtCapsules[tokenId].recipient == msg.sender, "You are not the recipient");
        require(block.timestamp >= _flirtCapsules[tokenId].unlockTime, "Capsule is time-locked");
        return _flirtCapsules[tokenId].contentURI;
    }

    // The following functions are overrides required by Solidity.

    /**
     * @dev Override the _beforeTokenTransfer function to prevent transfers of Flirt Capsules.
     */
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    /**
     * @notice Gets the URI of a token.
     * @param tokenId The token ID to query.
     * @return The token URI.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }


    /**
     * @notice Checks if a contract supports an interface.
     * @param interfaceId The interface identifier, as specified in ERC-165.
     * @return True if the contract supports interfaceId, false otherwise.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}
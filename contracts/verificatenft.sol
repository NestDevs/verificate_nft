// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

// imports
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

/**
* @author Verificatedevs
* @title A Skill Verification Dapp
*/

contract Verificate is ERC721, ERC721URIStorage, Pausable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _nftIdCounter;

    constructor() ERC721("VerificateNFT", "VFT") {}

    /** allow contract owner to mint nft to recipient */
    function safeMint(address to, string memory uri) 
        public 
        onlyOwner
        whenNotPaused 
    {
        uint256 nftId = _nftIdCounter.current();
        _nftIdCounter.increment();
        _safeMint(to, nftId);
        _setTokenURI(nftId, uri);
    }

    /** option to destroy nft */
    function _burn(uint256 nftId) 
        internal 
        override(ERC721, ERC721URIStorage) 
    {
        super._burn(nftId);
    }

    /** returns a URI pointing to NFT metadata */
    function tokenURI(uint256 nftId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(nftId);
    }

    /** pause contract in the event of modifications or security breach */
    function pause()
        public 
        onlyOwner 
    {
        _pause();
    }

    /** unpause the contract */
    function unpause() 
        public 
        onlyOwner 
    {
        _unpause();
    }
}
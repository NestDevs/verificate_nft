// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
* @author Nestdevs
* @title A Skill Verification Dapp
*/
contract Verificate is ERC721, Pausable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _nftIdCounter;

    /** URL for certificate */
    string _baseNftURI;

    constructor(string memory baseURI) ERC721("VerificateNFT", "VFT") {       
        /** declare variable for the baseuri */
        _baseNftURI = baseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return _baseNftURI;
    }

    /** change certificate url */
    function setBaseNftURI(string memory baseURI) public onlyOwner whenNotPaused {
    _baseNftURI = baseURI;
    }

    /** allow contract owner to mint nft to recipient */
    function safeMint(address recipient) public onlyOwner whenNotPaused {
        uint256 nftId = _nftIdCounter.current();
        /** increment nft count per mint */
        _nftIdCounter.increment();
        _safeMint(recipient, nftId);
    }

    function _beforeTokenTransfer(address from, address recipient, uint256 nftId) internal whenNotPaused override {
        super._beforeTokenTransfer(from, recipient, nftId);
    }

    /** pause contract in the event of modifications or security breach */
    function pause() public onlyOwner {
        _pause();
    }

    /** unpause the contract */
    function unpause() public onlyOwner {
        _unpause();
    }
}
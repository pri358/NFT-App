// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

// console logging lib provided by hardhat
import "hardhat/console.sol";
// We first import some OpenZeppelin Contracts. ERC721: NFT Standard, OppenZeplin provides boiler plate code
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyEpicNFT is ERC721URIStorage {

    using Counters for Counters.Counter;

    // unique identifier for NFTs
    Counters.Counter private _tokenIds; 

    constructor() ERC721 ("SquareNFT", "SQUARE") {
        console.log("This is my NFT contract. Whoa!");
    }

    function makeAnEpicNFT() public {
        uint256 newItemId = _tokenIds.current();

    // giving the current NFT token id to the address callibng the function
        _safeMint(msg.sender, newItemId);

        // tokenURI: where NFT data lives
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/U569");
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        _tokenIds.increment();
    }
}
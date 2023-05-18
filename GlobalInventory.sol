// SPDX-License-Identifier: Unlicensed

/*

private, external, public

*/

pragma solidity ^0.8.2;

struct Item {
    uint8 id;
    string name;
}

contract GlobalInventory{
    uint8 index = 0;
    mapping(address => Item) items;

    function dropItem(string calldata name) external {
        items[msg.sender] = Item(index++, name);
    }

    function getWalletItemName() external view returns(string memory){
        return items[msg.sender].name;
    }
}
// SPDX-License-Identifier: Unlicensed

/*

1 ether = 10^18 wei

*/

pragma solidity ^0.8.2;

struct Item {
    uint8 id;
    string name;
}

contract Market{

    address payable public immutable gameStudioWalletAddress;

    constructor(){
        gameStudioWalletAddress = payable (msg.sender);
    }

    uint public totalBalance;
    uint8 index = 0;
    mapping(address => Item) items;

    function buyItem(string calldata name) payable external {
        require(msg.value == 2 ether, "2 ethers required!");
        items[msg.sender] = Item(index++, name);
        gameStudioWalletAddress.transfer(1 ether);
        totalBalance += 1 ether;
    }

    function getWalletItemName() external view returns(string memory){
        return items[msg.sender].name;
    }
}
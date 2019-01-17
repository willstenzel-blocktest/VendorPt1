pragma solidity 0.4.25;

contract VendorPt1 {
  struct Item {
    string name;
    uint count;
  }

  address storeOwner;
  Item[] inventory;

  event Purchase(address sender, string itemName);

  constructor() public {
    storeOwner = msg.sender;
  }

  function purchaseItem(string itemName) public {
    for (uint i = 0; i < inventory.length; i++) {
      if (keccak256(inventory[i].name) == keccak256(itemName) && inventory[i].count > 0) {
        inventory[i].count--;
        emit Purchase(msg.sender, itemName);
        return;
      }
    }
    revert("Item not in the inventory.");
  }

  function addItem(string itemName, uint itemCount) {
    require(msg.sender == storeOwner);
    inventory.push(Item(itemName, itemCount));
  }

  function getItemCount(string itemName) public returns (uint count) {
    for (uint i = 0; i < inventory.length; i++) {
      if (keccak256(inventory[i].name) == keccak256(itemName)) {
          return inventory[i].count;
      }
    }
  }
}

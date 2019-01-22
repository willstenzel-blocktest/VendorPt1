pragma solidity 0.4.25;

import "./VendorPt1.sol";

contract TestVendorPt1 is VendorPt1 {

  function test_AddItem() {
    assert(getItemCount("Hats") == 0);
    addItem("Hats", 15);
    assert(getItemCount("Hats") == 15);
    addItem("Mugs", 5);
    addItem("Ties", 30);
    addItem("Scarves", 20);
    assert(getItemCount("Scarves") == 20);
  }

  function test_PurchaseItem() {
    addItem("Watches", 5);
    addItem("Sunglasses", 40);
    addItem("Water Bottles", 18);
    addItem("Card", 100);
    addItem("Computer", 18);
    addItem("Head Band", 20);
    addItem("Keyboard", 30);
    addItem("T shirts", 100);
    addItem("Sodas", 50);
    addItem("Marbles", 450);
    assert(getItemCount("Sunglasses") == 40);
    purchaseItem("Sunglasses");
    assert(getItemCount("Sunglasses") == 39);
    assert(getItemCount("Marbles") == 450);
    purchaseItem("Marbles");
    assert(getItemCount("Marbles") == 449);
  }
}

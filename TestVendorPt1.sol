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
    addItem("Sunglasses", 40);
    assert(getItemCount("Sunglasses") == 40);
    purchaseItem("Sunglasses");
    assert(getItemCount("Sunglasses") == 39);
  }
}

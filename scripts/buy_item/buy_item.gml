// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function buy_item(itemSlot){
	if (itemSlot < 0) return;
	if (itemSlot > Inventory.inventory_and_chest_max_slot_length) return;
	var itemId = Inventory.inventory_slot[itemSlot][ITEM_PARAMETERS.ID];
	var itemQty = Inventory.inventory_slot[itemSlot][ITEM_PARAMETERS.QTY];
	var itemCost = Inventory.inventory_slot[itemSlot][ITEM_PARAMETERS.VALUE];
	if (itemCost * itemQty > Player.money) return;
	
	Player.money-= itemCost * itemQty;
	give_item(itemId, itemQty);
}
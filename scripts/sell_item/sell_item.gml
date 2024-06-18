// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function sell_item(itemSlot){
	if (itemSlot < 0) return;
	if (itemSlot > Inventory.inventory_and_chest_max_slot_length) return;
	var itemId = Inventory.inventory_slot[itemSlot][ITEM_PARAMETERS.ID];
	var itemQty = Inventory.inventory_slot[itemSlot][ITEM_PARAMETERS.QTY];
	var itemCost = floor(Inventory.inventory_slot[itemSlot][ITEM_PARAMETERS.VALUE]/2);
	if (itemCost < 0) itemCost = 0;
	Player.money+=itemCost * grabbed_qty;
	inventory_slot[grabbed_slot][ITEM_PARAMETERS.QTY] -= grabbed_qty;
	if (inventory_slot[grabbed_slot][ITEM_PARAMETERS.QTY] <= 0) {
		set_inventory_slot_to_item_definition(grabbed_slot,ITEMS.EMPTY, 0);
	}
}
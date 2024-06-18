// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function fill_inventory_slot_with_another_slot(from_slot, from_qty, to_slot){
	if (inventory_slot[grabbed_slot, ITEM_PARAMETERS.ID] != inventory_slot[hovered_slot, ITEM_PARAMETERS.ID]) {
		return;
	}
	var _item_id = inventory_slot[grabbed_slot, ITEM_PARAMETERS.ID];
	var _max_qty = item_definitions[_item_id, ITEM_PARAMETERS.QTY];
	inventory_slot[hovered_slot, ITEM_PARAMETERS.QTY] += from_qty;
	
	inventory_slot[grabbed_slot, ITEM_PARAMETERS.QTY] -= from_qty;
	if (inventory_slot[hovered_slot, ITEM_PARAMETERS.QTY] > _max_qty) {
		var _rem_qty = inventory_slot[hovered_slot, ITEM_PARAMETERS.QTY] - _max_qty;
		inventory_slot[hovered_slot, ITEM_PARAMETERS.QTY] -= _rem_qty;
		inventory_slot[grabbed_slot, ITEM_PARAMETERS.QTY] += _rem_qty;
		return;
	}
	
	if (inventory_slot[grabbed_slot, ITEM_PARAMETERS.QTY] <= 0) {
		set_inventory_slot_to_item_definition(from_slot, ITEMS.EMPTY, 0);
	}
	return;
}
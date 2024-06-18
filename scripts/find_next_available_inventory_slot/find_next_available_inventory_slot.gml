// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function find_next_available_inventory_slot(item_id = -1) {
	if (item_id == -1) {
		for(var i=0; i<inventory_slot_length; i++) {
			if (inventory_slot[i][ITEM_PARAMETERS.QTY] == 0) {
				return i;
			}
		}
	}
	//first check if we have the same item somewhere in inventory.
	for(var i=0; i<inventory_slot_length; i++) {
		var cur_id = inventory_slot[i][ITEM_PARAMETERS.ID];
		if (cur_id == item_id && inventory_slot[i][ITEM_PARAMETERS.QTY] < item_definitions[cur_id][ITEM_PARAMETERS.QTY]) {
			return i;
		}
	}
	//Otherwise, just return first empty.
	for(var i=0; i<inventory_slot_length; i++) {
		var cur_id = inventory_slot[i][ITEM_PARAMETERS.ID];
		if (cur_id == 0) {
			return i;
		}
	}
	return -1;
}
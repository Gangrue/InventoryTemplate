// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function give_item(item_id, item_qty){
	var remaining_qty = 0;
	if (item_id == ITEMS.EMPTY) return true;
	with(Inventory) {
		var cur_slot = find_next_available_inventory_slot(item_id);
		if (cur_slot == -1) {
			return false;
		}
	
		inventory_slot[cur_slot][ITEM_PARAMETERS.ID] = item_definitions[item_id][ITEM_PARAMETERS.ID];
		inventory_slot[cur_slot][ITEM_PARAMETERS.QTY] += item_qty;
		inventory_slot[cur_slot][ITEM_PARAMETERS.NAME] = item_definitions[item_id][ITEM_PARAMETERS.NAME];
		inventory_slot[cur_slot][ITEM_PARAMETERS.DESC] = item_definitions[item_id][ITEM_PARAMETERS.DESC];
		inventory_slot[cur_slot][ITEM_PARAMETERS.ITEM_TYPE] = item_definitions[item_id][ITEM_PARAMETERS.ITEM_TYPE];
		inventory_slot[cur_slot][ITEM_PARAMETERS.VALUE] = item_definitions[item_id][ITEM_PARAMETERS.VALUE];
		inventory_slot[cur_slot][ITEM_PARAMETERS.SCRIPT] = item_definitions[item_id][ITEM_PARAMETERS.SCRIPT];
		inventory_slot[cur_slot][ITEM_PARAMETERS.ATTRIBUTES] = item_definitions[item_id][ITEM_PARAMETERS.ATTRIBUTES];
	
		remaining_qty = inventory_slot[cur_slot][ITEM_PARAMETERS.QTY] - item_definitions[item_id][ITEM_PARAMETERS.QTY];
		if (remaining_qty <= 0) {
			return true;
		}
		else {
			inventory_slot[cur_slot][ITEM_PARAMETERS.QTY] -= remaining_qty;
			if (!give_item(item_id, remaining_qty)) {
				drop_item_at(Player.x, Player.y, Player.Direction, 13, item_id, remaining_qty);
			}
			return true;
		}
	}
	
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_inventory_slot_to_item_definition(slot_number, item_id, item_qty){
	for(var X=0; X<ITEM_PARAMETERS.LENGTH; X++) {
		inventory_slot[slot_number, X] = item_definitions[item_id, X];
	}
	inventory_slot[slot_number, ITEM_PARAMETERS.QTY] = 0+item_qty;
}
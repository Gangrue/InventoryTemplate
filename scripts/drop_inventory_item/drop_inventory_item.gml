// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drop_inventory_item(item_slot_to_drop){
	throw_item(item_slot_to_drop);
	set_inventory_slot_to_item_definition(item_slot_to_drop, ITEMS.EMPTY, 0);
}
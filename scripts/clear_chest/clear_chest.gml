// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_chest(){
	with(Inventory) {
		for(var i=inventory_max_slot_length; i<inventory_and_chest_max_slot_length; i++) {
			set_inventory_slot_to_item_definition(i,ITEMS.EMPTY, 0);
		}
	}
}
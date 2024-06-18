// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function swap_inventory_items(first_slot, second_slot) {
	//Copy first to temp
	for(var X=0; X<ITEM_PARAMETERS.LENGTH; X++) {
		temp_slot[X] = inventory_slot[first_slot][X];
	}
	//Then overwrite first with second
	for(var X=0; X<ITEM_PARAMETERS.LENGTH; X++) {
		inventory_slot[first_slot][X] = inventory_slot[second_slot][X];
	}
	
	//Then Place Temp in second.
	for(var X=0; X<ITEM_PARAMETERS.LENGTH; X++) {
		inventory_slot[second_slot][X] = temp_slot[X];
	}
	clear_temp_slot();
}
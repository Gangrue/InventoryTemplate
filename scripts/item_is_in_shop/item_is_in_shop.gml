// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function item_is_in_shop(item_slot){
	return (item_slot > Inventory.inventory_max_slot_length);
}
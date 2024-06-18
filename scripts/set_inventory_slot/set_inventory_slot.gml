// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_inventory_slot(slot_number, item_id, item_qty, item_name, item_desc, item_type, item_value, item_script, item_args){
	inventory_slot[slot_number, ITEM_PARAMETERS.ID] = item_id;
	inventory_slot[slot_number, ITEM_PARAMETERS.QTY] = 0+item_qty;
	inventory_slot[slot_number, ITEM_PARAMETERS.NAME] = ""+item_name;
	inventory_slot[slot_number, ITEM_PARAMETERS.DESC] = ""+item_desc;
	inventory_slot[slot_number, ITEM_PARAMETERS.ITEM_TYPE] = item_type;
	inventory_slot[slot_number, ITEM_PARAMETERS.VALUE] = item_value;
	inventory_slot[slot_number, ITEM_PARAMETERS.SCRIPT] = item_script;
	inventory_slot[slot_number, ITEM_PARAMETERS.ATTRIBUTES] = item_args;
}
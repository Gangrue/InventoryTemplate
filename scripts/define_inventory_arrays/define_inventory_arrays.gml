// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function define_inventory_arrays(){
	temp_slot[ITEM_PARAMETERS.LENGTH] = undefined;
	
	item_definitions[ITEMS.LENGTH][ITEM_PARAMETERS.LENGTH] = undefined;
	for(var X=0; X<ITEMS.LENGTH; X++) {
		item_definitions[X][ITEM_PARAMETERS.NAME] = "";
		item_definitions[X][ITEM_PARAMETERS.DESC] = "";
		item_definitions[X][ITEM_PARAMETERS.ID] = 0;
		item_definitions[X][ITEM_PARAMETERS.QTY] = 0;
		item_definitions[X][ITEM_PARAMETERS.ITEM_TYPE] = 0;
		item_definitions[X][ITEM_PARAMETERS.VALUE] = 0;
		item_definitions[X][ITEM_PARAMETERS.SCRIPT] = empty_script;
		item_definitions[X][ITEM_PARAMETERS.ATTRIBUTES] = "";
	}
	inventory_and_chest_and_equipment_max_slot_length = 84;
	inventory_and_chest_max_slot_length = 80;
	inventory_max_slot_length = 40;
	inventory_slot_length = 40;
	inventory_slot[inventory_and_chest_and_equipment_max_slot_length][ITEM_PARAMETERS.LENGTH] = undefined;
	for(var X=0; X<inventory_and_chest_and_equipment_max_slot_length; X++) {
		inventory_slot[X][ITEM_PARAMETERS.NAME] = "";
		inventory_slot[X][ITEM_PARAMETERS.DESC] = "";
		inventory_slot[X][ITEM_PARAMETERS.ID] = 0;
		inventory_slot[X][ITEM_PARAMETERS.QTY] = 0;
		inventory_slot[X][ITEM_PARAMETERS.ITEM_TYPE] = 0;
		item_definitions[X][ITEM_PARAMETERS.VALUE] = 0;
		inventory_slot[X][ITEM_PARAMETERS.SCRIPT] = empty_script;
		inventory_slot[X][ITEM_PARAMETERS.ATTRIBUTES] = "";
	}
}
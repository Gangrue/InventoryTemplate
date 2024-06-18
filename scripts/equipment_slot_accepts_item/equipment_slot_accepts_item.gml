// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function equipment_slot_accepts_item(_inventory_slot, _item_id){
	if (_inventory_slot == EQUIPMENT_SLOT_HEAD_INDEX) {
		return (item_definitions[_item_id][ITEM_PARAMETERS.ITEM_TYPE] == ITEM_TYPE.HEAD);
	}
	if (_inventory_slot == EQUIPMENT_SLOT_BODY_INDEX) {
		return (item_definitions[_item_id][ITEM_PARAMETERS.ITEM_TYPE] == ITEM_TYPE.BODY);
	}
	if (_inventory_slot == EQUIPMENT_SLOT_LEGS_INDEX) {
		return (item_definitions[_item_id][ITEM_PARAMETERS.ITEM_TYPE] == ITEM_TYPE.LEGS);
	}
	if (_inventory_slot == EQUIPMENT_SLOT_FOOT_INDEX) {
		return (item_definitions[_item_id][ITEM_PARAMETERS.ITEM_TYPE] == ITEM_TYPE.FOOT);
	}
}
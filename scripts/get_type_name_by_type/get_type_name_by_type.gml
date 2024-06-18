// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_type_name_by_type(item_type){
	switch(item_type) {
		case ITEM_TYPE.FOOD:
			return "Food";
		case ITEM_TYPE.HOE:
			return "Tool";
		case ITEM_TYPE.WATERINGCAN:
			return "Tool";
		case ITEM_TYPE.WEAPON:
			return "Weapon";
		case ITEM_TYPE.SEED:
			return "Seed";
		default:
			return "Item";
	}
}
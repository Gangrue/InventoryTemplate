// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function define_items(){
	define_item(ITEMS.EMPTY, 0, "EMPTY", "", ITEM_TYPE.LENGTH, 0, empty_script, "");
	define_item(ITEMS.APPLE, 255, "Apple", "A Tasty Apple", ITEM_TYPE.FOOD, 5, consume_food, "HP+5,CONSUME");
	define_item(ITEMS.APPLESEED, 255, "Apple Seed", "Grows an Apple Tree", ITEM_TYPE.SEED, 30, empty_script, "AppleTree");
	define_item(ITEMS.HOE, 1, "Hoe", "Used to till the ground.", ITEM_TYPE.HOE, 100, empty_script, "DMG+1");
	define_item(ITEMS.WATERINGCAN, 1, "Watering Can", "Used to water a planted seed.", ITEM_TYPE.WATERINGCAN, 100, empty_script, "DMG+1");
	define_item(ITEMS.SICKLE, 1, "Sickle", "Used to harvest a plant", ITEM_TYPE.WEAPON, 100, empty_script, "DMG+1");
	define_item(ITEMS.SIMPLEHAT, 1, "Hat", "A simple hat. Helps protect against the sun.", ITEM_TYPE.HEAD, 100, empty_script, "DEF+1, HEAT+2");
	define_item(ITEMS.SIMPLESHIRT, 1, "Shirt", "A basic shirt. Provides poor protection.", ITEM_TYPE.BODY, 100, empty_script, "DEF+2, HEAT+5");
	define_item(ITEMS.SIMPLEPANTS, 1, "Pants", "A simple pair of pants. Minor scratches may be prevented.", ITEM_TYPE.LEGS, 100, empty_script, "DEF+2, HEAT+5");
	define_item(ITEMS.SIMPLEBOOTS, 1, "Boots", "A pair of boots. Not great at keeping out water, but more cleanly than bare feet.", ITEM_TYPE.FOOT, 100, empty_script, "DEF+1, HEAT+3");

}

function define_item(item_id, item_qty, item_name, item_desc, item_type, item_val, item_script, item_args) {
	item_definitions[item_id][ITEM_PARAMETERS.ID] = item_id;
	item_definitions[item_id][ITEM_PARAMETERS.QTY] = 0+item_qty;
	item_definitions[item_id][ITEM_PARAMETERS.NAME] = ""+item_name;
	item_definitions[item_id][ITEM_PARAMETERS.DESC] = ""+item_desc;
	item_definitions[item_id][ITEM_PARAMETERS.ITEM_TYPE] = item_type;
	item_definitions[item_id][ITEM_PARAMETERS.VALUE] = item_val;
	item_definitions[item_id][ITEM_PARAMETERS.SCRIPT] = item_script;
	item_definitions[item_id][ITEM_PARAMETERS.ATTRIBUTES] = item_args;
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function prepare_shop(shop_name){
	switch(shop_name) {
		case "test_shop":
			with(Inventory) {
				var begin_shop_index = inventory_max_slot_length;
				var end_shop_index = inventory_and_chest_max_slot_length;
				for(var i=begin_shop_index; i<end_shop_index; i++) {
					var rand_item_id = choose(ITEMS.APPLESEED, ITEMS.HOE, ITEMS.SICKLE, ITEMS.WATERINGCAN, ITEMS.EMPTY);
					set_inventory_slot_to_item_definition(i, rand_item_id, 1);
				}
			}
			break;
		default:
			break;
	}
}
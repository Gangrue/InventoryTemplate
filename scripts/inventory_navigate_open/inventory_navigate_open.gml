// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_open(){
	var pressed_open_inventory = (keyboard_check_pressed(ord("I")) || keyboard_check_pressed(vk_tab));
	var pressed_open_chest = keyboard_check_pressed(ord("E"));
	var pressed_close_chest = false;
	if (pressed_open_inventory) {
		if (inventory_is_open && inventory_is_trading) {
			//Close inventory
			inventory_is_open = false;
			inventory_is_trading = false;
			if (opened_chest_id != "") {
				save_chest_to_file(opened_chest_id);
				clear_chest();
				opened_chest_id = "";
			}
		}
		else {
			inventory_is_open = !inventory_is_open;
			inventory_is_equipping = inventory_is_open;
		}
	}
	if (inventory_is_open) {
		var pressed_close_inventory = (keyboard_check_pressed(vk_escape));
		if (pressed_close_inventory) {
			inventory_is_open = false;
		}
	}
	else {
		inventory_is_trading = false;
		inventory_is_shopping = false;
	}
	
	if (pressed_open_chest) {
		if (inventory_is_open && inventory_is_trading) {
			//Close inventory
			inventory_is_open = false;
			inventory_is_trading = false;
			if (opened_chest_id != "") {
				save_chest_to_file(opened_chest_id);
				clear_chest();
				opened_chest_id = "";
			}
		}
		else if (!inventory_is_open) {
			inventory_open_nearby_chest();
			//now we need to check if the chest is not opened, if not, try to open nearby shops instead.
			if (!inventory_is_trading) {
				inventory_open_nearby_shop();
			}
		}
	}
}
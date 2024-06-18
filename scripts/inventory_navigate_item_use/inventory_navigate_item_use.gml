// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_item_use(){
	var pressed_use = mouse_check_button_pressed(mb_left);
	if (pressed_use) {
		using_slot = current_selected_slot;
		var cur_script = inventory_slot[current_selected_slot][ITEM_PARAMETERS.SCRIPT];
		var cur_args = inventory_slot[current_selected_slot][ITEM_PARAMETERS.ATTRIBUTES];
		script_execute(cur_script, cur_args);
	}
}
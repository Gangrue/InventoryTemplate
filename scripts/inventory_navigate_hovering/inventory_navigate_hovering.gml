// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_hovering(){
	var screen_x = camera_get_view_x(view_camera[0]);
	var screen_y = camera_get_view_y(view_camera[0]);
	var screen_width = camera_get_view_width(view_camera[0]);
	var screen_height = camera_get_view_height(view_camera[0]);
	var inventory_hot_bar_x = screen_x + screen_width/2-(sprite_get_width(spr_inventory_bar)/2);
	var inventory_hot_bar_y = screen_y + screen_height-sprite_get_height(spr_inventory_bar);
	var slot_offset = 4;
	var row_slot_count = 10;
	var slot_width = sprite_get_width(spr_inventory_slot);
	var slot_height = sprite_get_height(spr_inventory_slot);
	var extra_width_distance_for_quantity = floor(slot_width/2);
	var inventory_window_x = screen_x + screen_width/2-(sprite_get_width(spr_inventory_window)/2);
	var inventory_window_y = screen_y + screen_height-sprite_get_height(spr_inventory_window) - sprite_get_height(spr_inventory_bar);
	var inventorytrading_window_x = screen_x + screen_width/2-(sprite_get_width(spr_inventory_window_trading)/2);
	var inventorytrading_window_y = screen_y + screen_height-sprite_get_height(spr_inventory_window_trading) - sprite_get_height(spr_inventory_bar);
	
	hovered_slot = -1;
	for(var i=0; i<row_slot_count; i++) {
		var inventory_slot_x = inventory_hot_bar_x+slot_offset+(i*slot_width);
		var inventory_slot_y = inventory_hot_bar_y+slot_offset;
		if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
			if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
				hovered_slot = i;
			}
		}
	}
	
	var cur_inventory_max_slot_length = inventory_max_slot_length - row_slot_count;
	for(var i=0; i<cur_inventory_max_slot_length; i++) {
		var ii = cur_inventory_max_slot_length - i;
		var cur_slot = ii + row_slot_count-1;
		var inventory_slot_x = inventory_window_x+slot_offset+((i%row_slot_count)*slot_width);
		var inventory_slot_y = inventory_window_y+slot_offset+((floor(i/row_slot_count))*(slot_width+slot_offset));
		if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
			if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
				hovered_slot = cur_slot;
			}
		}
	}
	
	if (inventory_is_trading) {
		var cur_inventorytrading_max_slot_length = inventory_and_chest_max_slot_length - inventory_max_slot_length - row_slot_count;
		for(var i=0; i<cur_inventorytrading_max_slot_length; i++) {
			var ii = cur_inventorytrading_max_slot_length - i;
			var cur_slot = ii + inventory_max_slot_length + row_slot_count-1;
			var inventory_slot_x = inventorytrading_window_x+slot_offset+((i%row_slot_count)*slot_width);
			var inventory_slot_y = inventorytrading_window_y+slot_offset+((floor(i/row_slot_count))*(slot_width+slot_offset));
			if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
				if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
					hovered_slot = cur_slot;
				}
			}
		}
	}
	
	if (inventory_is_equipping) {
		inventory_navigate_hovering_equipment();
	}
}
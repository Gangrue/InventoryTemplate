// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_trashcan(){
	trashcan_sprite_index = 0;
	var screen_x = camera_get_view_x(view_camera[0]);
	var screen_y = camera_get_view_y(view_camera[0]);
	if (grabbed_slot == -1) {
		return;
	}
	if (mouse_x > screen_x + trashcan_x && mouse_x < screen_x + trashcan_x + sprite_get_width(spr_inventory_trash)) {
		if (mouse_y > screen_y + trashcan_y && mouse_y < screen_y + trashcan_y + sprite_get_height(spr_inventory_trash)) {
			trashcan_sprite_index = 1;
		}
	}
}
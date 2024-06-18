// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_draw_selecting(){
	var slot_width = sprite_get_width(spr_inventory_slot);
	var extra_width_distance_for_quantity = floor(slot_width/2);
	var cur_slot_x = device_mouse_x_to_gui(0) - slot_width/2;
	var cur_slot_y = device_mouse_y_to_gui(0) - slot_width/2;
	if (grabbed_slot == -1) return;
	if (inventory_slot[grabbed_slot][ITEM_PARAMETERS.ID] == ITEMS.EMPTY) return;
	
	draw_sprite(spr_inventory_slot, inventory_slot[grabbed_slot][ITEM_PARAMETERS.ID], cur_slot_x, cur_slot_y);
	if (grabbed_qty > 1) {
		draw_text(cur_slot_x+extra_width_distance_for_quantity, cur_slot_y+extra_width_distance_for_quantity, grabbed_qty);
	}
}
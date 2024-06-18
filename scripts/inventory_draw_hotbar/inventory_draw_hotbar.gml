// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_draw_hotbar(){
	var slot_offset = 4;
	var row_slot_count = 10;
	draw_sprite(spr_inventory_bar, 0, hotbar_x, hotbar_y);

	var slot_width = sprite_get_width(spr_inventory_slot);
	var extra_width_distance_for_quantity = floor(slot_width/2);
	for(var i=0; i<row_slot_count; i++) {
		var inventory_slot_x = hotbar_x+slot_offset+(i*slot_width);
		var inventory_slot_y = hotbar_y+slot_offset;
		draw_sprite(spr_inventory_slot, 0, inventory_slot_x, inventory_slot_y);
		
		if (grabbed_slot == i && is_splitting_grabbed_slot) {
			draw_sprite(spr_inventory_slot, inventory_slot[i][ITEM_PARAMETERS.ID], inventory_slot_x, inventory_slot_y);
			var cur_qty = inventory_slot[i][ITEM_PARAMETERS.QTY] - grabbed_qty;
			if (cur_qty > 1) {
				draw_text(inventory_slot_x+extra_width_distance_for_quantity, inventory_slot_y+extra_width_distance_for_quantity, cur_qty);
			}
		}
		
		if (grabbed_slot == i) continue;
		
		draw_sprite(spr_inventory_slot, inventory_slot[i][ITEM_PARAMETERS.ID], inventory_slot_x, inventory_slot_y);
		var cur_qty = inventory_slot[i][ITEM_PARAMETERS.QTY];
		if (cur_qty > 1) {
			draw_text(inventory_slot_x+extra_width_distance_for_quantity, inventory_slot_y+extra_width_distance_for_quantity, inventory_slot[i][ITEM_PARAMETERS.QTY]);
		}
	}

	var shifted_selected_slot = current_selected_slot;
	var inventory_selected_slot_x = hotbar_x+slot_offset+2+(shifted_selected_slot*slot_width);
	var inventory_selected_slot_y = hotbar_y+slot_offset+2;
	draw_sprite(spr_inventory_slot_selected, 0, inventory_selected_slot_x, inventory_selected_slot_y);

}
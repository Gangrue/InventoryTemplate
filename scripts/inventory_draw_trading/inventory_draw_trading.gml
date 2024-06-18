// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_draw_trading(){
	var slot_offset = 4;
	var row_slot_count = 10;
	var slot_width = sprite_get_width(spr_inventory_slot);
	var extra_width_distance_for_quantity = floor(slot_width/2);
	draw_sprite(spr_inventory_window_trading, 0, inventorytrading_x, inventorytrading_y);
	
	var cur_inventory_max_slot_length = (inventory_and_chest_max_slot_length- inventory_max_slot_length - row_slot_count);
	for(var i=0; i<cur_inventory_max_slot_length; i++) {
		var ii = cur_inventory_max_slot_length - i;
		var cur_slot = ii + row_slot_count + inventory_max_slot_length;
		var inventory_slot_x = inventorytrading_x+slot_offset+((i%row_slot_count)*slot_width);
		var inventory_slot_y = inventorytrading_y+slot_offset+((floor(i/row_slot_count))*(slot_width+slot_offset));
		
		if (inventory_slot_length < ii + row_slot_count) {
			draw_sprite(spr_inventory_slot_locked, 0, inventory_slot_x, inventory_slot_y);
		}
		
		draw_sprite(spr_inventory_slot, 0, inventory_slot_x, inventory_slot_y);
		if (grabbed_slot == cur_slot-1 && is_splitting_grabbed_slot) {
			draw_sprite(spr_inventory_slot, inventory_slot[cur_slot-1][ITEM_PARAMETERS.ID], inventory_slot_x, inventory_slot_y);
			var cur_qty = inventory_slot[cur_slot-1][ITEM_PARAMETERS.QTY] - grabbed_qty;
			if (cur_qty > 1) {
				draw_text(inventory_slot_x+extra_width_distance_for_quantity, inventory_slot_y+extra_width_distance_for_quantity, cur_qty);
			}
		}
		
		if (grabbed_slot == cur_slot-1) continue;
		draw_sprite(spr_inventory_slot, inventory_slot[cur_slot-1][ITEM_PARAMETERS.ID], inventory_slot_x, inventory_slot_y);
		var cur_qty = inventory_slot[cur_slot-1][ITEM_PARAMETERS.QTY];
		if (cur_qty > 1) {
			draw_text(inventory_slot_x+extra_width_distance_for_quantity, inventory_slot_y+extra_width_distance_for_quantity, cur_qty);
		}
	}
}
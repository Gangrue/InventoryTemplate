// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_draw_equipment(){
	
	var slot_width = sprite_get_width(spr_inventory_slot);
	var extra_width_distance_for_quantity = floor(slot_width/2);
	draw_sprite(spr_inventory_equipment_window, 0, inventoryequipment_x, inventoryequipment_y);
	
	var old_color = draw_get_color();
	draw_set_color(c_white);
	draw_text(inventoryequipment_x + inventory_bodytemp_x, inventoryequipment_y + inventory_bodytemp_y, "Body Temperature: " + equipment_get_current_body_temperature());
	draw_text(inventoryequipment_x + inventory_def_x, inventoryequipment_y + inventory_def_y, "Defense: " + equipment_get_current_defense());
	draw_set_color(old_color);
	
	if (grabbed_slot != EQUIPMENT_SLOT_HEAD_INDEX && inventory_slot[EQUIPMENT_SLOT_HEAD_INDEX][ITEM_PARAMETERS.ID] != ITEMS.EMPTY) {
		draw_sprite(spr_inventory_slot, inventory_slot[EQUIPMENT_SLOT_HEAD_INDEX][ITEM_PARAMETERS.ID], inventoryequipment_x+inventory_headSlot_x, inventoryequipment_y+inventory_headSlot_y);
		var cur_qty = inventory_slot[EQUIPMENT_SLOT_HEAD_INDEX][ITEM_PARAMETERS.QTY];
		if (cur_qty > 1) {
			draw_text(inventoryequipment_x+inventory_headSlot_x+extra_width_distance_for_quantity, inventoryequipment_y+inventory_headSlot_y+extra_width_distance_for_quantity, cur_qty);
		}
	}
	if (grabbed_slot != EQUIPMENT_SLOT_BODY_INDEX && inventory_slot[EQUIPMENT_SLOT_BODY_INDEX][ITEM_PARAMETERS.ID] != ITEMS.EMPTY) {
		draw_sprite(spr_inventory_slot, inventory_slot[EQUIPMENT_SLOT_BODY_INDEX][ITEM_PARAMETERS.ID], inventoryequipment_x+inventory_bodySlot_x, inventoryequipment_y+inventory_bodySlot_y);
		var cur_qty = inventory_slot[EQUIPMENT_SLOT_BODY_INDEX][ITEM_PARAMETERS.QTY];
		if (cur_qty > 1) {
			draw_text(inventoryequipment_x+inventory_bodySlot_x+extra_width_distance_for_quantity, inventoryequipment_y+inventory_bodySlot_y+extra_width_distance_for_quantity, cur_qty);
		}
	}
	if (grabbed_slot != EQUIPMENT_SLOT_LEGS_INDEX && inventory_slot[EQUIPMENT_SLOT_LEGS_INDEX][ITEM_PARAMETERS.ID] != ITEMS.EMPTY) {
		draw_sprite(spr_inventory_slot, inventory_slot[EQUIPMENT_SLOT_LEGS_INDEX][ITEM_PARAMETERS.ID], inventoryequipment_x+inventory_legsSlot_x, inventoryequipment_y+inventory_legsSlot_y);
		var cur_qty = inventory_slot[EQUIPMENT_SLOT_LEGS_INDEX][ITEM_PARAMETERS.QTY];
		if (cur_qty > 1) {
			draw_text(inventoryequipment_x+inventory_legsSlot_x+extra_width_distance_for_quantity, inventoryequipment_y+inventory_legsSlot_y+extra_width_distance_for_quantity, cur_qty);
		}
	}
	if (grabbed_slot != EQUIPMENT_SLOT_FOOT_INDEX && inventory_slot[EQUIPMENT_SLOT_FOOT_INDEX][ITEM_PARAMETERS.ID] != ITEMS.EMPTY) {
		draw_sprite(spr_inventory_slot, inventory_slot[EQUIPMENT_SLOT_FOOT_INDEX][ITEM_PARAMETERS.ID], inventoryequipment_x+inventory_footSlot_x, inventoryequipment_y+inventory_footSlot_y);
		var cur_qty = inventory_slot[EQUIPMENT_SLOT_FOOT_INDEX][ITEM_PARAMETERS.QTY];
		if (cur_qty > 1) {
			draw_text(inventoryequipment_x+inventory_footSlot_x+extra_width_distance_for_quantity, inventoryequipment_y+inventory_footSlot_y+extra_width_distance_for_quantity, cur_qty);
		}
	}
}
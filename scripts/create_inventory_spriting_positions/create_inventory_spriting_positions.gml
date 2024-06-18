// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function create_inventory_spriting_positions(){	
	var screen_width = camera_get_view_width(view_camera[0]);
	var screen_height = camera_get_view_height(view_camera[0]);
	hotbar_x = screen_width/2-(sprite_get_width(spr_inventory_bar)/2);
	hotbar_y = screen_height-sprite_get_height(spr_inventory_bar);
	inventory_x = screen_width/2-(sprite_get_width(spr_inventory_window)/2);
	inventory_y = screen_height-sprite_get_height(spr_inventory_window) - sprite_get_height(spr_inventory_bar);
	inventorytrading_x = screen_width/2-(sprite_get_width(spr_inventory_window_trading)/2);
	inventorytrading_y = screen_height-sprite_get_height(spr_inventory_window_trading) - sprite_get_height(spr_inventory_bar);
	inventoryequipment_x = screen_width/2-(sprite_get_width(spr_inventory_equipment_window)/2);
	inventoryequipment_y = screen_height-sprite_get_height(spr_inventory_equipment_window) - sprite_get_height(spr_inventory_bar);
	trashcan_x = inventory_x + sprite_get_width(spr_inventory_window);
	trashcan_y = inventory_y + 64;
	trashcan_sprite_index = 0;
	
	inventory_bodytemp_x = 320;
	inventory_bodytemp_y = 96;
	
	inventory_def_x = 320;
	inventory_def_y = 160;
	
	inventory_headSlot_x = 160;
	inventory_headSlot_y = 70;
	
	inventory_bodySlot_x = 160 + sprite_get_width(spr_inventory_slot);
	inventory_bodySlot_y = 70;
	
	inventory_legsSlot_x = 160 + sprite_get_width(spr_inventory_slot);
	inventory_legsSlot_y = 70 + sprite_get_height(spr_inventory_slot);
	
	inventory_footSlot_x = 160;
	inventory_footSlot_y = 70 + sprite_get_height(spr_inventory_slot);
	
	#macro EQUIPMENT_SLOT_HEAD_INDEX 80
	#macro EQUIPMENT_SLOT_BODY_INDEX 81
	#macro EQUIPMENT_SLOT_LEGS_INDEX 82
	#macro EQUIPMENT_SLOT_FOOT_INDEX 83
}
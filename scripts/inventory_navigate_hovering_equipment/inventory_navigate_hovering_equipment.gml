// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_hovering_equipment(){
	var screen_x = camera_get_view_x(view_camera[0]);
	var screen_y = camera_get_view_y(view_camera[0]);
	var slot_width = sprite_get_width(spr_inventory_slot);
	var slot_height = sprite_get_height(spr_inventory_slot);
	var extra_width_distance_for_quantity = floor(slot_width/2);
	//Head slot:
	var inventory_slot_x = screen_x + inventoryequipment_x+inventory_headSlot_x;
	var inventory_slot_y = screen_y + inventoryequipment_y+inventory_headSlot_y;
	if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
		if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
			hovered_slot = EQUIPMENT_SLOT_HEAD_INDEX;
		}
	}
	//Shoes slot:
	inventory_slot_x =  screen_x + inventoryequipment_x+inventory_footSlot_x;
	inventory_slot_y = screen_y + inventoryequipment_y+inventory_footSlot_y;
	if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
		if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
			hovered_slot = EQUIPMENT_SLOT_FOOT_INDEX;
		}
	}
	//Body slot:
	var inventory_slot_x =  screen_x + inventoryequipment_x+inventory_bodySlot_x;
	var inventory_slot_y = screen_y + inventoryequipment_y+inventory_bodySlot_y;
	if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
		if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
			hovered_slot = EQUIPMENT_SLOT_BODY_INDEX;
		}
	}
	//Leg slot:
	var inventory_slot_x =  screen_x + inventoryequipment_x+inventory_legsSlot_x;
	var inventory_slot_y = screen_y + inventoryequipment_y+inventory_legsSlot_y;
	if (mouse_x > inventory_slot_x && mouse_x < inventory_slot_x + slot_width) {
		if (mouse_y > inventory_slot_y && mouse_y < inventory_slot_y + slot_height) {
			hovered_slot = EQUIPMENT_SLOT_LEGS_INDEX;
		}
	}
}
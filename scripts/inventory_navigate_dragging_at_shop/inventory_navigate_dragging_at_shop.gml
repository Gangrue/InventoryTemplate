// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_dragging_at_shop(){
	var screen_x = camera_get_view_x(view_camera[0]);
	var screen_y = camera_get_view_y(view_camera[0]);
	if (mouse_check_button_pressed(mb_left) && grabbed_slot == -1) {
		//Selected hovered slot.
		grabbed_slot = hovered_slot;
		if (grabbed_slot != -1) {
			grabbed_qty = inventory_slot[grabbed_slot, ITEM_PARAMETERS.QTY];
			if (item_is_in_shop(grabbed_slot)) {
				buy_item(grabbed_slot);
				reset_shop_selecting();
			}
		}
		is_splitting_grabbed_slot = false;
	}
	else if (mouse_check_button_pressed(mb_right) && grabbed_slot == -1) {
		grabbed_slot = hovered_slot;
		if (!item_is_in_shop(grabbed_slot)) {
			if (grabbed_slot != -1) {
				grabbed_qty = floor(inventory_slot[grabbed_slot, ITEM_PARAMETERS.QTY] / 2);
			}
			is_splitting_grabbed_slot = true;
			if (grabbed_qty <= 0) {
				grabbed_slot = -1;
				grabbed_qty = 0;
				is_splitting_grabbed_slot = false;
			}
		}
	}
	
	if (((!mouse_check_button(mb_left) && !is_splitting_grabbed_slot) ||
		(!mouse_check_button(mb_right) && is_splitting_grabbed_slot))
		&& grabbed_slot != -1) {
		if (grabbed_slot == hovered_slot) {
			reset_shop_selecting();
			return;
		}
		//drop current selected item
		if (hovered_slot != -1) {
			if (item_is_in_shop(hovered_slot) && !item_is_in_shop(grabbed_slot)) {
				sell_item(grabbed_slot);
			}
			else if (!item_is_in_shop(hovered_slot)) {
				if (inventory_slot[grabbed_slot, ITEM_PARAMETERS.ID] == inventory_slot[hovered_slot, ITEM_PARAMETERS.ID]) {
					fill_inventory_slot_with_another_slot(grabbed_slot, grabbed_qty, hovered_slot);
				} else  if (!is_splitting_grabbed_slot) {
					swap_inventory_items(grabbed_slot, hovered_slot);
				}
				else if (is_splitting_grabbed_slot && inventory_slot[hovered_slot, ITEM_PARAMETERS.ID] == ITEMS.EMPTY) {
					var _item_id = inventory_slot[grabbed_slot, ITEM_PARAMETERS.ID];
					var _item_qty = grabbed_qty;
					if (_item_qty < 0) _item_qty = 0;
					var _item_name = inventory_slot[grabbed_slot, ITEM_PARAMETERS.NAME];
					var _item_desc = inventory_slot[grabbed_slot, ITEM_PARAMETERS.DESC];
					var _item_type = inventory_slot[grabbed_slot, ITEM_PARAMETERS.ITEM_TYPE];
					var _item_value = inventory_slot[grabbed_slot, ITEM_PARAMETERS.VALUE];
					var _item_script = inventory_slot[grabbed_slot, ITEM_PARAMETERS.SCRIPT];
					var _item_args = inventory_slot[grabbed_slot, ITEM_PARAMETERS.ATTRIBUTES];
					set_inventory_slot(hovered_slot,_item_id, _item_qty, _item_name, _item_desc, _item_type, _item_value, _item_script, _item_args);
				
					inventory_slot[grabbed_slot, ITEM_PARAMETERS.QTY] -= _item_qty;
				}
			}
		}
		else if (!is_splitting_grabbed_slot) {
			if (mouse_x > screen_x + trashcan_x &&  mouse_x < screen_x + trashcan_x + sprite_get_width(spr_inventory_trash)) {
				if (mouse_y > screen_y + trashcan_y && mouse_y < screen_y + trashcan_y + sprite_get_height(spr_inventory_trash)) {
					set_inventory_slot_to_item_definition(grabbed_slot, ITEMS.EMPTY, 0);
					reset_shop_selecting();
					return;
				}
			}
		}
		reset_shop_selecting();
	}
}

function reset_shop_selecting() {
	grabbed_slot = -1;
	grabbed_qty = 0;
	is_splitting_grabbed_slot = false;
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_draw_hovering(){
	if (hovered_slot == -1 || grabbed_slot != -1) {
		return;
	}
	if (inventory_slot[hovered_slot, ITEM_PARAMETERS.ID] == ITEMS.EMPTY) {
		return;
	}
	
	var buffer_size = sprite_get_width(spr_inventory_item_hover_description);
	var cur_mouse_x = device_mouse_x_to_gui(0);
	var cur_mouse_y = device_mouse_y_to_gui(0);

	var _shopping_header = "BUY";
	var _shopping_footer = "COST: " + string(inventory_slot[hovered_slot, ITEM_PARAMETERS.VALUE] * inventory_slot[hovered_slot, ITEM_PARAMETERS.QTY]);
	var _selling_header = "SELL";
	var _selling_footer = "SELL FOR: " + string(floor((inventory_slot[hovered_slot, ITEM_PARAMETERS.VALUE]*inventory_slot[hovered_slot, ITEM_PARAMETERS.QTY])/2));
	var _item_name = inventory_slot[hovered_slot, ITEM_PARAMETERS.NAME];
	var _item_desc = inventory_slot[hovered_slot, ITEM_PARAMETERS.DESC];
	var _item_type = get_type_name_by_type(inventory_slot[hovered_slot, ITEM_PARAMETERS.ITEM_TYPE]);
	var _string_width = string_width_ext(_item_desc, -1, 200);
	var _string_height = string_height_ext(_item_desc, -1, 200);
	var _shopping_header_width = string_width_ext(_shopping_header, -1, 200);
	var _shopping_header_height = string_height_ext(_shopping_header, -1, 200);
	var _shopping_footer_width = string_width_ext(_shopping_footer, -1, 200);
	var _shopping_footer_height = string_height_ext(_shopping_footer, -1, 200);
	var _selling_footer_width = string_width_ext(_selling_footer, -1, 200);
	var _selling_footer_height = string_height_ext(_selling_footer, -1, 200);
	var _header_width = string_width_ext(_item_name, -1, 200);
	var _header_height = string_height_ext(_item_name, -1, 200);
	var _header_padding = 4;
	var _item_type_width = string_width_ext(_item_type, -1, 200);
	var _item_type_height = string_height_ext(_item_type, -1, 200);
	var _item_desc_width = string_width_ext(_item_desc, -1, 200);
	var _item_desc_height = string_height_ext(_item_desc, -1, 200);
	var _item_type_padding = 16;
	var _total_string_height = _string_height + _header_height + _header_padding + _item_type_height + _item_type_padding;
	if (inventory_is_shopping) {
		_total_string_height += _shopping_header_height + _shopping_footer_height;	
	}
	var _total_string_width = (_string_width > _header_width) ? _string_width : _header_width;
	_total_string_width = (_total_string_width > _item_type_width) ? _total_string_width : _item_type_width;
	
	var _string_x_scale = _string_width / buffer_size;
	var _string_y_scale = _total_string_height / buffer_size;
	
	var desc_x = cur_mouse_x;
	var desc_y = cur_mouse_y - _total_string_height - (buffer_size*2)
	
	//Draw box top
	draw_sprite(spr_inventory_item_hover_description, 0, desc_x, desc_y);
	draw_sprite_ext(spr_inventory_item_hover_description, 1, desc_x + buffer_size, desc_y, _string_x_scale, 1, 0, c_white, 1);
	draw_sprite(spr_inventory_item_hover_description, 2, desc_x + buffer_size + _string_width, desc_y);
	
	//Draw middle, this is where the text lies.
	draw_sprite_ext(spr_inventory_item_hover_description, 3, desc_x, desc_y + buffer_size, 1, _string_y_scale, 0, c_white, 1);
	draw_sprite_ext(spr_inventory_item_hover_description, 4, desc_x + buffer_size, desc_y + buffer_size, _string_x_scale, _string_y_scale, 0, c_white, 1);
	draw_sprite_ext(spr_inventory_item_hover_description, 5, desc_x + buffer_size + _string_width, desc_y + buffer_size, 1, _string_y_scale, 0, c_white, 1);
	
	//Draw box bottom
	draw_sprite(spr_inventory_item_hover_description, 6, desc_x, desc_y + _total_string_height + buffer_size);
	draw_sprite_ext(spr_inventory_item_hover_description, 7, desc_x + buffer_size, desc_y + _total_string_height + buffer_size, _string_x_scale, 1, 0, c_white, 1);
	draw_sprite(spr_inventory_item_hover_description, 8, desc_x + buffer_size + _string_width, desc_y + _total_string_height + buffer_size);
	
	var old_color = draw_get_color();
	var moving_top_height = 0;
	//If shopping, draw header:
	if (inventory_is_shopping) {
		moving_top_height += _shopping_header_height;
		if (hovered_slot > inventory_max_slot_length) {
			draw_set_color(c_yellow);
			draw_text_ext(cur_mouse_x + buffer_size, cur_mouse_y - _total_string_height - (buffer_size), _shopping_header, -1, 200);
		}
		else {
			draw_set_color(c_green);
			draw_text_ext(cur_mouse_x + buffer_size, cur_mouse_y - _total_string_height - (buffer_size), _selling_header, -1, 200);
		}
	}
	//Draw the item description
	draw_set_color(c_white);
	draw_text_ext(cur_mouse_x + buffer_size, cur_mouse_y - _total_string_height + (moving_top_height) - (buffer_size), _item_name, -1, 200);
	moving_top_height += (_header_height + _header_padding);
	
	draw_set_color(c_gray);
	draw_text_ext(cur_mouse_x + buffer_size, cur_mouse_y - _total_string_height + (moving_top_height) - (buffer_size), _item_type, -1, 200);
	moving_top_height += (_item_type_height + _item_type_padding);
	
	draw_set_color(c_white);
	draw_text_ext(cur_mouse_x + buffer_size, cur_mouse_y - _total_string_height + (moving_top_height) - (buffer_size), _item_desc, -1, 200);
	moving_top_height += _item_desc_height;
	
	if (inventory_is_shopping) {
		if (hovered_slot > inventory_max_slot_length) {
			draw_set_color(c_yellow);
			draw_text_ext(cur_mouse_x + _item_desc_width + buffer_size -_shopping_footer_width, cur_mouse_y - _total_string_height + (moving_top_height) - (buffer_size), _shopping_footer, -1, 200);
		}
		else {
			draw_set_color(c_yellow);
			draw_text_ext(cur_mouse_x + _item_desc_width + buffer_size -_selling_footer_width, cur_mouse_y - _total_string_height + (moving_top_height) - (buffer_size), _selling_footer, -1, 200);
		}
	}
	draw_set_color(old_color);
}
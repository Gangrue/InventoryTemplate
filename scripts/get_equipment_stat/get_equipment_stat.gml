// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function get_equipment_stat(_equipment_slot_index, _stat_text){
	var equipment_stat_string = "";
	with(Inventory) {
		equipment_stat_string = inventory_slot[_equipment_slot_index][ITEM_PARAMETERS.ATTRIBUTES];
	}
	var args_list = string_split(equipment_stat_string, ",");
    // Iterate over each argument in the list
    for (var i = 0; i < array_length(args_list); i++) {
        var arg = string_trim(args_list[i]); // Trim whitespace
		// Handle dynamic effects like HP+, MP-, SPD+
		var effect_add = (string_pos("+", arg) != 0);
		var effect_sub = (string_pos("-", arg) != 0);
		var effect_set = (string_pos("=", arg) != 0);
		var effect_type_name_length = string_pos("+", arg);
		if (effect_sub) effect_type_name_length = string_pos("-", arg);
		if (effect_set) effect_type_name_length = string_pos("=", arg);
				
        var effect_type = string_copy(arg, 1, effect_type_name_length-1); // Extract the effect type (first two characters)
        if (effect_type == _stat_text) {
			var effect_value = real(string_delete(arg, 1, effect_type_name_length)); // Extract the numeric value
			if (effect_sub) effect_value = -effect_value;
			return effect_value;
		}
    }
	return 0;
}
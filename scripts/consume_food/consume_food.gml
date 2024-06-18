// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function consume_food(passed_args) {
	//Check if we consume the item.
	// Split the passed arguments into a list
    var args_list = string_split(passed_args, ",");
    // Iterate over each argument in the list
    for (var i = 0; i < array_length(args_list); i++) {
        var arg = string_trim(args_list[i]); // Trim whitespace

        // Check for specific commands and effects
        switch (arg) {
            case "CONSUME":
                with (Inventory) {
                    inventory_slot[using_slot][ITEM_PARAMETERS.QTY] -= 1;
                    if (inventory_slot[using_slot][ITEM_PARAMETERS.QTY] <= 0) {
                        set_inventory_slot_to_item_definition(using_slot, ITEMS.EMPTY, 0);
                    }
                }
                break;

            default:
                // Handle dynamic effects like HP+, MP-, SPD+
				var effect_add = (string_pos("+", arg) != 0);
				var effect_sub = (string_pos("-", arg) != 0);
				var effect_set = (string_pos("=", arg) != 0);
				var effect_type_name_length = string_pos("+", arg);
				if (effect_sub) effect_type_name_length = string_pos("-", arg);
				if (effect_set) effect_type_name_length = string_pos("=", arg);
				
                var effect_type = string_copy(arg, 1, effect_type_name_length-1); // Extract the effect type (first two characters)
                var effect_value = real(string_delete(arg, 1, effect_type_name_length)); // Extract the numeric value
                switch (effect_type) {
                    case "HP":
                        Player.HP += effect_value;
                        break;
                    case "MP":
                        Player.MP += effect_value;
                        break;
                    case "SPD":
                        Player.SPD += effect_value;
                        break;
                    // Add more cases for additional effects
                }
                break;
        }
    }
}
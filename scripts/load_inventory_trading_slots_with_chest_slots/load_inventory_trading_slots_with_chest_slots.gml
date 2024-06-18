// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_inventory_trading_slots_with_chest_slots(chest_to_open){
	with(Inventory) {
		opened_chest_id = chest_to_open.chest_id;
	}
	// Define constants for chest indices
    var chest_start_index = 40;
    var chest_end_index = 79;
    var file_path = "chest_" + chest_to_open.chest_id + ".json";
    if (!file_exists(file_path)) {
		return;
	}
    // Open the JSON file for reading
    var file = file_text_open_read(file_path);
    
    // Read the entire file content into a string
    var chest_json = "";
	
    while (!file_text_eof(file)) {
        chest_json += file_text_read_string(file);
        file_text_readln(file); // Move to the next line
    }
    
    // Close the file
    file_text_close(file);
    
    // Parse the JSON string into a data structure
    var chest_data = json_parse(chest_json);
    
    // Check if the parsed data is an array and has the correct length
    if (is_array(chest_data) && array_length(chest_data) == (chest_end_index - chest_start_index + 1)) {
        // Populate chest slots with the parsed data
        for (var i = chest_start_index; i <= chest_end_index; i++) {
            var item = chest_data[i - chest_start_index];
			if (!itemIsValid(item)) continue;
            inventory_slot[i][ITEM_PARAMETERS.NAME] = item.itemName;
            inventory_slot[i][ITEM_PARAMETERS.DESC] = item.desc;
            inventory_slot[i][ITEM_PARAMETERS.ID] = item.itemId;
            inventory_slot[i][ITEM_PARAMETERS.QTY] = item.qty;
            inventory_slot[i][ITEM_PARAMETERS.ITEM_TYPE] = item.itemType;
			inventory_slot[i][ITEM_PARAMETERS.VALUE] = item.itemValue;
            inventory_slot[i][ITEM_PARAMETERS.SCRIPT] = item.itemScript;
            inventory_slot[i][ITEM_PARAMETERS.ATTRIBUTES] = item.attributes;
        }
    } else {
        //show_error("Error loading chest data: Invalid data format or length.", true);
    }
}

function itemIsValid(theItem) {
	if (theItem == undefined) return false;
	if (!variable_struct_exists(theItem, "itemName")) return false;
	if (!variable_struct_exists(theItem, "desc")) return false;
	if (!variable_struct_exists(theItem, "itemId")) return false;
	if (!variable_struct_exists(theItem, "qty")) return false;
	if (!variable_struct_exists(theItem, "itemType")) return false;
	if (!variable_struct_exists(theItem, "itemValue")) return false;
	if (!variable_struct_exists(theItem, "itemScript")) return false;
	if (!variable_struct_exists(theItem, "attributes")) return false;
	
	return true;
}
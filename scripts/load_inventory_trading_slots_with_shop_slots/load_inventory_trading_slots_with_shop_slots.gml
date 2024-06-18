// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_inventory_trading_slots_with_shop_slots(shop_to_open){
	with(Inventory) {
		opened_shop_id = shop_to_open.shop_id;
	}
	// Define constants for chest indices
    var shop_start_index = 40;
    var shop_end_index = 79;
    var file_path = shop_to_open.shop_id + ".json";
    if (!file_exists(file_path)) {
		return;
	}
    // Open the JSON file for reading
    var file = file_text_open_read(file_path);
    
    // Read the entire file content into a string
    var shop_json = "";
	
    while (!file_text_eof(file)) {
        shop_json += file_text_read_string(file);
        file_text_readln(file); // Move to the next line
    }
    
    // Close the file
    file_text_close(file);
    
    // Parse the JSON string into a data structure
    var shop_data = json_parse(shop_json);
    
    // Check if the parsed data is an array and has the correct length
    if (is_array(shop_data) && array_length(shop_data) == (shop_end_index - shop_start_index + 1)) {
        // Populate chest slots with the parsed data
        for (var i = shop_start_index; i <= shop_end_index; i++) {
            var item = shop_data[i - shop_start_index];
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
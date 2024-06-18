// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function save_chest_to_file(file_id, file_name=""){
	with(Inventory) {
	    // Define constants for chest indices
	    var chest_start_index = 40;
	    var chest_end_index = 79;
    
	    // Create a temporary array to hold the chest data
	    var chest_data = array_create(0);

	    // Extract chest data
	    for (var i = chest_start_index; i <= chest_end_index; i++) {
	        var item = {
	            itemName: inventory_slot[i][ITEM_PARAMETERS.NAME],
	            desc: inventory_slot[i][ITEM_PARAMETERS.DESC],
	            itemId: inventory_slot[i][ITEM_PARAMETERS.ID],
	            qty: inventory_slot[i][ITEM_PARAMETERS.QTY],
	            itemType: inventory_slot[i][ITEM_PARAMETERS.ITEM_TYPE],
	            itemValue: inventory_slot[i][ITEM_PARAMETERS.VALUE],
	            itemScript: inventory_slot[i][ITEM_PARAMETERS.SCRIPT],
	            attributes: inventory_slot[i][ITEM_PARAMETERS.ATTRIBUTES]
	        };
	        array_push(chest_data, item);
	    }

	    // Convert the chest data array to a JSON string
	    var chest_json = json_stringify(chest_data);

	    // Save the JSON string to a file
		if (file_name == "") {
		    var file = file_text_open_write("chest_" + file_id + ".json");
		    file_text_write_string(file, chest_json);
		    file_text_close(file);
		}
		else {
		    var file = file_text_open_write(file_name + ".json");
		    file_text_write_string(file, chest_json);
		    file_text_close(file);
		}
	}
}
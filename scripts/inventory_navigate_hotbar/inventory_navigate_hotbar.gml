// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_navigate_hotbar(){
	numberPressed = current_selected_slot; // Initialize to -1 to indicate no number pressed
	// Check if any number key (0-9) is pressed
	for (var i = 0; i < 10; i++) {
	    if (keyboard_check_pressed(ord(string(i)))) {
	        numberPressed = (i - 1 + 10) % 10; // Store the pressed number
	        break; // Exit the loop after finding the pressed number
	    }
	}
	return numberPressed;
}
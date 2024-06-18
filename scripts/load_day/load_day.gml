// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function load_day(){
	//First we save out the newly randomly generated daily shops.
	prepare_shop("test_shop");
	save_chest_to_file("test_shop", "test_shop");
	clear_chest();
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function clear_temp_slot(){
	for(var X=0; X<ITEM_PARAMETERS.LENGTH; X++) {
		temp_slot[X] = undefined;
	}
}
// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_open_nearby_chest(){
	var opened_chest = false;
	var the_chest_to_open = noone;
	with(Chest) {
		if (point_distance(self.x,self.y,Player.x,Player.y) < Player.open_chest_distance) {
			opened_chest = true;
			the_chest_to_open = self;
		}
	}
	if (opened_chest && the_chest_to_open != noone) {
		inventory_is_trading = true;
		inventory_is_open = true;
		load_inventory_trading_slots_with_chest_slots(the_chest_to_open);
	}
}
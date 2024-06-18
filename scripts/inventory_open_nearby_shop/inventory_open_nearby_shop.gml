// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_open_nearby_shop(){
	var opened_shop = false;
	var the_shop_to_open = noone;
	with(Shop) {
		if (point_distance(self.x,self.y,Player.x,Player.y) < Player.open_chest_distance) {
			opened_shop = true;
			the_shop_to_open = self;
		}
	}
	if (opened_shop && the_shop_to_open != noone) {
		inventory_is_trading = true;
		inventory_is_shopping = true;
		inventory_is_open = true;
		load_inventory_trading_slots_with_shop_slots(the_shop_to_open);
	}
}
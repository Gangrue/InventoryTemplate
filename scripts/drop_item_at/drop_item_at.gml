// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function drop_item_at(_x,_y,_direction,_spd,_item_id,_item_qty){
	if (_item_id == ITEMS.EMPTY) {
		return;
	}
	var my_projectile_item = instance_create_depth(_x,_y,0,ProjectileItem);
	with(my_projectile_item) {
		item_id = _item_id;
		item_qty = _item_qty;
		SPD = _spd;
		DIR = _direction;
	}
}
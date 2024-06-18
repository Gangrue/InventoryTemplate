// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function throw_item(item_slot){
	var _item_id = ITEMS.EMPTY;
	var _item_qty = 0;
	with(Inventory) {
		_item_id = inventory_slot[item_slot, ITEM_PARAMETERS.ID];
		_item_qty = inventory_slot[item_slot, ITEM_PARAMETERS.QTY];
	}
	
	if (_item_id == ITEMS.EMPTY) {
		return;
	}
	var my_projectile_item = instance_create_depth(Player.x,Player.y,0,ProjectileItem);
	with(my_projectile_item) {
		item_id = _item_id;
		item_qty = _item_qty;
		SPD = 13;
		DIR = Player.Direction;
	}
}
if (SPD < 0.1) {
	var my_ground_item = instance_create_depth(x,y,depth,GroundItem);
	with(my_ground_item) {
		item_id = other.item_id;
		item_qty = other.item_qty;
	}
	instance_destroy();
}
x += lengthdir_x(SPD, DIR);
y += lengthdir_y(SPD, DIR);
SPD = (SPD*0.9)
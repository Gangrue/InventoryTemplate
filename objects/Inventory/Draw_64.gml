
inventory_draw_hotbar();
inventory_draw_money();
if (inventory_is_open) {
	inventory_draw_trashcan();
	if (inventory_is_trading) {
		inventory_draw_trading();
	}
	else if (inventory_is_equipping) {
		inventory_draw_equipment();
	}
	inventory_draw();
}
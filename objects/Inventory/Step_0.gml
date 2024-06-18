with(Player) {
	
	if (is_moving) {
		inventory_collect_surrounding_items();
	}
}
current_selected_slot = inventory_navigate_hotbar();
inventory_navigate_open();

if (inventory_is_open) {
	inventory_navigate_hovering();
	if (!inventory_is_shopping) {
		inventory_navigate_dragging();
	}
	else {
		inventory_navigate_dragging_at_shop();
	}
	inventory_navigate_trashcan();
}
else {
	inventory_navigate_item_use();
}
update_stat_timer++;
if (update_stat_timer > update_stat_timer_max) {
	update_stat_timer = 0;
	update_stats();
}
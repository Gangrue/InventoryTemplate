// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_collect_surrounding_items(){
	if (!instance_exists(Player)) return;
	var grab_distance = GRAB_DISTANCE;
	var current_player_x = Player.x;
	var current_player_y = Player.y;
	with(GroundItem) {
		if (distance_to_point(current_player_x, current_player_y) < grab_distance) {
			if (give_item(item_id, item_qty)) {
				instance_destroy();
			}
		}
	}
}
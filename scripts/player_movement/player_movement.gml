// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_movement(){
	var h_speed = pressing_right() - pressing_left();
	var v_speed = pressing_down() - pressing_up();
	if (h_speed != 0 && v_speed != 0) {
		h_speed = h_speed * 0.7;
		v_speed = v_speed * 0.7;
	}
	if (h_speed != 0 || v_speed != 0) {
		h_speed *= move_spd;
		v_speed *= move_spd;
		Direction = point_direction(0,0,h_speed,v_speed);
		move_and_collide(h_speed,v_speed,Wall);
		return true;
	}
	is_moving = false;
	return false;
}

function pressing_right() {
	return keyboard_check(vk_right) || keyboard_check(ord("D"));
}

function pressing_left() {
	return keyboard_check(vk_left) || keyboard_check(ord("A"));
}
function pressing_up() {
	return keyboard_check(vk_up) || keyboard_check(ord("W"));
}
function pressing_down() {
	return keyboard_check(vk_down) || keyboard_check(ord("S"));
}
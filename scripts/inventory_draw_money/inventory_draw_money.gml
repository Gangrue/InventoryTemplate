// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function inventory_draw_money(){
	var screen_width = camera_get_view_width(view_camera[0]);
	var screen_height = camera_get_view_width(view_camera[0]);
	draw_text(screen_width-128, 32, Player.money);
}
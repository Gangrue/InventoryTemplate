// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_stats_by_environment(){
	//HERE WE WOULD UPDATE ACCORDING TO WEATHER ETC.
	with(Player) {
		//TODO: Create object that maintains environmental stats.
		var current_outside_temp = 60;
		weathered_bodyTemperature += (current_outside_temp - (base_bodyTemperature + weathered_bodyTemperature)) / 10;
		bodyTemperature = base_bodyTemperature + weathered_bodyTemperature;
	}
}
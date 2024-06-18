// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function update_stats_by_equipment(){
	var _defense = 0;
	var _bodyTemp = 0;
	with(Inventory) {
		for(var i=inventory_and_chest_max_slot_length; i< inventory_and_chest_and_equipment_max_slot_length; i++) {
			_defense += get_equipment_stat(i, "DEF");
			_bodyTemp += get_equipment_stat(i, "HEAT");
		}
	}
	
	with(Player) {
		defense += _defense;
		bodyTemperature += _bodyTemp;
	}
}
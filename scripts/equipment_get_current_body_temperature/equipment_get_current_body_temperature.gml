// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function equipment_get_current_body_temperature(){
	var curbodytemp = "OK";
	with(Player) {
		return string(bodyTemperature);
		/*if (bodyTemperature < 10) {
			curbodytemp = "FREEZING";
		}
		else if (bodyTemperature < 30) {
			curbodytemp = "COLD";
		}
		else if (bodyTemperature < 40) {
			curbodytemp = "CHILLY";
		}
		else if (bodyTemperature < 60) {
			curbodytemp = "OK";
		}
		else if (bodyTemperature < 70) {
			curbodytemp = "WARM";
		}
		else if (bodyTemperature < 90) {
			curbodytemp = "HOT";
		}
		else {
			curbodytemp = "BURNING";
		}*/
	}
	return curbodytemp;
}
//Camera
my_camera = instance_create_depth(x,y, 0, Camera);
my_inventory = instance_create_depth(x,y,0,Inventory);
move_spd = 3;
is_moving = false;
Direction = 0;

HPMAX = 100;
HP = HPMAX;

MPMAX = 100;
MP = MPMAX;

SPD = 1;

money = 0;

open_chest_distance = 128;

base_bodyTemperature = 50;
weathered_bodyTemperature = 0;
bodyTemperature = 29;

base_defense = 0;
weathered_defense = 0;
defense = 0;

load_day();
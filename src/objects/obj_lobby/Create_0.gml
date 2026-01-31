/// @description Insert description here
// You can write your code in this editor

input_list = []
__temp = {}

flag_debug_mode = false

players_list = []

chars_list = [0, 1, 2, 3]

countdown_to_start_flag = false
countdown_to_start = noone

if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO))
{
    for (var i = 0; i < global.__temp.players_count; i++) {
    	var _obj = instance_create_layer(100+i*100, 100, "Instances", obj_lobby_slot)
        _obj.playerid = i
    }
}
else {
    for (var i = 0; i < 2; i++) {
    	var _obj = instance_create_layer(100+i*100, 100, "Instances", obj_lobby_slot)
        _obj.playerid = i
    }
}
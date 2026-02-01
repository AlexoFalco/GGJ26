/// @description Insert description here
// You can write your code in this editorà

if (!instance_exists(obj_control))
{
	instance_create_depth(0, 0, 99999, obj_control);
}


enum RELEASE_MODE_ENUMS
{
    DEFAULT = 1000,
    ZIG = 1001,
    ALEXO = 1002,
    MAD = 1003,
    GIOCO = 1004,
}

#macro RELEASE_MODE 1000
#macro Zig:RELEASE_MODE 1001
#macro Alexo:RELEASE_MODE 1002
#macro Mad:RELEASE_MODE 1003
#macro Gioco:RELEASE_MODE 1004

if (release_mode_check(RELEASE_MODE_ENUMS.ZIG))
{
    room_goto(room_game)   
}
else if(release_mode_check(RELEASE_MODE_ENUMS.ALEXO))
{
    room_goto(room_lobby)
}
else if(release_mode_check(RELEASE_MODE_ENUMS.MAD))
{
    room_goto(room_test_mad)
}
else if(release_mode_check(RELEASE_MODE_ENUMS.GIOCO))
{
    room_goto(room_menu_main)
}

global.input_list = []
global.__temp = {}

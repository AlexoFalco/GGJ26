/// @description Insert description here
// You can write your code in this editor
if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO, RELEASE_MODE_ENUMS.ALEXO))
{
    var _length = array_length(global.__temp.player_list)
    for (var i = 0; i < _length; i++) {
    	var _item = global.__temp.player_list[i]
        
        var _dist = 400
        var _x = room_width/2 + lengthdir_x(_dist, 45+(360/_length)*i);
        var _y = room_height/2 + lengthdir_y(_dist, 45+(360/_length)*i);
        var _obj = instance_create_layer(_x, _y, "Instances", obj_player_mad)
        _obj.player = _item.inputid == 0 ? 0 : _item.inputid+1
        _obj.charid = _item.charid
    }
	alarm[0] = 120;
}

music_ref = audio_play_sound(music_game, 1, true)

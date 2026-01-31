/// @description Insert description here
// You can write your code in this editor
iii = 0
var _length = array_length(global.__temp.player_list)
for (var i = 0; i < _length; i++) {
	var _item = global.__temp.player_list[i]
    
    var _x = room_width/2 + lengthdir_x(200, (360/_length)*i);
    var _y = room_height/2 + lengthdir_y(200, (360/_length)*i);
    var _obj = instance_create_layer(_x, _y, "Instances", obj_player_mad)
    _obj.player = _item.inputid == 0 ? 0 : _item.inputid+1
    //call_later(1, time_source_units_frames, function()
    //{
        //with(obj_player_mad)
        //{
            //player = other.iii
            //other.iii+=1
        //}
    //})
}
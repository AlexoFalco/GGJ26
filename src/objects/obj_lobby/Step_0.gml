/// @description Insert description here
// You can write your code in this editor

input_list = global.input_list

for (var i = 0; i < 32; i++) 
{
	if (gamepad_button_check_pressed(i, gp_face1))
    {
        var _playerid = array_length(players_list);
        var _inputid = i
        
        var exists_index = array_find_index(players_list, method({_inputid: _inputid}, function(item){return _inputid == item.inputid}))
        
        if (exists_index == -1)
        {
            array_push(players_list, 
                {
                    playerid: _playerid,
                    inputid: _inputid
                }
            )
            
            for (var n = 0; n < instance_number(obj_lobby_slot); n++) 
            {
            	var _obj = instance_find(obj_lobby_slot, n)
                if (_obj.playerid == _playerid)
                {
                    _obj.inputid = _inputid 
                    _obj.update_char_without_conflict(1)
                }
            }
        }
        
    }
    
	if (gamepad_button_check_pressed(i, gp_face2))
    {
        var _playerid = noone
        
        
        var exists_index = array_find_index(players_list, method({_inputid: i}, function(item){return _inputid == item.inputid}))
        
        if (exists_index != -1)
        {
            _playerid = players_list[exists_index].playerid
            array_delete(players_list, exists_index, 1)
            
            for (var n = 0; n < instance_number(obj_lobby_slot); n++) 
            {
            	var _obj = instance_find(obj_lobby_slot, n)
                if (_obj.playerid == _playerid)
                {
                    _obj.inputid = noone 
                    _obj.is_ready = false
                }
            }
        }
    }
}

var _cond = 0
for (var i = 0; i < instance_number(obj_lobby_slot); i++) {
	var _item = instance_find(obj_lobby_slot, i)
    if (_item.is_ready)
    {
        _cond+=1
    }
}

if (_cond == instance_number(obj_lobby_slot))
{
    countdown_to_start_flag = true
}

if (countdown_to_start_flag)
{
    countdown_to_start+=1
    
    if (countdown_to_start > 60*3)
    {
        game_end()
    }
}
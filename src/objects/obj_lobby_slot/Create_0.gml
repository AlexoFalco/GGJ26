/// @description Insert description here
// You can write your code in this editor

playerid = 0
inputid = noone
charid = noone
is_ready = false

update_char_without_conflict = function(_input_dir)
{
    var _char_list_used = []
    
    for (var i = 0; i < instance_number(obj_lobby_slot); i++) 
    {
    	var _item = instance_find(obj_lobby_slot, i)
        if (_item.charid != noone)
        {
            array_push(_char_list_used, _item.charid)
        }
        
        
        
    }
    var _cond = 4
    
    while(_cond > 0) {
        charid = (charid + 4 + _input_dir) mod 4
        if (array_find_index(_char_list_used, function(item){return item == charid}) > -1)
        {
            _cond-=1
        }
        else {
            _cond = 0
        }
        image_index = charid + 1
    }
}
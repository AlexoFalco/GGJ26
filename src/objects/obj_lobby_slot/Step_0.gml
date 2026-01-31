/// @description Insert description here
// You can write your code in this editor

if (inputid == noone)
{
    image_index = 0
}
else {
	image_index = 1 + charid
}

var _input_dir = 0
if (is_ready == false)
{
    if (gamepad_button_check_pressed(inputid, gp_padu))
    {
        _input_dir = -1
    }
    if (gamepad_button_check_pressed(inputid, gp_padd))
    {
        _input_dir = +1
    }  
}
    
if (_input_dir != 0)
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

if (gamepad_button_check_pressed(inputid, gp_face1))
{
    if (charid != noone)
    {
        is_ready = true
    }
}
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
    
    update_char_without_conflict(_input_dir)
}

if (gamepad_button_check_pressed(inputid, gp_face1) and is_ready == false)
{
    if (charid != noone)
    {
        is_ready = true
        ready_count = 1
    }
}

ready_count = lerp(ready_count, 0, 0.05)
image_xscale = 1+ready_count*0.1
image_yscale = 1+ready_count*0.1
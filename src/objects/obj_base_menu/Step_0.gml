/// @description Insert description here
// You can write your code in this editor

button_count = instance_number(obj_base_button)

for (var i = 0; i < 32; i++) 
{
	if (gamepad_button_check_pressed(i, gp_padu))
    {
        button_index = (button_index-1+button_count) mod button_count
    }	
    if (gamepad_button_check_pressed(i, gp_padd))
    {
        button_index = (button_index+1+button_count) mod button_count
    }    
    with(obj_base_button)
    {
        if (index == other.button_index) is_selected = true else is_selected = false
    }
    if (gamepad_button_check_pressed(i, gp_face1))
    {
        with(obj_base_button)
        {
            if (is_selected)
            {
                on_click()
            }
        }
    }
    if (gamepad_button_check_pressed(i, gp_face2))
    {
        room_goto(room_menu_main)
    }
}
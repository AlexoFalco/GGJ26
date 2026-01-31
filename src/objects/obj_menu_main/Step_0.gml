/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < 32; i++) 
{
	if (gamepad_button_check_pressed(i, gp_padu))
    {
        button_index = (button_index-1+4) mod 4
    }	
    if (gamepad_button_check_pressed(i, gp_padd))
    {
        button_index = (button_index+1+4) mod 4
    }    
    if (gamepad_button_check_pressed(i, gp_face1))
    {
        switch(button_index)
        {
            case 0: room_goto(room_menu_gameoptions);break;
            case 3: game_end();break;
        }
    }
}

/// @description Insert description here
// You can write your code in this editor
button_index = 0


_draw_button = function(_index, _x, _y, _text)
{
    if (button_index == _index)
    {
        draw_set_colour(c_gray)
    }
    else 
    {
    	draw_set_colour(c_white)
    }
    draw_text(_x, _y, _text)
}

instance_create_button_obj(self, 0, room_width/2, 300, obj_button_iniziapartita)
instance_create_button_obj(self, 1, room_width/2, 550, obj_button_info)
instance_create_button_obj(self, 2, room_width/2, 650, obj_button_crediti)
instance_create_button_obj(self, 3, room_width/2, 800, obj_button_esci)
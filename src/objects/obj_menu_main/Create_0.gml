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
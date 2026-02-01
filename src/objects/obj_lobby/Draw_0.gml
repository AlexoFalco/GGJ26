/// @description Insert description here
// You can write your code in this editor
if (flag_debug_mode)
{
    draw_set_colour(c_white)
    for (var i = 0; i < array_length(input_list); i++) {
    	var _item = input_list[i]
        draw_text(10, 10+i*15, json_stringify(_item))
    }
    
    draw_set_colour(c_orange)
    for (var i = 0; i < array_length(players_list); i++) {
    	var _item11 = players_list[i]
        draw_text(10, 100+i*15, json_stringify(_item11))
    }
}

draw_set_colour(c_white)
draw_set_font(font_subtitle)
draw_set_halign(fa_middle)
draw_set_valign(fa_top)
draw_text(1920/2+35, 20, "Lobby")

if (countdown_to_start_flag)
{
    draw_set_halign(fa_center)
    var _value = floor((countdown_to_start_max - countdown_to_start)/60)
    if (_value == 0)
    {
        _value = "Go!"
    }
    else {
    	_value = "Ready..."
    }
    draw_text(1920-250, 1080-140, _value)
}
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
draw_set_font(font_title)
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(10, 10, "Lobby")

if (countdown_to_start_flag)
{
    draw_set_halign(fa_right)
    var _value = floor((countdown_to_start_max - countdown_to_start)/60)
    if (_value == 0)
    {
        _value = "Go!"
    }
    draw_text(1920-50, 1080-100, _value)
}
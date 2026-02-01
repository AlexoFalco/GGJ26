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
    var _value = [floor((countdown_to_start_max - countdown_to_start)/60),floor((countdown_to_start_max - countdown_to_start)/60)];
    if (_value[0] == 0)
    {
        _value = ["Go!","Iniziamo!"]
    }
    else {
    	_value = ["Ready...","Pronti..."]
    }
    draw_text_border(1920-250, 1080-140, font_text,_value[0],_value[1])
}


game_info = []
game_info[0] = "Skull bash your way to victory!\n\nGet the mask and defeat the other players!\n\nDpad/Stick: movement\nA: Shove / Dash\nB: Shield / smash"
game_info[1] = "Sopravvivi nell'arena a suon di spintoni!\n\nRaccogli la maschera e sconfiggi gli altri giocatori!\n\nDpad/Stick: movimento\nA: Spinta / Dash\nB: Parata / smash"
draw_set_halign(fa_center)
draw_set_font(font_game_info)
draw_set_valign(fa_top)
draw_set_colour(c_black)
draw_text_ext(1660, 150, game_info[global.language], 46, 400)


draw_set_font(font_text)
draw_set_valign(fa_top)
draw_set_halign(fa_right)
draw_set_halign(fa_left)

left_info = []
left_info[0] = $"A: Select      B: Back";
left_info[1] = $"A: Seleziona      B: Indietro";
draw_text(50, 1080-50, left_info[global.language])
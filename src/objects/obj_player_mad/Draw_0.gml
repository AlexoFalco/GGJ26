if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO) == false)
{
    draw_sprite(mask_index, 0, x, y);
	var _alpha = sine_wave(current_time / 1000, 3, 4, 0.8);
	_alpha = clamp(_alpha, 0.7, 1); 
	draw_sprite_ext(spr_player_arrow, 0, x, y+12, 4, 4, direction, arrow_col[player], _alpha);
    draw_self();
    draw_set_font(font_title)
    draw_text(x, y-20, p_spinto_count)
    if (p_spinto_count)
    {
        image_blend = c_orange
    }
    else 
    {
        image_blend = c_white
    }
    
    if mudded
		draw_sprite_ext(spr_mud,0,x,y,0.2,0.2,0,c_red,1);
}
else 
{
	var _alpha = sine_wave(current_time / 1000, 3, 4, 0.8);
	_alpha = clamp(_alpha, 0.7, 1);
	draw_sprite_ext(spr_player_arrow, 0, x, y+12, 4, 4, direction, arrow_col[player], _alpha);
	draw_self();
    if mudded
		draw_sprite_ext(spr_mud,0,x,y,0.2,0.2,0,c_red,1);
}

for (var i = 0; i < p_health_max; i++) {
    var _full = i < p_health ? 1 : 0
    var _scale = 0.5
	draw_sprite_ext(spr_gui_heart, _full, x+i*80*_scale-80*_scale, y+100, _scale, _scale, 0, c_white, 1)
}

if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO) == false)
{
    draw_sprite(mask_index, 0, x, y);
	var _alpha = sine_wave(current_time / 1000, 3, 4, 0.8);
	_alpha = clamp(_alpha, 0.7, 1); 
	draw_sprite_ext(spr_player_arrow, 0, x, y+12, 4, 4, direction, arrow_col[player], _alpha);
    draw_sprite_ext(sprite_index, image_index, x+random_range(-anim_shake, anim_shake), y+smash_yplus+random_range(-anim_shake, anim_shake), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
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
	
	//var _scale = image_xscale;
	//if (sprite_index == spr_player_4_walk) _scale = image_xscale*0.2;
	//draw_sprite_ext(sprite_index, image_index, x+random_range(-anim_shake, anim_shake), y+smash_yplus+random_range(-anim_shake, anim_shake), _scale, _scale, image_angle, image_blend, image_alpha);
	
	draw_sprite_ext(sprite_index, image_index, x+random_range(-anim_shake, anim_shake), y+smash_yplus+random_range(-anim_shake, anim_shake), image_xscale, image_yscale, image_angle, image_blend, image_alpha);
    if mudded
		draw_sprite_ext(spr_mud,0,x,y,0.2,0.2,0,c_red,1);
}

var _masked = (tempo_trasformazione > 0);

var _y_start = _masked ? -300 :  - 150

var _wdelta = 40
for (var i = 0; i < p_health_max; i++) {
    var _full = i < p_health ? 1 : 0
	draw_sprite_ext(spr_gui_heart, _full, x+i*_wdelta-_wdelta*2, y+_y_start, 1, 1, 0, c_white, 1)
}

//dash timern
{
    var _v = p_dash_timer/p_dash_timer_max
    var _ww = sprite_get_width(spr_gui_dash)
    var _hh = sprite_get_height(spr_gui_dash)
    draw_sprite_ext(spr_gui_dash, 1, x+1*_wdelta, y+_y_start, 1, 1, 0, c_white, 1)
    draw_sprite_part_ext(spr_gui_dash, 2, 0, (1-_v)*_hh, _ww,_hh-(1-_v)*_hh, x+1*_wdelta-_ww/2, y+_y_start+(1-_v)*_hh-_hh/2, 1, 1, #63ACFF, 1)
    draw_sprite_ext(spr_gui_dash, 0, x+1*_wdelta, y+_y_start, 1, 1, 0, c_white, 1)
}

//smash timer
if (_masked)
{
    var _v = tempo_trasformazione/tempo_trasformazione_max
    
    var _ww = sprite_get_width(spr_gui_dash)
    var _hh = sprite_get_height(spr_gui_dash)
    draw_sprite_ext(spr_gui_mask, 1, x+2*_wdelta, y+_y_start, 1, 1, 0, c_white, 1)
    draw_sprite_part_ext(spr_gui_mask, 2, 0, (1-_v)*_hh, _ww,_hh-(1-_v)*_hh, x+2*_wdelta-_ww/2, y+_y_start+(1-_v)*_hh-_hh/2, 1, 1, #FF63EF, 1)
    draw_sprite_ext(spr_gui_mask, 0, x+2*_wdelta, y+_y_start, 1, 1, 0, c_white, 1)
}
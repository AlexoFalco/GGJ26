if (release_mode_check(RELEASE_MODE_ENUMS.GIOCO) == false)
{
    draw_sprite(mask_index, 0, x, y);
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
	draw_self();
    if mudded
	draw_sprite_ext(spr_mud,0,x,y,0.2,0.2,0,c_red,1);
}

var _wdelta = 40
for (var i = 0; i < p_health_max; i++) {
    var _full = i < p_health ? 1 : 0
	draw_sprite_ext(spr_gui_heart, _full, x+i*_wdelta-_wdelta*2, y+100, 1, 1, 0, c_white, 1)
}

//dash timer
{
    var _v = p_dash_timer/p_dash_timer_max
    var _ww = sprite_get_width(spr_gui_dash)
    var _hh = sprite_get_height(spr_gui_dash)
    draw_sprite_part_ext(spr_gui_dash, 1, 0, (1-_v)*_hh, _ww,_hh-(1-_v)*_hh, x+1*_wdelta-_ww/2, y+100+(1-_v)*_hh-_hh/2, 1, 1, c_white, 1)
    draw_sprite_ext(spr_gui_dash, 0, x+1*_wdelta, y+100, 1, 1, 0, c_white, 1)
}

//smash timer
var _masked = (tempo_trasformazione > 0);
if (_masked)
{
    var _v = tempo_trasformazione/tempo_trasformazione_max
    
    var _ww = sprite_get_width(spr_gui_dash)
    var _hh = sprite_get_height(spr_gui_dash)
    draw_sprite_part_ext(spr_gui_mask, 1, 0, (1-_v)*_hh, _ww,_hh-(1-_v)*_hh, x+2*_wdelta-_ww/2, y+100+(1-_v)*_hh-_hh/2, 1, 1, c_white, 1)
    draw_sprite_ext(spr_gui_mask, 0, x+2*_wdelta, y+100, 1, 1, 0, c_white, 1)
}
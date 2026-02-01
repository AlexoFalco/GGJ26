
if !smuccata
{
	draw_set_alpha(0.5);
	draw_set_color(c_red);
	draw_rectangle(-3000,y-200,room_width+3000,y+100,false);
	draw_set_alpha(1);
	
	var _xx, _xarrow, xa = 30, as;
	if image_xscale = 1
	{
		_xx = 400;
		_xarrow = xa;
		as = -1;
	}
	else
	{
		_xx = room_width - 400;
		_xarrow = room_width-xa
		as = 1;
	}
		
	if flash
	{
		draw_sprite_ext(spr_mucca_alert,0,_xx,y,1,1,0,c_white,1)
		//draw_sprite_ext(spr_arrow,0,_xarrow,y-50,as,1,0,c_red,1)
	}
	
	
}

draw_self();